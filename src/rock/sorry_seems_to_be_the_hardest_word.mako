<%page args="part"/>
% if part=='Vars':
<%
	attributes['doGuitar']=True
	attributes['doOwn']=True

	# from wikipedia
	attributes['title']="Sorry Seems to Be the Hardest Word"
	# from wikipedia
	attributes['composer']="Elton John"
	# from wikipedia
	attributes['poet']="Bernie Taupin"
	# from wikipedia
	attributes['style']="Pop,R&B"
	# from me
	attributes['piece']="Ballad"

	attributes['completion']="5"
	attributes['uuid']="795b5442-53f8-11e2-9a2d-871ce68b4fd7"

	attributes['remark']="same scale (g:m) as the original version"

	attributes['idyoutube']="c3nScN89Klo"
	attributes['idyoutuberemark']="Original Elton John Video clip"
	attributes['lyricsurl']="http://www.eltonography.com/songs/sorry_seems_to_be_the_hardest_word.html"
	attributes['wiki']="Sorry_Seems_to_Be_the_Hardest_Word"
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

<%namespace name="defs" file="/src/include/defs.makoi"/>

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
		ees2:maj7.9 d:7 | g:m7/bes c:7.9 | ees:maj7.9 d:7 | g:m7.9 a4:m7.5- d:7.9- | \myEndLine
		ees2:maj7.9 d:7 | g:m7/bes c:7.9 | ees1:maj7.9 | c2:m7.9/ees d:7 | \myEndLine
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
	\midi {}
	\layout {}
}

%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small { %% \teeny \tiny \small \normalsize \large \huge
		\fill-line {
			\column {
				%% verse
				"What have I got to do to make you love me"
				"What have I got to do to make you care"
				"What do I do when lightning strikes me"
				"And I wake to find that you're not there"
				\null
				%% verse
				"What do I do to make you want me"
				"What have I got to do to be heard"
				"What do I say when it's all over"
				"And sorry seems to be the hardest word"
				\null
				%% chorus
				"It's sad, so sad"
				"It's a sad, sad situation"
				"And it's getting more and more absurd"
				"It's sad, so sad"
				"Why can't we talk it over"
				"Oh it seems to me"
				"That sorry seems to be the hardest word"
			}
			\null
			\column {
				%% chorus (same as before)
				"It's sad, so sad"
				"It's a sad, sad situation"
				"And it's getting more and more absurd"
				"It's sad, so sad"
				"Why can't we talk it over"
				"Oh it seems to me"
				"That sorry seems to be the hardest word"
				\null
				%% verse
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
