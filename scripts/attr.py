'''
This is the attributes object to be used in every tune
to fill in the tunes meta data.
It should do as much validation as is possible to enforce
good meta data by tune authors
'''

import os.path # for join, isfile
import subprocess # for check_call, DEVNULL
import shutil # for copy

order=[
    'doChords',
    'doVoice',
    'doLyrics',
    'doLyricsmore',
    'doLyricsmoremore',
    'doChordBars',
    'doGuitar',
    'doExtra',
    'doPrep',
    'doOwn',
    'render',
    'heb',
    'dedication',
    'title',
    'style',
    'subtitle',
    'subsubtitle',
    'composer',
    'poet',
    'piece',
    'singer',
    'arranger',
    'album',
    'opus',
    'instrument',
    'copyright',
    'copyrightextra',
    'copyrightextraextra',
    'typesetter',
    'completion',
    'dontimport',
    'uuid',
    'structure',
    'structureremark',
    'location',
    'remark',
    'idyoutuberemark1',
    'idyoutube1',
    'idyoutuberemark2',
    'idyoutube2',
    'idyoutuberemark3',
    'idyoutube3',
    'idyoutuberemark4',
    'idyoutube4',
    'idyoutuberemark5',
    'idyoutube5',
    'idyoutuberemark6',
    'idyoutube6',
    'lyricsurl',
    'wiki',
]

books_translation={
    'cc': 'Colorado Cookbook',
    'cfb': 'Cuban Fake Book',
    'fj': 'Fake Jazz - The World\'s Greatest Fake Book',
    'hlrjb': 'Hal Leonard Real Jazz Book',
    'jbf': 'Jazz Bible Fakebook - Best Of 50s',
    'jfb': 'Jazz Fake Book',
    'jltd': 'jazz_ltd_content',
    'js': 'Jazz standards (Budget books)',
    'kw': 'Kiselev W. - 150 American Jazz Standards',
    'lrb': 'Latin Real Book',
    'lomj': 'Library of Musicians´Jazz',
    'nrbk1': 'newreal1',
    'nrbk2': 'newreal2',
    'nrbk3': 'newreal3',
    'nrbk1': 'New Real Book Vol 1',
    'nrbk2': 'New Real Book Vol 2',
    'nrbk3': 'New Real Book Vol 3',
    'rebk1': 'Real Easy Book Vol 1',
    'tbk': 'The Book',
    'tolmfb': 'The Original Legal Musician Fake Book',
    'toban': 'The Other Book All New',
    'tob': 'The Other Book',
    'rbk3': 'The Real Book of Jazz Volume III',
    'rbk2': 'The Real Book of Jazz Volume II',
    'rbk1': 'The Real Book of Jazz Volume I',
    'rvb': 'The Real Vocal Book',
    'rvb2': 'The Real vocal book vol 2',
    'tsbk1': 'The Slickbook 1',
    'tsbk2': 'The Slickbook 2',
    'tsrbk': 'The Standards Real Book',
    'ttfbk': 'The TV Fakebook - Hal Leonard',
    'twgfb': 'The World\'s Greatest Fake Book',
    'vfbk': 'Vanilla Real Book',
    'ja54': 'Jamey Aebersold volume 54',
    'gt': 'Guitar - 557 Standards',
}

books_offsets={
    'jfb': -1,
    'rbk1': 13,
    'rbk2': 7,
    'rbk3': 5,
    'tsrbk': -3,
    'nrbk1': 13,
    'nrbk3': 10,
    'tbk': 11,
}

books_dont_have=set([
    'ja54',
])

doCheckLocation=False

# where are all the fake books?
folder='/home/mark/links/topics_archive/music_education/jazz/collections'

def check_int(val):
    if not val.isdigit():
        raise ValueError('what kind of page number is', val)

def check_have_file(filename):
    full=os.path.join(folder, filename)
    if not os.path.isfile(full):
        raise ValueError('do not have file', full)

def check_location(val):
    parts=val.split(',')
    for part in parts:
        (bk, pages)=part.split(':')
        if bk=='file':
            filename=pages
            check_have_file(filename)
        else:
            if not bk in books_translation:
                raise ValueError('what kind of value is', val)
            if not bk in books_dont_have:
                filename=books_translation[bk]+'.pdf'
                check_have_file(filename)
            if '-' in pages:
                (pg_from, pg_to)=pages.split('-')
                check_int(pg_from)
                check_int(pg_to)
            else:
                check_int(pages)

class Version(dict):
    def __init__(self):
        super().__init__()
        self['doChords']=False
        self['doVoice']=False
        self['doLyrics']=False
        self['doLyricsmore']=False
        self['doLyricsmoremore']=False
        self['doChordBars']=False
        self['doGuitar']=False
        self['doExtra']=False
        self['doPrep']=False
        self['doOwn']=False

class Attributes(dict):
    def postinit(self):
        self.pos=-1
        self.versions=dict()
        self.defaultVersionName=None
    def __init__(self):
        super().__init__()
        self.postinit()
    def __setitem__(self, key, val):
        newpos=order.index(key)
        if newpos<=self.pos:
            raise ValueError('incorrect order of assignment', key, self['title'], self.pos, newpos)
        if key=='location' and doCheckLocation:
            check_location(val)
        self.pos=newpos
        super().__setitem__(key, val)
    def reset(self):
        self.clear()
        self.postinit()
    def cut(self, p_cutnum, p_output):
        val=self['location']
        if val=='':
            raise ValueError('have no location information')
        parts=val.split(',')
        if p_cutnum<0 or p_cutnum>=len(parts):
            raise ValueError('location out of range')
        part=parts[p_cutnum]
        (bk, pages)=part.split(':')
        if bk=='file':
            filename=pages
            full=os.path.join(folder, filename)
            shutil.copy(full, p_output)
        else:
            if not bk in books_translation:
                raise ValueError('what kind of value is', val)
            if bk in books_dont_have:
                raise ValueError('dont have the book', bk)
            filename=books_translation[bk]+'.pdf'
            full=os.path.join(folder, filename)
            if not os.path.isfile(full):
                raise ValueError('dont have file', full)
            if '-' in pages:
                (pg_from, pg_to)=pages.split('-')
                check_int(pg_from)
                check_int(pg_to)
            else:
                check_int(pages)
                pg_from=pages
                pg_to=pages
            pg_from=int(pg_from)
            pg_to=int(pg_to)
            # apply offsets to page numbers
            if bk in books_offsets:
                pg_from+=books_offsets[bk]
                pg_to+=books_offsets[bk]
            cut_pdf(full, pg_from, pg_to, p_output)
    def addVersion(self, name, version):
        self.versions[name]=version
    def setDefaultVersionName(self, name):
        self.defaultVersionName=name
    def getDefaultVersionName(self):
        return self.defaultVersionName
    def getDefaultVersion(self):
        return self.versions[self.defaultVersionName]
    def getWorkingVersion(self):
        return self.versions[self.defaultVersionName]

def cut_pdf(source_pdf, pg_from, pg_to, output_pdf):
    args=[
        'gs',
        '-sDEVICE=pdfwrite',
        '-dNOPAUSE',
        '-dBATCH',
        '-dSAFER',
        '-dFirstPage='+str(pg_from),
        '-dLastPage='+str(pg_to),
        '-sOutputFile='+output_pdf,
        source_pdf,
    ]
    subprocess.check_call(args, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
