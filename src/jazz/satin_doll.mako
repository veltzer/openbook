<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=True
	attributes['doLyricsmore']=True
	attributes['render']="Fake"

	attributes['title']="Satin Doll"
	attributes['style']="Jazz"
	# this is from the fake book
	attributes['composer']="Duke Ellingtone, Billy Strayhorn"
	# this is from the fake book
	attributes['poet']="Johnny Mercer"
	# this is from the fake book
	attributes['piece']="Smoothly"
	# this is from the fake book
	attributes['copyright']="1958 Tempo Music, Inc"
	attributes['typesetter']="Jordan Eldredge <JordanEldredge@gmail.com>"
	attributes['copyrightextra']=""

	attributes['completion']="5"
	attributes['uuid']=""
	attributes['structure']="AABA"

	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['idyoutuberemark']=""
	attributes['idyoutube']=""
	attributes['lyricsurl']=""
%>
% endif

% if part=='Doc':
% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
    d2:m7 g:7 | d:m7 g:7 | e:m7 a:7 | e:m7 a:7 |
    a:m9 d:9 | aes:m9 des:9 |
	} \alternative {
		{
            c d:m7 | e:m7 a:7 |
		}
		{
            c f:7
		}
	}
	\endPart

	\myMark "B"
	\startPart
    c1 | g2:m7 c:7 | g:m7 | c:9- | f:maj7 g:m7 | 
    a:m7 bes:m7 | a:m7 d:7 | a:m7 d:9- | g:7 d:m7 |
    g1:7 | 
	\endPart

	\myMark "A"
	\startPart
    d2:m7 g:7 | d:m7 g:7 | e:m7 a:7 | e:m7 a:7 |
    a:m9 d:9 | aes:m9 des:9 | c4 c:7/e f aes/ges | c/g g:7 c2:6.9 |
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
\relative c'' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	%%\tempo "Allegro" 4 = 130
	\time 2/2
	\key c \major

	%% A part
	\repeat volta 2 {
        a8. g16 a8 g~ g a4. | r8 a4. g8 a4. | b8. a16 b8 a~ a b4. | r8 b4. a8 b4. |
        r8 d4. c8 d4. | r8 bes4. aes4 bes8 g~ |
	} \alternative {
		{
            g1~ | g |
		}
		{
            g1\repeatTie |
		}
	}
	%% B part
    r2 r4 r8 g | c4 bes8. a16 g8. a16 bes4 | c4 bes8. a16 g8. a16 bes8 c~ | c1~ |
    c2. r8 c | d8. c16 b8. a16~ a8. b16 c4 | d8. c16 b8 a~ a8. b16 c8 d~ | d1~ |
    d8 \xNote { d4^"(Spoken)" d8 d d4. } | a8. g16 a8 g~ g a4. | r8 a4. g8 a4. | b8. a16 b8 a~ a b4. |
    r8 b4. a8 b4. | r8 d4. c8 d4. | r8 bes4. aes4 bes8 g~ | g1~ | g2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {
	%% part "A"
	%% Volta
    Cig -- a -- rette hold -- er which wigs me, o -- ver her shoul -- der, she digs me.
    Out cat -- tin' that Sat -- in Doll. __
	%% part "B"
    _ She's no -- bod -- y's fool, so I'm play -- ing it cool as can be. __
    I'll give it a whirl, __ but I ain't for no girl __ catch -- ing me. __
    Switch -- E -- Roo -- ney 
    %% part "A"
    Tel -- e -- phone num -- bers well you know, do -- ing my rhum -- bas
    with u -- no, and that 'n' my Sat -- in Doll. __

}
% endif

% if part=='LyricsmoreFake':
\lyricmode {
    Ba -- by shall we __ go out skip -- pin' care -- ful a -- mi -- gos, you're flip -- pin'.
    Speaks lat -- in that Sat -- in Doll.
}
% endif
