##############
# PARAMETERS #
##############
# should we show commands executed ?
DO_MKDBG?=0
# do you want dependency on the Makefile itself ?
DO_MAKEFILE_DEPEND:=1
# should we depend on the wrappers scripts dates ?
DO_WRAPDEPS:=1
# should we depend on the common include file ?
DO_INCDEPS:=1
# should we make the ly files and use them?
DO_LY:=1
# should we make pdfs ?
DO_PDF:=0
# should we make postscript ?
DO_PS:=0
# should we make midi ?
DO_MIDI:=0
# should we make stamp files ?
DO_STAMP:=0
# should we make .wav files ? (don't really want this):
DO_WAV:=0
# should we make mp3 ?
DO_MP3:=0
# should we make ogg ?
DO_OGG:=0
# should we do the full books ?
DO_BOOKS_PDF:=1
# do you want to validate html?
DO_CHECKHTML:=0
# which books should we do?
NAMES:=openbook israeli drumming rockbook guitar_album
# should we do tools?
DO_TOOLS:=0

#############
# CONSTANTS #
#############
# where is the web folder?
DOCS:=docs
# where are the sources located ?
SOURCE_DIR:=src
# where is the output folder ?
OUT_DIR:=out
# where is the common file?
COMMON:=include/common.ly.mako
# wrappers
LILYPOND_WRAPPER:=python -m scripts.wrapper_lilypond
LILYPOND_WRAPPER_DEP:=scripts/wrapper_lilypond.py
MAKO_WRAPPER:=python -m scripts.wrapper_mako
MAKO_WRAPPER_DEP:=scripts/wrapper_mako.py
MAKO_DEPS_WRAPPER:=scripts/mako_deps.py
MIDI2WAV_WRAPPER:=scripts/midi2wav.pl
MIDI2WAV_WRAPPER_DEP:=scripts/midi2wav.pl
MIDI2OGG_WRAPPER:=scripts/midi2ogg.pl
MIDI2OGG_WRAPPER_DEP:=scripts/midi2ogg.pl
MIDI2MP3_WRAPPER:=scripts/midi2mp3.pl
MIDI2MP3_WRAPPER_DEP:=scripts/midi2mp3.pl
# parameters to pass to the mako wrapper
CONST_BOOK:=1
CONST_SONG:=0
CONST_DONTCUT:=0
CONST_CUT:=1
# arguments to git grep
GITARGS:=--no-pager

########
# code #
########

ifeq ($(DO_WRAPDEPS),0)
	LILYPOND_WRAPPER_DEP:=
	BOOK_WRAPPER_DEP:=
	MAKO_WRAPPER_DEP:=
	MAKO_DEPS_WRAPPER_DEP:=
	MIDI2WAV_WRAPPER_DEP:=
	MIDI2OGG_WRAPPER_DEP:=
	MIDI2MP3_WRAPPER_DEP:=
endif
ifeq ($(DO_INCDEPS),1)
	MAKO_WRAPPER_DEP:=$(MAKO_WRAPPER_DEP) $(COMMON)
endif # DO_INCDEPS

ALL_DEP:=

# dependency on the makefile itself
ifeq ($(DO_MAKEFILE_DEPEND),1)
ALL_DEP+=Makefile
endif # DO_MAKEFILE_DEPEND

ifeq ($(DO_MKDBG),1)
Q=
# we are not silent in this branch
else # DO_MKDBG
Q=@
#.SILENT:
endif # DO_MKDBG

ifeq ($(DO_TOOLS),1)
TOOLS:=out/tools.stamp
ALL_DEP+=$(TOOLS)
endif # DO_TOOLS

# this find the sources without git...
SOURCES_ALL:=$(subst ./,,$(shell find src -type f -and -name "*.mako"))
FILES_MAKO:=$(filter %.ly.mako,$(SOURCES_ALL))
FILES_MAKO_BASE:=$(basename $(basename $(FILES_MAKO)))

FILES_JAZZ:=$(subst ./,,$(shell find src/openbook -type f -and -name "*.mako"))

FILES_MAKO_DEPS:=$(addsuffix .mako.d,$(addprefix $(OUT_DIR)/,$(FILES_MAKO_BASE)))
FILES_LY:=$(addsuffix .ly,$(addprefix $(OUT_DIR)/,$(FILES_MAKO_BASE)))
FILES_PDF:=$(addsuffix .pdf,$(addprefix $(OUT_DIR)/,$(FILES_MAKO_BASE)))
FILES_PS:=$(addsuffix .ps,$(addprefix $(OUT_DIR)/,$(FILES_MAKO_BASE)))
FILES_MIDI:=$(addsuffix .midi,$(addprefix $(OUT_DIR)/,$(FILES_MAKO_BASE)))
FILES_STAMP:=$(addsuffix .stamp,$(addprefix $(OUT_DIR)/,$(FILES_MAKO_BASE)))
FILES_WAV:=$(addsuffix .wav,$(addprefix $(OUT_DIR)/,$(FILES_MAKO_BASE)))
FILES_MP3:=$(addsuffix .mp3,$(addprefix $(OUT_DIR)/,$(FILES_MAKO_BASE)))
FILES_OGG:=$(addsuffix .ogg,$(addprefix $(OUT_DIR)/,$(FILES_MAKO_BASE)))

# ALL_OUT_FILES:=$(shell find src -type f -and -name "*.mako")
# ALL_OUT_STAMP:=$(addsuffix .stamp,$(addprefix $(OUT_DIR)/,$(basename $(ALL_OUT_FILES))))

OUT_LY:=$(addsuffix .ly,$(addprefix $(DOCS)/,$(NAMES)))
OUT_PS:=$(addsuffix .ps,$(addprefix $(DOCS)/,$(NAMES)))
OUT_PDF:=$(addsuffix .pdf,$(addprefix $(DOCS)/,$(NAMES)))

ifeq ($(DO_LY),1)
	ALL+=$(FILES_LY)
endif
ifeq ($(DO_PS),1)
	ALL+=$(FILES_PS)
endif
ifeq ($(DO_PDF),1)
	ALL+=$(FILES_PDF)
endif
ifeq ($(DO_MIDI),1)
	ALL+=$(FILES_MIDI)
endif
ifeq ($(DO_STAMP),1)
	ALL+=$(FILES_STAMP)
endif
ifeq ($(DO_WAV),1)
	ALL+=$(FILES_WAV)
endif
ifeq ($(DO_MP3),1)
	ALL+=$(FILES_MP3)
endif
ifeq ($(DO_OGG),1)
	ALL+=$(FILES_OGG)
endif
ifeq ($(DO_BOOKS_PDF),1)
	ALL+=$(OUT_PDF)
endif

SOURCES_HTML:=$(DOCS)/index.html
HTMLCHECK:=out/html.stamp
ifeq ($(DO_CHECKHTML),1)
ALL+=$(HTMLCHECK)
endif # DO_CHECKHTML

#########
# rules #
#########
# do not touch this rule or add a recipe to it. This is to force 'make' to take the new $(ALL)
all: $(ALL)

.PHONY: stamp
stamp: $(FILES_STAMP)
	$(info doing [$@])

.PHONY: ly
ly: $(FILES_LY)
	$(info doing [$@])

$(TOOLS): config/packages.py
	$(info doing [$@])
	$(Q)install_deps
	$(Q)pymakehelper touch-mkdir $@

.PHONY: debug
debug:
	$(info doing [$@])
	$(info ALL is $(ALL))
	$(info SOURCES_ALL is $(SOURCES_ALL))
	$(info SOURCES_HTML is $(SOURCES_HTML))
	$(info FILES_MAKO is $(FILES_MAKO))
	$(info FILES_MAKO_DEPS is $(FILES_MAKO_DEPS))
	$(info FILES_LY is $(FILES_LY))
	$(info FILES_LYI is $(FILES_LYI))
	$(info FILES_PDF is $(FILES_PDF))
	$(info FILES_PS is $(FILES_PS))
	$(info FILES_MIDI is $(FILES_MIDI))
	$(info FILES_STAMP is $(FILES_STAMP))
	$(info FILES_WAV is $(FILES_WAV))
	$(info FILES_MP3 is $(FILES_MP3))
	$(info FILES_OGG is $(FILES_OGG))
	$(info FILES_JAZZ is $(FILES_JAZZ))
	$(info NAMES is $(NAMES))
	$(info OUT_LY is $(OUT_LY))
	$(info OUT_PS is $(OUT_PS))
	$(info OUT_PDF is $(OUT_PDF))
	$(info DO_MKDBG is $(DO_MKDBG))

.PHONY: todo
todo:
	$(info doing [$@])
	$(Q)-grep TODO $(FILES_LY)

.PHONY: clean
clean:
	$(Q)rm -f $(ALL) $(OUT_LY) $(OUT_PS) $(OUT_PDF)

.PHONY: clean_all_png
clean_all_png:
	$(info doing [$@])
	$(Q)-find $(SOURCE_DIR) -name "*.png" -exec rm -f {} \;

# checks

.PHONY: check_ws
check_ws:
	$(info doing [$@])
	$(Q)make_helper wrapper-ok grep -e "[[:space:]]$$" $(FILES_MAKO)
.PHONY: check_naked_mymark
check_naked_mymark:
	$(info doing [$@])
	$(Q)grep "\myMark" $(FILES_MAKO) | make_helper wrapper-ok grep -v \"
.PHONY: check_and
check_and:
	$(info doing [$@])
	$(Q)make_helper wrapper-ok grep "composer=\".* and .*\"" $(FILES_MAKO)
	$(Q)make_helper wrapper-ok grep "poet=\".* and .*\"" $(FILES_MAKO)
.PHONY: check_mark
check_mark:
	$(info doing [$@])
	$(Q)make_helper wrapper-ok grep --files-without-match "\\\\myMark" $(FILES_JAZZ)
.PHONY: check_key
check_key:
	$(info doing [$@])
	$(Q)grep "\\\\key" $(FILES_JAZZ) | grep -v major | make_helper wrapper-ok grep -v minor
.PHONY: check_python
check_python:
	$(info doing [$@])
	$(Q)scripts/check.py
.PHONY: check_hardcoded_names
check_hardcoded_names:
	$(info doing [$@])
	$(Q)make_helper wrapper-ok git $(GITARGS) grep veltzer
.PHONY: check_parts
check_parts:
	$(info doing [$@])
	$(Q)git grep "%% part" src | make_helper wrapper-ok grep -v \"
.PHONY: check_volta_last
check_volta_last:
	$(info doing [$@])
	$(Q)make_helper wrapper-ok grep alternative `git grep -L myEndLineVolta src/openbook`
.PHONY: check_null
check_null:
	$(info doing [$@])
	$(Q)git grep null src | make_helper wrapper-ok grep -v include
.PHONY: check_alternative
check_alternative:
	$(info doing [$@])
	$(Q)git grep \\\\alternative src | make_helper wrapper-ok grep -v "}"
.PHONY: check_tempo
check_tempo:
	$(info doing [$@])
	$(Q)git grep "\\\\tempo " src | make_helper wrapper-ok grep -v \"
.PHONY: check_all
check_all: check_ws check_naked_mymark check_and check_mark check_key check_python check_parts check_volta_last check_null check_alternative check_tempo

.PHONY: checkhtml
checkhtml: $(HTMLCHECK)
	$(info doing [$@])

# rules

# explain to make that .ps .pdf and .midi are really stamp files (do I need this ?!?)
$(FILES_PS): %.ps: %.stamp $(ALL_DEP)
	$(info doing [$@])

$(FILES_PDF): %.pdf: %.stamp $(ALL_DEP)
	$(info doing [$@])

$(FILES_MIDI): %.midi: %.stamp $(ALL_DEP)
	$(info doing [$@])

# this is the real rule
$(FILES_STAMP): $(OUT_DIR)/%.stamp: $(OUT_DIR)/%.ly $(LILYPOND_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)$(LILYPOND_WRAPPER) run --stop_on_output False --ps $(dir $@)$(basename $(notdir $@)).ps --pdf $(dir $@)$(basename $(notdir $@)).pdf --out $(dir $@)$(basename $(notdir $@)) --ly $<
	$(Q)touch $@

$(OUT_DIR)/%.0.pdf: %.ly.mako $(MAKO_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)$(MAKO_WRAPPER) $(CONST_SONG) $(CONST_CUT) 0 $@ $<
$(OUT_DIR)/%.1.pdf: %.ly.mako $(MAKO_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)$(MAKO_WRAPPER) $(CONST_SONG) $(CONST_CUT) 1 $@ $<
$(OUT_DIR)/%.2.pdf: %.ly.mako $(MAKO_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)$(MAKO_WRAPPER) $(CONST_SONG) $(CONST_CUT) 2 $@ $<
$(OUT_DIR)/%.3.pdf: %.ly.mako $(MAKO_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)$(MAKO_WRAPPER) $(CONST_SONG) $(CONST_CUT) 3 $@ $<
$(FILES_LY): $(OUT_DIR)/%.ly: %.ly.mako $(MAKO_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)$(MAKO_WRAPPER) $(CONST_SONG) $(CONST_DONTCUT) 0 $@ $<
$(FILES_MAKO_DEPS): $(OUT_DIR)/%.mako.d: %.ly.mako $(MAKO_DEPS_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)$(MAKO_DEPS_WRAPPER) $< $@ $(basename $(basename $@)).stamp $(basename $(basename $@)).pdf $(basename $(basename $@)).ps $(basename $(basename $@)).midi
$(FILES_WAV): %.wav: %.midi $(MIDI2WAV_WRAPPER_DEP) $(ALL_DEP)
	$(info doing $@)
	$(Q)mkdir -p $(dir $@)
	$(Q)$(MIDI2WAV_WRAPPER) $< $@
$(FILES_OGG): %.ogg: %.midi $(MIDI2OGG_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)$(MIDI2OGG_WRAPPER) $< $@
$(FILES_MP3): %.mp3: %.midi $(MIDI2MP3_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)$(MIDI2MP3_WRAPPER) $< $@

define template
TMPL_LY_$(1):=$$(DOCS)/$(1).ly
TMPL_PS_$(1):=$$(DOCS)/$(1).ps
TMPL_PDF_$(1):=$$(DOCS)/$(1).pdf
TMPL_PREREQ_$(1):=$(subst ./,,$(shell find src/$(1) -type f -and -name "*.mako"))
$$(TMPL_PDF_$(1)): $$(TMPL_LY_$(1)) $$(LILYPOND_WRAPPER_DEP) $$(ALL_DEP)
	$$(info doing [$$@])
	$$(Q)$$(LILYPOND_WRAPPER) run --ps $$(TMPL_PS_$(1)) --pdf $$(TMPL_PDF_$(1)) --out $$(DOCS) --ly $$<
$$(TMPL_LY_$(1)): $$(TMPL_PREREQ_$(1)) $$(MAKO_WRAPPER_DEP) $$(COMMON) $$(ALL_DEP)
	$$(info doing [$$@])
	$$(Q)mkdir -p $$(dir $$@)
	$$(Q)$$(MAKO_WRAPPER) $$(CONST_BOOK) $$(CONST_DONTCUT) 0 $$@ $$(TMPL_PREREQ_$(1))
endef
$(foreach name, $(NAMES), $(eval $(call template,$(name))))

.PHONY: grive
grive: $(OUT_PDF) $(ALL_DEP)
	$(info doing [$@])
	$(Q)-rm -rf ~/grive/outputs/$(tdefs.project_name)
	$(Q)-mkdir ~/grive/outputs/$(tdefs.project_name)
	$(Q)cp $(OUT_PDF) ~/grive/outputs/$(tdefs.project_name)
	$(Q)cd ~/grive; grive

.PHONY: dropbox
dropbox: $(OUT_PDF) $(ALL_DEP)
	$(info doing [$@])
	$(Q)-rm -rf ~/Dropbox/outputs/$(tdefs.project_name)
	$(Q)-mkdir ~/Dropbox/outputs/$(tdefs.project_name)
	$(Q)cp $(OUT_PDF) ~/Dropbox/outputs/$(tdefs.project_name)

.PHONY: all_tunes
all_tunes: $(FILES_STAMP)
	$(info doing [$@])

$(HTMLCHECK): $(SOURCES_HTML) $(ALL_DEP)
	$(info doing [$@])
	$(Q)tidy -errors -q -utf8 $(SOURCES_HTML)
	$(Q)node_modules/htmlhint/bin/htmlhint $(SOURCES_HTML) > /dev/null
	$(Q)mkdir -p $(dir $@)
	$(Q)touch $(HTMLCHECK)
