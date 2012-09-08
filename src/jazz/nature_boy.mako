<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Newreal"

	attributes['title']="Nature Boy"
	attributes['style']="Jazz"
	# from the new real book
	attributes['composer']="Eben Ahbez"
	attributes['poet']="Eben Ahbez"
	# from the real book (volume II)
	attributes['piece']="Slowly"
	# from the new Real book
	attributes['piece']="Med. Ballad"
	# from the new Real Book
	attributes['copyright']="1948, Eben Ahbez"

	attributes['completion']="5"
	attributes['uuid']="13d57a4a-a26f-11df-8711-0019d11e5a41"
	attributes['structure']="AB"
	attributes['remark']="7th bar of letters A and B were originally 2 bars each. Melody is straight eights, though rather freely interpreted rhythmically."

	attributes['idyoutube']="Iq0XJCJ1Srw"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book epdf.
	- brought in the new real book epdf.
	- filled in this tunes structure.
	- filled in this tunes meta data (from the new real book).
	- put in the new real book chords.
	- put in the new real book tune.
	- put in the new real book lyrics.
	- checked the new real book chords.
	- checked the new real book tune.
	- checked the new real book lyrics.
	- heard the tune to make sure it sounds right and the rythm is right.
	TODO:
	- document the youtube performance.
	- add another youtube performance.
	- add a lyrics url.
	- in the new real book version the b:m7.5- on at the end of the B part and the final two chords of the B
	part (turn-around chords) should be in parenthesis. How do I do that?
	- add the real book version.
	REMARKS:
	- this tunes structure can also be AA' or maybe ABAC since the A and the B part are VERY similar.
% endif

% if part=='ChordsNewreal':
\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\mark "A"
	\startPart
	d1:m | e2:m7.5- a:7 | d1:m | e2:m7.5- a:7 | \myEndLine
	d:m d:m7+ | d:m7 d:m6 | g:m6 d:m | e1:m7.5- | \myEndLine
	a1*2:7 | d:m | \myEndLine
	e:7.9- | a:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	d1:m | e2:m7.5- a:7 | d1:m | e2:m7.5- a:7 | \myEndLine
	d:m d:m7+ | d:m7 d:m6 | g:m6 d:m | e1:m7.5- | \myEndLine
	a1*2:7 | d1:m | b:m7.5- | \myEndLine
	e:7.9- | a:7.5+ | d:m | e2:m7.5- a:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceNewreal':
\relative a {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Moderato" 4 = 110
	\time 4/4
	\key d \minor
	\partial 8 a8 |

	%% A part
	a'8 f d2. | r4 r8 a e' f g bes | a f d2. | r4 r8 a e' f g bes |
	a4. d8 cis2 | a4. c!8 b2 | g4. bes!8 a4. d,8 | e2. r8 a, |
	a'2. g4 | e2. a,4 | g'2. f4 | d2. a4 |
	f'2. e4 | b2. c4 | cis1 | r2 r4 r8 a |

	%% B part
	a'8 f d2. | r4 r8 a e' f g bes | a f d2. | r4 r8 a e' f g bes |
	a4. d8 cis2 | a4. c!8 b2 | g4. bes!8 a4. d,8 | e2. r8 a, |
	a'2. g4 | e2. a,4 | g'2. f4 | d2. a4 |
	f'4. e8 b4. a8 | g'4 f2 a,8 e' | d1 | r |
}
% endif

% if part=='LyricsNewreal':
\lyricmode {
	%% A part
	There was a boy,
	A ver -- y strange en -- chant -- ed boy
	They say he wan -- dered ver -- y far, ver -- y far,
	o -- ver land and sea;

	A lit -- tle shy
	and sad of eye,
	But ver -- y wise
	was he

	%% B part
	And then one day,
	One mag -- ic day he came my way,
	And as we spoke of man -- y things, fools and kings,
	this he said to me: The

	great -- est thing
	you'll ev -- er learn
	is just to love and be loved
	in re -- turn.
}
% endif
