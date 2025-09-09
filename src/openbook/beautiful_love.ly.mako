<%page args='part'/>
% if part=='Vars':
<%
	from scripts import attr
	version=attr.Version()
	version['doChords']=True
	version['doVoice']=True
	version['doLyrics']=True
	version['doLyricsmore']=True
	attributes.add_version('Real', version)
	attributes.set_default_version_name('Real')
	
	attributes['title']='Beautiful Love'
	attributes['style']='Jazz'
	# Sorry for all the slashes. They have to be escaped by mako and then
	# still escaped for Lilypond
	attributes['composer']='Victor Young, Wayne King, Egbert Vanalstyne, Haven Gillespie'
	# this is from the fake book
	attributes['piece']='Ballad'
	# this is from the fake book
	attributes['copyright']='1931 and 1959 Movietone Music Corporation, New York, New York'
	# this is from the fake book
	attributes['copyrightextra']='Copyright Renewed'

	attributes['typesetter']='Roberto Bucher <roberto.bucher@sunrise.ch>'
	attributes['completion']='5'
	attributes['uuid']='b15e533d-b59f-4db6-b363-b716a6b7b161'
	# attributes['structure']='ABA'

%>
% endif

% if part=='Doc':
	DONE:
	- filled in the structure of the tune.
	- wrote down the real book chords.
	- added a lyrics url.
	- wrote down the real book tune.
	- wrote down the real book lyrics.
	- checked the real book lyrics.
	- bring in real book pdf.
	- bring in fake book pdf.
	- fill in the meta data from the fake book pdf.
	- checked the real book chords.
	- checked the real book tune.
	- hear the tune, adjust it's speed and see it's ok.
	- put you tube performances.
	TODO:
	- add the fake book version.
% endif

% if part=='ChordsReal':
\chordmode {
\startChords
\startSong

   s4 s4 s4 s4 \repeat volta 2 {
      |
      e2.:dim5m7 s4 |
      a4.:7.5+ s8 s4 s8 s8 |
      d1:m5 |
      d4:m5 s4 s4 s4 |
      g2.:m7 s4 |
      c4.:7 s8 s4 s8 s8 |
      f1:maj7 |
      e4:dim5m7 s4 a4:7 s4 |
      d4.:m5 s8 s4 s4 | 
      g4.:m7 s8 s4 s4 |
      bes1:7.11+ |
      a4:7 s4 s4 s4
   }
   \alternative {
      {
         |
         d2.:m5 s4 |
         g2.:7.11+ s4 |
         e1:dim5m7 |
         a4:7 s4 s4 s4
      }
      {
         |
         d2:m5 b4:7 s4
      }
   } |
   bes2:7 a2:7 |
   d1:m5 | 
   s4 s4 s4 s4 \bar "|."

\endSong
\endChords
}
% endif

% if part=='VoiceReal':
{
  \numericTimeSignature\time 4/4 \key f \major
   \transposition c r4
   d4 e4 f4 |
   \repeat volta 2 {
      |
      a2.  g4 |
      f4.  e8  d4  e8 [
      f8 ~ ] |
      f1 |
      r4  f4  g4  a4 \break |
      c2.  bes4 |
      a4.  g8  f4  g8 [
      a8 ~ ] |
      a1 |
      r4  a4  b4  cis4 \break |
      e4.  d8 ~  d4  a4 |
      c4.  bes8 ~  bes4  d,4
      |
      e1 |
      r4  e4  f4  g4 \break
   }
   \alternative {
      {
         a2.  d,4 |
         cis2.  d4 |
         e1 | \break
         r4  d4  e4  f4  |
      }  
      {
         a2  cis,4  d4 |
      }
   }
   f2  e2 |
   d1 |
   r4  d4  e4  f4  | 
   \bar "|."
}
% endif

% if part=='LyricsReal':
\lyricmode {
Beau ti ful love, you're all a my stery -      
Beau ti ful love, what have you done to me?
I was con t ent un til you came along
Thril ling my soul with you r song
Beau ti ful love, will my dreams come true?
}
% endif

% if part=='LyricsmoreReal':
\lyricmode {
Beau ti ful love, I've roamed your para dise -
Searc hing for love, - my dream to rea lize 
Rea ch ing for heaven de pen ding on you
}
% endif
