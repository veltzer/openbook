<%page args="part"/>
% if part=='Vars':
<%
	attributes['doGuitar']=True
	attributes['doChords']=True
	attributes['doChordBars']=True
	attributes['doExtra']=True
	attributes['render']="My"
	attributes['heb']=True

	attributes['title']=u"איך הוא שר"
	attributes['style']="Israeli"
	attributes['composer']=u"דני רובס"
	attributes['poet']=u"דני רובס"
	attributes['singer']=u"דני רובס"
	attributes['piece']=u"בלדת רוק"
	attributes['typesetter']=u"מרק ולצר <mark.veltzer@gmail.com>"

	attributes['completion']="5"
	attributes['uuid']="8203d67e-41a0-11e2-a975-5a1faa0d3cc5"

	attributes['idyoutube']="ARuMB_iMRcY"
	attributes['lyricsurl']="http://www.tab4u.com/tabs/songs/1172_%D7%93%D7%A0%D7%99_%D7%A8%D7%95%D7%91%D7%A1_-_%D7%90%D7%99%D7%9A_%D7%94%D7%95%D7%90_%D7%A9%D7%A8.html"
%>
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\mark "Verse"
	\startPart
	\repeat volta 2 {
		a1:m | d:m/f | e:sus4 | e:7 |
	}
	f | g:7 | c | e:7 |
	a:m | d:m | e:sus4 | e:7 |
	\endPart

	\mark "Chorus"
	\startPart
	d:m | g | c | a:7 |
	d:m | e:7 | f | a:7 |
	d:m | g | c | a:7 |
	d:m | e:7 | f | a:m |
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
			\right-column {
				%% chorus
				"איך הוא שר, איך הוא שר, הם רקדו מסביבו בטירוף הוא היה מאושר"
				"איך הוא שר, איך הוא שר, מה נשאר מהזוהר מכל השירים מה נשאר"
				\null
				%% verse
				"הם סגדו לו כמו אל, הוא היה סך הכל בן-אדם"
				"הקולות ששמע בשכונה נמוגים לאיטם"
				"רק הפחד ההוא הלבן בעורקיו מתפתל"
				"הוא חשב שימריא איתו, לא, הוא נופל"
				\null
				%% chorus
				"איך הוא שר, איך הוא שר, הם רקדו מסביבו בטירוף הוא היה מאושר"
				"איך הוא שר, איך הוא שר, מה נשאר מהזוהר מכל השירים מה נשאר"
			}
			\null
			\right-column {
				%% verse
				"מרחוק הוא שומע תפילות בית הכנסת מלא"
				"הנרות הדולקים ריח ערב שבת שוב עולה"
				"איך כולם התגאו בו הילד עם קול הזהב"
				"והסוף כמו בקרב אבוד, סוגר עליו"
				\null
				%% verse
				"ואמו לחשה לתינוק שרעד ובכה"
				"עוד תיראה לכולנו תהיה גאווה מקולך"
				"חום ידו של אביו כששר והאש בעיניו"
				"והסוף כמו בקרב אבוד, סוגר עליו"
			}
		}
	}
}
% endif
