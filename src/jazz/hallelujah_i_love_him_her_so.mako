<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Hallelujah I Love Him (Her) So"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="Ray Charles"
	# this is from the fake book
	attributes['poet']="Ray Charles"
	# this is from the fake book
	attributes['piece']="Moderately"
	# this is from the fake book
	attributes['copyright']="1956 & 1959 by Hill & Range Snogs, Inc."
	attributes['copyrightextra']="Copyright renewed, all rights controlled by Unichappell Music, Inc."

	attributes['completion']="5"
	attributes['uuid']="d387ae5e-a26e-11df-9edf-0019d11e5a41"
	attributes['structure']="ABA"

	attributes['idyoutuberemark']="Ray Charles live!"
	attributes['idyoutube']="Cf0X7QuK4LI"
	attributes['idyoutuberemark']="The original version"
	attributes['idyoutube']="rWGG6MdGdlg"
	attributes['lyricsurl']="http://www.lyrics007.com/Peggy%20Lee%20Lyrics/Hallelujah,%20I%20Love%20Him%20So%20Lyrics.html"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the fake book epdf.
	- filled in the song meta data from the fake book.
	- filled in the songs structure.
	- put in the fake book chords.
	- put in the fake book lyrics.
	- put in the fake book tune
	- checked the fake book lyrics.
	- connect the notes of the tune together.
	- checked the fake book chords.
	- checked the fake book tune.
	- heard that it sounds well.
	- added a lyrics url.
	- added youtube performances.
	TODO:
	- add the alternate lyrics (her instead of him and similar stuff from the real book).
	- bring in another version of this tune.
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	f2 f/a | bes b4:dim7 c:7 | f2 f/a | bes b4:dim7 c:7 | \myEndLine
	f1 | f2.:7 f4:7.5+ | bes1 | b:dim7 | \myEndLine
	f2 a:7 | d:m bes:7 | g:7 c:7.11 | f1 | \myEndLine

	\myMark "B"
	bes1:6 | b:dim7 | f | f:7 | \myEndLine
	bes:7.9 | aes:9 | g:7 | c:7 | \myEndLine

	\myMark "A"
	f2 f/a | bes b4:dim7 c:7 | f2 f/a | bes b4:dim7 c:7 | \myEndLine
	f1 | f2.:7 f4:7.5+ | bes1 | b:dim7 | \myEndLine
	f2 a:7 | d:m bes:7 | g:7 c:7.11 | f bes:7 | f1 | \myEndLine

	\endChords
	\endSong
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\key f \major
	\time 4/4

	%% A part
	r8. c16[ d8. c16] aes8.[ g16 f8. d16] | f4 f8 aes~ aes r r4 |
	r8. c16[ d8. c16] aes8.[ g16 f8. d16] | f4 f8 d~ d8. c16 r4 |
	r4 d'8. c16 aes8.[ g16 f8. d16] | f4 f8 f~ f r r4 |
	r8. d16[ f8. d16] f8.[ d16 f8. d16] | f4 f8 f~ f8.[ c16 d8. f16] |
	a8 c4. r4 a8. a16 | g8 f4. r4 aes8. g16 |
	aes8.[ g16 f8. d16] f4 f8 f~ | f r r4 r2 |

	%% B part
	r8. d16[ f8. d16] f8.[ d16 f8. d16] | f8. f16 f4 r2 |
	r4 a d8.[ c16 a8. f16] | a4 f8 g~ g4 r |
	r f8. d16 f8.[ d16 f8. d16] | f4 f8 f~ f r r4 |
	r8. d16[ g8. d16] r2 | g8 a4 d8~ d4 c |

	%% A part
	r4 d8. c16 aes8.[ g16 f8. d16] | f4 f8 aes~ aes r r4 |
	r4 d8. c16 aes8.[ g16 f8. d16] | f4 f8 d~ d8. c16 r4 |
	r8. c'16[ d8. c16] aes8.[ g16 f8. d16] | f4 f8 f~ f r r4 |
	r8. d16[ f8. d16] f8.[ d16 f8. d16] | f4 f8 f~ f8.[ c16 d8. f16] |
	a8 c4. r4 a8. a16 | g8 f4. r4 aes8. g16 |
	aes8.[ g16 f8. d16] f4 f8 f~ | f1~ | f2 r |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% A part
	_ Let me tell you 'bout a boy I know. __
	He is my ba -- by and he lives next door __ _
	Ev -- 'ry morn -- ing 'fore the sun comes up __
	he brings my cof -- fee in my fav -- 'rite cup __
	That's why I know, __ _ yes, I know, __ _ Hal -- le -- lu -- jah, I just love him so. __
	%% B part
	Now if I call him on the tel -- e -- phone,
	and tell him that I'm all a -- lone, __
	by the time I count from one to four, __
	I hear him on my door. __ _
	%% A part
	In the eve -- ning when the sun goes down, __
	when there is no -- bod -- y else a -- round __ _
	he kiss -- es me __ _ and he holds me tight. __
	He tells me "\"Ba" -- by ev -- 'ry -- thing's all "right.\""
	That's why I know, __ _ yes, I know. __ _ Hal -- le -- lu -- jah, I just love him so. __
}
% endif
