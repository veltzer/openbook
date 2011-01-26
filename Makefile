#######################
# makefile parameters #
#######################

# should we show commands executed ?
DO_MKDBG:=0
# should we depend on the date of the makefile itself ?
DO_MAKEDEPS:=1
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
DO_STAMP:=1
DO_WAV:=0
DO_MP3:=1
DO_OGG:=1
# do you actually want to use dependency information ?
USE_LYD:=0
# where are the sources located ?
SRC_FOLDER:=src

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

FILES_GPP:=$(shell find $(SRC_FOLDER) -name "*.gpp")
FILES_LYI:=$(shell find $(SRC_FOLDER) -name "*.lyi")

FILES_LY:=$(addsuffix .ly,$(basename $(FILES_GPP)))
FILES_LYD:=$(addsuffix .d,$(FILES_LY))
FILES_PDF:=$(addsuffix .pdf,$(basename $(FILES_GPP)))
FILES_PS:=$(addsuffix .ps,$(basename $(FILES_GPP)))
FILES_MIDI:=$(addsuffix .midi,$(basename $(FILES_GPP)))
FILES_STAMP:=$(addsuffix .stamp,$(basename $(FILES_GPP)))
FILES_WAV:=$(addsuffix .wav,$(basename $(FILES_GPP)))
FILES_MP3:=$(addsuffix .mp3,$(basename $(FILES_GPP)))
FILES_OGG:=$(addsuffix .ogg,$(basename $(FILES_GPP)))

ifeq ($(DO_LY),1)
	ALL:=$(ALL) $(FILES_LY)
	CLEAN:=$(CLEAN) $(FILES_LY)
endif
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

.PHONY: ly
ly: $(FILES_LY)

.PHONY: debug
debug:
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
	$(Q)git clean -xdf
.PHONY: clean_git_test
clean_git_test:
	$(Q)git clean -xdf --dry-run

# checks

.PHONY: check_extra_files
check_extra_files:
	$(info doing [$@])
	$(Q)git status --porcelain
.PHONY: check_comments
check_comments:
	$(info doing [$@])
	-$(Q)grep "%%" $(FILES_GPP)
.PHONY: check_composer_and
check_composer_and:
	$(info doing [$@])
	-$(Q)grep "composer=\".* and .*\"" $(FILES_GPP)
.PHONY: check_min_chords
check_min_chords:
	$(info doing [$@])
	-$(Q)grep ":min" $(FILES_GPP)
.PHONY: check_ws
check_ws:
	$(info doing [$@])
	-$(Q)./scripts/pgrep.pl "  | $$|\w\t|\t$$|\*\\d\:" $(FILES_GPP) $(FILES_LYI)
.PHONY: check_uuid
check_uuid:
	$(info doing [$@])
	-$(Q)grep --files-without-match uuid $(FILES_GPP)
.PHONY: check_common
check_common:
	$(info doing [$@])
	-$(Q)grep --files-without-match "common_m4.lyi" $(FILES_GPP)
.PHONY: check_no_poet
check_no_poet:
	$(info doing [$@])
	-$(Q)grep --files-without-match "poet=" $(FILES_GPP)
.PHONY: check_copyright
check_copyright:
	$(info doing [$@])
	-$(Q)grep --files-without-match "copyright=" $(FILES_GPP)
.PHONY: check_completion
check_completion:
	$(info doing [$@])
	-$(Q)grep --files-without-match "completion=" $(FILES_GPP)
.PHONY: check_empty_copyright
check_empty_copyright:
	$(info doing [$@])
	-$(Q)grep "copyright=\"\"" $(FILES_GPP)
.PHONY: check_chordChanges
check_chordChanges:
	$(info doing [$@])
	-$(Q)grep "chordChanges" $(FILES_GPP)
.PHONY: check_bar
check_bar:
	$(info doing [$@])
	-$(Q)grep "\\\\bar" $(FILES_GPP)
.PHONY: check_break
check_break:
	$(info doing [$@])
	-$(Q)grep "\\\\break" $(FILES_GPP)
.PHONY: check_include
check_include:
	$(info doing [$@])
	-$(Q)grep "\\\\include" $(FILES_GPP)
.PHONY: check_all
check_all: check_empty_copyright check_common check_ws check_composer_and check_extra_files check_min_chords check_uuid check_chordChanges check_bar check_break check_completion check_include

# rules

# rules for creating pdf, ps, png and midi directly from the ly files,
# they are not used as we are creating everything together...
#$(FILES_PDF): %.pdf: %.ly
#	./scripts/lilypond_wrapper.pl --pdf $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.pdf $@
#$(FILES_PNG): %.png: %.ly
#	./scripts/lilypond_wrapper.pl --png $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.png $@
#$(FILES_PS): %.ps: %.ly
#	./scripts/lilypond_wrapper.pl --ps $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.ps $@
#$(FILES_MIDI): %.midi: %.ly
#	./scripts/lilypond_wrapper.pl --pdf $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.midi $@
# dependency for PNGs does not make sense since we do not know the file names...
#$(FILES_PNG): %.png: %.stamp $(ALL_DEP)

$(FILES_PS): %.ps: %.stamp $(ALL_DEP)

$(FILES_PDF): %.pdf: %.stamp $(ALL_DEP)

$(FILES_MIDI): %.midi: %.stamp $(ALL_DEP)

$(FILES_STAMP): %.stamp: %.ly $(ALL_DEP) ./scripts/lilypond_wrapper.pl
	$(info doing [$@])
	$(Q)./scripts/lilypond_wrapper.pl $< $@ $(LYFLAGS) -o $(dir $@)$(basename $(notdir $@)) $<

#old rule
#	rm -rf /tmp/folder
#	mkdir /tmp/folder
#	./scripts/lilypond_wrapper.pl --png --pdf $(LYFLAGS) -o /tmp/folder/foo $<
#	mv /tmp/folder/foo.ps $(basename $<).ps
#	mv /tmp/folder/foo.pdf $(basename $<).pdf
#	mv /tmp/folder/foo.midi $(basename $<).midi
#	touch $@
#rm -rf /tmp/folder
$(FILES_LY): %.ly: %.gpp $(ALL_DEP) ./scripts/m4_wrapper.pl
	$(info doing [$@])
	$(Q)./scripts/m4_wrapper.pl $< $@
$(FILES_LYD): %.ly.d: %.ly $(ALL_DEP) ./scripts/lilydep.pl
	$(info doing [$@])
	$(Q)./scripts/lilydep.pl $< $@ $(basename $<).stamp $(basename $<).pdf $(basename $<).ps $(basename $<).midi
$(FILES_WAV): %.wav: %.midi $(ALL_DEP) ./scripts/timidity_wrapper.pl
	$(info doing $@)
	$(Q)./scripts/timidity_wrapper.pl $< -idq -Ow -o $@
# rule about making mp3 from wav files - I currently don't use it since
# I generated mp3 directly from midi using a pipe between timidity and lame...
#$(FILES_MP3): %.mp3: %.wav
#	lame $< $@
$(FILES_OGG): %.ogg: %.midi $(ALL_DEP) ./scripts/timidity_wrapper.pl
	$(info doing [$@])
	$(Q)./scripts/timidity_wrapper.pl $< $@ $< -idq -Ov -o $@
$(FILES_MP3): %.mp3: %.midi $(ALL_DEP) ./scripts/timlame_wrapper.pl
	$(info doing [$@])
	$(Q)./scripts/timlame_wrapper.pl $< $@ $< -idq -Ow -o -

# include the deps files (no warnings)
ifeq ($(USE_LYD),1)
-include $(FILES_LYD)
endif
