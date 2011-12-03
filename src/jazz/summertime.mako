<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Aebersold"

	attributes['title']="Summertime"
	attributes['style']="Jazz"
	attributes['composer']="George Gershwin"
	attributes['poet']="DuBose Heyward"
	# this piece instruction is from the fake book
	attributes['piece']="Slowly"
	# the next one is from Aebersold...
	attributes['copyright']="1936, Gershwin Publishing Corp., copyright renewed"

	attributes['completion']="5"
	attributes['uuid']="2615b7ec-a26f-11df-b010-0019d11e5a41"
	attributes['structure']="AB"
	attributes['idyoutuberemark']="Janis!"
	attributes['idyoutube']="mzNEgcqWDG4"
	attributes['idyoutuberemark']="Ella Fitzgerald with Louis"
	attributes['idyoutube']="MIDOEsQL7lA"
	attributes['lyricsurl']="http://www.stlyrics.com/songs/g/georgegershwin8836/summertime299720.html"
%>
% endif

% if part=='Doc':
	DONE:
	- added the meta data for this tune.
	- brought in the fake book epdf.
	- brought in the real book epdf.
	- brought in the aebersold book epdf.
	- put in the aebersold chords.
	- put in the aebersold tune.
	- put in the aebersold lyrics.
	- checked the aebersold chords.
	- checked the aebersold tune.
	- checked the aebersold lyrics.
	- in the aebersold version added parenthesis on the turn around notes.
	- in the aebersold version added phrases.
	- heard the aebersold version to make sure it's ok.
	- added youtube performances.
	- added lyrics url.
	TODO:
	- mark where the meta data for this tune came from.
	- add real book version.
	- add fake book version.
	- in the Aebersold tune there are two versions: one marked out and one not. The only
		difference between then is that the marked out one has phrases lined out (as
		in the Aebersold booklet). The reasons it is not enabled is that it makes
		the lyrics come out wrong. It seems that phrases are related to lyrics rendering.
		Find out why and how and fix it (try to get the phrases back while keeping the
		lyrics intact).
% endif

% if part=='ChordsAebersold':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	\repeat volta 2 {

	\mark "A"
	\startPart
	d1*3:m | d2:m d:7.9+ | \myEndLine
	g1*2:m | e1:m7.5- | a:7.9+ | \myEndLine
	\endPart

	\mark "B"
	\startPart
	d1*3:m | g2:m c:7 | \myEndLine
	f1:maj7 | e2:m7.5- a:7.9+ | d1:m | a:7.9+ | \myEndLine
	%% so I would see the repeat marks
	%%\endPart

	}

	%% so I would see the repeat marks
	%%\endSong
	\endChords
}
% endif

% if part=='VoiceAebersold':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 108
	\time 4/4
	\key d \minor

	%%\partial 4 a8. ( f16 |
	\partial 4 a8. f16 |

	\repeat volta 2 {
		%%a1~ | a8 ) r g8. ( f16 g8. a16 f4 | d2 a~ | a4 ) r a' ( f |
		%%g8 g~ g2. ) | r4 f8. ( d16 f8. d16 f4 | e1~ | e2 ) r8 a4 ( f8 |
		%%a8 a~ a2. ) | r4 g8. ( f16 g8. a16 f4 | d2 a~ | a ) r4 a ( |
		%%c a8 c d f~ f4 ) | a8 ( g~ g4 f2 | d1~ | d4 ) r r <\parenthesize a'>8. ( <\parenthesize f>16 ) |
		a1~ | a8 r g8. f16 g8. a16 f4 | d2 a~ | a4 r a' f |
		g8 g~ g2. | r4 f8. d16 f8. d16 f4 | e1~ | e2 r8 a4 f8 |
		a8 a~ a2. | r4 g8. f16 g8. a16 f4 | d2 a~ | a r4 a |
		c a8 c d f~ f4 | a8 g~ g4 f2 | d1~ | d4 r r <\parenthesize a'>8. <\parenthesize f>16 |
	}
}
% endif

% if part=='LyricsAebersold':
%% these lyrics are from the Internet and adjusted for this tune...
\lyricmode {
	Sum -- mer -- time, __
	And the li -- vin' is ea -- sy __
	Fish are jum -- pin' __
	And the cot -- ton is high __

	Your dad -- dy's rich __
	And your mam -- ma's good look -- in' __
	So hush lit -- tle ba -- by __
	Do -- n't __ you cry __

	One_of these
}
% endif

% if part=='LyricsmoreAebersold':
\lyricmode {
	One_of these mornings __
	You're going to rise up sing -- ing __
	Then you'll spread your_wings __
	And you'll take to the sky __

	But_till that morn -- ing __
	There's a -- 'no -- thing can harm you __
	With da -- ddy and ma -- mma st -- an -- ding by __
}
% endif
