<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doGuitar']=True
	version['doExtra']=True
	attributes.addVersion('My', version)
	attributes.setDefaultVersionName('My')

	attributes['title']='Shape of My Heart'
	attributes['style']='Pop'
	attributes['composer']='Sting, Dominic Miller'
	attributes['poet']='Sting'
	attributes['piece']='Med. Ballad'
	attributes['singer']='Sting'
	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'

	attributes['completion']='5'
	attributes['uuid']='677fee0a-a26f-11df-bd2c-0019d11e5a41'

	attributes['idyoutuberemark1']='Leon the professional clip...:)'
	attributes['idyoutube1']='_0J0toYZB6Q'
	attributes['idyoutuberemark2']='Another one from Leon...:)'
	attributes['idyoutube2']='nVYFOlVB-Uo'
	attributes['idyoutuberemark3']='And another one from Leon...:)'
	attributes['idyoutube3']='P_1orNvO6Xk'
	attributes['idyoutuberemark4']='And another one from Leon...:)'
	attributes['idyoutube4']='locIxsfpgp4'
	attributes['idyoutuberemark5']='Sting and Dominic with nylon guitar'
	attributes['idyoutube5']='037uSAIahho'
	attributes['idyoutuberemark6']='Orignal video in the studio'
	attributes['idyoutube6']='qZ22i7QllO8'
	attributes['lyricsurl']='http://www.lyrics007.com/Sting%20Lyrics/Shape%20Of%20My%20Heart%20Lyrics.html'

%>
% endif

% if part=='Doc':
	DONE:
	- wrote the chords.
	- added lyrics.
	- filled in meta data (lyricsurl, youtube performances).
	TODO:
	- check the chords
	- add guitar chords.
	- add guitar tab.
	- add tune
% endif

<%namespace name="defs" file="/include/defs.ly.mako"/>

% if part=='ChordsMy':
\chordmode {
	\startChords
	\startSong

	\mark \markup { \tiny \center-column { Verse and chorus } }
	\startPart
	fis2:m fis:m9/e | b:m7 b4:m7 cis:7 | fis2:m fis:m9/e | b:m7 b4:m7 cis:7 | \myEndLine
	d1 | a2:9 cis:7 | d:maj7 cis:7 | fis1:m | \myEndLine
	\endPart

	\mark "When doubling"
	\startPart
	fis2:m fis:m9/e | b:m7 b4:m7 cis:7 | fis2:m fis:m9/e | b:m7 b4:m7 cis:7 | \myEndLine
	d1 | a2:9 cis:7 | d:maj7 cis:7 | fis:m fis:m9/e | \myEndLine
	d:maj7 cis:7 | fis1:m | \myEndLine
	\endPart

	\mark "Special"
	\startPart
	cis2:m cis:m9/b | fis:m7 fis4:m7 gis:7 | cis2:m cis:m9/b | fis:m7 fis4:m7 gis:7 | \myEndLine
	a1 | e2:9 gis:7 | a:maj7 gis:7 | cis:m cis:m9/b | \myEndLine
	a:maj7 gis:7 | a1 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='Extra':
%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\concat {
			\column {
				\box "Verse"
				"He deals the cards as a meditation"
				"And those he plays never suspect"
				"He doesn't play for the money he wins"
				"He doesn't play for respect"
				\vspace #0.3
				\box "Verse"
				"He deals the cards to find the answer"
				"The sacred geometry of chance"
				"The hidden law of a probable outcome"
				"The numbers lead a dance"
				\vspace #0.3
				\box "Chorus"
				"I know that the spades are swords of a soldier"
				"I know that the clubs are weapons of war"
				"I know that diamonds mean money for this art"
				"But that's not the shape of my heart"
				\vspace #0.3
				\box "Verse"
				"He may play the jack of diamonds"
				"He may lay the queen of spades"
				"He may conceal a king in his hand"
				"While the memory of it fades"
			}
			\hspace #3
			\column {
				\box "Chorus"
				"I know that the spades are swords of a soldier"
				"I know that the clubs are weapons of war"
				"I know that diamonds mean money for this art"
				"But that's not the shape of my heart"
				"Shape of my heart"
				\vspace #0.3
				\box "Verse"
				"And if I told you that I loved you"
				"You'd maybe think there's something wrong"
				"I'm not a man of too many faces"
				"The mask I wear is one"
				\vspace #0.3
				\box "Verse"
				"Those who speak know nothing"
				"And find out to their cost"
				"Like those who curse their luck in too many places"
				"And those who fear are lost"
				\vspace #0.3
				\box "Chorus"
				"I know that the spades are swords of a soldier"
				"I know that the clubs are weapons of war"
				"I know that diamonds mean money for this art"
				"But that's not the shape of my heart"
			}
		}
	}
}
% endif
