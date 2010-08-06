% end verbatim - this comment is a hack to prevent texinfo.tex
% from choking on non-European UTF-8 subsets

\include "src/include/common.lyi"
\header {
	title="צרות טובות"
	composer="שלום חנוך"
	singer="שלום חנוך"
	poet="שמרית אור"
	copyright="GPL"
	style="Pop"
	piece="Med. Ballad"
}

harmony=\new ChordNames \with {
	\override BarLine #'bar-size = #4
	\consists "Bar_engraver"
}
\chordmode {
	\mark "verse"
	\repeat volta 2 {
		c2 b2:min7.5- | a2:min7 d2:min7 | g2:7 c2:maj7 | d2:min7 g2:7 | \break
	}
	\mark "chorus"
	a2:min7 g2:7 | f1:maj7 | a2:min7 d2:min7 | g1:7 | \break
	c2 b2:min7.5- | a2:min7 g2:7 | f2:maj7 g2:7 | c2 g2:7 | \break
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
