<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['render']="Fake"

	attributes['title']="Doxy"
	attributes['style']="Jazz"
	attributes['composer']="Sonny Rollins"
	# this is from the fake book
	attributes['copyright']="1963 Prestige Music Co, Inc."
	# this is from the fake book
	attributes['piece']="Medium Groove"

	attributes['completion']="5"
	attributes['uuid']="c921579e-a26e-11df-9a5c-0019d11e5a41"

	attributes['structure']="AABA"

	attributes['idyoutuberemark']="Miles Davis!"
	attributes['idyoutube']="ZcPxCQhJ2n4"
%>
% endif

% if part=='Doc':
	DONE:
	- brought in the real book pdf.
	- filled in the tunes meta data from the fake book.
	- added the fake book epdf.
	- wrote down the fake book chords.
	- wrote down the fake book tune.
	- bring in the fake book pdf.
	- check the fake book chords.
	- check the fake book tune.
	- heard the tune to make sure it sounds right.
	- document the youtube performance.
	- added the tunes structure.
	TODO:
	- add the real book chords and tune.
	- how about adding the Aebersold version too?
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\partial 8 s8 |

	\mark "A"
	\startPart
	\repeat volta 2 {
		bes2:7 aes:7 | aes:7 g:7 |
	}
	\alternative {
		{
			c:7 f:7 | bes1:7 |
		}
		{
			c:7 | f:7 | \myEndLine
		}
	}
	\endPart

	\mark "B"
	\startPart
	bes1*2:7 | ees1:7 | e:dim7 | \myEndLine
	\endPart

	\mark "A"
	\startPart
	bes2 aes:7 | aes:7 g:7 | c:7 f:7 | bes1 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative f' {
	\time 4/4
	\key bes \major
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130

	\partial 8 f8 |
	\repeat volta 2 {
		bes8 d bes f bes4 r8 f | bes8 f bes des r g,4 f8 |
	}
	\alternative {
		{
			e8 g bes des \times 4/3 { c16 des c } g8 bes | r2 r4 r8 f |
		}
		{
			e8 g bes des \times 4/3 { c16 des c } g8 a | r1 |
		}
	}
	g'4 r8 f~ f r des4~ | des4. g,8 r c4 g8 |
	des'4 des8 des g,4 c | r2 r4 r8 f, |
	bes d bes f bes4 r8 f | bes f bes des r g,4 f8 |
	e g bes des \times 4/3 { c16 des c } g8 bes | r1 |
}
% endif
