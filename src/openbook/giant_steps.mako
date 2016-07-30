<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='Giant Steps'
	attributes['style']='Jazz'
	attributes['composer']='John Coltrane'
	# this is from the real book
	attributes['piece']='Fast'
	# this is from the hal leonard book
	#attributes['piece']='Fast Swing'
	# this is from the hal leonard book
	attributes['copyright']='1974 Jowcol Music.'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='828326cc-013c-11e1-b823-0019d11e5a41'
	attributes['structure']='A'
	attributes['structureremark']='Very weird not repeating structure because of the weird harmony steps'
	attributes['location']='rbk1:170,hlrjb:130,nrbk2:121,kw:3'
	attributes['remark']='the key here is of little meaning as the harmony changes key all the time...:) That\'s why it\'s written in C.'

	attributes['idyoutuberemark1']='Mccoy Tyner awesome solo...'
	attributes['idyoutube1']='PukuQPUKfyU'
	attributes['idyoutuberemark2']='The original Coltrane version...'
	attributes['idyoutube2']='BZRnkBK_0no'
	attributes['lyricsurl']='http://www.bjazz.com/Giant_Steps.html'
%>
% endif

% if part=='Doc':
	DONE:
	- added the real book pdf.
	- added the real book chords.
	- added the real book notes.
	- added the tunes structure.
	- added the real book lyrics and adjusted them to the tune.
	- brought in the hal leonard epdf.
	- added meta data (copyright)
	- checked the speed of the tune.
	- checked the real book chords.
	- checked the real book tune.
	- added youtube performances.
	- added the new real book epdf.
	- added the tunes structure, in the meta data and in the tune itself.
	TODO:
	- do the hal leonard epdf.
	REMARKS:
	- there is a note which has no corresponding lyric in the real book version (last line).
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	b2 d:7 | g bes:7 | ees1 | a2:m7 d:7 | \myEndLine
	g bes:7 | ees fis:7 | b1 | f2:m7 bes:7.9 | \myEndLine
	ees1 | a2:m7 d:7 | g1 | cis2:m7 fis:7 | \myEndLine
	b1 | f2:m7 bes:7 | ees1 | cis2:m7 fis:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Prestissimo" 4 = 240
	\time 4/4
	\key c \major

	%% part "A"
	fis'2 d | b g4. bes8~ | bes1 | b4. a8~ a2 |
	d bes | g dis4. fis8~ | fis1 | g2 f4. bes8~ |
	bes1 | b2 a4. d8~ | d1 | dis2 cis4. fis8~ |
	fis2 fis | g f4. bes8~ | bes1 | fis4. fis8~ fis2 |
}
% endif

% if part=='LyricsReal':
\lyricmode {

	%% part "A"
	Life when we were kids __
	Was like __ play -- ing gi -- ant steps __
	We were told __ to ad -- vance __
	We o -- beyed, __ _ took the chance __
	You're it __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	Think of life as chess __
	Cap -- ture __ one piece at a time __
	For -- ward east, __ cas -- tle next __
	Not the pace __ _ but the steps __
	Check -- mate __
}
% endif
