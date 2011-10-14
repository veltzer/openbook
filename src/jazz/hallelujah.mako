<%inherit file="/src/include/common.makoi"/>
<%
	attributes['jazzTune']=True
	attributes['type']="harmony_tune_lyrics"

	attributes['title']="Hallelujah I Love Him(her) So"
	attributes['composer']="Ray Charles"
	attributes['style']="blues"
	attributes['piece']="Med Swing"

	attributes['completion']="0"
	attributes['uuid']="d387ae5e-a26e-11df-9edf-0019d11e5a41"
%>

<%doc>
	DONE:
	TODO:
	- where is this from?
	- check this tune.
	- add you tube performances.
	- mark whats been done with this tune.
</%doc>

myChords=\chordmode {
	f1 | bes4. b4:dim7 r4. | f1 | bes4. b8:dim7 r8. c16:7 r4 | f1 | f2.:7 f4:7.5+ |
	bes1 | b:dim7 | f2 a:7 | d:m bes:7 | g:7 c4.:7.4 f8 | r1 |

	f1 | bes4. b4:dim7 r4. | f1 | bes4. b8:dim7 r8. c16:7 r4 | f1 | f2.:7 f4:7.5+ |
	bes1 | b:dim7 | f2 a:7 | d:m bes:7 | g:7 c4.:7.4 f8 | r2 f:7.5+ |
}

myVoice={
	\key f \major
	\time 4/4
	\phraseA | f4 f8 aes8~ aes8 r8 r4 |
	\phraseB | f4 f8 d8(~ d8. )c16 r4 |
	\phraseA | f4 f8 f8~ f8 r8 r4 |
	\phraseB | f4 f8 f8~ f8. c16 d8. f16 |
	a8 c'4. r4 a8. a16 | g8 f4. r4 aes8. g16 |
	aes8. g16 f8. d16 f4 f8 f8 | f8 r8 r4 r2 |

	\phraseB | f4 f8 aes8~ aes8 r8 r4 |
	\phraseB | f4 f8 d8(~ d8. )c16 r4 |
	\phraseA | f4 f8 f8~ f8 r8 r4 |
	\phraseB | f4 f8 f8~ f8. c16 d8. f16 |
	a8 c'4. r4 a8. a16 | g8 f4. r4 aes8. g16 |
	aes8. g16 f8. d16 f4 f8 f8 | f8 r8 r4 r2 |
}

myLyrics=\lyrics {
	Let me tell you 'bout a boy I know __
	He is my ba -- by and he lives next door. __ __
	Ev -- 'ry morn -- ing 'fore the sun comes up, __
	He brings my cof -- fe in my fav -- 'rite cup. __
	That's why I know, __ yes, I know, __ Hal -- le -- lu -- jah, I just love him so. __

	When I'm in trou -- ble an I have no friends, __
	I know he'll go with me un -- til the end. __ __
	Ev -- 'vry bo -- dy asks me how I know. __
	I smile at them and say he told me so. __
	That's why I know, __ yes I know, __ Hal -- le lu -- jah, I just love him so. __
}
