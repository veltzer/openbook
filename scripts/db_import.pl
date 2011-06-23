#!/usr/bin/perl -w

# This script imports all of my lilypond sources, targets and meta data (extracted
# from the lilypond files themselves) into my database (into a lilypond table).

# TODO:
# - make this script not import anything which is already in the database.
# 	Do this using the uuid, a date field as compared to the date of the file,
# 	or maybe an md5 sum ?!?
# - improve the lilypond parser to get more data. 

use strict;
use diagnostics;
use DBI qw();
use Error qw(:try); # for the throw used in handle_error (cant I do qw() here ?)
use File::Find qw();
use File::Basename qw();
use Perl6::Slurp qw();
use Parse::RecDescent qw();

# parameters
my($debug)=1;
my($debug_blobs)=0;
my($debug_epdf)=0;
my($report)=1;
my($do_import_blobs)=1;
my($do_epdfs)=1;
my($limit_imports)=1;

# variables
my($dbh);
my($parser);
my($grammer);

sub handle_error() {
	my($rc)=$dbh->err;
	my($str)=$dbh->errstr;
	my($rv)=$dbh->state;
	throw Error::Simple($str.','.$rv.','.$rv);
}

sub get_meta_data($) {
	my($file)=$_[0];
	if($debug) {
		print 'meta file is '.$file."\n";
	}
	my($data);
	$data=Perl6::Slurp::slurp($file);
	my($parser)=Parse::RecDescent->new($grammer);
	my($ret)=$parser->lilyfile(\$data);
	if(!$ret) {
		die('ERROR!');
	}
	# check that there is no more data which is not parsed...
	if($data!~/^\s*/) {
		die('rest of data is ['.$data.']');
	}
	return $ret;
}

sub insert_blob($$$$) {
	my($name,$slug,$mime,$file)=@_;
	if($debug_blobs) {
		print 'inserting blob: ['.join('],[',@_).']'."\n";
	}
	my($data);
	$data=Perl6::Slurp::slurp($file);
	$dbh->do('insert into TbRsBlob (name,slug,mime,data) values(?,?,?,?)',
		undef,
		$name,
		$slug,
		$mime,
		$data
	);
}

sub handler() {
	my($file)=$File::Find::name;
	if($file!~/\.ly$/) {
		return;
	}
	my($name,$path,$suffix)=File::Basename::fileparse($file,'.ly');
	if($debug) {
		print '===================================='."\n";
		print 'name is ['.$name.']'."\n";
		print 'path is ['.$path.']'."\n";
		print 'suffix is ['.$suffix.']'."\n";
	}
	# handle epdfs stuff...
	my($epdfs)=0;
	my(@epdfs_abs);
	my(@epdfs_base);
	if($do_epdfs) {
		my($more)=1;
		while($more) {
			my($curr_base)=$name.'-epdf-'.$epdfs.'.pdf';
			my($curr_abs)='epdfs/'.$curr_base;
			if(-f $curr_abs) {
				if($debug_epdf) {
					print 'found file ['.$curr_abs.']'."\n";
				}
				push(@epdfs_base,$curr_base);
				push(@epdfs_abs,$curr_abs);
				$epdfs++;
			} else {
				if($debug_epdf) {
					print 'didnt find file ['.$curr_abs.']'."\n";
				}
				$more=0;
			}
		}
	}
	# end of epdfs stuff...
	# handle png stuff...
	my($pages);
	my(@pngs_abs);
	my(@pngs_base);
	my($file_to_test)=$path.$name.'.png';
	if(-f $file_to_test) {
		# if we only have one png...
		if($debug) {
			print 'in the first part of the branch ['.$file_to_test.']'."\n";
		}
		$pages=1;
		push(@pngs_abs,$file_to_test);
		push(@pngs_base,$name.'.png');
	} else {
		# if we have many pngs...
		if($debug) {
			print 'in the second part of the branch ['.$file_to_test.']'."\n";
		}
		my($more)=1;
		my($counter)=1;
		while($more) {
			if(-f $path.$name.'-page'.$counter.'.png') {
				push(@pngs_abs,$path.$name.'-page'.$counter.'.png');
				push(@pngs_base,$name.'-page'.$counter.'.png');
				$counter++;
			} else {
				$more=0;
			}
		}
		$pages=$counter-1;
	}
	# end of png stuff
	my($hash)=get_meta_data($file);
	if($limit_imports) {
		if(!exists($hash->{'completion'})) {
			if($debug) {
				print 'not importing due to completion not there'."\n";
			}
			return;
		}
		if($hash->{'completion'}!=5) {
			if($debug) {
				print 'not importing due to completion!=5'."\n";
			}
			return;
		}
		if(exists($hash->{'dontimport'})) {
			if($debug) {
				print 'not importing due to dontimport'."\n";
			}
			return;
		}
	}
	if($report) {
		print 'importing ['.$hash->{'title'}.']'."\n";
	}
	$dbh->do('insert into TbMsLilypond (uuid,title,subtitle,composer,copyright,style,piece,poet,pages,idyoutube,epdfs) values(?,?,?,?,?,?,?,?,?,?,?)',
		undef,
		$hash->{'uuid'},
		$hash->{'title'},
		$hash->{'subtitle'},
		$hash->{'composer'},
		$hash->{'copyright'},
		$hash->{'style'},
		$hash->{'piece'},
		$hash->{'poet'},
		$pages,
		$hash->{'idyoutube'},
		$epdfs
	);
	my($last_id)=$dbh->last_insert_id(undef, undef, undef, undef);
	if($debug) {
		# print the id of the new insert...
		print 'last_id is ['.$last_id.']'."\n";
	}
	# now insert blobs associated with this entry...
	if($do_import_blobs) {
		insert_blob(
			$name.'.ly',
			$hash->{'uuid'}.'-ly',
			'text/plain',
			$path.$name.'.ly'
		);
		insert_blob(
			$name.'.pdf',
			$hash->{'uuid'}.'-pdf',
			'application/pdf',
			$path.$name.'.pdf'
		);
		insert_blob(
			$name.'.ps',
			$hash->{'uuid'}.'-ps',
			'application/postscript',
			$path.$name.'.ps'
		);
		insert_blob(
			$name.'.midi',
			$hash->{'uuid'}.'-midi',
			'audio/midi',
			$path.$name.'.midi'
		);
		insert_blob(
			$name.'.mp3',
			$hash->{'uuid'}.'-mp3',
			'audio/mpeg',
			$path.$name.'.mp3'
		);
		insert_blob(
			$name.'.ogg',
			$hash->{'uuid'}.'-ogg',
			'audio/ogg',
			$path.$name.'.ogg'
		);
		# lets bring in the pngs...
		my($counter)=0;
		my($png);
		foreach $png (@pngs_abs) {
			insert_blob(
				$pngs_base[$counter],
				$hash->{'uuid'}.'-png'.($counter+1),
				'image/png',
				$png
			);
			$counter++;
		}
		# lets bring in the epdfs...
		$counter=0;
		my($epdf);
		foreach $epdf (@epdfs_abs) {
			insert_blob(
				$epdfs_base[$counter],
				$hash->{'uuid'}.'-epdf'.$counter,
				'application/pdf',
				$epdf
			);
			$counter++;
		}
	}
}

$dbh=DBI->connect('dbi:mysql:myworld','','',{
	RaiseError => 1,
	AutoCommit => 0,
	mysql_enable_utf8 => 1,
});
$dbh->{HandleError} =\&handle_error;

# on two separate lines because of list context...
$grammer=Perl6::Slurp::slurp('scripts/lilypond.grammer');
#$parser=Parse::RecDescent->new($grammer);
#print 'grammer is '.$grammer;
# show hints...
$::RD_HINT=1;
# show warnings...
$::RD_WARN=1;
# to debug the grammer...
#$::RD_TRACE=1;
#$Parse::RecDescent::skip='[ \v\t\n]*';

#get_meta_data('test.ly');
#die('end of debug');

# erase all old records, and set the auto increment for those tables so that ids start from 1 again...
$dbh->do('DELETE FROM TbMsLilypond',undef);
$dbh->do('ALTER TABLE TbMsLilypond AUTO_INCREMENT=1',undef);
$dbh->do('DELETE FROM TbRsBlob',undef);
$dbh->do('ALTER TABLE TbRsBlob AUTO_INCREMENT=1',undef);
# go import things
File::Find::find({'no_chdir'=>1,'wanted'=>\&handler},'.');
# now commit all the changes...
$dbh->commit();
# disconnect from the database
$dbh->disconnect();
