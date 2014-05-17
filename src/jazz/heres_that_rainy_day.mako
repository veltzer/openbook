<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	# this is only for the real book version
	#attributes['doLyricsmore']=True
	attributes['render']="Fake"

	attributes['title']="Here's That Rainy Day"
	attributes['style']="Jazz"
	# this is from the real book
	attributes['composer']="Jim Van Heusen"
	# this is from the fake book
	attributes['composer']="James Van Heusen"
	# this is from the fake book
	attributes['poet']="Johnny Burke"
	# this is from the fake book
	attributes['piece']="Slowly"
	# this is from the fake book
	attributes['copyright']="1953 by BOURCE CO. and DORSEY BROS. MUSIC, INC. Copyright Renewed."

	attributes['typesetter']="Mark Veltzer <mark@veltzer.net>"
	attributes['completion']="5"
	attributes['uuid']="4c69df80-cd7f-11e1-8c91-4b6b0349580b"
	attributes['structure']="ABAC"
	attributes['structureremark']="You can also think of this as AB"

	attributes['idyoutuberemark']="Nat King Cole in a great vocal version"
	attributes['idyoutube']="yokM-Hfu5Gc"
	attributes['idyoutuberemark']="The great Bill Evans"
	attributes['idyoutube']="cJzIvj9IKcM"
	attributes['lyricsurl']="http://kokomo.ca/pop_standards/heres_that_rainy_day_lyrics.htm"
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the meta data from the fake book.
	- put in the tunes structure.
	- brought in the fake book epdf.
	- put in the fake book chords.
	- put in the fake book tune.
	- put in the fake book lyrics.
	- played the fake book version to hear that it sounds well.
	- checked the fake book chords.
	- checked the fake book tune.
	- checked the fake book lyrics.
	- put in you tube performances with documentation.
	- put in a lyrics url.
	- brought in the real book epdf.
	- put in the real book chords.
	- put in the real book tune.
	- put in the real book lyrics.
	- played the real book version to hear that is sounds well.
	- checked the real book chords.
	- checked the fake book lyrics.
	- checked the fake book tune.
	TODO:
	- how do I put the last two chords in the real book version in parenthesis?
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {
		\myMark "A"
		\startPart
		g2.:maj9 g4:maj9/fis | bes2:7/f e:7.5- | ees1:maj7 | ees:6 | \myEndLine
		a:m7 | d2.:7 d4:7.5-.9- | g1:maj7 | d2:m7 g:7 | \myEndLine
		\endPart

		\myMark "B"
		\startPart
		c1:m7 | f:9 | bes2.:maj7 e4:9 | ees1:maj7 | \myEndLine
		a:m7 | d2.:9 d4:7.9- | g1:maj7 | a2:m7 d:7 | \myEndLine
		\endPart

		\myMark "A"
		\startPart
		g2.:maj9 g4:maj9/fis | bes2:7/f e:7.5- | ees1:maj7 | ees:6 | \myEndLine
		a:m7 | d2.:7 d4:7.5-.9- | g1:maj9 | d2:m7 g:9.5+ | \myEndLine
		\endPart

		\myMark "C"
		\startPart
		c1:maj7 | a2:m7 d4:7 d:7/c | b2:m7 e:m7 | a:7.5- a:7 | \myEndLine
		a1:m7 | d2:7 a4:m7 d:7.9- |
	} \alternative {
		{
			g2 e:m7 | a:m7 d:9 | %% \myEndLine
		}
		{
			g1 | bes:6 | ees2:maj7 aes:maj7 | g1:6 | \myEndLine
		}
	}
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\set Staff.timeSignatureFraction=#'(2 . 2)
	\time 4/4
	\key g \major

	\repeat volta 2 {
		%% "A" part
		d4 d2 d4 | d f bes d | d2 c4. b!8 | c1 |
		d,4 d2 d4 | d fis a c | b1~ | b2. r4 |
		%% "B" part
		ees2 ees | ees4 g, aes a | d2 f,4 fis | g2 f4 g |
		c c8 c c4 c8 c | c4 e, eis fis | b1~ | b2. r4 |
		%% "A" part
		d,4 d2 d4 | d f bes d | d2 c4. b!8 | c1 |
		d,4 d2 d4 | d fis a c | b1~ | b2. r4 |
		%% "C" part
		e4 e2 e4 | e a, b c | d2 fis,4 g | a1 |
		d,4 d2 d4 | d fis a b |
	} \alternative {
		{
			g1~ | g4 r r2 |
		}
		{
			g1~ | g~ | g~ | g2. r4 |
		}
	}
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% part "A"
	May -- be I should have saved those left -- ov -- er dreams;
	fun -- ny, but Here's That Rain -- y Day. __
	%% part "B"
	Here's That Rain -- y Day they told me a -- bout,
	and I laughed at the thought that it might turn out this way. __
	%% part "A"
	Where is that worn out wish that I threw a -- side,
	Af -- ter it brought my lov -- er near? __
	%% part "C"
	Fun -- ny how love be -- comes a cold rain -- y day.
	Fun -- ny that rain -- y day is here. __
	%% volta
	here. __
}
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {
		\myMark "A"
		\startPart
		f2:m c:7/e | aes:7/ees d:7 | des:maj7 c:m7 | bes:m bes:m7 | \myEndLine
		g1:m7.5- | c:7.9- | f:maj7 | c2:m7 f:7 | \myEndLine
		\endPart
	} \alternative {
		{
			\myMark "B"
			\startPart
			bes1:m7 | ees:7 | aes:maj7 | des:maj7 | \myEndLine
			g:m7.5- | c:7 | f:maj7 | g2:m7.5- c:7.9- | \myEndLine
			\endPart
		}
		{
			\myMark "C"
			\startPart
			bes1:maj7 | g2:m7 c:7 | a1:m7 | aes:dim | \myEndLine
			g:m7 | c:7 | f:maj7 | g2:m7.5- c:7.9- | \myEndLine
			\endPart
		}
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative {
	%% https://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key f \major

	\repeat volta 2 {
		%% "A" part
		c2. c4 | c ees aes c | c2. bes8 a! | bes2. r4 |
		c,2. c4 | c e g bes | a1~ | a2. f4 |
	} \alternative {
		{
			%% "B" part
			des'2. des4 | des f, fis g | c2. ees,8 e! | f1 |
			bes2. bes4 | bes d, dis e | a1~ | a2. r4 |
		}
		{
			%% "C" part
			d2. d4 | d g, a bes | c2. e,8 f | g2. f4 |
			c2. c4 | c e g a | f1~ | f |
		}
	}
}
% endif

% if part=='LyricsReal':
\lyricmode {
	%% part "A"
	Maybe I should have saved those left -- ov -- er dreams;
	funny, but Here's That Rain -- y Day. __
	%% part "B"
	_ Here's That Rain -- y Day they told me a -- bout,
	and_I laughed_at the thought that_it_might turn_out_this way. __
	%% part "C"
	Funny how love be -- comes a cold rain -- y day. _
	Funny that rain -- y day is here. __
	%% volta
	here. __
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
	%% part "A"
	Where_is that worn out wish that I threw a -- side,
	After it brought my lov -- er near? __ _
}
% endif
