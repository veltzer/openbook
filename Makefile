ALL:=
CLEAN:=

LY:=$(shell find . -name "*.ly")
PDF:=$(addsuffix .pdf,$(basename $(LY)))
ALL:=$(ALL) $(PDF)
CLEAN:=$(CLEAN) $(PDF)

.PHONY: all
all: $(ALL)

.PHONY: debug
debug:
	$(info TEMP is $(TEMP))
	$(info LY is $(LY))

.PHONY: clean
clean:
	rm -rf $(CLEAN)

# checks

.PHONY: check_extra_files
check_extra_files:
	-@find -type f -and -not -name "Makefile" -and -not -path "./.git/*" -and -not -name "*.ly" -and -not -name "*.lyi"
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

# rules

# rule about how to create .pdf files from .ly files
$(PDF): %.pdf: %.ly
	lilypond -o $(basename $@) $<
	rm -f $(basename $@).ps $(basename $@).midi
