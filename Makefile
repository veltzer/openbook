#######################
# makefile parameters #
#######################

# should we show commands executed ?
DO_MKDBG:=0
# should we depend on the date of the makefile itself ?
DO_MAKEDEPS:=1
# should we make dependency files ?
DO_LYD:=1
# should we make pds ?
DO_PDF:=1
# should we make images ?
DO_PNG:=1
# should we make postscript ?
DO_PS:=1
# should we make midi ?
DO_MIDI:=1
DO_STAMP:=1
DO_WAV:=0
DO_MP3:=1
DO_OGG:=1
# do you actually want to use dependency information ?
USE_LYD:=1
# where are the sources located ?
SRC_FOLDER:=src
# what is the lilypond that we are running?
LILYPOND:=./scripts/lilypond_wrapper.pl

# here begins the makefile...

ifneq ($(filter clean_git,$(MAKECMDGOALS)),)
USE_LYD:=0
endif
ifneq ($(filter clean_git_test,$(MAKECMDGOALS)),)
USE_LYD:=0
endif
ifneq ($(filter clean,$(MAKECMDGOALS)),)
USE_LYD:=0
endif

ALL:=
CLEAN:=
CLEAN_DIRS:=
CLEAN_EXTRA:=echo doing extra cleanup work...

LYFLAGS:=

ALL_DEP:=
ifeq ($(DO_MAKEDEPS),1)
	ALL_DEP:=$(ALL_DEP) Makefile
endif

ifeq ($(DO_MKDBG),1)
Q=
# we are not silent in this branch
else # DO_MKDBG
Q=@
#.SILENT:
endif # DO_MKDBG

FILES_LY:=$(shell find $(SRC_FOLDER) -name "*.ly")
FILES_LYI:=$(shell find $(SRC_FOLDER) -name "*.lyi")

FILES_LYD:=$(addsuffix .d,$(FILES_LY))
FILES_PDF:=$(addsuffix .pdf,$(basename $(FILES_LY)))
FILES_PS:=$(addsuffix .ps,$(basename $(FILES_LY)))
FILES_MIDI:=$(addsuffix .midi,$(basename $(FILES_LY)))
FILES_STAMP:=$(addsuffix .stamp,$(basename $(FILES_LY)))
FILES_WAV:=$(addsuffix .wav,$(basename $(FILES_LY)))
FILES_MP3:=$(addsuffix .mp3,$(basename $(FILES_LY)))
FILES_OGG:=$(addsuffix .ogg,$(basename $(FILES_LY)))

ifeq ($(DO_LYD),1)
	ALL:=$(ALL) $(FILES_LYD)
	CLEAN:=$(CLEAN) $(FILES_LYD)
endif
ifeq ($(DO_PDF),1)
	ALL:=$(ALL) $(FILES_PDF)
	CLEAN:=$(CLEAN) $(FILES_PDF)
	LYFLAGS:=$(LYFLAGS) --pdf
endif
ifeq ($(DO_PNG),1)
	CLEAN_EXTRA:=$(CLEAN_EXTRA); find $(SRC_FOLDER) -name "*.png" -exec rm {} \;
	LYFLAGS:=$(LYFLAGS) --png
endif
ifeq ($(DO_PS),1)
	ALL:=$(ALL) $(FILES_PS)
	CLEAN:=$(CLEAN) $(FILES_PS)
endif
ifeq ($(DO_MIDI),1)
	ALL:=$(ALL) $(FILES_MIDI)
	CLEAN:=$(CLEAN) $(FILES_MIDI)
endif
ifeq ($(DO_STAMP),1)
	ALL:=$(ALL) $(FILES_STAMP)
	CLEAN:=$(CLEAN) $(FILES_STAMP) $(FILES_MIDI) $(FILES_PS) $(FILES_PDF)
endif
ifeq ($(DO_WAV),1)
	ALL:=$(ALL) $(FILES_WAV)
	CLEAN:=$(CLEAN) $(FILES_WAV)
endif
ifeq ($(DO_MP3),1)
	ALL:=$(ALL) $(FILES_MP3)
	CLEAN:=$(CLEAN) $(FILES_MP3)
endif
ifeq ($(DO_OGG),1)
	ALL:=$(ALL) $(FILES_OGG)
	CLEAN:=$(CLEAN) $(FILES_OGG)
endif

.PHONY: all
all: $(ALL)

.PHONY: stamp
stamp: $(FILES_STAMP)

.PHONY: debug
debug:
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

.PHONY: todo
todo:
	-$(Q)grep TODO $(FILES_LY)

.PHONY: clean
clean:
	$(Q)rm -rf $(CLEAN)
	-$(Q)rm -rf $(CLEAN_DIRS)
	$(Q)$(CLEAN_EXTRA)
.PHONY: clean_deps
clean_deps:
	$(Q)rm -f $(FILES_LYD)
.PHONY: clean_all_png
clean_all_png:
	-find $(SRC_FOLDER) -name "*.png" -exec rm {} \;

# -x: remove everything not known to git (not only ignore rules).
# -d: remove directories also.
# -f: force.
.PHONY: clean_git
clean_git:
	@git clean -xdf
.PHONY: clean_git_test
clean_git_test:
	@git clean -xdf --dry-run

# checks

.PHONY: check_extra_files
check_extra_files:
	$(info doing [$@])
	-@find -type f -and -not -name "Makefile" -and -not -path "./.git/*" -and -not -name "*.ly" -and -not -name "*.lyi" -and -not -name "*.txt" -and -not -name "*.ly.d" -and -not -name "*.pl" -and -not -name "*.grammer" -and -not -name "*.pdf" -and -not -name "*.ps" -and -not -name "*.midi" -and -not -name "*.stamp" -and -not -name ".gitignore" -and -not -name "*.wav" -and -not -name "*.mp3" -and -not -name "*.ogg" -and -not -name "*.png" -and -not -name "*.source"
.PHONY: check_comments
check_comments:
	$(info doing [$@])
	-@grep "%%" $(FILES_LY)
.PHONY: check_composer_and
check_composer_and:
	$(info doing [$@])
	-@grep "composer=\".* and .*\"" $(FILES_LY)
.PHONY: check_min_chords
check_min_chords:
	$(info doing [$@])
	-@grep ":min" $(FILES_LY)
.PHONY: check_ws
check_ws:
	$(info doing [$@])
	-@./scripts/pgrep.pl "  | $$|\w\t|\t$$|\*\\d\:" $(FILES_LY) $(FILES_LYI)
.PHONY: check_uuid
check_uuid:
	$(info doing [$@])
	-@grep --files-without-match uuid $(FILES_LY)
.PHONY: check_common
check_common:
	$(info doing [$@])
	-@grep --files-without-match "common.lyi" $(FILES_LY)
.PHONY: check_no_poet
check_no_poet:
	$(info doing [$@])
	-@grep --files-without-match "poet=" $(FILES_LY)
.PHONY: check_copyright
check_copyright:
	$(info doing [$@])
	-@grep --files-without-match "copyright=" $(FILES_LY)
.PHONY: check_completion
check_completion:
	$(info doing [$@])
	-@grep --files-without-match "completion=" $(FILES_LY)
.PHONY: check_empty_copyright
check_empty_copyright:
	$(info doing [$@])
	-@grep "copyright=\"\"" $(FILES_LY)
.PHONY: check_chordChanges
check_chordChanges:
	$(info doing [$@])
	-@grep "chordChanges" $(FILES_LY)
.PHONY: check_bar
check_bar:
	$(info doing [$@])
	-@grep "\\\\bar" $(FILES_LY)
.PHONY: check_break
check_break:
	$(info doing [$@])
	-@grep "\\\\break" $(FILES_LY)
.PHONY: check_all
check_all: check_empty_copyright check_common check_ws check_composer_and check_extra_files check_min_chords check_uuid check_chordChanges check_bar check_break check_completion

# rules

# rules for creating pdf, ps, png and midi directly from the ly files,
# they are not used as we are creating everything together...
#$(FILES_PDF): %.pdf: %.ly
#	$(LILYPOND) --pdf $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.pdf $@
#$(FILES_PNG): %.png: %.ly
#	$(LILYPOND) --png $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.png $@
#$(FILES_PS): %.ps: %.ly
#	$(LILYPOND) --ps $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.ps $@
#$(FILES_MIDI): %.midi: %.ly
#	$(LILYPOND) --pdf $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.midi $@
# dependency for PNGs does not make sense since we do not know the file names...
#$(FILES_PNG): %.png: %.stamp $(ALL_DEP)

$(FILES_PS): %.ps: %.stamp $(ALL_DEP)

$(FILES_PDF): %.pdf: %.stamp $(ALL_DEP)

$(FILES_MIDI): %.midi: %.stamp $(ALL_DEP)

$(FILES_STAMP): %.stamp: %.ly $(ALL_DEP)
	$(info doing [$@])
	$(Q)rm -f $(dir $@)$(basename $(notdir $@))-*.png $(dir $@)$(basename $(notdir $@)).{ps,pdf,midi}
	$(Q)$(LILYPOND) $(LYFLAGS) -o $(dir $@)$(basename $(notdir $@)) $< 2> /tmp/error
	$(Q)touch $@

#old rule
#	rm -rf /tmp/folder
#	mkdir /tmp/folder
#	$(LILYPOND) --png --pdf $(LYFLAGS) -o /tmp/folder/foo $<
#	mv /tmp/folder/foo.ps $(basename $<).ps
#	mv /tmp/folder/foo.pdf $(basename $<).pdf
#	mv /tmp/folder/foo.midi $(basename $<).midi
#	touch $@
#rm -rf /tmp/folder
$(FILES_LYD): %.ly.d: %.ly $(ALL_DEP)
	$(info doing [$@])
	$(Q)./scripts/lilydep.pl $< $@ $(basename $<).stamp $(basename $<).pdf $(basename $<).ps $(basename $<).midi
$(FILES_WAV): %.wav: %.midi $(ALL_DEP)
	$(info doing $@)
	$(Q)timidity $< -idq -Ow -o $@ > /dev/null
# rule about making mp3 from wav files - I currently don't use it since
# I generated mp3 directly from midi using a pipe between timidity and lame...
#$(FILES_MP3): %.mp3: %.wav
#	lame $< $@
$(FILES_OGG): %.ogg: %.midi $(ALL_DEP)
	$(info doing [$@])
	$(Q)timidity $< -idq -Ov -o $@ > /dev/null
$(FILES_MP3): %.mp3: %.midi $(ALL_DEP)
	$(info doing [$@])
	$(Q)timidity $< -idq -Ow -o - 2> /dev/null | lame - $@ > /dev/null 2> /dev/null

# include the deps files (no warnings)
ifeq ($(USE_LYD),1)
-include $(FILES_LYD)
endif
