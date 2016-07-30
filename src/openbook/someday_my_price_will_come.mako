<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	version['doExtra']=True
	attributes.addVersion('Real', version)
	attributes.setDefaultVersionName('Real')

	attributes['title']='Someday My Prince Will Come'
	attributes['style']='Jazz'
	# this is from the internet
	attributes['composer']='Frank Churchill'
	# this is from the internet
	attributes['poet']='Larry Morey'
	# this is from the real book
	attributes['piece']='Med. Jazz Waltz'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='4933391e-ee10-11e0-b804-0019d11e5a41'
	attributes['structure']='ABAC'
	attributes['structureremark']='This could be thought of as AB as well'
	attributes['location']='rbk1:388'

	attributes['idyoutuberemark1']='Miles'
	attributes['idyoutube1']='Lo18F5ObPng'
	attributes['idyoutuberemark2']='the great Bill Evans'
	attributes['idyoutube2']='zYpKNM1Yi5o'
	attributes['idyoutuberemark3']='and Bill again'
	attributes['idyoutube3']='KUT06K5eGz4'
	attributes['lyricsurl']='http://artists.letssingit.com/disney-lyrics-someday-my-prince-will-come-31rjgwv'
%>
% endif

% if part=='Doc':
	DONE:
	- added an epdf for the real book.
	- put in the real book chords.
	- put in the real book tune.
	- put in the real book lyrics.
	- made sure the real book chords are good.
	- made sure the real book melody is right.
	- made sure the real book version sounds fine.
	- put in the tunes structure.
	- added the lyrics url.
	- added youtube performances
	TODO:
	- add copyright notice.
	- add another version of this tune.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {

		\myMark "A"
		\startPart
		bes2.:maj7 | d:7.5+ | ees:maj7 | g:7.5+ | \myEndLine
		c:m7 | g:7.5+ | c:7 | f:7 | \myEndLine
		\endPart
	} \alternative {
		{

			\myMark "B"
			\startPart
			d:m7 | des:dim | c:m7 | f:7 | \myEndLine
			d:m7 | des:dim | c:m7 | f:7 | \myEndLineVolta
			\endPart
		}
		{

			\myMark "C"
			\startPart
			f:m7 | bes:7 | ees | e:dim | \myEndLine
			bes/f | c2:m7/f f4:7 | bes2.*2 | \myEndLineVolta
			\endPart
		}
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
{
	\tempo "Allegro" 4 = 130
	\time 3/4
	\key bes \major

	%% part "A"
	\repeat volta 2 {
		f2. | bes2 fis4 | a2 g4 | g2. |
		g | ees'2 b4 | d2 c4 | c d ees |
	} \alternative {
		{

			%% part "B"
			f2 f4 | a2 a4 | f2. | c4 d ees |
			f2 f4 | a2 a4 | f2.~ | f |
		}
		{

			%% part "C"
			f4. e8 f4 | c'2 bes4 | c,4 bes c | a'2 g4 |
			f2 ees4 | d2 c4 | bes2.~ | bes |
		}
	}
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {

	%% part "A"
	Some -- day my prince will come
	Some -- day I'll find my love

	%% part "B"
	And how thrilling that moment will be
	When the prince of my dreams_comes to me
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {

	%% part "A"
	He'll whis -- per I love you
	And steal a kiss or two

	%% part "C"
	Though he's
	_ _ _ _ _ _ _ _ _ _ _ _ _
	far _ a -- way I'll find my love_some -- day
	Some -- day_when my dreams come true
}
% endif

% if part=='Extra':
%% More lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\concat {
			\column {
				\box "A"
				"Someday I'll find my love"
				"Someone to call my own"
				\box "B"
				"And I know at the moment we meet"
				"my heart will start skipping the beats"
				\vspace #0.3
				\box "A"
				"Someday we'll say and do"
				"Things we've been longing to"
				\box "C"
				"Though he's far away I'll find my love someday"
				"Someday when my dreams come true"
			}
			\hspace #3
			\column {
				\box "A"
				"Someday my prince will come"
				"Someday we'll meet again"
				\box "B"
				"And away to his castle we'll go"
				"To be happy forever I know"
				\vspace #0.3
				\box "A"
				"Someday when spring is here"
				"We'll find our love anew"
				\box "C"
				"And the birds will sing and weddingbells will ring"
				"Someday when my dreams come true"
			}
		}
	}
}
% endif
