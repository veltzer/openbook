\include "src/include/common.lyi"
\header {
	title="Hallelujah I Love Him(her) So"
	composer="Ray Charles"
	style="blues"
	piece="Med Swing"

	completion="0"
	uuid="d387ae5e-a26e-11df-9edf-0019d11e5a41"
}

phraseA={ r4 d'8. c'16 aes8. g16 f8. d16 }
phraseB={ r8. c'16 d'8. c'16 aes8. g16 f8. d16 }

tune={
	\key f \major
	\time 4/4
	\phraseA | f4 f8 aes8 ~ aes8 r8 r4 |
	\phraseB | f4 f8 d8( ~ d8. )c16 r4 |
	\phraseA | f4 f8 f8 ~ f8 r8 r4 |
	\phraseB | f4 f8 f8 ~ f8. c16 d8. f16 |
	a8 c'4. r4 a8. a16 | g8 f4. r4 aes8. g16 |
	aes8. g16 f8. d16 f4 f8 f8 | f8 r8 r4 r2 |

	\phraseB | f4 f8 aes8 ~ aes8 r8 r4 |
	\phraseB | f4 f8 d8( ~ d8. )c16 r4 |
	\phraseA | f4 f8 f8 ~ f8 r8 r4 |
	\phraseB | f4 f8 f8 ~ f8. c16 d8. f16 |
	a8 c'4. r4 a8. a16 | g8 f4. r4 aes8. g16 |
	aes8. g16 f8. d16 f4 f8 f8 | f8 r8 r4 r2 |
}

text=\lyrics {
	Let me tell you 'bout a boy I know ___
	He is my ba -- by and he lives next door. ___ ___
	Ev -- 'ry morn -- ing 'fore the sun comes up, ___
	He brings my cof -- fe in my fav -- 'rite cup. ___
	That's why I know, ___ yes, I know, ___ Hal -- le -- lu -- jah, I just love him so. ___

	When I'm in trou -- ble an I have no friends, ___
	I know he'll go with me un -- til the end. ___ ___
	Ev -- 'vry bo -- dy asks me how I know. ___
	I smile at them and say he told me so. ___
	That's why I know, ___ yes I know, ___ Hal -- le lu -- jah, I just love him so. ___
}

harmony=\chords {
	f1 | bes4. b4:dim7 r4. | f1 | bes4. b8:dim7 r8. c16:7 r4 | f1 | f2.:7 f4:7.5+ |
	bes1 | b:dim7 | f2 a:7 | d:m bes:7 | g:7 c4.:7.4 f8 | r1 |

	f1 | bes4. b4:dim7 r4. | f1 | bes4. b8:dim7 r8. c16:7 r4 | f1 | f2.:7 f4:7.5+ |
	bes1 | b:dim7 | f2 a:7 | d:m bes:7 | g:7 c4.:7.4 f8 | r2 f:7.5+ |
}

%{
piano=\context GrandStaff <
	\context Staff=treble {
	\global
	{
	< \context Voice=va { \stemUp
	\phraseA | f4 f8 aes8 ~ aes8 r8 r4 |
	\phraseB | f4 f8 d8 ~ d8. c16 r4 |
	\phraseA | f4 f8 f8 ~ f8 r16 f'16( g'4 |
	)f'8 r16 c'16 d'8. c'16 aes8. g16 f8. d16 | f4 f8 f8 ~ f8. c16 d8. f16 |
	a8 c'4. r4 a8. a16 | g8 f4. ~ f4 aes8. g16 |
	aes8. g16 f8. d16 f4 f8 f8( | )f8 r8 r4 r2 |
	}
	\context Voice=vb { \stemDown
		r4 <f a> r <a, c> | r4 d8 <d f> ~ <d f> r8 r4 |
		r4 <f a> r <a, c> | r4 <bes,8 d> <f, aes,> ~ <f,8. aes,> <e,16 bes,> r4 |
		<a,8 c f> r8 r4 r2 | <a,8 e> r r4 r4 <a cis'> |
		<bes8 d'> r8 r4 r2 | <aes,8 d> r8 r4 r2 | r4 <c f a> <cis g> <cis g>
		r4 <a, d> <aes, d> <bes, d> | r <a, d> <aes, d> <aes,8 d> <a, c> ~ |
		<a, c> r8 r4 r2 |
	}
	>

		<
		\context Voice=va { \stemUp
			\phraseB | f4 f8 aes8 ~ aes8 r8 r4 |
			\phraseB | f4 f8 d8 ~ d8. c16 r4 |
			\phraseA | f4 f8 f8 ~ f8 r16 f'16( g'4 |
			)f'8 r16 c'16 d'8. c'16 aes8. g16 f8. d16 | f4 f8 f8 ~ f8. c16 d8. f16 |
			a8 c'4. r4 a8. a16 | g8 f4. ~ f4 aes8. g16 |
			aes8. g16 f8. d16 f4 f8 f8( | )f2 f8. f16 f4 |
		}
		\context Voice=vb { \stemDown
			r4 <f a> r <a, c> | r4 d8 <d f> ~ <d f> r8 r4 |
			r4 <f a> r <a, c> | r4 <bes,8 d> <f, aes,> ~ <f,8. aes,> <e,16 bes,> r4 |
			<a,8 c f> r8 r4 r2 | <a,8 e> r r4 r4 <a cis'> |
			<bes8 d'> r8 r4 r2 | <aes,8 d> r8 r4 r2 | r4 <c f a> <cis g> <cis g> |
		}
		>
	}
	}
	\context Staff=bass {
		\clef bass
		{
			\repeat unfold 2 {
				f4 r a r | bes bes8 b8 ~ b8. c16 d8. e16 |
				f4 r a r | bes bes8 b8 ~ b8. c'16 d8. e16 |
				f8 r r4 r2 | f8 r r4 r4 f |
				bes,8 r r4 r2 | b,8 r r4 r2 |
				f4 r e a, | d r bes, bes | g r c' c8 f ~ |
			} \alternative {
				{ f8 bes4 b8 ~ b8. c'16 d'8. c'16 | }
				{ f4 d'8. c'16 f8. f16 f4 | }
			}
		}
	}
>

%}

\include "src/include/harmony_tune_lyrics.lyi"
