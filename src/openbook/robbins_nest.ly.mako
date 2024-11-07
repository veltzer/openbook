<%page args='part'/>
% if part=='Vars':
<%
	from scripts import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.add_version('Fake', version)
	attributes.set_default_version_name('Fake')

	attributes['title']='Robbin\'s nest'
	attributes['style']='Jazz'
	attributes['composer']='Sir Charles Thompson, Jean-Baptiste \\"Illinois\\" Jacquet'
	attributes['piece']='Medium Swing'
	attributes['copyright']='1947, 1948, 1951, 1952 (Renewed 1975, 1976, 1979, 1980) Atlantic Music Corp'

	attributes['typesetter']='Samuel Tardieu <sam@rfc1149.net>'
	attributes['completion']='5'
	attributes['uuid']='c921579e-a26e-11df-9a5c-0019d11e5a42'
	attributes['structure']='AABA'
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

	\partial 2 s2 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		c1*2:6 | aes1*2:7 | e2:m7 ees:m7.5- | d:m7 g:7.9- |
	} \alternative {
		{
			c:6 ees:m7.5- | d:m7 g:7 | \myEndLineVoltaNotLast
		}
		{
			c1*2:6 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	e1*2:7.9- | a1*2:7.9- |
	d1*2:7.9- | g2:7.5+ g:7 | d:m7 | g:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	c1:6 | c:6 | aes:7 | aes:7 | e2:m7 ees:m7.5- | d:m7 g:7.9- | c1:6 | d2:m7 g:7 |
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo 4 = 120
	\time 4/4
	\key c \major

	\partial 2 s8 dis \tuplet 3/2 { e g b } |

	%% part "A"
	\repeat volta 2 {
		d c g e d' c4.~ | c2 r8 b, \tuplet 3/2 { c e g } |
		bes aes ees c bes' aes4.~ | aes2. r8 g~ |
		g4 e8 g ges ees c f~ | f4 d8 f e8. e16 e8 c~ |
	} \alternative {
		{
			c2~ c~ | c r8 dis \tuplet 3/2 { e g b } |
		}
		{
			c,2.~ c4 | r2. e4
		}
	}

	%% part "B"
	f8. e16 dis8. e16 b'2 | r2 r8 e, g a |
	bes4. a8~ a2 | r2. c8. d16 |
	ees8. d16 c8 d~ d2 | r2. c8. d16 |
	ees4. d8~ d4 r4 | r2 r8 dis, \tuplet 3/2 { e g b } |

	%% part "A"
	d c g e d' c4.~ | c2 r4 \tuplet 3/2 { c,8 e g } |
	bes aes ees c bes' aes4.~ | aes2. r8 g~ |
	g4 e8 g ges ees c f~ | f4 d8 f e8. g16 a8 c8~ |
	c1~ | c2~ c4 r4 |
}
% endif
