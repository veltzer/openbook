<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="The Shadow of Your Smile"
	attributes['style']="Jazz"
	# this is from the real book
	attributes['composer']="Johnny Mandel"
	# this is from wikipedia
	attributes['poet']="Paul Francis Webster"
	# this is from the real book
	attributes['piece']="Slow Bossa"

	attributes['completion']="5"
	attributes['uuid']="dff04e04-a969-11e1-b8c5-5a1faa0d3cc5"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""

	attributes['structure']="ABAC"
	attributes['remark']="The structure could also be thought of as AB but it is very close to a pure ABAC"
	attributes['lyricsurl']="http://www.absolutelyrics.com/lyrics/view/barbra_streisand/the_shadow_of_your_smile"
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the lyrics URL.
	- filled in all the meta data for this tune.
	TODO:
	- in the real book version how do I put the last b:7 chord in parenthesis?
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 8*5 s8 s2 |

	%% A part
	fis1:m7 | b2:7.9 b:7.9- | e1:m7 | a:7 | \myEndLine
	a:m7 | d:7 | g:maj7| c:maj7 | \myEndLine
	%% B part
	fis:m7.5- | b:7 | e1.:m7 e2:7/d | \myEndLine
	cis1:m7.5- | fis:7 | fis:m7 | b:7 | \myEndLine
	%% A part
	fis1:m7 | b2:7.9 b:7.9- | e1:m7 | a:7 | \myEndLine
	a:m7 | d:7 | b:m7.5- | e:7.3-.5-.9-.11-.13- | \myEndLine
	%% C part
	a:m7 | c2:m7 f:7 | b1:m7 | e:7.9- | \myEndLine
	a2:7 ees:7 | a:m7 d:7.9- | g1.:6 b2:7 | \myEndLine

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key g \major

	\partial 8*5 b8 e fis g b |

	%% A part
	cis,2. fis4 | dis2. c!4 | b1~ | b4. b8 e fis g b |
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics).
\lyricmode {
	%% A part
	The sha -- dow of your smile
	When you are gone
	Will co -- lor all my dreams
	And light the dawn
	%% B part
	Look into my eyes, my love, and see
	All the lovely things you are to me
	%% A part
	A wistful little star
	Was far too high
	A tear drop kissed your lips
	and so did I
	%% C part
	Now when I remember spring
	All the joy that love can bring
	I will be remembering
	The shadow of your smile

	Now when I remember spring
	All the love that joy can bring
	I will be remembering
	The shadow of your smile...
}
% endif
