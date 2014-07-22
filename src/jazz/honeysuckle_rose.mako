<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=False
	attributes['render']="Fake"

	attributes['title']="Honeysuckle Rose"
	attributes['style']="Jazz"
	attributes['composer']="Thomas (\\\"Fats\\\") Waller"
	attributes['poet']="Andy Razaf"
	attributes['piece']="Medium, with a lift"
	attributes['copyright']="1929 Santly Bros., Inc."
	attributes['copyrightextra']="Copyright Renewed, Waller's Interet controller by Chappell & Co., Inc. (Interson Music, Publisher), Razaf's interest controlled by Razaf Music Co., co/o The Songwriters Guild"

	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"
	attributes['completion']="5"
	attributes['uuid']="1afdbda2-da81-11e3-a538-a3a8bef9e7c8"
%>
% endif

% if part=='Doc':
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {
		\myMark "A"
		\startPart
		g2:m7 c:7 | g:m7 c:7 | g:m7 c:7 | g:m7 c:7 | f d:m7 |
		g2:m7 c:7 | f1 | a2:m7.5- d:7.9- |
		\endPart
		\myMark "A"
		\startPart
		g:m7 c:7 | g:m7 c:7 | g:m7 c:7 |
		g:m9 c:7 | f aes:dim7 | g:m7 c:7 | f des:7 | g:m7 f |
		\endPart
		\myMark "B"
		\startPart
		f:7 c:m7 | f:dim f:7 |
		bes f:9 | ges4:9 f:9 bes2 | g:7 d:m7 | g:dim g:7 | c:7 g:m7 | aes4:9 g:9 c2:7 |
		\endPart
		\myMark "A"
		\startPart
		g:m7 c:7 | g:m7 c:7 | g:m7 c:7 | g:m9 c:7 | f gis:dim7 |
		g:m7 c:7 |
	} \alternative {
		{
			f1 | a2:m7.5- d:7.9- |
		}
		{
			f2 des:7 | g4:m7 ges:7 f2:6 |
		}
	}
	\endPart
	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key f \major

	%% part "A"
	\repeat volta 2 {
		c'8 bes d, f a2 | c8 bes d, f a2 | c8 bes d, f a4 a |a2 a8 g f d | f4 f f2~ |
		f a8 g f d | f1~ | f4 r r2 | c'8 bes d, f a2 | c8 bes d, f a2 | c8 bes d, f a4 a |
		a2 a8 g f d | f4 f f2~ | f a8 g f d | f1~ | f4 r r2 | f2 g | gis a |
		r4 bes8 c~ c bes c4 | des c8 bes~ bes2 | g a | ais b | r4 c8 d~ d c d4 | ees d8 c~ c2 |
		c8 bes d, f a2 | c8 bes d, f a2 | c8 bes d, f a4 a | a2 a8 g f d | f4 f f2~ |
		f a8 g f d |
	} \alternative {
		{
			f1~ | f4 r4 r2 |
		}
		{
			f1~ | f2~ f8 r8 r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% part "A"
	Ev -- 're hon -- ey bee fills with jeal -- ous -- y when they see you out with me, I don't blame them, good -- ness knows, __
	Hon -- ey -- sucke -- le Rose. __ When you're pass -in' by, flow -- ers droop and sigh, and I know the rea -- son
	why; You're much sweet -- er good -- ness knows, __ Hon -- ey -- suck -- le Rose. __ Don't buy sug -- ar,
	you just have to touch my cup. __ You're my sug -- ar, it's sweet when you stir it up. __
	When I'm tak -- in' sips from your tas -- ty lips, seems the hon -- ey fair -- ly drips. You're con -- fec -- tion, good -- ness knows, __
	Hon -- ey -- suck -- le rose. __
	Rose. __
}
% endif
