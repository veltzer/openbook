<%page args='part'/>
% if part=='Vars':
<%
        from scripts import attr
        version=attr.Version()
        version['doChords']=True
        version['doVoice']=True
        attributes.addVersion('Real', version)
        attributes.setDefaultVersionName('Real')

        # from the real book
        attributes['title']='Billie\'s Bounce'
        # from the real book
        attributes['style']='Blues'
        # from the real book
        attributes['composer']='Charlie Parker'
        # from the real book
        attributes['piece']='Blues'

        attributes['typesetter']='Micha Dienert <mdienert@t-online.de>'
        attributes['completion']='5'
        attributes['uuid']='9bd9980c-9628-11e4-80e9-3860779cb560'
        attributes['structure']='Blues'
        attributes['location']='rbk2:24'

        attributes['idyoutuberemark1']='Charly Parker, The Savoy Recordings'
        attributes['idyoutube1']='S4mRaEzwTYo'
        attributes['idyoutuberemark2']='t.b.d.'
        attributes['idyoutube2']='t.b.d.'
%>
% endif

% if part=='Doc':
        DONE:
        - added the epdf from the real book.
        - put in the tunes structure
        - added the meta data from the real book.
        - put in the chords (realbook).
        - put in the tune (realbook).
        - check the chords (realbook).
        - check the tune (realbook).
        - heard the tune to check that it is right and adjust the tempo.
        - added youtube performances.
        TODO:
        - add another version of this tune.
% endif

% if part=='ChordsReal':
\chordmode {
        \startChords
        \startSong

        \partial 8 c8:7 |
        \myMark "A"
        \startPart
           f1:7 | bes2:7 b2:dim| f1:7 | \myEndLine
           f1:7 | bes1:7 | bes1:7 | f1:7 | \myEndLine
           a2:m d2:7 | g1:m | c1:7 | f2:7 d2:7 | \myEndLine
           g2:m c2:7 | 
        \endPart

        \myMark "B"
        \startPart
           f1:7 | f1:7 | \myEndLine
           f1:7 | c2:m f2:7 | bes1:7 | \myEndLine
           bes1:7 | f1:7 | a2:m d2:7 |  \myEndLine
           g1:m | c1:7 | f1:7| \myEndLine
           c1:7 | 
        \endPart

        \endSong
        \endChords
}
% endif

% if part=='VoiceReal':
{
        \tempo "Allegro" 4 = 130
        \time 4/4
        \key c \major

        \partial 8 c8 |
        %% part "A"
        \repeat volta 2 {

           b8 c8 f8 gis8 a8 f8 d8 f8~|f8 d8 f8 r8 r8 f4 d8 |
           f8 r8 r8 f8~ f8 d8 f8 d8 | \myEndLine
           as'8 a8 \tuplet 3/2 { f16 g16 f16 } d8 f8 g8 f8 f8 |
           r4 r8 a8 bes8 f8 r8 as8~ |
           as8 bes8~bes4 es8 c8 f8 es8 | r8 f8 c4 r4 r8 e8~ |
           e4 g,8 e8 fis8 es'8 c8 cis8 |
           d4 r8 g8 \tuplet 3/2 {fis16 g16 fis16} d8 bes8 f8 |
           f'4 r8 f8 e8 e8 d8 d8 |
           c4 r8 f,8~f8 d8 f4|
           r8 f4~f8 d8 f4 c8|
        }

        f4 g8 gis8 s4 ais8 b8 |
        c8 a8 \tuplet 3/2 {bes8 c8 bes8 } a8 f8 d8 c8 |\myEndLine
        %%
        \tuplet 3/2 {g'16 a16 g16} f8 es8 f8~ f4 r4 | r2 r4 r8 f'8~ |
        f8 c16 bes16 as8 f8 g8 f8 es8 d8 | \myEndLine
        %%
        c4 bes8 f8 gis8 a8 bes8 b8 | c8 d16 c16 a8 c8 e8 d8~d4 |
        r1 | \myEndLine
        r4 r8 \tuplet 3/2 {g16 bes16 d16} f8 e8 d8 des8 |
        c8 a8 bes8 c16 bes16 a8 f8 d8 c8 | g'8 f8 g8( a8)~a4 r4 | \myEndLine
        %%
        r1-\markup {\abs-fontsize #14 {(Last 12 Bars are transcribed from Charlie Parker Solo - The Savoy Recordings)}}
        |
        \myEndLine
}
% endif
