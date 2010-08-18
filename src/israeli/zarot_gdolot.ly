\include "src/include/common.lyi"
\header {
	title="צרות טובות"
	composer="שלום חנוך"
	singer="שלום חנוך"
	poet="שמרית אור"
	copyright="GPL"
	style="Pop"
	piece="Med. Ballad"

	uuid="5a9b270e-a26f-11df-a792-0019d11e5a41"
}

harmony=\new ChordNames \with {
	\override BarLine #'bar-size = #4
	\consists "Bar_engraver"
}
\chordmode {
	\mark "verse"
	\repeat volta 2 {
		c2 b2:m7.5- | a2:m7 d2:m7 | g2:7 c2:maj7 | d2:m7 g2:7 | \break
	}
	\mark "chorus"
	a2:m7 g2:7 | f1:maj7 | a2:m7 d2:m7 | g1:7 | \break
	c2 b2:m7.5- | a2:m7 g2:7 | f2:maj7 g2:7 | c2 g2:7 | \break
}
text=\lyricmode {
	בעירי היו שתי עלמות
	שתי עלמות יפות ותאומות.
	הן היו תמיד כל כך דומות,
	כל כך דומות היו העלמות.

	ואהבתי את שתיהן, אלי,
	זאת שלי היתה וזאת שלי,
	ככה באו לי צרות טובות
	שתים הן ולא יודעות
	זאת על זו, וזו על זאת.

	האחת נשאתי להרים
	כדי לראות בזרח החמה
	ואת השניה ליערים
	לראות כיצד השמש נעלמה.

	ואהבתי את שתיהן אלי
	זו שלי הייתה וזו, שלי..
	ככה באו לי צרות טובות
	שתיים הן ולא יודעות
	זו על זו וזו על זו..

	איך שהימים חולפים מהר
	ואיך הליל הולך ומתקצר,
	והמלאכים רומזים לי כבר -
	מה אעשה, במי מהן אבחר?

	ואהבתי את שתיהן אלי
	זו שלי הייתה וזו, שלי..
	ככה באו לי צרות טובות
	שתיים הן ולא יודעות
	זו על זו וזו על זו..
}

\include "src/include/harmony_text.lyi"
