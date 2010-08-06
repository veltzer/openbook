ALL:=
CLEAN:=

DO_PDF:=1
DO_PNG:=1
DO_PS:=1
DO_MIDI:=1
DO_STAMP:=1
DO_WAV:=1
DO_MP3:=1

FILES_LY:=$(shell find . -name "*.ly")
FILES_LYD:=$(addsuffix .d,$(FILES_LY))

FILES_PDF:=$(addsuffix .pdf,$(basename $(FILES_LY)))
FILES_PNG:=$(addsuffix .png,$(basename $(FILES_LY)))
FILES_PS:=$(addsuffix .ps,$(basename $(FILES_LY)))
FILES_MIDI:=$(addsuffix .midi,$(basename $(FILES_LY)))
FILES_STAMP:=$(addsuffix .stamp,$(basename $(FILES_LY)))
FILES_WAV:=$(addsuffix .wav,$(basename $(FILES_LY)))
FILES_MP3:=$(addsuffix .mp3,$(basename $(FILES_LY)))

ALL:=$(ALL) $(FILES_LYD)
ifeq ($(DO_PDF),1)
	ALL:=$(ALL) $(FILES_PDF)
endif
ifeq ($(DO_PNG),1)
	ALL:=$(ALL) $(FILES_PNG)
endif
ifeq ($(DO_PS),1)
	ALL:=$(ALL) $(FILES_PS)
endif
ifeq ($(DO_MIDI),1)
	ALL:=$(ALL) $(FILES_MIDI)
endif
ifeq ($(DO_STAMP),1)
	ALL:=$(ALL) $(FILES_STAMP)
endif
ifeq ($(DO_WAV),1)
	ALL:=$(ALL) $(FILES_WAV)
endif
ifeq ($(DO_MP3),1)
	ALL:=$(ALL) $(FILES_MP3)
endif
CLEAN:=$(CLEAN) $(FILES_LYD) $(FILES_PDF) $(FILES_PNG) $(FILES_PS) $(FILES_MIDI) $(FILES_STAMP) $(FILES_WAV) $(FILES_MP3)

.PHONY: all
all: $(ALL)

.PHONY: debug
debug:
	$(info FILES_LY is $(FILES_LY))
	$(info FILES_LYD is $(FILES_LYD))
	$(info FILES_PDF is $(FILES_PDF))
	$(info FILES_PNG is $(FILES_PNG))
	$(info FILES_PS is $(FILES_PS))
	$(info FILES_MIDI is $(FILES_MIDI))
	$(info FILES_STAMP is $(FILES_STAMP))
	$(info FILES_WAV is $(FILES_WAV))
	$(info FILES_MP3 is $(FILES_MP3))

.PHONY: todo
todo:
	-@grep TODO $(FILES_LY)

.PHONY: clean
clean:
	rm -rf $(CLEAN)
.PHONY: clean_deps
clean_deps:
	rm -f $(FILES_LYD)
.PHONY: clean_all_png
clean_all_png:
	-find . -name "*.png" -exec rm {} \;

# checks

.PHONY: check_extra_files
check_extra_files:
	-@find -type f -and -not -name "Makefile" -and -not -path "./.git/*" -and -not -name "*.ly" -and -not -name "*.lyi" -and -not -name "*.txt" -and -not -name "*.ly.d" -and -not -name "*.pl" -and -not -name "*.grammer" -and -not -name "*.pdf" -and -not -name "*.ps" -and -not -name "*.midi" -and -not -name "*.stamp" -and -not -name ".gitignore"
.PHONY: check_comments
check_comments:
	-@grep "%%" `find . -name "*.ly"`
.PHONY: check_composer_and
check_composer_and:
	-@grep "composer=\".* and .*\"" `find . -name "*.ly" -or -name "*.lyi"`
.PHONY: check_ws
check_ws:
	-@./scripts/pgrep.pl "  | $$|\w\t|\t$$|\*\\d\:" `find . -name "*.ly" -or -name "*.lyi"`
.PHONY: check_common
check_common:
	-@grep --files-without-match "common.lyi" `find . -name "*.ly"`
.PHONY: check_no_poet
check_no_poet:
	-@grep --files-without-match "poet=" `find . -name "*.ly"`
.PHONY: check_no_copyright
check_no_copyright:
	-@grep --files-without-match "copyright=" `find . -name "*.ly"`
.PHONY: check_empty_copyright
check_empty_copyright:
	-@grep --files-with-match "copyright=\"\"" `find . -name "*.ly"`
.PHONY: check_all
check_all: check_empty_copyright check_common check_ws check_composer_and check_comments check_extra_files 

# rules

LYFLAGS:=

#$(FILES_PDF): %.pdf: %.ly
#	lilypond --pdf $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.pdf $@
#$(FILES_PNG): %.png: %.ly
#	lilypond --png $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.png $@
#$(FILES_PS): %.ps: %.ly
#	lilypond --ps $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.ps $@
#$(FILES_MIDI): %.midi: %.ly
#	lilypond --pdf $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.midi $@
$(FILES_PNG): %.png: %.stamp

$(FILES_PS): %.ps: %.stamp

$(FILES_PDF): %.pdf: %.stamp

$(FILES_MIDI): %.midi: %.stamp

$(FILES_STAMP): %.stamp: %.ly
	lilypond --pdf $(LYFLAGS) -o /tmp/foo $<
	mv /tmp/foo.ps $(basename $<).ps
	mv /tmp/foo.pdf $(basename $<).pdf
	mv /tmp/foo.midi $(basename $<).midi
	touch $@
$(FILES_LYD): %.ly.d: %.ly
	./scripts/lilydep.pl $< $@ $(basename $<).pdf $(basename $<).ps $(basename $<).midi
$(FILES_WAV): %.wav: %.midi
	timidity $< -Ow -o $@ > /dev/null
$(FILES_MP3): %.mp3: %.wav
	lame $< $@

# include the deps files (no warnings)
-include $(FILES_LYD)
