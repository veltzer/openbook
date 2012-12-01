##############
# PARAMETERS #
##############
# should we show commands executed ?
DO_MKDBG?=0
# should we depend on the date of the makefile itself ?
DO_ALL_DEP?=1
# should we depend on the wrappers ?
DO_WRAPDEPS?=1
# should we make the ly files and use them?
DO_LY?=0
# should we make lilypond dependency files and use them?
DO_LYD?=0
# should we make mako dependency files ?
DO_MAKO_DEPS?=0
# should we make pdfs ?
DO_PDF?=0
# should we make images ?
DO_PNG?=0
# should we make postscript ?
DO_PS?=0
# should we make midi ?
DO_MIDI?=0
# should we make stamp files ?
DO_STAMP?=0
# should we make .wav files ? (don't really want this):
DO_WAV?=0
# should we make mp3 ?
DO_MP3?=0
# should we make ogg ?
DO_OGG?=0
# should we do the full book ?
DO_BOOK?=1

# where are the sources located ?
SOURCE_DIR:=src
# where is the output folder ?
OUT_DIR:=out
# what is the web folder ?
WEB_DIR:=/var/www/openbook
# where is the common file?
COMMON:=src/include/common.makoi
# wrappers
LILYPOND_WRAPPER:=scripts/lilypond_wrapper.pl
BOOK_WRAPPER:=scripts/lilypond_wrapper.py
MAKO_WRAPPER:=scripts/mako_wrapper.py
MAKO_BOOK_WRAPPER:=scripts/mako_book.py
LYD_WRAPPER:=scripts/lyd.pl
MAKO_DEPS_WRAPPER:=scripts/mako_deps.py
MIDI2WAV_WRAPPER:=scripts/midi2wav.pl
MIDI2OGG_WRAPPER:=scripts/midi2ogg.pl
MIDI2MP3_WRAPPER:=scripts/midi2mp3.pl

########
# BODY #
########

# do not include deps (or generate them) if we are doing a clean...
ifneq ($(filter clean,$(MAKECMDGOALS)),)
	DO_LYD:=0
	DO_MAKO_DEPS:=0
endif

ALL:=

LYFLAGS:=--ps --pdf --png

ALL_DEP:=
ifeq ($(DO_ALL_DEP),1)
	ALL_DEP:=$(ALL_DEP) Makefile
endif
ifeq ($(DO_WRAPDEPS),1)
	LILYPOND_WRAPPER_DEP:=$(LILYPOND_WRAPPER)
	BOOK_WRAPPER_DEP:=$(BOOK_WRAPPER)
	MAKO_WRAPPER_DEP:=$(MAKO_WRAPPER)
	LYD_WRAPPER_DEP:=$(LYD_WRAPPER)
	MAKO_DEPS_WRAPPER_DEP:=$(MAKO_DEPS_WRAPPER)
	MIDI2WAV_WRAPPER_DEP:=$(MIDI2WAV_WRAPPER)
	MIDI2OGG_WRAPPER_DEP:=$(MIDI2OGG_WRAPPER)
	MIDI2MP3_WRAPPER_DEP:=$(MIDI2MP3_WRAPPER)
	MAKO_BOOK_WRAPPER_DEP:=$(MAKO_BOOK_WRAPPER)
else
	LILYPOND_WRAPPER_DEP:=
	BOOK_WRAPPER_DEP:=
	MAKO_WRAPPER_DEP:=
	LYD_WRAPPER_DEP:=
	MAKO_DEPS_WRAPPER_DEP:=
	MIDI2WAV_WRAPPER_DEP:=
	MIDI2OGG_WRAPPER_DEP:=
	MIDI2MP3_WRAPPER_DEP:=
	MAKO_BOOK_WRAPPER_DEP:=
endif

ifeq ($(DO_MKDBG),1)
Q=
# we are not silent in this branch
else # DO_MKDBG
Q=@
#.SILENT:
endif # DO_MKDBG

# this finds the sources via git
SOURCES_ALL:=$(shell git ls-files)
# this find the sources without git...
SOURCES_ALL:=$(subst ./,,$(shell find src -type f -and -name "*.mako" -or -name "*.makoi"))
FILES_MAKO:=$(filter %.mako,$(SOURCES_ALL))
FILES_MAKOI:=$(filter %.makoi,$(SOURCES_ALL))

FILES_COMPLETED_JAZZ:=$(shell grep -l \'completion\']=\"5\" src/jazz/*)

WEB_FOLDER:=web
WEB_FILES:=$(shell find $(WEB_FOLDER) -type f)

FILES_MAKO_DEPS:=$(addsuffix .mako.d,$(addprefix $(OUT_DIR)/,$(basename $(FILES_MAKO))))
FILES_LY:=$(addsuffix .ly,$(addprefix $(OUT_DIR)/,$(basename $(FILES_MAKO))))
FILES_LYD:=$(addsuffix .ly.d,$(addprefix $(OUT_DIR)/,$(basename $(FILES_MAKO))))
FILES_PDF:=$(addsuffix .pdf,$(addprefix $(OUT_DIR)/,$(basename $(FILES_MAKO))))
FILES_PS:=$(addsuffix .ps,$(addprefix $(OUT_DIR)/,$(basename $(FILES_MAKO))))
FILES_MIDI:=$(addsuffix .midi,$(addprefix $(OUT_DIR)/,$(basename $(FILES_MAKO))))
FILES_STAMP:=$(addsuffix .stamp,$(addprefix $(OUT_DIR)/,$(basename $(FILES_MAKO))))
FILES_WAV:=$(addsuffix .wav,$(addprefix $(OUT_DIR)/,$(basename $(FILES_MAKO))))
FILES_MP3:=$(addsuffix .mp3,$(addprefix $(OUT_DIR)/,$(basename $(FILES_MAKO))))
FILES_OGG:=$(addsuffix .ogg,$(addprefix $(OUT_DIR)/,$(basename $(FILES_MAKO))))
# books
# book - openbook
OB_OUT_BASE:=$(OUT_DIR)/openbook
OB_OUT_LY:=$(OUT_DIR)/openbook.ly
OB_OUT_PATTERN:=src/jazz/*.mako
OB_OUT_FILES:=$(shell find src -type f -and -wholename "$(OB_OUT_PATTERN)")
OB_OUT_PS:=$(OUT_DIR)/openbook.ps
OB_OUT_PDF:=$(OUT_DIR)/openbook.pdf
# book - israelbook
IL_OUT_BASE:=$(OUT_DIR)/israelisongbook
IL_OUT_LY:=$(OUT_DIR)/israelisongbook.ly
IL_OUT_PATTERN:=src/israeli/*.mako
IL_OUT_FILES:=$(shell find src -type f -and -wholename "$(IL_OUT_PATTERN)")
IL_OUT_PS:=$(OUT_DIR)/israelisongbook.ps
IL_OUT_PDF:=$(OUT_DIR)/israelisongbook.pdf
# book - rockbook
RK_OUT_BASE:=$(OUT_DIR)/rockbook
RK_OUT_LY:=$(OUT_DIR)/rockbook.ly
RK_OUT_PATTERN:=src/rock/*.mako
RK_OUT_FILES:=$(shell find src -type f -and -wholename "$(RK_OUT_PATTERN)")
RK_OUT_PS:=$(OUT_DIR)/rockbook.ps
RK_OUT_PDF:=$(OUT_DIR)/rockbook.pdf

ifeq ($(DO_LY),1)
	ALL:=$(ALL) $(FILES_LY)
endif
ifeq ($(DO_LYD),1)
	ALL:=$(ALL) $(FILES_LYD)
endif
ifeq ($(DO_MAKO_DEPS),1)
	ALL:=$(ALL) $(FILES_MAKO_DEPS)
endif
ifeq ($(DO_PDF),1)
	ALL:=$(ALL) $(FILES_PDF)
endif
ifeq ($(DO_PNG),1)
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
ifeq ($(DO_OGG),1)
	ALL:=$(ALL) $(FILES_OGG)
endif
ifeq ($(DO_BOOK),1)
	ALL:=$(ALL) $(OB_OUT_LY) $(OB_OUT_PS) $(OB_OUT_PDF) $(IL_OUT_LY) $(IL_OUT_PS) $(IL_OUT_PDF) $(RK_OUT_LY) $(RK_OUT_PS) $(RK_OUT_PDF)
endif

.PHONY: all
all: $(ALL)

.PHONY: stamp
stamp: $(FILES_STAMP)

.PHONY: ly
ly: $(FILES_LY)

.PHONY: debug
debug:
	$(info ALL is $(ALL))
	$(info SOURCES_ALL is $(SOURCES_ALL))
	$(info FILES_MAKO is $(FILES_MAKO))
	$(info FILES_MAKO_DEPS is $(FILES_MAKO_DEPS))
	$(info FILES_LY is $(FILES_LY))
	$(info FILES_LYI is $(FILES_LYI))
	$(info FILES_LYD is $(FILES_LYD))
	$(info FILES_PDF is $(FILES_PDF))
	$(info FILES_PS is $(FILES_PS))
	$(info FILES_MIDI is $(FILES_MIDI))
	$(info FILES_STAMP is $(FILES_STAMP))
	$(info FILES_WAV is $(FILES_WAV))
	$(info FILES_MP3 is $(FILES_MP3))
	$(info FILES_OGG is $(FILES_OGG))
	$(info OB_OUT_LY is $(OB_OUT_LY))
	$(info OB_OUT_PS is $(OB_OUT_PS))
	$(info OB_OUT_PDF is $(OB_OUT_PDF))
	$(info OB_OUT_PATTERN is $(OB_OUT_PATTERN))
	$(info OB_OUT_FILES is $(OB_OUT_FILES))
	$(info IL_OUT_LY is $(IL_OUT_LY))
	$(info IL_OUT_PS is $(IL_OUT_PS))
	$(info IL_OUT_PDF is $(IL_OUT_PDF))
	$(info IL_OUT_PATTERN is $(IL_OUT_PATTERN))
	$(info IL_OUT_FILES is $(IL_OUT_FILES))
	$(info RK_OUT_LY is $(RK_OUT_LY))
	$(info RK_OUT_PS is $(RK_OUT_PS))
	$(info RK_OUT_PDF is $(RK_OUT_PDF))
	$(info RK_OUT_PATTERN is $(RK_OUT_PATTERN))
	$(info RK_OUT_FILES is $(RK_OUT_FILES))
	$(info FILES_COMPLETED_JAZZ is $(FILES_COMPLETED_JAZZ))
	$(info WEB_FOLDER is $(WEB_FOLDER))
	$(info WEB_FILES is $(WEB_FILES))

.PHONY: todo
todo:
	$(Q)-grep TODO $(FILES_LY)

.PHONY: show_uncompleted
show_uncompleted:
	$(Q)grep completion src/jazz/* | grep -v 5

.PHONY: clean_deps
clean_deps:
	$(Q)rm -f $(FILES_LYD)
.PHONY: clean_all_png
clean_all_png:
	$(Q)-find $(SOURCE_DIR) -name "*.png" -exec rm -f {} \;

# cleaning using git. Watch out! always add files or they will be erased...
# -x: remove everything not known to git (not only ignore rules).
# -d: remove directories also.
# -f: force.
# -X: keep manually created files and remove ignored files
# -xfd - is the hardest
.PHONY: clean
clean:
	$(info doing [$@])
	$(Q)git clean -xfd > /dev/null

# checks

.PHONY: check_extra_files
check_extra_files:
	$(info doing [$@])
	$(Q)git status --porcelain
.PHONY: check_comments
check_comments:
	$(info doing [$@])
	$(Q)-grep "%%" $(FILES_MAKO)
.PHONY: check_and
check_and:
	$(info doing [$@])
	$(Q)-grep "composer=\".* and .*\"" $(FILES_MAKO)
	$(Q)-grep "poet=\".* and .*\"" $(FILES_MAKO)
.PHONY: check_min_chords
check_min_chords:
	$(info doing [$@])
	$(Q)-grep ":min" $(FILES_MAKO)
.PHONY: check_ws
check_ws:
	$(info doing [$@])
	$(Q)-./scripts/pgrep.pl "  | $$|\w\t|\t$$" $(FILES_MAKO) $(FILES_LYI)
.PHONY: check_uuid
check_uuid:
	$(info doing [$@])
	$(Q)-grep --files-without-match uuid $(FILES_MAKO)
.PHONY: check_poet
check_poet:
	$(info doing [$@])
	$(Q)-grep --files-without-match "attributes\['poet'\]=" $(FILES_MAKO)
.PHONY: check_copyright
check_copyright:
	$(info doing [$@])
	$(Q)-grep --files-without-match "attributes\['copyright'\]=" $(FILES_MAKO)
.PHONY: check_mark
check_mark:
	$(info doing [$@])
	$(Q)-grep --files-without-match "\\\\mark" $(FILES_COMPLETED_JAZZ)
.PHONY: check_completion
check_completion:
	$(info doing [$@])
	$(Q)-grep --files-without-match "attributes\['completion'\]=" $(FILES_MAKO)
.PHONY: check_empty_copyright
check_empty_copyright:
	$(info doing [$@])
	$(Q)-grep "copyright=\"\"" $(FILES_MAKO)
.PHONY: check_chordChanges
check_chordChanges:
	$(info doing [$@])
	$(Q)-grep "chordChanges" $(FILES_MAKO)
.PHONY: check_bar
check_bar:
	$(info doing [$@])
	$(Q)-grep "\\\\bar" $(FILES_MAKO)
.PHONY: check_break
check_break:
	$(info doing [$@])
	$(Q)-grep "\\\\break" $(FILES_MAKO)
.PHONY: check_include
check_include:
	$(info doing [$@])
	$(Q)-grep "\\\\include" $(FILES_MAKO)
.PHONY: check_threeunderscores
check_threeunderscores:
	$(info doing [$@])
	$(Q)-grep "___" $(FILES_MAKO)
.PHONY: check_all
check_all: check_empty_copyright check_ws check_and check_extra_files check_min_chords check_uuid check_chordChanges check_bar check_break check_completion check_include check_threeunderscores check_mark

# rules

# explain to make that .ps .pdf and .midi are really stamp files (do I need this ?!?)
$(FILES_PS): %.ps: %.stamp $(ALL_DEP)

$(FILES_PDF): %.pdf: %.stamp $(ALL_DEP)

$(FILES_MIDI): %.midi: %.stamp $(ALL_DEP)

$(FILES_STAMP): %.stamp: %.ly $(LILYPOND_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)$(LILYPOND_WRAPPER) $< $@ $(LYFLAGS) -o $(dir $@)$(basename $(notdir $@)) $<

$(FILES_LY): $(OUT_DIR)/%.ly: %.mako $(MAKO_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)$(MAKO_WRAPPER) $< $@
$(FILES_MAKO_DEPS): $(OUT_DIR)/%.mako.d: %.mako $(MAKO_DEPS_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)$(MAKO_DEPS_WRAPPER) $< $@ $(basename $(basename $@)).stamp $(basename $(basename $@)).pdf $(basename $(basename $@)).ps $(basename $(basename $@)).midi
$(FILES_LYD): %.ly.d: %.ly $(LYD_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)mkdir -p $(dir $@)
	$(Q)$(LYD_WRAPPER) $< $@ $(basename $@).stamp $(basename $@).pdf $(basename $@).ps $(basename $@).midi
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

.PHONY: books
books: $(OB_OUT_PDF) $(IL_OUT_PDF) $(RK_OUT_PDF) $(ALL_DEP)
	$(info doing [$@])
$(OB_OUT_PS) $(OB_OUT_PDF): $(OB_OUT_LY) $(BOOK_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)$(BOOK_WRAPPER) $(OB_OUT_PS) $(OB_OUT_PDF) $(OB_OUT_BASE) $(OB_OUT_LY)
$(OB_OUT_LY): $(OB_OUT_FILES) $(MAKO_BOOK_WRAPPER_DEP) $(COMMON) $(ALL_DEP)
	$(info doing [$@])
	$(Q)-mkdir -p $(dir $@)
	$(Q)$(MAKO_BOOK_WRAPPER) $(OB_OUT_LY) "$(OB_OUT_PATTERN)"
$(IL_OUT_PS) $(IL_OUT_PDF): $(IL_OUT_LY) $(BOOK_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)$(BOOK_WRAPPER) $(IL_OUT_PS) $(IL_OUT_PDF) $(IL_OUT_BASE) $(IL_OUT_LY)
$(IL_OUT_LY): $(IL_OUT_FILES) $(MAKO_BOOK_WRAPPER_DEP) $(COMMON) $(ALL_DEP)
	$(info doing [$@])
	$(Q)-mkdir -p $(dir $@)
	$(Q)$(MAKO_BOOK_WRAPPER) $(IL_OUT_LY) "$(IL_OUT_PATTERN)"
$(RK_OUT_PS) $(RK_OUT_PDF): $(RK_OUT_LY) $(BOOK_WRAPPER_DEP) $(ALL_DEP)
	$(info doing [$@])
	$(Q)$(BOOK_WRAPPER) $(RK_OUT_PS) $(RK_OUT_PDF) $(RK_OUT_BASE) $(RK_OUT_LY)
$(RK_OUT_LY): $(RK_OUT_FILES) $(MAKO_BOOK_WRAPPER_DEP) $(COMMON) $(ALL_DEP)
	$(info doing [$@])
	$(Q)-mkdir -p $(dir $@)
	$(Q)$(MAKO_BOOK_WRAPPER) $(RK_OUT_LY) "$(RK_OUT_PATTERN)"

.PHONY: install
install: $(OB_OUT_LY) $(OB_OUT_PS) $(OB_OUT_PDF) $(WEB_FILES) $(ALL_DEP)
	$(info doing [$@])
	$(Q)sudo rm -rf $(WEB_DIR)
	$(Q)sudo mkdir -p $(WEB_DIR)
	$(Q)sudo cp -r .htaccess index.html $(OB_OUT_LY) $(OB_OUT_PS) $(OB_OUT_PDF) $(WEB_FOLDER) $(WEB_DIR)

.PHONY: clean_web
clean_web: $(ALL_DEP)
	$(info doing [$@])
	$(Q)sudo rm -rf $(WEB_DIR)

# include the deps files (no warnings)
ifeq ($(DO_LYD),1)
-include $(FILES_LYD)
endif
ifeq ($(DO_MAKO_DEPS),1)
-include $(FILES_MAKO_DEPS)
endif
