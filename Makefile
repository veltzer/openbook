ALL:=
CLEAN:=

DO_PDF:=1
DO_PNG:=0
DO_PS:=1
DO_MIDI:=1

LY:=$(shell find . -name "*.ly")
LYD:=$(addsuffix .d,$(LY))

PDF:=$(addsuffix .pdf,$(basename $(LY)))
PNG:=$(addsuffix .png,$(basename $(LY)))
PS:=$(addsuffix .ps,$(basename $(LY)))
MIDI:=$(addsuffix .midi,$(basename $(LY)))

ALL:=$(ALL) $(LYD)
ifeq ($(DO_PDF),1)
	ALL:=$(ALL) $(PDF)
endif
ifeq ($(DO_PNG),1)
	ALL:=$(ALL) $(PNG)
endif
ifeq ($(DO_PS),1)
	ALL:=$(ALL) $(PS)
endif
ifeq ($(DO_MIDI),1)
	ALL:=$(ALL) $(MIDI)
endif
CLEAN:=$(CLEAN) $(LYD)
ifeq ($(DO_PDF),1)
	CLEAN:=$(CLEAN) $(PDF)
endif
ifeq ($(DO_PNG),1)
	CLEAN:=$(CLEAN) $(PNG)
endif
ifeq ($(DO_PS),1)
	CLEAN:=$(CLEAN) $(PS)
endif
ifeq ($(DO_MIDI),1)
	CLEAN:=$(CLEAN) $(MIDI)
endif

.PHONY: all
all: $(ALL)

.PHONY: pdf
pdf: $(PDF)

.PHONY: debug
debug:
	$(info LY is $(LY))
	$(info LYD is $(LYD))
	$(info PDF is $(PDF))
	$(info PNG is $(PNG))
	$(info PS is $(PS))
	$(info MIDI is $(MIDI))

.PHONY: todo
todo:
	-@grep TODO $(LY)

.PHONY: clean
clean:
	rm -rf $(CLEAN)
.PHONY: clean_deps
clean_deps:
	rm -f $(LYD)
.PHONY: clean_all_png
clean_all_png:
	-find . -name "*.png" -exec rm {} \;

# checks

.PHONY: check_extra_files
check_extra_files:
	-@find -type f -and -not -name "Makefile" -and -not -path "./.git/*" -and -not -name "*.ly" -and -not -name "*.lyi" -and -not -name "*.txt" -and -not -name "*.ly.d" -and -not -name "*.pl" -and -not -name "*.grammer" -and -not -name "*.pdf" -and -not -name "*.ps" -and -not -name "*.midi"
.PHONY: check_comments
check_comments:
	-@grep "%%" `find . -name "*.ly"`
.PHONY: check_composer_and
check_composer_and:
	-@grep "composer=\".* and .*\"" `find . -name "*.ly" -or -name "*.lyi"`
.PHONY: check_ws
check_ws:
	-@./pgrep.pl "  | $$|\w\t|\t$$|\*\\d\:" `find . -name "*.ly" -or -name "*.lyi"`
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

$(PDF): %.pdf: %.ly
	lilypond --pdf $(LYFLAGS) -o /tmp/foo $<
	mv /tmp/foo.pdf $@
$(PNG): %.png: %.ly
	lilypond --png $(LYFLAGS) -o /tmp/foo $<
	mv /tmp/foo.png $@
$(PS): %.ps: %.ly
	lilypond --ps $(LYFLAGS) -o /tmp/foo $<
	mv /tmp/foo.ps $@
$(MIDI): %.midi: %.ly
	lilypond --pdf $(LYFLAGS) -o /tmp/foo $<
	mv /tmp/foo.midi $@
$(LYD): %.ly.d: %.ly
	./lilydep.pl $< $@ $(basename $<).pdf $(basename $<).ps $(basename $<).midi

# include the deps files (no warnings)
-include $(LYD)
