<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="Gentle Rain"
	attributes['style']="Jazz"
	attributes['composer']="Louis Bonfa"
	# this comes from the real book...
	attributes['piece']="Bossa"
	# this is from the new real book
	attributes['piece']="Med. Ballad (or Slow Bossa)"
	# this is from the new real book
	attributes['poet']="Matt Dubey"
	attributes['copyright']="1931 (renewed 1959) EMI Robbins Catalog, Inc"
	attributes['copyrightextra']="Used by Persmission of CPP/Belwin, Inc, Miami, FL. International Copyright Secured. All Rights Reserved."

	attributes['completion']="5"
	attributes['uuid']="04bbfb74-0128-11e1-9e2a-0019d11e5a41"
	attributes['structure']="AB"
	attributes['structureremark']="This tune has a weird structure because the B part has different lengths"

	attributes['idyoutuberemark']="Tony Bennet slow version"
	attributes['idyoutube']="uJGqzudEDDE"
	attributes['idyoutuberemark']="The wonderful ballad version of Astrud Gilberto"
	attributes['idyoutube']="s6ndU7GKpjI"
	attributes['lyricsurl']="http://lyrics.wikia.com/Astrud_Gilberto:The_Gentle_Rain"
%>
% endif

% if part=='Doc':
	DONE:
	- added the real book epdf.
	- put in the real book chords.
	- put in the real book tune.
	- put in the lyrics adjusted for the real book.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- heard the real book version.
	- added the new real book epdf.
	- filled in missing meta data (copyright, poet, ...) from the new real book.
	- put in youtube performances and lyrics url.
	- mark the structure in this tune.
	TODO:
	- the last chords in the real book version should be in parenthesis (I don't know
	how to do that).
	- add the new real book version (pdf is already there).
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\startPart
	\repeat volta 2 {
		\myMark "A"
		a1*2:m6 | b1:m7.5- | e:7 | \myEndLine
		a2:m7 d:7 | g:m7 c:7 | f1*2:6 | \myEndLine
		\myMark "B"
		fis1:m7.5- | b:7.9- | e:m7.5- | a:7.9- | \myEndLine
		d:m7.5- | b2:m7.5- e:7 |
	}
	\alternative {
		{
			a1:m6 | bes:7 | \myEndLine
		}
		{
			a2:m7 d:7 | g:m7 c:7 | f1:6 | c:7 | \myEndLine
			f:6 | e:m7 | a:m | e:7 | \myEndLine
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key a \minor

	\repeat volta 2 {
		e2. d8 c | c2. d8 e | e2. d8 c | b2. c8 d |
		e1~ | e2 e8 g e c | d1~ | d2. r4 |
		c'2. b8 a | a2. g8 fis | bes2. a8 g | g2. f8 e |
		aes2. g8 f | f2. e8 d |
	}
	\alternative {
		{
			e1~ | e2. r4 |
		}
		{
			e1~ | e2 e8 g e c | d1~ | d2 e8 g e c |
			d1~ | d2 b'8 d b g | a1~ | a1 |
		}
	}
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the internet but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	We both are lost and a -- lone in the world,
	Walk with me __ in the Gen -- tle Rain. __
	Don't be af -- raid; I've a hand for your hand,
	And I will be your love for a while. __

	sad, __

	like the Gen -- tle Rain, __
	like the Gen -- tle Rain, __
	like the Gen -- tle Rain, __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	I feel your tears as they fall on my cheek,
	They are warm __ in the Gen -- tle Rain. __
	Don't be af -- raid; I've a hand for your hand,
	And our love will be sweet, will be
}
% endif
