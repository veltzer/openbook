<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doChordBars']=True
	attributes['doExtra']=True
	attributes['doGuitar']=True
	attributes['render']="My"
	attributes['heb']=True

	attributes['title']=u"יום שישי את יודעת"
	attributes['style']="Israeli"
	attributes['composer']=u"יהודה פוליקר"
	attributes['poet']=u"יעקב גלעד"
	attributes['singer']=u"יהודה פוליקר"
	attributes['piece']=u"רוקנרול"

	attributes['completion']="5"
	attributes['uuid']="d4c79db6-8aec-11e1-bca8-3b15b6cb5cfe"

	attributes['idyoutuberemark']="הביצוע המקורי של בנזין"
	attributes['idyoutube']="wD0Zlwg5VOg"
	attributes['lyricsurl']="http://shironet.mako.co.il/artist?type=lyrics&lang=1&prfid=187&wrkid=1537"
%>
% endif

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\endSong
	\endChords
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
			}
			\null
			\column {
			}
		}
	}
}
% endif
