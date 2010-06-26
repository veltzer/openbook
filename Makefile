ALL:=
CLEAN:=

TEMP:=$(shell find . -name "*.temp")
LY:=$(addsuffix .ly,$(basename $(TEMP)))
ALL:=$(ALL) $(LY)
CLEAN:=$(CLEAN) $(LY)
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
	-@find -type f -and -not -name "Makefile" -and -not -path "./.git/*" -and -not -name "*.temp"
.PHONY: check_comments
check_comments:
	-@fgrep "%%" `find . -name "*.temp"`
.PHONY: check_composer_and
check_composer_and:
	-@grep "composer=\".* and .*\"" `find . -name "*.temp"`
.PHONY: check_ws
check_ws:
	-@grep "  " `find . -name "*.temp"`

# rules

# rule about how to create .ly files from .temp files
$(LY): %.ly: %.temp
	rm -f $@
	cp $< $@
	chmod 444 $@
# rule about how to create .pdf files from .ly files
$(PDF): %.pdf: %.ly
	lilypond -o $(basename $@) $<
	rm -f $(basename $@).ps $(basename $@).midi
