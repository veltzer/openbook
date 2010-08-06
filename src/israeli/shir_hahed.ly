\include "src/include/common.lyi"
\header {
	title="שיר ההד"
	subtitle=""
	composer="יוחנן זראי"
	copyright="-- עיזרו לי למלא זכויות יוצרים --"
	style="Rock"
	singer="אריק לביא"
	piece="בלדה איטית"
	poet="יעקב שבתאי"

	completion="5"

	url="http://www.youtube.com/watch?v=IUZQgbhivqw"
}

%{
	TODO:
%}

\score {
<<
\chords {
	\set chordChanges = ##t
	\partial 4 r4
	\mark "opening"
	e1 | e1 | fis1 | e4 aes4/ees a4/cis a4 | e1 |
	\mark "verse"
}
\new Voice="melody" \relative f' {
	\time 6/8
	\key e \major
	gis4
}
\new Lyrics \lyricsto "melody" {
	בוקר עלה בהרים הכחולים
	טיפסתי נושם בשבילים עתיקים
	נולד בי שיר זמר נושן:
	"הו, מה כחול!"
	והד לי ענה מהרי הבשן:
	"הו, מה כחול, כחול, כחול, כחול!"

	שמש מכה על ראשי הגבעות
	קרוע בגדי ופני לוהטות
	שירי אז עלה בצמא:
	"הו מה עייף!"
	והד לי ענה מאבני החומה:
	"הו מה עייף, עייף, עייף, עייף!"

	ערב יורד ובגיא דמדומים
	טיפסתי בודד בשבילים אדומים
	שירי מתגלגל במדרון:
	"הו מה בודד!"
	והד לי עונה מהרי גוש עציון
	"הו מה בודד, בודד, בודד, בודד!"

	לילה יורד בין צוקי הר נבו
	צבוע בוכה אל מדבר וחולו
	קולי מחפש את רעי
	"הו מה רחוק!"
	והד לי עונה מפסגת הר סיני:
	"הו מה רחוק, רחוק, רחוק, רחוק!"
}
	>>
		\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 110 4)
		}
	}
	\layout {}
}
