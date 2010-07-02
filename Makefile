ALL:=
CLEAN:=

DO_PNG:=0

LY:=$(shell find . -name "*.ly")
LYD:=$(addsuffix .d,$(LY))
PDF:=$(addsuffix .pdf,$(basename $(LY)))
PNG:=$(addsuffix .png,$(basename $(LY)))
ALL:=$(ALL) $(LYD) $(PDF)
ifeq ($(DO_PNG),1)
	ALL:=$(ALL) $(PNG)
endif
CLEAN:=$(CLEAN) $(LYD) $(PDF)
ifeq ($(DO_PNG),1)
	CLEAN:=$(CLEAN) $(PNG)
endif

.PHONY: all
all: $(ALL)

.PHONY: debug
debug:
	$(info LY is $(LY))
	$(info LYD is $(LYD))
	$(info PDF is $(PDF))
	$(info PNG is $(PNG))

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
	-@find -type f -and -not -name "Makefile" -and -not -path "./.git/*" -and -not -name "*.ly" -and -not -name "*.lyi" -and -not -name "TODO.txt"
.PHONY: check_comments
check_comments:
	-@grep "%%" `find . -name "*.ly"`
.PHONY: check_composer_and
check_composer_and:
	-@grep "composer=\".* and .*\"" `find . -name "*.ly" -or -name "*.lyi"`
.PHONY: check_ws
check_ws:
	-@grep "  " `find . -name "*.ly" -or -name "*.lyi"`
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

# rules

# rule about how to create .pdf files from .ly files
$(PDF): %.pdf: %.ly
	lilypond -o $(basename $@) $<
	rm -f $(basename $@).ps $(basename $@).midi
$(PNG): %.png: %.ly
	lilypond --png -o $(basename $@) $<
	rm -f $(basename $@).ps $(basename $@).midi
$(LYD): %.ly.d: %.ly
	./lilydep.pl $< $@ $(basename $<).pdf $(basename $<).ps $(basename $<).midi

# include the deps files (no warnings)
-include $(LYD)
