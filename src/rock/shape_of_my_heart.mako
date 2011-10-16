<%inherit file="/src/include/common.makoi"/>
<%
	attributes['jazzTune']=True
	attributes['guitar']=True
	attributes['type']='harmony'
	attributes['render']='My'
	attributes['extra']=True

	attributes['title']="Shape of My Heart"
	attributes['singer']="Sting"
	attributes['poet']="Sting"
	attributes['composer']="Sting"
	attributes['style']="Pop"
	attributes['piece']="Med. Ballad"
	attributes['lyricsurl']="http://www.lyrics007.com/Sting%20Lyrics/Shape%20Of%20My%20Heart%20Lyrics.html"
	attributes['idyoutuberemark']="Leon the professional clip...:)"
	attributes['idyoutube']="_0J0toYZB6Q"
	attributes['idyoutuberemark']="Another one from Leon...:)"
	attributes['idyoutube']="nVYFOlVB-Uo"
	attributes['idyoutuberemark']="And another one from Leon...:)"
	attributes['idyoutube']="P_1orNvO6Xk"
	attributes['idyoutuberemark']="And another one from Leon...:)"
	attributes['idyoutube']="locIxsfpgp4"
	attributes['idyoutuberemark']="Sting and Dominic with nylon guitar"
	attributes['idyoutube']="037uSAIahho"
	attributes['idyoutuberemark']="Orignal video in the studio"
	attributes['idyoutube']="qZ22i7QllO8"

	attributes['completion']="5"
	attributes['uuid']="677fee0a-a26f-11df-bd2c-0019d11e5a41"
%>

<%doc>
	DONE:
	- wrote the chords.
	- added lyrics.
	- filled in meta data (lyricsurl, youtube performances).
	TODO:
	- check the chords
	- add guitar chords.
	- is the composer really sting?
	- add tune
</%doc>

<%def name="myChordsMy()">
\chordmode {
	\startChords
	\startSong

	\mark \markup { \tiny \center-column { Verse and chorus } }
	\startPart
	ges2:m ges:m9/e | d:6 des4:sus4 des | ges2:m ges:m9/e | d:6 des4:sus4 des | \myEndLine
	d1:6 | a2:9 des | d:maj7 des:7 | ges1:m | \myEndLine
	\endPart

	\mark \markup { \tiny \center-column { Chorus (to special) } }
	\startPart
	ges2:m ges:m9/e | d:6 des4:sus4 des | ges2:m ges:m9/e | d:6 des4:sus4 des | \myEndLine
	d1:6 | a2:9 des | d:maj7 des:7 | ges1:m | \myEndLine
	\endPart

	\mark "Special"
	\startPart
	\endPart

	\endSong
	\endChords
}
</%def>

<%def name="extra()">
%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small { %% \teeny \tiny \small \normalsize \large \huge
		\fill-line {
			\column {
			  	%% Verse
				"He deals the cards as a meditation"
				"And those he plays never suspect"
				"He doesn't play for the money he wins"
				"He doesn't play for respect"
				\null
			  	%% Verse
				"He deals the cards to find the answer"
				"The sacred geometry of chance"
				"The hidden law of a probable outcome"
				"The numbers lead a dance"
				\null
				%% Chorus
				"I know that the spades are swords of a soldier"
				"I know that the clubs are weapons of war"
				"I know that diamonds mean money for this art"
				"But that's not the shape of my heart"
				\null
			  	%% Verse
				"He may play the jack of diamonds"
				"He may lay the queen of spades"
				"He may conceal a king in his hand"
				"While the memory of it fades"
			}
			\null
			\column {
				%% Chorus
				"I know that the spades are swords of a soldier"
				"I know that the clubs are weapons of war"
				"I know that diamonds mean money for this art"
				"But that's not the shape of my heart"
				"Shape of my heart"
				\null
			  	%% Verse
				"And if I told you that I loved you"
				"You'd maybe think there's something wrong"
				"I'm not a man of too many faces"
				"The mask I wear is one"
			  	%% Verse
				\null
				"Those who speak know nothing"
				"And find out to their cost"
				"Like those who curse their luck in too many places"
				"And those who fear are lost"
				\null
				%% Chorus
				"I know that the spades are swords of a soldier"
				"I know that the clubs are weapons of war"
				"I know that diamonds mean money for this art"
				"But that's not the shape of my heart"
			}
		}
	}
}
</%def>
