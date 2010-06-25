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

.PHONY: check_extra_files
check_extra_files:
	@find -type f -and -not -name "Makefile" -and -not -path "./.git/*" -and -not -name "*.temp"

# rules

# rule about how to create .ly files from .temp files
$(LY): %.ly: %.temp
	cp $< $@
	chmod 444 $@
# rule about how to create .pdf files from .ly files
$(PDF): %.pdf: %.ly
	lilypond $<
