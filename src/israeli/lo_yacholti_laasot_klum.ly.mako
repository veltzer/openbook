<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doChordBars']=True
	version['doGuitar']=True
	version['doExtra']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['heb']=True

	attributes['title']=u'לא יכולתי לעשות כלום'
	attributes['style']='Israeli'
	attributes['composer']=u'אילן וירצברג'
	attributes['poet']=u'יונה וולך'
	attributes['piece']=u'בלדת רוק'
	attributes['singer']=u'איןך ןירצברג'
	attributes['typesetter']=u'מרק ולצר <mark.veltzer@gmail.com>'

	attributes['completion']='5'
	attributes['uuid']='f2e3c22e-f100-11e0-9162-0019d11e5a41'
	attributes['remark']='Ilan Virtsberg plays it in G in live concerts'

	attributes['idyoutube1']='XJYKf0sNDoE'
	attributes['lyricsurl']='http://www.mp3music.co.il/tabs/10728.html'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark whats been done in this tune.
	- document the youtube performances.
	- do it in two scales.
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\myWordMark "Verse"
	\startPart
	a1 | fis:m | d | g | a | \myEndLine
	d | d:m | g | a | \myEndLine
	a1 | fis:m | d | g | a | \myEndLine
	a | cis:m | d | d:m | a | \myEndLine
	\endPart

	\myWordMark "Chorus"
	\startPart
	fis1*2:m | cis:m | b:m | fis:m | \myEndLine
	a | cis:m | b:m | fis:m | \myEndLine
	\endPart

	\myWordMark "Solo"
	\startPart
	\startRepeat
	fis1*2:m | cis:m | b:m | fis:m | \myEndLine
	\endRepeat
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='Extra':
%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\fill-line {
			\hspace #0
			\concat {
				\right-column {
					\box "Verse"
					"לא יכולתי לעשות עם זה כלום, אתה שומע?"
					"לא יכולתי לעשות עם זה כלום."
					"זה היה אצלי בידיים..."
					"ולא יכולתי לעשות כלום."
					\vspace #0.3
					\box "Verse"
					"אנלא יכולתי עם זה משהו, אתה שומע?"
					"יכולתי לגמגם"
					"מה רציתי להגיד"
					"יכולתי להרגיש הכי רע, שאפשר."
					\vspace #0.3
					\box "Verse"
					"ופתאום אתה עומד כמו ילד קטן"
					"בסינור לצוואר וחוזר על השאלה"
					"מה עשית עם זה, שואלים לאן"
					"בזבזת את כל זה היה לך סיכוי"
					"ואתה תצטרך להתחיל הכל מחדש."
					\vspace #0.3
					\box "Verse"
					"לא יכולתי לעשות עם זה כלום."
				}
				\hspace #3
				\right-column {
					\box "Verse"
					"לא יכולתי לעשות עם זה כלום, אתה שומע?"
					"לא יכולתי לעשות עם זה כלום."
					"זה היה אצלי בידיים..."
					"ולא יכולתי לעשות כלום."
					\vspace #0.3
					\box "Verse"
					"לא יכולתי לעשות משהו, אתה שומע?"
					"יכולתי לגמגם"
					"מה רציתי להגיד "
					"יכולתי להרגיש הכי רע, שאפשר."
					\vspace #0.3
					\box "Verse"
					"לא יכולתי לעשות עם זה כלום, אתה שומע?"
					"לא יכולתי לעשות עם זה כלום."
					"זה היה אצלי בידיים..."
					"ולא יכולתי לעשות כלום."
					\vspace #0.3
					\box "Verse"
					"לא יכולתי לעשות משהו, אתה שומע?"
					"יכולתי לגמגם"
					"מה רציתי להגיד"
					"יכולתי להרגיש הכי רע, שאפשר."
					\vspace #0.3
					\box "Verse"
					"ופתאום אתה עומד כמו ילד קטן"
					"בסינור לצוואר וחוזר על השאלה"
					"מה עשית עם זה, שואלים לאן"
					"בזבזת את כל זה היה לך סיכוי"
					"ואתה תצטרך להתחיל הכל מחדש."
				}
			}
		}
	}
}
% endif
