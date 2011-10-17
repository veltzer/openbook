<%page args="part"/>
% if part=='Vars':
<%
	attributes['doGuitar']=True
	attributes['doChords']=True
	attributes['render']="My"
	attributes['doExtra']=True

	attributes['title']=u"לא יכולתי לעשות כלום"
	attributes['composer']=u"אילן וירצברג"
	attributes['singer']=u"איןך ןירצברג"
	attributes['poet']=u"יונה וולך"
	attributes['piece']=u"בלדת רוק"

	attributes['completion']="5"
	attributes['uuid']="f2e3c22e-f100-11e0-9162-0019d11e5a41"

	attributes['idyoutube']="XJYKf0sNDoE"
	attributes['lyricsurl']="http://www.mp3music.co.il/tabs/10728.html"
	attributes['remark']="Ilan Virtsberg plays it in G in live concerts"
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

	\mark "Verse"

	\startPart
	a1 | fis:m | d | g | a |
	d | d:m | g | a |
	a1 | fis:m | d | g | a |
	a | cis:m | d | d:m | a |
	\endPart

	\mark "Chorus"
	\startPart
	fis1*2:m | cis:m | b:m | fis:m |
	a | cis:m | b:m | fis:m |
	\endPart

	\mark "Instrumental"
	\startPart
	\startRepeat
	fis1*2:m | cis:m | b:m | fis:m |
	\endRepeat
	\endPart

	\endSong

	\endChords
}
% endif

% if part=='FretsMy':
\new FretBoards {
	\PartChords
}
% endif

% if part=='Extra':
%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small { %% \teeny \tiny \small \normalsize \large \huge
		\fill-line {
			\column {
				"לא יכולתי לעשות עם זה כלום, אתה שומע?"
				"לא יכולתי לעשות עם זה כלום."
				"זה היה אצלי בידיים..."
				"ולא יכולתי לעשות כלום."
				\null
				"לא יכולתי לעשות משהו, אתה שומע?"
				"יכולתי לגמגם"
				"מה רציתי להגיד "
				"יכולתי להרגיש הכי רע, שאפשר."
				\null
				"לא יכולתי לעשות עם זה כלום, אתה שומע?"
				"לא יכולתי לעשות עם זה כלום."
				"זה היה אצלי בידיים..."
				"ולא יכולתי לעשות כלום."
				\null
				"לא יכולתי לעשות משהו, אתה שומע?"
				"יכולתי לגמגם"
				"מה רציתי להגיד"
				"יכולתי להרגיש הכי רע, שאפשר."
			}
			\null
			\column {
				"ופתאום אתה עומד כמו ילד קטן"
				"בסינור לצוואר וחוזר על השאלה"
				"מה עשית עם זה, שואלים לאן"
				"בזבזת את כל זה היה לך סיכוי"
				"ואתה תצטרך להתחיל הכל מחדש."
				\null
				"לא יכולתי לעשות עם זה כלום, אתה שומע?"
				"לא יכולתי לעשות עם זה כלום."
				"זה היה אצלי בידיים..."
				"ולא יכולתי לעשות כלום."
				\null
				"אנלא יכולתי עם זה משהו, אתה שומע?"
				"יכולתי לגמגם"
				"מה רציתי להגיד"
				"יכולתי להרגיש הכי רע, שאפשר."
				\null
				"ופתאום אתה עומד כמו ילד קטן"
				"בסינור לצוואר וחוזר על השאלה"
				"מה עשית עם זה, שואלים לאן"
				"בזבזת את כל זה היה לך סיכוי"
				"ואתה תצטרך להתחיל הכל מחדש."
				\null
				"לא יכולתי לעשות עם זה כלום."
			}
		}
	}
}
% endif
