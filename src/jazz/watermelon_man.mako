<%def name="vars()">
<%
	attributes['jazzTune']=True
	attributes['type']="harmony_tune"
	attributes['render']="Real"

	attributes['title']="Watermelon Man"
	attributes['composer']="Herbie Hancock"
	attributes['copyright']="1962, 1963 & 1965 By Hancock Music Co., New York, NY"
	attributes['style']="Jazz"
	attributes['piece']="16-Bar Blues"

	attributes['completion']="5"
	attributes['uuid']="359f7428-a26f-11df-ad8c-0019d11e5a41"

	attributes['idyoutube']="4z8Rt4nvd-I"
%>
</%def>

<%doc>
	DONE:
	TODO:
	- document what has been done.
	- document the youtube performance.
	- add the piano accompaniment for this song (rythm pattern with some notes - ripp
	it off the album).
	- add another version of this one with epdf.
</%doc>

<%def name="myChordsReal()">
\chordmode {
	\startChords

	\startSong

	f1:7 | f1:7 | f1:7 | f1:7 | \myEndLine
	bes1:7 | bes1:7 | f1:7 | f1:7 | \myEndLine
	c1:7 | bes1:7 | c1:7 | bes1:7 | \myEndLine
	c1:7 | bes1:7 | f1:7 | f1:7 | \myEndLine

	\endSong

	\endChords
}
</%def>

<%def name="myVoiceReal()">
\relative ees'' {
	\key c \major
	\time 4/4
	%% http://veltzer.net/blog/blog/2010/08/14/musical-tempo-table/
	\tempo "Allegro" 4 = 130

	ees1\<~ | ees4\! f,8 f8 <aes c> ( <bes d>4-. ) f8~ | f1~ | f2 r2 |
	f'1\<~ | f4\! f,8 f8 <aes c> ( <bes d>4-. ) f8~ | f1~ | f2 r2 |
	r4 c'8 ( c8 g'4 a4 | aes8 g8 f8 d8 f4 g-. ) |
	r4 c,8 ( c8 g'4 a4 | aes8 g8 f8 d8 c4 d-. ) |
	r4 c8 ( c8 g'4 aes4 | \mark \markup { \italic { break } } f-. ) f,8 f8 <aes c> ( <bes d>4-. ) f8~ | f1 | r1 |
}
</%def>
