<%inherit file="/src/include/common.makoi"/>
\header {
	default_header

	title="Shape of My Heart"
	singer="Sting"
	style="Pop"
	piece="Med. Ballad"

	completion="0"
	uuid="677fee0a-a26f-11df-bd2c-0019d11e5a41"
}
jazzTune

<%doc>
	TODO:
	- add lyrics
	- add tune
</%doc>

myChords=\chordmode {
	\mark "verse"
	ges2:m ges2:m
	\mark "chorus"

<%doc>
	verse:
	Gbm Gbm|E | Dmaj7 D/Db7 | x2
	Dmaj7 | Amaj7 Db7 | Dmaj7 Db7 | Gbm |
	chorus:
	Gbm Gbm|E | Dmaj7 Db7 | x2
	Dmaj7 | Amaj7 Db7 | Dmaj7 Db7 | Gbm |
</%doc>
}

include(src/include/harmony.lyi)
