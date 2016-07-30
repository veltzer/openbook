<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('Galit', version)

	attributes['title']='The Man I Love'
	attributes['style']='Jazz'
	# from the real book
	attributes['composer']='George Gershwin'
	# from the internet
	attributes['poet']='Ira Gershwin'
	# from the real book
	attributes['piece']='Slowly'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='e8ff288e-2233-11e1-9b9f-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='rbk2:229'

	attributes['idyoutuberemark1']='Classic Billie Holiday'
	attributes['idyoutube1']='uzJMTSaAl8g'
	attributes['idyoutuberemark2']='Ella Fitzgerald with Tommy Flanagan on the piano'
	attributes['idyoutube2']='ySszeu4H4QI'
	attributes['lyricsurl']='http://www.sing365.com/music/lyric.nsf/The-Man-I-Love-lyrics-Ella-Fitzgerald/8EE600AB304A9C6948256AAB0009579B'
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- filled in meta data from the real book.
	- filled in the tunes structure.
	- filled in the real book chords.
	- filled in the real book tune.
	- filled in the real book lyrics.
	- checked the real book chords.
	- checked the real book tune.
	- checked the real book lyrics.
	- heard the real book version to make sure that the tempo and tune is right.
	- added a lyrics url.
	- added you tube performances.
	- added the galit version of the chords. (copied from the real book version).
	- added the galit version of the tune. (copied from the real book version).
	- added the galit version of the lyrics.
	- checked all the parts of the galit version.
	TODO:
	- add copyright to this tune.
	- bring in another version of this (from where?)
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\myMark "Intro"
	\startPart
	ees1:6 | b2:7 bes:7 | \myEndLine
	\endPart

	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees2. ees4:7 | ees1:m7 | bes:m | c2:7.5+ c:7 | \myEndLine
		aes1:m6 | bes:7 | ees2 aes:maj7 | g:m bes:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees2. ees4:7 | ees1:m7 | bes:m | c2:7.5+ c:7 | \myEndLine
		aes1:m6 | bes2:7 bes4:7.11 bes:7 | ees2 aes | ees aes4:7 g:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		c1:m7 | d2:7 bes4:7 d:dim | c1:m | g:7 | \myEndLine
		c:m7 | d2:7 bes4:7 d:dim | c2:m g:dim | aes bes:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees2. ees4:7 | ees1:m7 | bes:m | c2:7.5+ c:7 | \myEndLine
		aes1:m | bes2:7 bes4:7.11 bes:7 | ees2 aes |
	} \alternative {
		{
			ees bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Andante" 4 = 76
	\time 4/4
	\key ees \major

	%% part "Intro"
	r8. bes'16[ c8. bes16] c8.[ bes16 ees,8. f16] | ges8-. ges-. ges-. ges-. ges-> f~ f4 |

	\repeat volta 2 {

		%% part "A"
		r8 bes c bes c bes des4 | r8 bes c bes des2 | r8 bes c bes c bes des4 | r8 aes bes aes c2 |
		r8 aes bes aes bes aes ces4 | r8 g aes g bes4 aes | g2 g | g1 |

		%% part "A"
		r8 bes c bes c bes des4 | r8 bes c bes des2 | r8 bes c bes c bes des4 | r8 aes bes aes c2 |
		r8 aes bes aes bes aes ces4 | r8 g aes g bes4 g | ees2 ees | ees1 |

		%% part "B"
		ees8 f g fis g4 ees' | ees d bes b | d c g a | b1 |
		ees,8 f g fis g4 ees' | ees d bes b | d c bes! aes | g f g aes |

		%% part "A"
		r8 bes c bes c bes des4 | r8 bes c bes des2 | r8 bes c bes c bes des4 | r8 aes bes aes c2 |
		r8 aes bes aes bes aes ces4 | r8 g aes g bes4 g | ees2 ees |
	} \alternative {
		{
			ees f |
		}
		{
			ees1 |
		}
	}
}
% endif

% if part=='LyricsReal':
%% these are lyrics from the internet adjusted for the real book
\lyricmode {

	%% part "Intro"
	_ _ _ _ _ _ _ _ _ _ _ _ _

	%% part "A"
	Some -- day he'll come a -- long, the man I love
	And he'll be big and strong, the man I love
	And when he comes my way
	I'll do my best to make him stay

	%% part "A"
	He'll look at me and smile, I'll un -- der -- stand
	And in a lit -- tle while he'll take my hand
	And though it seems ab -- surd
	I know we both won't say a word

	%% part "B"
	May -- be I shall meet him Sun -- day
	May -- be Mon -- day, may -- be not
	Still I'm sure to meet him one day
	May -- be Tues -- day will be my good news day

	%% part "A"
	He'll build a lit -- tle home, just meant for two
	From which we'll ne -- ver roam; Who would, would you?
	And so all else a -- bove
	I'm wait -- ing for the man I love
	%% Volta
	_ love
}
% endif

% if part=='ChordsGalit':
%% taken from the real book
\chordmode {
	\startChords
	\startSong

	\myMark "Intro"
	\startPart
	ees1:6 | b2:7 bes:7 | \myEndLine
	\endPart

	\repeat volta 2 {

		\myMark "A"
		\startPart
		ees2. ees4:7 | ees1:m7 | bes:m | c2:7.5+ c:7 | \myEndLine
		aes1:m6 | bes:7 | ees2 aes:maj7 | g:m bes:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees2. ees4:7 | ees1:m7 | bes:m | c2:7.5+ c:7 | \myEndLine
		aes1:m6 | bes2:7 bes4:7.11 bes:7 | ees2 aes | ees aes4:7 g:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		c1:m7 | d2:7 bes4:7 d:dim | c1:m | g:7 | \myEndLine
		c:m7 | d2:7 bes4:7 d:dim | c2:m g:dim | aes bes:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		ees2. ees4:7 | ees1:m7 | bes:m | c2:7.5+ c:7 | \myEndLine
		aes1:m | bes2:7 bes4:7.11 bes:7 | ees2 aes |
	} \alternative {
		{
			ees bes:7 | \myEndLineVoltaNotLast
		}
		{
			ees1 | \myEndLineVoltaLast
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceGalit':
%% taken from the real book
{
	\tempo "Andante" 4 = 76
	\time 4/4
	\key ees \major

	%% part "Intro"
	r8. bes'16[ c8. bes16] c8.[ bes16 ees,8. f16] | ges8-. ges-. ges-. ges-. ges-> f~ f4 |

	\repeat volta 2 {

		%% part "A"
		r8 bes c bes c bes des4 | r8 bes c bes des2 | r8 bes c bes c bes des4 | r8 aes bes aes c2 |
		r8 aes bes aes bes aes ces4 | r8 g aes g bes4 aes | g2 g | g1 |

		%% part "A"
		r8 bes c bes c bes des4 | r8 bes c bes des2 | r8 bes c bes c bes des4 | r8 aes bes aes c2 |
		r8 aes bes aes bes aes ces4 | r8 g aes g bes4 g | ees2 ees | ees1 |

		%% part "B"
		ees8 f g fis g4 ees' | ees d bes b | d c g a | b1 |
		ees,8 f g fis g4 ees' | ees d bes b | d c bes! aes | g f g aes |

		%% part "A"
		r8 bes c bes c bes des4 | r8 bes c bes des2 | r8 bes c bes c bes des4 | r8 aes bes aes c2 |
		r8 aes bes aes bes aes ces4 | r8 g aes g bes4 g | ees2 ees |
	} \alternative {
		{
			ees f |
		}
		{
			ees1 |
		}
	}
}
% endif

% if part=='LyricsGalit':
%% these are lyrics from the internet adjusted for the real book
\lyricmode {

	%% part "Intro"
	_ _ _ _ _ _ _ _ _ _ _ _ _

	%% part "A"
	הוא יום א -- חד י -- בוא א -- הוב לי -- בי
	ע -- ייף מ -- נ -- תי -- בו א -- הוב לי -- בי
	ו -- כש -- הוא י -- ע -- צר
	אז רק או -- מר לו תי -- ש -- אר

	%% part "A"
	י -- ביט בי ו -- יצ -- חק מה, מה מצ -- חיק?
	את שתי י -- די ח -- זק פת -- אום יח -- זיק
	ו -- גם אם זה מו -- זר
	א -- דע כי שנינו לא נאמר ד -- בר

	%% part "B"
	גם אם זה יה -- יה יום ג -- שם
	יום של ק -- שת יום של סתיו
	הוא י -- בוא אי -- ני חו -- ש -- שת
	יום של תכ -- לת הוא דו -- פק ב -- ד -- לת

	%% part "A"
	תה -- יה ל -- נו בק -- תה רק לי ו -- לו
	עם ד -- לת ו -- מי -- טה אח ו -- ח -- לון
	א -- שב בו ו -- א -- ביט
	מ -- תי י -- בוא א -- הוב לי -- בי?

	%% part "Volta"
	_ בי?
}
% endif
