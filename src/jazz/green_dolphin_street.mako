<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['render']="Real"

	attributes['title']="Green Dolphin Street"
	attributes['composer']="Bronislau Kaper"
	attributes['poet']="Ned Washington"
	attributes['style']="Jazz"
	# this is from the real book
	attributes['piece']="Latin/Swing"
	# this is from the new real book, vol 3
	attributes['piece']="Med. Latin"
	# this is from the new real book, vol 3
	attributes['copyright']="1947 (Renewed 1975) MGM/EMI Feist Catalog, Inc."

	attributes['structure']="ABAC"

	attributes['completion']="5"
	attributes['uuid']="b93bdc7e-0207-11e1-9e68-0019d11e5a41"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
	DONE:
	- added the tune structure.
	- added the real book chords.
	- added the reak book notes.
	- checked the real book chords.
	- take care of the repeat signs.
	- added "The book" epdf for this tune.
	- checked the real book tune.
	- checked that the real book version sounds hood.
	- get meta data for this tune from somewhere.
	TODO:
	- are there lyrics for this? if so, add them (and lyrics url).
	- add youtube performances.
	- in the real book version how do I put the last two chords (the turn-around chords)
		in parenthesis?
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {
		\mark "A"
		\startPart
		c1*2:maj7 | c:m7 | \myEndLine
		d1:7/c | d2:7/c des/c | c1*2:maj7 | \myEndLine
		\endPart
	}
	\alternative {
		{
			\mark "B"
			\startPart
			d1:m7 | g:7 | c1*2:maj7 | \myEndLine
			f1:m7 | bes:7 | ees1:maj7 | ees2:maj7 g:7 | \myEndLine
			%% remarked to allow the repeat signs
			%%\endPart
		}
		{
			\mark "C"
			\startPart
			d2:m7 d:m/c | b:m7.5- e:7.9- | a:m7 a:m/g | fis:m7.5- b:7 | \myEndLine
			e:m7 a:7 | d:m7 g:7 | c1:maj7 | d2:m7 g:7 | \myEndLine
			\endPart
		}
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 160
	\time 4/4
	\key c \major

	%% part "A"
	\repeat volta 2 {
		c2 c~ | c \times 2/3 { b4 g e } | bes'1~ | bes |
		a2 a~ | a \times 2/3 { aes4 f des } | g1~ | g |
	}
	\alternative {
		{
			%% part "B"
			r8 g4. d4 e | f g aes bes | g1~ | g |
			r8 bes4. f4 g | aes bes ces des | bes1~ | bes2 b |
		}
		{
			%% part "C"
			r8 g4. d4 e | f g gis e' | d4. c8~ c2 | c,4 d dis b' |
			a4. g8~ g2 | r8 g4. g4 g | g1~ | g |
		}
	}
}
% endif
