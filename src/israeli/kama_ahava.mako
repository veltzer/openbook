<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="My"
	attributes['heb']=True
	attributes['doExtra']=True

	attributes['title']=u"כמה אהבה"
	attributes['style']="Israeli"
	# from the internet
	attributes['composer']=u"מאיר בנאי"
	# from the internet
	attributes['poet']=u"מאיר בנאי"
	# from the internet
	attributes['singer']=u"מאיר בנאי"
	# mine
	attributes['piece']=u"פלמנקו"

	attributes['completion']="4"
	attributes['uuid']="9196fc14-f623-11e2-afd9-ebf7136455e5"

	# mine
	attributes['structure']="Intro,Verse,Chorus,Verse2,Chorus,Instrumental"

	attributes['lyricsurl']="http://shironet.mako.co.il/artist?type=lyrics&lang=1&prfid=606&wrkid=3894"

	attributes['idyoutuberemark']="Meir Banay in original version"
	attributes['idyoutube']="MtkYo-IVCjw"

%>
% endif

% if part=='Doc':
	DONE:
	- added meta data for the tune from the internet
	- added lyrics url.
	- added youtube performances.
	- filled in the tunes structure
	TODO:
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\mark "Intro"
	\startPart
	f1*2:m | c:m | \myEndLine
	bes1:m | c:m | f1*2:m | \myEndLine
	\endPart

	\mark "Verse"
	\startPart
	f1*2:m | c:m | \myEndLine
	bes1:m | c:m | f1*2:m | \myEndLine
	f1*2:m | c:m | \myEndLine
	bes1:m | c:m | f1*2:m | \myEndLine
	bes1*2:m | aes | \myEndLine
	bes1:m | c:7 | bes:m | c:7 | \myEndLine

	f1*2:m | c:m | \myEndLine
	bes1:m | c:m | f1*2:m | \myEndLine
	bes:m | aes | \myEndLine
	bes1:m | c:7 | bes:m | c1*2:7 | \myEndLine
	\endPart

	\mark "Chorus"
	f1:m | des:maj7 | b:m7 | f:m | \myEndLine
	b:m7 | f:m | b:m7 | c:7 | \myEndLine
	f1:m | des:maj7 | b:m7 | f:m | \myEndLine
	b:m7 | f:m | b:m7 | c1*2:7 | \myEndLine
	\startPart
	\endPart

	\mark "Verse"
	\startPart
	f1*2:m | c:m | \myEndLine
	bes1:m | c:m | f1*2:m | \myEndLine
	bes1*2:m | aes | \myEndLine
	bes1:m | c:7 | bes:m | c1*2:7 | \myEndLine
	\endPart

	\mark "Chorus"
	f1:m | des:maj7 | b:m7 | f:m | \myEndLine
	b:m7 | f:m | b:m7 | c:7 | \myEndLine
	f1:m | des:maj7 | b:m7 | f:m | \myEndLine
	b:m7 | f:m | b:m7 | c1*2:7 | \myEndLine
	\startPart
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceMy':
\relative c'{
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 120
	\time 4/4
	\key f \minor

	%% Intro
	c1~ | c2 \times 2/3 { c4 des c } | c4. bes8 bes2~ | bes \times 2/3 { bes4 aes c } |
	c4. f,8 f2 | g \times 2/3 { g4 ees' bes } | c1~ | c |

	%% Verse
}
% endif

% if part=='LyricsMy':
\lyricmode {
	%% Intro
	_ _ _ _ _ _ _ _ _ _

	%% A part
	היה זה בוקר יום ראשון
	העיירה עוד ישנה
	והוא ממשיך ושר,
	שר מול חלונה
	נזכר איך הוא וחבריו
	ישבו בבית קפה קטן
	כשהיא יצאה לרחוב
	כמו סופה אל ים
	ליבו כמעט הפסיק לפעום
	הוא התאהב בה במקום
	כשהיא שלחה אליו מבט
	העולם שתק
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
				%% part
			}
			\null
			\right-column {
				%% part
				\null
				%% part
			}
		}
	}
}
% endif
