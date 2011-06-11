##############
# PARAMETERS #
##############
# should we show commands executed ?
DO_MKDBG:=0
# should we depend on the date of the makefile itself ?
DO_MAKEDEPS:=1
# should we depend on the wrappers ?
DO_WRAPDEPS:=1
# should we make the ly files ?
DO_LY:=1
# should we make lilypond dependency files ?
DO_LYD:=0
# should we make pds ?
DO_PDF:=1
# should we make images ?
DO_PNG:=1
# should we make postscript ?
DO_PS:=1
# should we make midi ?
DO_MIDI:=1
# should we make stamp files ? (always answer yes to this...)
DO_STAMP:=1
# should we make .wav files ? (don't really want this):
DO_WAV:=0
# should we make mp3 ?
DO_MP3:=1
# should we make ogg ?
DO_OGG:=1
# do you actually want to use dependency information ?
USE_LYD:=0
# where are the sources located ?
SOURCE_DIR:=src
# where is the output folder ?
OUT_DIR:=out
# wrappers
LILYPOND_WRAPPER:=scripts/lilypond_wrapper.pl
M4_WRAPPER:=scripts/m4_wrapper.pl
LILYDEP_WRAPPER:=scripts/lilydep.pl
MIDI2WAV_WRAPPER:=scripts/midi2wav.pl
MIDI2OGG_WRAPPER:=scripts/midi2ogg.pl
MIDI2MP3_WRAPPER:=scripts/midi2mp3.pl

########
# BODY #
########

# do not include deps (or generate them) if we are doing a clean...
ifneq ($(filter clean,$(MAKECMDGOALS)),)
USE_LYD:=0
endif

ALL:=

LYFLAGS:=

ALL_DEP:=
ifeq ($(DO_MAKEDEPS),1)
	ALL_DEP:=$(ALL_DEP) Makefile
endif
ifeq ($(DO_WRAPDEPS),1)
	LILYPOND_WRAPPER_DEP:=$(LILYPOND_WRAPPER)
	M4_WRAPPER_DEP:=$(M4_WRAPPER)
	LILYDEP_WRAPPER_DEP:=$(LILYDEP_WRAPPER)
	MIDI2WAV_WRAPPER_DEP:=$(MIDI2WAV_WRAPPER)
	MIDI2OGG_WRAPPER_DEP:=$(MIDI2OGG_WRAPPER)
	MIDI2MP3_WRAPPER_DEP:=$(MIDI2MP3_WRAPPER)
else
	LILYPOND_WRAPPER_DEP:=
	M4_WRAPPER_DEP:=
	LILYDEP_WRAPPER_DEP:=
	MIDI2WAV_WRAPPER_DEP:=
	MIDI2OGG_WRAPPER_DEP:=
	MIDI2MP3_WRAPPER_DEP:=
endif

ifeq ($(DO_MKDBG),1)
Q=
# we are not silent in this branch
else # DO_MKDBG
Q=@
#.SILENT:
endif # DO_MKDBG

SOURCES_ALL:=$(shell git ls-files)
#SOURCES_ALL:=$(subst ./,,$(shell find . -type f))
FILES_GPP:=$(filter %.gpp,$(SOURCES_ALL))
FILES_LYI:=$(filter %.lyi,$(SOURCES_ALL))

FILES_LY:=$(addsuffix .ly,$(addprefix $(OUT_DIR)/,$(basename $(FILES_GPP))))
FILES_LYD:=$(addsuffix .ly.d,$(addprefix $(OUT_DIR)/,$(basename $(FILES_GPP))))
FILES_PDF:=$(addsuffix .pdf,$(addprefix $(OUT_DIR)/,$(basename $(FILES_GPP))))
FILES_PS:=$(addsuffix .ps,$(addprefix $(OUT_DIR)/,$(basename $(FILES_GPP))))
FILES_MIDI:=$(addsuffix .midi,$(addprefix $(OUT_DIR)/,$(basename $(FILES_GPP))))
FILES_STAMP:=$(addsuffix .stamp,$(addprefix $(OUT_DIR)/,$(basename $(FILES_GPP))))
FILES_WAV:=$(addsuffix .wav,$(addprefix $(OUT_DIR)/,$(basename $(FILES_GPP))))
FILES_MP3:=$(addsuffix .mp3,$(addprefix $(OUT_DIR)/,$(basename $(FILES_GPP))))
FILES_OGG:=$(addsuffix .ogg,$(addprefix $(OUT_DIR)/,$(basename $(FILES_GPP))))

ifeq ($(DO_LY),1)
	ALL:=$(ALL) $(FILES_LY)
endif
ifeq ($(DO_LYD),1)
	ALL:=$(ALL) $(FILES_LYD)
endif
ifeq ($(DO_PDF),1)
	ALL:=$(ALL) $(FILES_PDF)
	LYFLAGS:=$(LYFLAGS) --pdf
endif
ifeq ($(DO_PNG),1)
	LYFLAGS:=$(LYFLAGS) --png
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

.PHONY: all
all: $(ALL)

.PHONY: stamp
stamp: $(FILES_STAMP)

.PHONY: ly
ly: $(FILES_LY)

.PHONY: debug
debug:
	$(info SOURCES_ALL is $(SOURCES_ALL))
	$(info FILES_GPP is $(FILES_GPP))
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
	$(info ALL is $(ALL))

.PHONY: todo
todo:
	$(Q)-grep TODO $(FILES_LY)

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
.PHONY: clean
clean:
	$(Q)git clean -fXd > /dev/null

# checks

.PHONY: check_extra_files
check_extra_files:
	$(info doing [$@])
	$(Q)git status --porcelain
.PHONY: check_comments
check_comments:
	$(info doing [$@])
	$(Q)-grep "%%" $(FILES_GPP)
.PHONY: check_and
check_and:
	$(info doing [$@])
	$(Q)-grep "composer=\".* and .*\"" $(FILES_GPP)
	$(Q)-grep "poet=\".* and .*\"" $(FILES_GPP)
.PHONY: check_min_chords
check_min_chords:
	$(info doing [$@])
	$(Q)-grep ":min" $(FILES_GPP)
.PHONY: check_ws
check_ws:
	$(info doing [$@])
	$(Q)-./scripts/pgrep.pl "  | $$|\w\t|\t$$|\*\\d\:" $(FILES_GPP) $(FILES_LYI)
.PHONY: check_uuid
check_uuid:
	$(info doing [$@])
	$(Q)-grep --files-without-match uuid $(FILES_GPP)
.PHONY: check_common
check_common:
	$(info doing [$@])
	$(Q)-grep --files-without-match "common.lyi" $(FILES_GPP)
.PHONY: check_no_poet
check_no_poet:
	$(info doing [$@])
	$(Q)-grep --files-without-match "poet=" $(FILES_GPP)
.PHONY: check_copyright
check_copyright:
	$(info doing [$@])
	$(Q)-grep --files-without-match "copyright=" $(FILES_GPP)
.PHONY: check_completion
check_completion:
	$(info doing [$@])
	$(Q)-grep --files-without-match "completion=" $(FILES_GPP)
.PHONY: check_empty_copyright
check_empty_copyright:
	$(info doing [$@])
	$(Q)-grep "copyright=\"\"" $(FILES_GPP)
.PHONY: check_chordChanges
check_chordChanges:
	$(info doing [$@])
	$(Q)-grep "chordChanges" $(FILES_GPP)
.PHONY: check_bar
check_bar:
	$(info doing [$@])
	$(Q)-grep "\\\\bar" $(FILES_GPP)
.PHONY: check_break
check_break:
	$(info doing [$@])
	$(Q)-grep "\\\\break" $(FILES_GPP)
.PHONY: check_include
check_include:
	$(info doing [$@])
	$(Q)-grep "\\\\include" $(FILES_GPP)
.PHONY: check_all
check_all: check_empty_copyright check_common check_ws check_and check_extra_files check_min_chords check_uuid check_chordChanges check_bar check_break check_completion check_include

# rules

# explain to make that .ps .pdf and .midi are really stamp files (do I need this ?!?)
$(FILES_PS): %.ps: %.stamp $(ALL_DEP)

$(FILES_PDF): %.pdf: %.stamp $(ALL_DEP)

$(FILES_MIDI): %.midi: %.stamp $(ALL_DEP)

$(FILES_STAMP): %.stamp: %.ly $(ALL_DEP) $(LILYPOND_WRAPPER_DEP)
	$(info doing [$@])
	$(Q)-mkdir -p $(dir $@)
	$(Q)$(LILYPOND_WRAPPER) $< $@ $(LYFLAGS) -o $(dir $@)$(basename $(notdir $@)) $<

$(FILES_LY): $(OUT_DIR)/%.ly: %.gpp $(ALL_DEP) $(M4_WRAPPER_DEP)
	$(info doing [$@])
	$(Q)-mkdir -p $(dir $@)
	$(Q)$(M4_WRAPPER) $< $@
$(FILES_LYD): %.ly.d: %.ly $(ALL_DEP) $(LILYDEP_WRAPPER_DEP)
	$(info doing [$@])
	$(Q)-mkdir -p $(dir $@)
	$(Q)$(LILYDEP_WRAPPER) $< $@ $(basename $@).stamp $(basename $@).pdf $(basename $@).ps $(basename $@).midi
$(FILES_WAV): %.wav: %.midi $(ALL_DEP) $(MIDI2WAV_WRAPPER_DEP)
	$(info doing $@)
	$(Q)-mkdir -p $(dir $@)
	$(Q)$(MIDI2WAV_WRAPPER) $< $@
$(FILES_OGG): %.ogg: %.midi $(ALL_DEP) $(MIDI2OGG_WRAPPER_DEP)
	$(info doing [$@])
	$(Q)-mkdir -p $(dir $@)
	$(Q)$(MIDI2OGG_WRAPPER) $< $@
$(FILES_MP3): %.mp3: %.midi $(ALL_DEP) $(MIDI2MP3_WRAPPER_DEP)
	$(info doing [$@])
	$(Q)-mkdir -p $(dir $@)
	$(Q)$(MIDI2MP3_WRAPPER) $< $@

# include the deps files (no warnings)
ifeq ($(USE_LYD),1)
-include $(FILES_LYD)
endif
