<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Real"

	attributes['title']="Caravan"
	attributes['style']="Jazz"
	# this is from the new real book, volume III
	attributes['composer']="Duke Ellington, Juan Tizol"
	# this is from the new real book, volume III
	attributes['poet']="Irving Mills"
	# this is from the new real book, volume III
	attributes['piece']="Bright Latin and Swing"
	# this is from the new real book, volume III
	attributes['copyright']="1937 (renewed 1965) Mills Music c/o EMI Music Publishing"
	# this is from the new real book, volume III
	attributes['copyrightextra']="Used by Permission of CPP/Belwin, Inc., Miami, FL ALL Right Reserved"

	attributes['completion']="4"
	attributes['uuid']="160af5b0-ebe1-11e2-937c-bb8193c610fc"
	# my own (the structure in the new real book claims ABC which is totally wrong)
	attributes['structure']="AABA"

	attributes['idyoutuberemark']="A great performance by Ella"
	attributes['idyoutube']="s4VjltPMfds"
	attributes['idyoutuberemark']="Jazz messengers with an intro by Blakey"
	attributes['idyoutube']="eP12RhmBIRw"
	attributes['lyricsurl']="http://www.metrolyrics.com/caravan-lyrics-ella-fitzgerald.html"
%>
% endif

% if part=='Doc':
	DONE:
	- put in the chords.
	- put in the lyrics.
	- put in the melody.
	- checked the melody.
	- put in youtube performances.
	- put in lyrics url.
	TODO:
	- put the directions in a nicer place on the page (and document it).
	- put the rest of the lyrics in (as extra).
	- put the alternate chords in (how do I do that?!?)
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\mark "A (Bright Latin)"
	\startPart
	\repeat volta 2 {
		c1*4:7 | \myEndLine
		c1*4:7 | \myEndLine
		c1*4:7 | \myEndLine
		f1*4:m6 | \myEndLine
	}
	%% so I would see the repeat marks
	%%\endPart

	\mark "B (Swing)"
	\startPart
	f1*4:9 | \myEndLine
	bes1*4:9 | \myEndLine
	ees1*4:9 | \myEndLine
	aes1*2:6 | c1*2:7 | \myEndLine
	\endPart
	
	\mark "A (Bright Latin)"
	\startPart
	c1*4:7 | \myEndLine
	c1*4:7 | \myEndLine
	c1*4:7 | \myEndLine
	f1*4:m6 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Prestissimo" 4 = 220
	\time 4/4
	\key f \minor

	%% A part
	\repeat volta 2 {
		c1~ | c~ | c4 des c g | bes c e g, |
		bes1~ | bes~ | bes4 c des c | des c b g |
		bes!1~ | bes~ | bes4 c b bes | a aes g ges |
		f1~ | f~ | f | r |
	}

	%% B part
	f'1 | d2 c4. g8~ | g1~ | g4. f8 e4-. f-. |
	c'1 | g2 f4. c8~ | c1 | r2 bes'8 c des d |
	ees1 | c2 bes4. f8~ | f1~ | f2 g4-. ees-. |
	c'4. aes8~ aes2~ | aes bes4-. aes-. | g2 g4. g8~ | g2 r |

	%% A part
	c1~ | c~ | c4 des c g | bes c e g, |
	bes1~ | bes~ | bes4 c des c | des c b g |
	bes!1~ | bes~ | bes4 c b bes | a aes g ges |
	f1~ | f~ | f | r |
}
% endif

% if part=='LyricsReal':
%% these lyrics are from the Internet and adjusted for this tune...
\lyricmode {
	%% A part
	Night and stars ab -- ove that shine so bright
	The mys -- t'ry of their fa -- ding light
	That shines u -- pon our ca -- ra -- van
	%% B part
	This is so exciting, you are so inviting
	Resting in my arms
	As I thrill to the magic charms
	%% A part
	Of you beside me here, beneath the blue
	My dream of love is coming true
	Within our desert caravan
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	%% A part
	Sleep u -- pon my shou -- lder as we creep
	Ac -- ross the sand so I may keep
	This mem -- 'ry of our ca -- ra -- van
}
% endif
