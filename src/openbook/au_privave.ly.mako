<%page args='part'/>
% if part=='Vars':
<%
	from scripts import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	attributes.add_version('Aebersold', version)
	attributes.set_default_version_name('Aebersold')

	attributes['title']='Au Privave'
	attributes['style']='Jazz'
	# from the aebersold book
	attributes['composer']='Charlie Parker'
	# this is my own definition
	attributes['piece']='Upbeat Swing'
	# this is from the aebersold book
	attributes['copyright']='1956, Atlantic Music Corp.'
	attributes['copyrightextra']='1978, Atlantic Music Corp.'

	attributes['typesetter']='Mark Veltzer <mark.veltzer@gmail.com>'
	attributes['completion']='5'
	attributes['uuid']='e62b60ec-eb9b-11e0-aab7-0019d11e5a41'
	attributes['structure']='Blues'
	attributes['location']='rbk1:32,jfb:50,file:au_privave_omnibook.pdf'

	attributes['idyoutube1']='HUNgcPSYeyM'
	attributes['idyoutube2']='dvdQYSWOobc'
%>
% endif

% if part=='Doc':
	DONE:
	- got the Aebersold epdf in here.
	- got the real book epdf in here.
	- got the fake book epdf in here.
	- put in the structure of the tune.
	TODO:
	- mark whats been done to the Aebersold tune.
	- document the you tube performances.
	- write the real book version.
	- write the fake book version.
	REMARKS:
	- I moved the Aebersold tune to scale f major which is better for this tune. Why the hell did aebersold put it in C?
% endif

% if part=='ChordsAebersold':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1:7 | g2:m aes:dim | f1:7 | c2:m f:7 | \myEndLine
		bes1*2:7 | f1:7 | a2:m d:7 | \myEndLine
		g1:m | c:7 | f2:7 d:7 |
	} \alternative {
		{
			g2:m c:7 | \myEndLineVoltaNotLast
		}
		{
			g2:7 c:7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "A"
	\startPart
	f1*2:7 | c1:m | c2:m b:7 | \myEndLine
	bes1*2:7 | f1 | f2 d:7 | \myEndLine
	g1:m | c:7 | f:7 | g2:m c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1:7 | bes:7 | f:7 | f2:7 f:7.5+ | \myEndLine
	bes1*2:7 | f1:7 | a2:m d:7 | \myEndLine
	g1:m | c:7 | f:7 | g2:m c:7 | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1:7 | bes:7 | f:7 | c2:m f:7 | \myEndLine
	bes1*2:7 | f1:7 | a2:m d:7 | \myEndLine
	g1:m | c:7 | f:7 | g2:m c:7 | \myEndLine
	\endPart

	\myMark "End"
	f1:7 | \myEndLine

	\endSong
	\endChords
}
% endif

% if part=='VoiceAebersold':
{
	\tempo "Prestissimo" 4 = 220
	\time 4/4
	\key f \major

	%% part "A"
	\repeat volta 2 {
		f8 e f c r4 a'8 aes | a c, r e~ e g f e | g f a bes a f g ees | r d' r4 r8 des~ des bes |
		b4. f'8 r b, bes4~ | bes2 aes8 f g f | c'4 r8 a bes4 r8 g | c4 c~ c8 a bes c |
		a g f e f4 r8 c' | bes4 r8 f'~ f c e f | r4 r8 c~ c4. a8 |
	} \alternative {
		{
			bes a f d a' a~ a4
		}
		{
			bes8 a f d a' g~ g4
		}
	}

	%% part "A"
	f4 r r8 des16 c b8 c | e g f g a bes c a | bes c16 bes a8 f g ees~ ees4 | r2 r4 f16 g bes d |
	f8 r d g, r4 f16 g bes d | f4 des8 g, r2 | r8 e \tuplet 3/2 { f8 a c } e ees d des | c bes \tuplet 3/2 { a16 bes a } g8 ges ees c cis |
	f a, \tuplet 3/2 { bes d f } a f d bes | g'4 c8 aes~ aes4 c8 a~ | a4 c,8 d~ d4 r | r2 r4 f'8 e |

	%% part "A"
	f r c bes c4 a8 f | bes c d c r b, c bes' | aes a c a bes c16 bes a8 g | f e ees g d c f e |
	d f, aes b e4 b8 g'~ | g4 r8 f~ f4 e8 c | d a~ a2 r4 | r2 r4 g'16 a bes d |
	f16 d ees e c cis d c bes a g f e g bes d | c a \tuplet 3/2 { bes c bes } a f d bes g' aes e c cis d b g | %% cont on next line
	c4 r r8 bes a16 c e g | f4 r8 c e4~ e16 g bes d |

	%% part "A"
	c4 r8 bes a f4 b8~ | b bes \tuplet 3/2 { aes16 bes aes } f8 g f4 ees8~ | ees c~ c4 r2 | r4 r8 g''8~ g4 f8 ees |
	d c bes c16 bes aes8 f d4 | r r8 \mark \markup { \italic { Lay Back } } g~ g f des b | c4 r r r8 e'16 ees | d8 des c bes \tuplet 3/2 { a16 bes a } g8 ges g |
	a g r4 r8 a bes c | \tuplet 3/2 { des ees des } c b bes g c bes | a f des b c4 r4 | r4 r8 a'~ a4~ a8 c16 a |

	%% part "End"
	g8 f g2. |
}
% endif
