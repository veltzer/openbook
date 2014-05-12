<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['render']="Real"

	attributes['title']="Night And Day"
	attributes['style']="Jazz"
	# from the real book
	attributes['composer']="Cole Porter"
	# from wikipedia
	attributes['poet']="Cole Porter"
	attributes['piece']=""
	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"

	attributes['completion']="5"
	attributes['uuid']="f3f8f010-3fda-11e2-ad72-a3725b0aaeaa"
	attributes['structure']="AAB"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']="http://www.lyricsfreak.com/f/frank+sinatra/night+day_20055251.html"
	attributes['wiki']="Night_and_Day_(song)"
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the meta data from the real book
	- filled in the chords from the real book version.
	- filled in this songs structure.
	- filled in the wikipedia link.
	- brought in the real book version.
	- brought in the kiselev book version.
	- checked the chords from the real book version.
	- fill in the meta data from the kiselev book version (there was no meta info).
	- fill in the tune from the real book version.
	- filled in the words from the internet for the real book version (there are no lyrics in the real book version).
	- check the tune from the real book version.
	- checked that the tune sounds right in the midi version.
	TODO:
	- check the lyrics from the real book version.
	- bring you tube performances.
	- how do I put the last two chords (d:7 g:7) in the real book version in parenthesis?
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\partial 2 s2 |

	\myMark "A"
	\startPart
	\repeat volta 2 {
		d1:m7.5- | g:7 | c1*2:maj7 | \myEndLine
		d1:m7.5- | g:7 | c1*2:maj7 | \myEndLine
		fis1:m7.5- | f:m7 | e:m7 | ees:dim7 | \myEndLine
		d:m7 | g:7 | c:maj7 |
	} \alternative {
		{
			c:maj7 | %% \myEndLine remarked to prevent line break
		}
		{
			bes:7 | \myEndLine
		}
	}
	\endPart

	\myMark "B"
	\startPart
	ees1*2:maj7 | c:maj7 | \myEndLine
	ees:maj7 | c:maj7 | \myEndLine
	fis1:m7.5- | f:m7 | e:m7 | ees:dim7 | \myEndLine
	d:m7 | g2:7 d:m7 | c1:6 | d2:7 g:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c'' {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

	\partial 2 g4 g8 g~ |
	%% part "A"
	\repeat volta 2 {
		g1~ | g2 \times 2/3 { f4 e dis } | e1~ | e2 g4 g8 g~ | \myEndLine
		g4 g g g | g f \times 2/3 { f e dis } | e1~ | e2 e4. e8 | \myEndLine
		e4 e e e | ees2~ ees8 ees4 ees8 | d4 d d d | d des8 c~ c4 b | \myEndLine
		a4 aes8 g~ g2 | g g'4 g8 g~ | g1~ |
	} \alternative {
		{
			g2 g4 g8 g | %% \myEndLine remarked to not create a break
		}
		{
			g2 g4 g | \myEndLine
		}
	}
	%% part "B"
	bes1~ | bes2 \times 2/3 { g4 f ees } | g g8 g~ g2~ | g g4. g8 | \myEndLine
	bes c4 bes8 c4 bes8 c~ | c bes4 g8~ \times 2/3 { g4 f ees } | g g8 g~ g2~ | g2 e!4. e8 | \myEndLine
	e4 e e e | ees2~ ees8 ees4 ees8 | d4 d d d | d8 des c b'~ b bes a4 | \myEndLine
	g4 g8 g~ g2~ | g c4 c8 c~ | c1 | r | \myEndLine
}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	%% part "A"
	Night and day __
	You are the one __
	On -- ly you be -- nea -- th the moon
	And under the sun __
	Whether near to me or far
	No matter, darling Where you are
	I think of you
	Night and day
	%% part "A"
	Day and night
	Why it is so
	That this longing for you
	Follows wherever I go.
	In the roarin' traffic's boom
	In the silence of my lonely room
	I think of you
	Night and day
	%% part "B"
	Night and day
	Under the hide of me
	There's an oh such a hungry
	Yearnin' burnin' inside of me
	And its torment won't be through
	'Til you let me spend my life
	Making love to you
	Day and night
	Night and day
}
% endif
