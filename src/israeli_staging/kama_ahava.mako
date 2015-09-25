<%page args='part'/>
% if part=='Vars':
<%
	# vim: set filetype=lilypond :
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doExtra']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['heb']=True

	attributes['title']=u'כמה אהבה'
	attributes['style']='Israeli'
	# from the internet
	attributes['composer']=u'מאיר בנאי'
	# from the internet
	attributes['poet']=u'מאיר בנאי'
	# mine
	attributes['piece']=u'פלמנקו'
	# from the internet
	attributes['singer']=u'מאיר בנאי'
	attributes['typesetter']=u'מרק ולצר <mark.veltzer@gmail.com>'

	attributes['completion']='4'
	attributes['uuid']='9196fc14-f623-11e2-afd9-ebf7136455e5'

	# mine
	attributes['structure']='Intro,Verse,Chorus,Verse2,Chorus,Instrumental'

	attributes['idyoutuberemark1']='Meir Banay in original version'
	attributes['idyoutube1']='MtkYo-IVCjw'
	attributes['lyricsurl']='http://shironet.mako.co.il/artist?type=lyrics&lang=1&prfid=606&wrkid=3894'

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
{
	\tempo "Allegro" 4 = 120
	\time 4/4
	\key f \minor

	%% Intro
	c1~ | c2 \tuplet 3/2 { c4 des c } | c4. bes8 bes2~ | bes \tuplet 3/2 { bes4 aes c } |
	c4. f,8 f2 | g \tuplet 3/2 { g4 ees' bes } | c1~ | c |

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
			\hspace #0
			\concat {
				\right-column {

					\box "Verse"
				}
				\hspace #3
				\right-column {

					\box "Verse"

					\vspace #0.3
					\box "Chorus"
				}
			}
		}
	}
}
% endif
