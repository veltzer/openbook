<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Fake"

	attributes['title']="Among My Souvenirs"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="Horatio Nicholls"
	# this is from the fake book
	attributes['poet']="Edgar Leslie"
	# this is from the fake book
	attributes['piece']="Moderately"
	attributes['copyright']=""
	attributes['copyrightextra']=""
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"

	attributes['completion']="5"
	attributes['uuid']=""
	attributes['structure']="A"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\mark "A"
	\startPart
	\repeat volta 2 {
		ees2 c:9- | f1:m7 | bes2.:7 bes4:5+9 | ees1~ |
		ees2 ees4/g ges:dim7 | f1:m7 | bes:7 | ees~ |
		ees2 c:9- | f1:m7 | bes2.:7 bes4:5+9 | ees1~ |
		ees2 ees4/g ges:dim7 | f1:m7 | bes:9 | ees |
		ees:7 | aes:6 | f2:m7 bes4:7 bes:5+9 | ees1~ |
		ees | bes:7~ | bes2:7 d:dim7 | g:7 c:m7 |
%% Dm7b5
		f:9 bes:5+7 | ees c:9- | f1:m7 | bes2.:7 bes4:5+9 |
		ees1~ | ees2 ees4/g ges:dim7 | f1:m7 | bes:9 |
		ees2 aes:m6 | ees1 |
	}
	\endPart
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Andante" 4 = 88
	\time 2/2
	\key ees \major

	%% part "A"
	\repeat volta 2 {
        r4 g g bes |
        bes aes aes2~ |
        aes4 aes aes c |
        c bes bes2~ |
        bes4 bes bes ees |
        ees d d c |
        c bes bes aes |
        g1~ |
        g4 g g bes |
        bes aes aes2~ |
        aes4 aes aes c |
        c bes bes2~ |
        bes4 bes bes ees |
        ees d d c |
        c bes bes aes |
        g1~ |
        g4 g aes bes |
        c f f2~ |
        f4 ees d c | 
        ees g, bes2~ |
        bes4 ees, f g |
        aes d d2~ |
        d4 c bes aes |
        g2 ees |
        g fis |
        r4 g g bes |
        bes aes aes2~ |
        aes4 aes aes c |
        c bes bes2~ |
        bes4 bes bes ees |
        ees d d c |
        c d c bes |
        ees1~ |
        ees4 r r2 |

	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	There's no -- thing left for me; __ of days that used to be __ I live in 
	mem -- o -- ry A -- mong My Sou -- ve -- nirs. __ Some let -- ters tied to blue, __
	a pho -- to -- graph or two, __ I see a rose from you A -- mong My Sou -- ve --
	nirs. __ A few more to -- kens rest __ with -- in my trea -- sure chest, __ and tho' they
	do their best __ to give me con -- so -- la -- tion. I count them all a -- part, __
	And as the tear drops start, __ I find a bro -- ken heart A -- mong My Sou -- ve -- nirs.
}
% endif
