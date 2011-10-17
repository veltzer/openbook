<%inherit file="/src/include/common.makoi"/>
<%def name="vars()">
<%
	attributes['jazzTune']=True
	attributes['type']="harmony_tune_lyricsmore"
	attributes['render']="Real"
	attributes['extra']=True

	attributes['title']="Someday My Prince Will Come"
	attributes['composer']="Frank Churchill & Larry Morey"
	attributes['style']="Jazz"
	attributes['piece']="Med. Jazz Waltz"

	attributes['completion']="5"
	attributes['uuid']="4933391e-ee10-11e0-b804-0019d11e5a41"

	attributes['idyoutuberemark']="Miles"
	attributes['idyoutube']="Lo18F5ObPng"
	attributes['idyoutuberemark']="the great Bill Evans"
	attributes['idyoutube']="zYpKNM1Yi5o"
	attributes['idyoutuberemark']="and Bill again"
	attributes['idyoutube']="KUT06K5eGz4"

	attributes['structure']="AB"
	attributes['lyricsurl']="http://artists.letssingit.com/disney-lyrics-someday-my-prince-will-come-31rjgwv"
%>
</%def>

<%doc>
	DONE:
	for the real book version:
	- made sure it sounds fine.
	- made sure the chords are good.
	- made sure the melody is right.
	- aligned the lyrics.
	- added an epdf from the real book.
	TODO:
	- add copyright notice.
	- add a fakebook version (is there one?)
	- fixup names of composers and poets (I'm not sure they are right)
</%doc>

<%def name="myChordsReal()">
\chordmode {
	\startChords

	\startSong

	\repeat volta 2 {
		bes2.:maj7 | d:7.5+ | ees:maj7 | g:7.5+ | \myEndLine
		c:m7 | g:7.5+ | c:7 | f:7 | \myEndLine
	} \alternative {
		{
			d:m7 | des:dim | c:m7 | f:7 | \myEndLine
			d:m7 | des:dim | c:m7 | f:7 | \myEndLine
		}
		{
			f:m7 | bes:7 | ees | e:dim | \myEndLine
			bes/f | c2:m7/f f4:7 | bes2.*2 | \myEndLine
		}
	}

	\endSong

	\endChords
}
</%def>

<%def name="myVoiceReal()">
\relative c' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 3/4
	\key bes \major

	\repeat volta 2 {
		f2. | bes2 fis4 | a2 g4 | g2. |
		g | ees'2 b4 | d2 c4 | c d ees |
	} \alternative {
		{
			f2 f4 | a2 a4 | f2. | c4 d ees |
			f2 f4 | a2 a4 | f2.~ | f |
		}
		{
			f4. e8 f4 | c'2 bes4 | c,4 bes c | a'2 g4 |
			f2 ees4 | d2 c4 | bes2.~ | bes |
		}
	}
}
</%def>

<%def name="myLyricsReal()">
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	Some -- day my prince will come
	Some -- day I'll find my love
	And how thrilling that moment will be
	When the prince of my dreams_comes to me
}
</%def>

<%def name="myLyricsRealmore()">
\lyricmode {
	He'll whis -- per I love you
	And steal a kiss or two
	Though he's
	_ _ _ _ _ _ _ _ _ _ _ _ _
	far _ a -- way I'll find my love_some -- day
	Some -- day_when my dreams come true
}
</%def>

<%def name="extra()">
%% More lyrics
\verticalSpace
\verticalSpace
\markup {
	\small { %% \teeny \tiny \small \normalsize \large \huge
		\fill-line {
			\column {
				"Someday I'll find my love"
				"Someone to call my own"
				"And I know at the moment we meet"
				"my heart will start skipping the beats"
				\null
				"Someday we'll say and do"
				"Things we've been longing to"
				"Though he's far away I'll find my love someday"
				"Someday when my dreams come true"
			}
			\null
			\column {
				"Someday my prince will come"
				"Someday we'll meet again"
				"And away to his castle we'll go"
				"To be happy forever I know"
				\null
				"Someday when spring is here"
				"We'll find our love anew"
				"And the birds will sing and weddingbells will ring"
				"Someday when my dreams come true"
			}
		}
	}
}
</%def>
