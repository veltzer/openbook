<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.addVersion('Fake', version)
	attributes.setDefaultVersionName('Fake')

	attributes['title']='The Girl From Ipanema'
	attributes['style']='Jazz'
	# from the fake book
	attributes['subtitle']='Garota De Ipanema'
	# from the real book
	#attributes['composer']='Jobim'
	# from the fake book
	attributes['composer']='Antonio Carlos Jobim'
	# from the fake book
	attributes['poet']='Vincius De Moraes, Norman Gimbel'
	# from the real book
	#attributes['piece']='Bossa'
	# from the fake book
	attributes['piece']='Moderate Bossa Nova'
	# from the fake book
	attributes['copyright']='1963, Antonio Carlos Jobim and Vincius De Moraes, Brazil'
	# from the fake book
	attributes['copyrightextra']='Sole Selling Agent Duchess Music Corporation (MCA), New York, NY for all. English speaking countries'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='2c3b337c-a26f-11df-b7d1-0019d11e5a41'
	attributes['structure']='AABA'
	attributes['location']='rbk1:171,jfb:132'

	attributes['idyoutuberemark1']='Tom Jobim and Joan Gilberto'
	attributes['idyoutube1']='DmV0TcTNJ3o'
	attributes['idyoutuberemark2']='Frank!'
	attributes['idyoutube2']='NldPFVKYmiw'
	attributes['lyricsurl']='http://www.lyricsfreak.com/f/frank+sinatra/girl+from+ipanema+the_10121534.html'
%>
% endif

% if part=='Doc':
	DONE:
	- put in the tunes meta data from the real book and fake book.
	- put in locations for reak book and fake book.
	- put in the tunes structure.
	- put in the fake book chords.
	- put in the fake book tune.
	- put in the fake book lyrics.
	- check the fake book chords.
	- check the fake book tune.
	- check the fake book lyrics.
	- heard the tune to make sure it sounds good.
	- added you tube performances.
	- added a lyrics url.
	TODO:
	- add the real book version of this tune.
	- there is an intro to this song (I don't know where from...)
	\mark "Intro"
	\startPart
	f1:6.9 | c2:m7 c:m6 | f1:6.9 | c2:m7 c:m6 | \myEndLine
	\endPart

% endif

% if part=='ChordsFake':
\chordmode {
	\startChords
	\startSong

	\myMark "A"
	\startPart
	\repeat volta 2 {
		f1*2:maj7 | g:7 | \myEndLine
		g1:m7 | ges:7 |
	} \alternative {
		{
			f1:maj7 | ges:7.5- | \myEndLineVoltaNotLast
		}
		{
			f1*2:maj7 | \myEndLineVoltaLast
		}
	}
	\endPart

	\myMark "B"
	\startPart
	ges1*2:maj7 | ces:7.9 | \myEndLine
	fis:m7 | d:7.9 | \myEndLine
	g:m7 | ees:7.9 | \myEndLine
	a1:m7 | d:7.5-.9- | g:m7 | c:7.5-.9- | \myEndLine
	\endPart

	\myMark "A"
	\startPart
	f1*2:maj7 | g:7 | \myEndLine
	g1:m7 | ges:7.5- | f:maj7 | ges:7 | \myEndLine
	f:maj7 | ges:7 | f1*2:maj7 | \myEndLine
	\endPart

	\endSong
	\endChords
}
% endif

% if part=='VoiceFake':
{
	\tempo "Allegro" 4 = 130
	\time 2/2
	\key f \major

	%% part "A"
	\repeat volta 2 {
		g'4. e8 e4 d8 g~ | g4 e8 e~ e e d g~ | g4 e e d8 g~ | g g e e~ e e d f~ |
		f d4 d8~ d d c e~ | e c4 c8~ c c bes4 |
	} \alternative {
		{
			r c2.~ | c2 r |
		}
		{
			r4 c2.~ | c2 r |
		}
	}

	%% part "B"
	f1~ | \tuplet 3/2 {f4 ges f} \tuplet 3/2 {ees f ees} |
	des4. ees8~ ees2~ | ees2. r8 gis~ |
	gis1~ | \tuplet 3/2 {gis4 a gis} \tuplet 3/2 {fis gis fis} |
	e4. fis8~ fis2~ | fis2. r8 a~ |
	a1~ | \tuplet 3/2 {a4 bes a} \tuplet 3/2 {g a g} |
	f4. g8~ g2~ | g2 \tuplet 3/2 {r4 a bes} |
	\tuplet 3/2 {c c, d} \tuplet 3/2 {e f g} | gis2. a4 |
	\tuplet 3/2 {bes bes, c} \tuplet 3/2 {d e f} | fis2. r4 |

	%% part "A"
	g4. e8 e4 d8 g~ | g4 e8 e~ e e d g~ | g4 e e d8 g~ | g g e e~ e e d a'~ |
	a4. f8 f f d c'~ | c4. e,8 \tuplet 3/2 {e4 e d} | e1 | r4 r8 e \tuplet 3/2 {e4 e d} |
	e1 | r4 r8 e \tuplet 3/2 {e4 e d} | e1~ | e2. r4 |
}
% endif

% if part=='LyricsFake':
\lyricmode {

	%% part "A"
	Tall and tan and young __ and love -- __ ly,
	the Girl __ From I -- pa -- ne -- __ ma goes walk -- __ ing,
	and when __ she pass -- __ es, each one __ she pass -- __ es goes "\"ah!\"" __

	%% part "volta"
	_

	%% part "B"
	Oh, __ but I watch her so sad -- ly. __
	How __ can I tell her I love her? __
	Yes, __ I would give my heart glad -- ly, __
	but each day when she walks to the sea,
	she looks straight a -- head not at me.

	%% part "A"
	Tall and tan and young __ and love -- __ ly,
	The Girl __ From I -- pa -- ne -- __ ma goes walk -- __ ing,
	and when __ she pass -- es I smile, __
	but she does -- n't see.
	She just does -- n't see.
	No, she does -- n't see. __
}
% endif

% if part=='LyricsmoreFake':
\lyricmode {

	%% part "A"
	When she walks she's like __ a sam -- __ ba
	that swings __ so cool and sways __ _ so gen -- __ tle,
	that when __ she pass -- __ es, each one __ she pass -- __ es goes _ "\"ah!\"" __
}
% endif
