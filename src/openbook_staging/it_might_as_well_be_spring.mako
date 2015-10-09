<%page args='part'/>
% if part=='Vars':
<%
	# vim: set filetype=lilypond :
	import attr
	version=attr.Version()
	version['doVoice']=True
	attributes.addVersion('Unknown', version)
	attributes.setDefaultVersionName('Unknown')

	attributes['title']='It might as well be spring'
	attributes['style']='Jazz'
	attributes['composer']='Richard Rogers'
	attributes['poet']='Oscar Hammerstein'
	attributes['piece']='Med Swing'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='0'
	attributes['uuid']='f4f39800-a26e-11df-b97a-0019d11e5a41'
%>
% endif

% if part=='VoiceUnknown':
{
	\time 4/4
	\key g \major

	\partial 4 d8 d |
	\repeat volta 2 {
		fis d d d fis d d g | e4 d2 d8 d |
		d8. b'16 d8. g,16 b8. d,16 g8. d16 |
		f2. f4 | e dis8 e fis4. g8 | g4 d!2 d8 d |
	} \alternative {
		{ c'4 c c fis, | b2. d,8 d | }
		{ d'4 d d fis, | g1 | }
	}
	c'4 c c8 d c b | a4 f f2 | a8 f f f f4 e | g1 |
	c4 c c8 d c b | a4 fis! fis g8 a | b4 b cis cis | d2. d,8 d |
	fis d d d fis d d g | e4 d2 d8 d |
	d8. b'16 d8. g,16 b8. d,16 g8. d16 |
	f2. f4 | e8 e dis e fis fis eis fis | g4 g2 fis8 g | a4 a a fis |
	b2. b8 bis | cis4 a a a8 b! | c! a a a a4 a8 ais | b4 g g b |
	a2. g4 | d4.. b'16 g2 | d4.. c'16 a2 | g1 | r2 r4 d8 d |
}
% endif
