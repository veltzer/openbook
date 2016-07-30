<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doGuitar']=True
	version['doOwn']=True
	attributes.addVersion('DontMatter', version)
	attributes.setDefaultVersionName('DontMatter')

	attributes['title']='Lucky Man'
	attributes['style']='Rock'
	attributes['composer']='Greg Lake'
	attributes['poet']='Greg Lake'
	attributes['piece']='Med. Ballad'
	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'

	attributes['completion']='5'
	attributes['uuid']='a68bcbbc-c8ae-11e0-8fa9-0019d11e5a41'

	attributes['remark']='The D scale is the one used in the original version (Mark Veltzer,17/8/11)'

	attributes['idyoutube1']='5x6uQ6yZsOY'
	attributes['lyricsurl']='http://www.sing365.com/music/lyric.nsf/Lucky-Man-lyrics-Emerson-Lake-Palmer/13302F99F6B11DEC48256AB8002432F8'
%>
% endif

% if part=='Doc':
	remarks:
	\key d \major
	Some people play "a | g | d | d |" at the chorus but this is wrong if you bother
	to hear the original.
	Song progression:
		opening
		verse 1
		chorus 1
		verse 2
		chorus 2
		verse (solo)
		chorus (solo)
		verse 3
		chorus 3
		verse 4
		chorus 4
		ending (2.5 choruses with a solo keyboard and a long D at the end)

	DONE:
	TODO:
% endif

<%namespace name="defs" file="/include/defs.ly.mako"/>

<%def name="chords()">
	\chordmode {
		\startChords
		\startSong

		\myWordMark "Verse"
		\startPart
		g1 | d | g | d | \myEndLine
		g | d | g | d | \myEndLine
		\endPart

		\myWordMark "Chorus"
		\startPart
		a:m | e:m | d1*2 | \myEndLine
		a1:m | e:m | d1*2 | \myEndLine
		\endPart

		\endSong
		\endChords
	}
</%def>

% if part=='Own':
\score {
	<<
		\new FretBoards {
			${chords()}
		}
		${defs.chordDefs()}
		${chords()}
	>>
	%%\midi {}
	\layout {}
}

%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\concat {
			\column {
				\box "Verse"
				"He had white Horses"
				"And ladies by the score"
				"All dressed in satin"
				"And waiting by the door"
				\vspace #0.3
				\box "Chorus"
				"Ooooh, what a lucky man he was"
				"Ooooh, what a lucky man he was"
				\vspace #0.3
				\box "Verse"
				"White lace and feathers"
				"They made up his bed"
				"A gold covered mattress"
				"On which he was led"
				\vspace #0.3
				\box "Chorus"
				"Ooooh, what a lucky man he was"
				"Ooooh, what a lucky man he was"
			}
			\hspace #3
			\column {
				\box "Verse"
				"He went to fight wars"
				"For his country and his king"
				"Of his honor and his glory"
				"The people would sing"
				\vspace #0.3
				\box "Chorus"
				"Ooooh, what a lucky man he was"
				"Ooooh, what a lucky man he was"
				\vspace #0.3
				\box "Verse"
				"A bullet had found him"
				"His blood ran as he cried"
				"No money could save him"
				"So he laid down and he died"
				\vspace #0.3
				\box "Chorus"
				"Ooooh, what a lucky man he was"
				"Ooooh, what a lucky man he was"
			}
		}
	}
}
% endif
