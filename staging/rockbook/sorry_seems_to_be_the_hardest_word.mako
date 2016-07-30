<%page args='part'/>
% if part=='Vars':
<%
	# vim: set filetype=lilypond :
	import attr
	version=attr.Version()
	version['doGuitar']=True
	version['doOwn']=True
	attributes.addVersion('DontMatter', version)
	attributes.setDefaultVersionName('DontMatter')

	# from wikipedia
	attributes['title']='Sorry Seems to Be the Hardest Word'
	# from wikipedia
	attributes['style']='Pop,R&B'
	# from wikipedia
	attributes['composer']='Elton John'
	# from wikipedia
	attributes['poet']='Bernie Taupin'
	# from me
	attributes['piece']='Ballad'
	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'

	attributes['completion']='5'
	attributes['uuid']='795b5442-53f8-11e2-9a2d-871ce68b4fd7'

	attributes['remark']='same scale (g:m) as the original version'

	attributes['idyoutuberemark1']='Original Elton John Video clip'
	attributes['idyoutube1']='c3nScN89Klo'
	attributes['lyricsurl']='http://www.eltonography.com/songs/sorry_seems_to_be_the_hardest_word.html'
	attributes['wiki']='Sorry_Seems_to_Be_the_Hardest_Word'
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the meta data from wikipedia, youtube and the web.
	- put in the chords (my own extraction).
	- put in the lyrics from the internet.
	- checked and fixed the lyrics according to the real song.
	TODO:
	- write down the melody?!?
% endif

<%namespace name="defs" file="/include/defs.ly.mako"/>

<%def name="chords()">
	\chordmode {
		\mark "Opening"
		\startPart
		g2:m/f g:m/e | g:m/ees g:m/d | c1:m7.9 | a2:m7.5- d:7.9- | \myEndLine
		\endPart
		\mark "Verse"
		g1:m7.9 | c:m7.9 | f:7.9 | bes2:9 a4:m7.5- d:7.9- | \myEndLine
		g1:m7.9 | c:m7.9 | f:7.9 | bes2:9 a4:m7.5- d:7.9- | \myEndLine
		\mark "Verse (before Chorus)"
		g1:m7.9 | c:m7.9 | f:7.9 | bes2:9 a4:m7.5- d:7.9- | \myEndLine
		g1:m7.9 | c:m7.9 | f:7.9 | bes2:9 a:m7.5- | \myEndLine
		\mark "Chorus"
		ees2/g d:7/fis | g:m6/f e:m7.5- | ees:maj7.9 d:7 | g:m7.9 a4:m7.5- d:7.9- | \myEndLine
		ees2/g d:7/fis | g:m6/f e:m7.5- | ees1:maj7.9 | c2:m7.9/ees d:7 | \myEndLine
		\mark "Instrumental"
		g1:m7.9 | c:m7.9 | f:7.9 | bes2:9 a4:m7.5- d:7.9- | \myEndLine
		g1:m7.9 | c:m7.9 | f:7.9 | bes2:9 a:m7.5- | \myEndLine
		\mark "Last Verse"
		g1:m7.9 | c:m7.9 | f:7.9 | bes2:9 a4:m7.5- d:7.9- | \myEndLine
		g1:m7.9 | c:m7.9 | a2:m7.5- d:7.9- | g:m7.9 c:7.9 | \myEndLine
		ees:maj7.9 d:7 |
		\mark "Instrumental Ending"
		g2:m/f g:m/e | g:m/ees g:m/d | c:m7.9 a4:m7.5- d:7.9- | g1:m9 | \myEndLine
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
		\fill-line {
			\column {
				\box "Verse"
				"What have I got to do to make you love me"
				"What have I got to do to make you care"
				"What do I do when lightning strikes me"
				"And I wake to find that you're not there"
				\vspace #0.3
				\box "Verse"
				"What do I do to make you want me"
				"What have I got to do to be heard"
				"What do I say when it's all over"
				"And sorry seems to be the hardest word"
				\vspace #0.3
				\box "Chorus"
				"It's sad, so sad"
				"It's a sad, sad situation"
				"And it's getting more and more absurd"
				"It's sad, so sad"
				"Why can't we talk it over"
				"Oh it seems to me"
				"That sorry seems to be the hardest word"
			}
			\hspace #3
			\column {
				\box "Chorus"
				"It's sad, so sad"
				"It's a sad, sad situation"
				"And it's getting more and more absurd"
				"It's sad, so sad"
				"Why can't we talk it over"
				"Oh it seems to me"
				"That sorry seems to be the hardest word"
				\vspace #0.3
				\box "Verse"
				"What do I do to make you love me"
				"What have I got to do to be heard"
				"What do I do when lightning strikes me"
				"What have I got to do"
				"What have I got to do"
				"When sorry seems to be the hardest word"
			}
		}
	}
}
% endif
