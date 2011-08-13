if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	au! BufNewFile,BufRead *.ly setf lilypond
	au! BufNewFile,BufRead *.lyi setf lilypond
	au! BufNewFile,BufRead *.gpp setf lilypond
augroup END
