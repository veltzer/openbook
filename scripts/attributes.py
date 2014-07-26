import enum # for Enum

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
	'typesetter',
	'completion',
	'uuid',
	'structure',
	'location',
	'structureremark',
	'remark',
	'idyoutuberemark1',
	'idyoutube1',
	'idyoutuberemark2',
	'idyoutube2',
	'idyoutuberemark3',
	'idyoutube3',
	'idyoutuberemark4',
	'idyoutube4',
	'lyricsurl',
	'wiki',
]

class Attributes(dict):
	def __init__(self):
		super().__init__()
		self.pos=-1
	def __setitem__(self, key, val):
		newpos=order.index(key)
		if newpos<self.pos:
			raise ValueError('incorrect order of assignment', key)
		self.pos=newpos
		super().__setitem__(key, val)
	def reset(self):
		self.pos=-1
