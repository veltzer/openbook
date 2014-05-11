<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Fake"

	attributes['title']="Stormy Weather"
	attributes['subtitle']="Keeps Rainin' All the Time"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="Harold Arlen"
	# this is from the fake book
	attributes['poet']="Ted Koehler"
	# this is from the fake book
	attributes['piece']="Slowly"
	# this is from the fake book
	attributes['copyright']="1933 Mills Music, Inc."
	attributes['copyrightextra']="Renewed 1961 Arko Music Corp"
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"

	attributes['completion']="5"
	attributes['uuid']=""
	attributes['structure']=""

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4

	\myMark "A"
	\startPart
	\repeat volta 2 {
		g2 gis:dim7 | a:m7 d:9 | g e:7 |
		a:m7 d:9 | g e:7 | a:m7 d:7.5+.9- |
	} \alternative {
		{
			g1 |
			a2:m7 d:9 |
		}
		{
			g2 c |
		}
	}
	\endPart

	\myMark "B"
	\startPart
	%% Jazz Fakebook has the follow d:7.5+.9- chord without the augmented, but
	%% given the melody note, and the fact that this exact figure appears in
	%% two other places augmented, I'm assumign this was a typo.
	g2 b4:m7 e:7 | a2:m7 d:7.5+.9- | g d4:m7 g:7 |
	c1:maj7 | g4/b a:m7 g2:maj7 | c1:maj7 |
	g2/b a4:m7 g:7 | c2 cis:dim7 | g/d e:7 a4:m7 b:7 e2:m7 |
	a:7 a4:m7 d:7 |
	\endPart
	\myMark "A"
	\startPart
	g2 gis:dim7 | a:m7 d:9 | g e:7 |
	a:m7 d:9 | g e:7 | a:m7 d:7.5+.9- | g1 |
	a2:m7 d:7.5+.9- | g a4:m7 aes:maj7 |
	\time 3/4
	g:maj7 c g4:6 |
	\endPart
	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c' {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	%%\tempo "Allegro" 4 = 130
	\time 2/2
	\key g \major


	\partial 4 ais'8 b

	%% part "A"
	\repeat volta 2 {
		d2.~ d8 ais16 b | d8 b d cis c4 ais8 b | d d,4.~ d2 |
		a'8. a16 a8. a16 a4~ a8 g16 e | g8 d4.~ d2 | c8 e g ais~ ais4. ais8 |
	} \alternative {
		{
			b8 g4.~ g2 | r2 r4 ais8 b |
		}
		{
			b8 g4.~ g4 g |
		}
	}
	%% part "B"
	e8 d4.~ d2 | c8 e g ais~ ais4. ais8 | b8 g4.~ g2 |
	e8. fis16 \times 2/3 { g8 a g~ } g8. g16 g8. g16 | g4. g8 b g4. | e8. fis16 \times 2/3 { g8 a g~ } g8. g16 g8. g16 |
	g4. g8 e d4. | e8. fis16 \times 2/3 { g8 a g~ } g8. g16 g8. g16 | g4. g8 c8 b4. | d4 b8 a g4 e |
	a2. ais8 b |
	%% part "A"
	d2.~ d8 ais16 b | d8 b d cis c4 ais8 b | d d,4.~ d2 |
	a'8. a16 a8. a16 a4~ a8 g16 e | g8 d4.~ d2 | c8 e g ais~ ais4. ais8 | b g4.~ g2 |
	c,8 e g ais~ ais4. ais8 | b g4.~ g2~ |
	\time 3/4
	g2. |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% part "A"
	Don't know
	%% Volta
	why __ there's no sun up in the sky, Storm -- y Weath -- er, __
	since my man and I __ ain't to -- geth -- er, __ keeps rain -- in' all __ the time. __ _
	Life is

	time, __ _ the time __ _ So wear -- y all __ the time. __ _
	%% part "B"
	When he went a -- way __ the blues walked in and met me. If he stays a -- way __ old rock -- in'
	chair will get me. All I do is pray __ the Lord a -- bove will let me walk in the sun once
	more.
	%% part "A"
	Can't go on, __ ev -- 'ry -- thing I had is gone, Storm -- y Weath -- er, __
	since my man and I __ ain't to -- geth -- er, __ keeps rain -- in' all __ the time. __ _
	Keeps rain -- in' all __ the time. __ _
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {
	%% Workaround to avoid having to repeat words. Each one skips a note.
	{ \skip 1 } { \skip 1 }
	bare __ gloom and mis -- 'ry ev -- 'ry -- where, Storm -- y Weath -- er, __
	just can't get my poor __ self to -- geth -- er, __ I'm wear -- y all __ the
}
% endif
