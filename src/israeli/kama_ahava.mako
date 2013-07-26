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

	attributes['completion']="5"
	attributes['uuid']="9196fc14-f623-11e2-afd9-ebf7136455e5"

	# fill this one out
	attributes['structure']="A"

	attributes['lyricsurl']="http://shironet.mako.co.il/artist?type=lyrics&lang=1&prfid=606&wrkid=3894"

	attributes['idyoutube']="MtkYo-IVCjw"

%>
% endif

% if part=='Doc':
	DONE:
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\mark "Intro"
	\startPart
	\endPart

	\mark "A"
	\startPart
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceMy':
\relative c'{
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 160
	\time 4/4
	\key f \minor

	%% Intro

	%% A part
}
% endif

% if part=='LyricsMy':
\lyricmode {
	%% Intro

	%% A part
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
