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

	attributes['completion']="1"
	attributes['uuid']="f3f8f010-3fda-11e2-ad72-a3725b0aaeaa"
	attributes['structure']="AB"
	attributes['remark']=""

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
	TODO:
	- fill in the tune from the real book version.
	- fill in the words for the real book version.
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
		fis:m7.5- | f:m7 | e:m7 | ees:dim7 | \myEndLine
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
	fis:m7.5- | f:m7 | e:m7 | ees:dim7 | \myEndLine
	d:m7 | g2:7 d:m7 | c:6 | d2:7 g:7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key bes \major

	\partial 2 g4 g8 g |

	%% part "A"

	%% part "B"

}
% endif

% if part=='LyricsReal':
%% this version of the lyrics is from the fake book but adjusted for the real book (the real book has no lyrics)...
\lyricmode {
	%% part "A"
	%% part "B"
}
% endif
