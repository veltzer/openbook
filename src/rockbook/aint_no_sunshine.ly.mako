<%page args='part'/>
% if part=='Vars':
<%
	import attr
	version=attr.Version()
	version['doGuitar']=True
	version['doOwn']=True
	attributes.addVersion('DontMatter', version)
	attributes.setDefaultVersionName('DontMatter')

	attributes['title']='Ain\'t No Sunshine'
	attributes['style']='Pop'
	attributes['composer']='Bill Withers'
	attributes['poet']='Bill Withers'
	attributes['piece']='Med. Ballad'

	attributes['typesetter']='Mark Veltzer <mark@veltzer.net>'
	attributes['completion']='5'
	attributes['uuid']='669540fe-d851-11df-ae78-0019d11e5a41'

	attributes['idyoutuberemark1']='The original video clip from youtube'
	attributes['idyoutube1']='tIdIqbv7SPo'
	attributes['lyricsurl']='http://tabs.ultimate-guitar.com/b/bill_withers/aint_no_sunshine_crd.htm'
	attributes['wiki']='Ain%27t_No_Sunshine'
%>
% endif

% if part=='Doc':
	DONE:
	TODO:
	- mark what has been done to this song (I think it is done).
% endif

<%namespace name="defs" file="/include/defs.ly.mako"/>

<%def name="chords()">
	\chordmode {
		\startChords
		\mark "Verse"
		\startPart
		a2:m7 e4:m7 e:m7/g | a1:m7 |
		a2:m7 e4:m7 e:m7/g | a1:m7 |
		e:m7 | d:m7 |
		a2:m7 e4:m7 e:m7/g | a1:m7 |
		\endPart
		\mark "Interlude"
		\startPart
		%% these chords are silent
		a1*8:m7 |
		%% these chords are even more silent
		a2:m7 e4:m7 e:m7/g | a1:m7 |
		\endPart
		\endChords
	}
</%def>

% if part=='Own':
\score {
	<<
		\new FretBoards {
			${chords()}
		}
		${defs.chordDefs()}
		${chords()}
	>>
	%%\midi {}
	\layout {}
}

%% Lyrics
\verticalSpace
\verticalSpace
\markup {
	\small {
		\concat {
			\column {
				\box "Verse"
				"Ain't no sunshine when she's gone."
				"It's not warm when she's away."
				"Ain't no sunshine when she's gone"
				"And she's always gone too long anytime she goes away."
				\vspace #0.3
				\box "Verse"
				"Wonder this time where she's gone,"
				"Wonder if she's gone to stay"
				"Ain't no sunshine when she's gone"
				"And this house just ain't no home anytime she goes away."
				\vspace #0.3
				\box "Special"
				"And I know, I know, I know, I know, I know,"
				"I know, I know, I know, I know, I know, I know, I know,"
				"I know, I know, I know, I know, I know, I know,"
				"I know, I know, I know, I know, I know, I know, I know, I know"
				"Hey, I ought to leave the young thing alone,"
			}
			\hspace #3
			\column {
				\box "Verse"
				"But ain't no sunshine when she's gone,"
				"Only darkness everyday."
				"Ain't no sunshine when she's gone,"
				"And this house just ain't no home anytime she goes away."
				\vspace #0.3
				\box "Ending"
				"Anytime she goes away."
				"Anytime she goes away."
				"Anytime she goes away."
				"Anytime she goes away."
			}
		}
	}
}
% endif
