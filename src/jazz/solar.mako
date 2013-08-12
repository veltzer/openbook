<%page args="part"/>
% if part=='Vars':
<%
	attributes['doChords']=True
	attributes['doVoice']=True
	attributes['doLyrics']=False
	attributes['render']="Real"

	attributes['title']="Solar"
	attributes['style']="Jazz"
	# from the real book
	attributes['composer']="Miles Davis"
	# no poet for this tune
	#attributes['poet']=""
	# from the real book
	attributes['piece']="Jazz"
	# no copyright for this tune as of yet
	#attributes['copyright']=""

	attributes['completion']="5"
	attributes['uuid']="841f9004-4477-11e2-acde-078065be2912"
	# filled this in myself
	attributes['structure']="A"
	attributes['remark']="The 12 bars have a kind of blue structure feel to them"

	attributes['idyoutuberemark']="Metheny/Holland/Hancock/DeJohnette kickass performance"
	attributes['idyoutube']="FAYt3a-c_k0"
	attributes['idyoutuberemark']="Classic miles davis"
	attributes['idyoutube']="9GADuMRXMRw"
%>
% endif

% if part=='Doc':
	DONE:
	- filled in the meta data from the real book.
	- wrote the real book tune.
	- wrote the real book chords.
	- checked the real book tune.
	- checked the real book chords.
	- checked how the real book version sounds.
	- filled in structure and remark about this tune.
	- added youtube performances.
	- added the real book epdf.
	TODO:
	- add another version except the real book one.
% endif

% if part=='ChordsReal':
\chordmode {
	\startChords
	\startSong

	\repeat volta 2 {
		\myMark "A"
		\startPart
		c1*2:m | g1:m7 | c:7 | \myEndLine
		f1*2:maj7 | f1:m7 | bes:7 | \myEndLine
		ees:maj7 | ees2:m7 aes:7 | des1:maj7 | d2:m7.5- g:7.9- | \myEndLine
		\endPart
	}

	\endSong
	\endChords
}
% endif

% if part=='VoiceReal':
\relative g' {
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130
	\time 4/4
	\key c \major

	\repeat volta 2 {
		r8 c4. b4 d8 c | r g4.~ g a8 | bes4 bes8 bes a4 c8 bes~ | bes1 |
		r8 a4. gis4 bes8 a | r c,4.~ c4 f8 g | aes4 aes8 aes g4 bes8 aes~ | aes2. r8 g~ |
		g4 f8 ees d c4 ges'8~ | ges4 f8 ees des c4 f8~ | f1 | r8 d! ees f g aes b!4 |
	}
}
% endif
