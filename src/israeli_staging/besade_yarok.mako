<%page args='part'/>
% if part=='Vars':
<%
	# vim: set filetype=lilypond :
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['heb']=True

	attributes['title']=u'בשדה ירוק'
	attributes['style']='Israeli'
	attributes['composer']=u'דני סנדרסון'
	attributes['poet']=u'מאיר אריאל'
	attributes['piece']=u'בלדה איטית'
	attributes['singer']=u'דני סנדרסון'
	attributes['typesetter']=u'מרק ולצר <mark.veltzer@gmail.com>'

	attributes['completion']='4'
	attributes['uuid']='42424480-a26f-11df-abb4-0019d11e5a41'

	attributes['idyoutube1']='En9qtX5VnLE'

%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark what has been done with this tune.
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\partial 4 s4 |

	bes2 a:m7 | g1:m7 | g2:m7 bes | f c:7 | \myEndLine
	bes a:m7 | g1:m7 | g2:m7 bes | f c:7 | c1:7 | \myEndLine

	g:m7 | bes | f2 c:7 | f1 | \myEndLine
	g:m7 | bes2 c:7 | f ees | bes c:7 | \myEndLine

	\endSong
	\endChords
}
% endif

% if part=='VoiceMy':
{
	\time 4/4
	\key f \major
	\partial 4 a'8 c |

	d d4 c8 ~ c4 a8 f | g g4 g8 ~ g4 d8 f |
	g g4 f8 ~ f e d c | f f4 e8 ~ e4 a8 c |

	d d4 c8 ~ c4 a8 f | g g4 g8 ~ g4 d8 f |
	g g4 f8 ~ f e d c | f f4 c8 ~ c2 | r2. f8 e |

	d4 a'8 g4 f8 e4 |
}
% endif

% if part=='LyricsMy':
\lyricmode {
	ב -- ש -- דה י -- רוק, על גב -- עה תלו -- לה.
	ב -- מ -- קום ר -- חוק, סוף ד -- רך לא סלו -- לה.
	ב -- ש -- דה י -- רוק, על גב -- עה תלו -- לה.
	א -- ה -- בת ח -- יי לי -- פול עוד ע -- לו -- לה.

	על מר -- בד עלי עשב רו -- ח
	שם ישבנו לר -- אות שקי -- עה
	והייתה תחושה של תפוח
	והיינו כל כך קרובים לנגיעה

	בשדה ירוק, על גבעה תלולה
	בושם אהבה נודפת וטלולה
	בשדה ירוק על גבעה תלולה
	אהבת חיי ליפול עוד עלולה

	עדרים גלשו אל השוקת
	על שפתי מפלי שיער
	חלילים התחילו למשוך את
	קו הרכס הרץ במעלה ההר

	בשדה ירוק על גבעה תלולה
	מגמה שקופה בהכרה צלולה
	בשדה ירוק, על גבעה תלולה
	כי תהום שחורה רובצת חלולה

	בין הרים השמש שקעה לה
	וירח עוד לא עלה
	יפתי פתאום פחדה לה
	אל תהום פעורה - כאילו צללה

	היא נתנה לדעת לדעת
	היא הפליאה להיוודע
	ואני צמא דעת לגעת
	עד לקצה הידיעה, אל תוך הלא נודע

	בשדה ירוק על גבעה תלולה
	במקום רחוק, סוף דרך לא סלולה
	בשדה ירוק, על גבעה תלולה
	אהבת חיי ליפול עוד עלולה
}
% endif
