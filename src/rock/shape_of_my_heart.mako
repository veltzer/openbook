<%inherit file="/src/include/common.makoi"/>
<%
	attributes['jazzTune']=True
	attributes['guitar']=True
	attributes['type']='harmony'
	attributes['render']='My'

	attributes['title']="Shape of My Heart"
	attributes['singer']="Sting"
	attributes['style']="Pop"
	attributes['piece']="Med. Ballad"

	attributes['completion']="0"
	attributes['uuid']="677fee0a-a26f-11df-bd2c-0019d11e5a41"
%>

<%doc>
	DONE:
	TODO:
	- add guitar chords.
	- check the chords
	- add lyrics
	- add tune
</%doc>

<%def name="myChordsMy()">
\chordmode {
	\startChords
	\startSong
	\mark "Verse"
	\startPart
	ges2:m ges:m/e | d:maj7 d4 des:7 | ges2:m ges:m/e | d:maj7 d4 des:7 | \myEndLine
	d1:maj7 | a2:maj7 des:7 | d:maj7 des:7 | ges1:m | \myEndLine
	\endPart
	\mark "Chorus"
	\startPart
	ges2:m ges:m/e | d:maj7 des:7 | ges2:m ges:m/e | d:maj7 des:7 | \myEndLine
	d1:maj7 | a2:maj7 des:7 | d:maj7 des:7 | ges1:m | \myEndLine
	\endPart
	\endSong
	\endChords
}
</%def>
