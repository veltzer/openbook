ALL:=
CLEAN:=

DO_PDF:=1
DO_PNG:=1
DO_PS:=1
DO_MIDI:=1
DO_STAMP:=1
DO_WAV:=0
DO_MP3:=1
DO_OGG:=1

# do you actually want to use dependency information ?
USE_DEPS:=0

SRC_FOLDER=src

FILES_LY:=$(shell find $(SRC_FOLDER) -name "*.ly")
FILES_LYI:=$(shell find $(SRC_FOLDER) -name "*.lyi")
FILES_LYD:=$(addsuffix .d,$(FILES_LY))

FILES_PDF:=$(addsuffix .pdf,$(basename $(FILES_LY)))
FILES_PNG:=$(addsuffix .png,$(basename $(FILES_LY)))
FILES_PS:=$(addsuffix .ps,$(basename $(FILES_LY)))
FILES_MIDI:=$(addsuffix .midi,$(basename $(FILES_LY)))
FILES_STAMP:=$(addsuffix .stamp,$(basename $(FILES_LY)))
FILES_WAV:=$(addsuffix .wav,$(basename $(FILES_LY)))
FILES_MP3:=$(addsuffix .mp3,$(basename $(FILES_LY)))
FILES_OGG:=$(addsuffix .ogg,$(basename $(FILES_LY)))

ALL:=$(ALL) $(FILES_LYD)
ifeq ($(DO_PDF),1)
	ALL:=$(ALL) $(FILES_PDF)
endif
ifeq ($(DO_PNG),1)
	ALL:=$(ALL) $(FILES_PNG)
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
CLEAN:=$(CLEAN) $(FILES_LYD) $(FILES_PDF) $(FILES_PNG) $(FILES_PS) $(FILES_MIDI) $(FILES_STAMP) $(FILES_WAV) $(FILES_MP3) $(FILES_OGG)

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
	$(info FILES_PNG is $(FILES_PNG))
	$(info FILES_PS is $(FILES_PS))
	$(info FILES_MIDI is $(FILES_MIDI))
	$(info FILES_STAMP is $(FILES_STAMP))
	$(info FILES_WAV is $(FILES_WAV))
	$(info FILES_MP3 is $(FILES_MP3))
	$(info FILES_OGG is $(FILES_OGG))

.PHONY: todo
todo:
	-@grep TODO $(FILES_LY)

.PHONY: clean
clean:
	rm -rf $(CLEAN)
.PHONY: clean_deps
clean_deps:
	rm -f $(FILES_LYD)
.PHONY: clean_all_png
clean_all_png:
	-find $(SRC_FOLDER) -name "*.png" -exec rm {} \;

# checks

.PHONY: check_extra_files
check_extra_files:
	-@find -type f -and -not -name "Makefile" -and -not -path "./.git/*" -and -not -name "*.ly" -and -not -name "*.lyi" -and -not -name "*.txt" -and -not -name "*.ly.d" -and -not -name "*.pl" -and -not -name "*.grammer" -and -not -name "*.pdf" -and -not -name "*.ps" -and -not -name "*.midi" -and -not -name "*.stamp" -and -not -name ".gitignore" -and -not -name "*.wav" -and -not -name "*.mp3" -and -not -name "*.ogg"
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
.PHONY: check_no_copyright
check_no_copyright:
	$(info doing [$@])
	-@grep --files-without-match "copyright=" $(FILES_LY)
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
check_all: check_empty_copyright check_common check_ws check_composer_and check_extra_files check_min_chords check_uuid check_chordChanges check_bar check_break

# rules

LYFLAGS:=

# rules for creating pdf, ps, png and midi directly from the ly files,
# they are not used as we are creating everything together...
#$(FILES_PDF): %.pdf: %.ly
#	lilypond --pdf $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.pdf $@
#$(FILES_PNG): %.png: %.ly
#	lilypond --png $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.png $@
#$(FILES_PS): %.ps: %.ly
#	lilypond --ps $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.ps $@
#$(FILES_MIDI): %.midi: %.ly
#	lilypond --pdf $(LYFLAGS) -o /tmp/foo $<
#	mv /tmp/foo.midi $@
$(FILES_PNG): %.png: %.stamp

$(FILES_PS): %.ps: %.stamp

$(FILES_PDF): %.pdf: %.stamp

$(FILES_MIDI): %.midi: %.stamp

$(FILES_STAMP): %.stamp: %.ly
	lilypond --pdf $(LYFLAGS) -o /tmp/foo $<
	mv /tmp/foo.ps $(basename $<).ps
	mv /tmp/foo.pdf $(basename $<).pdf
	mv /tmp/foo.midi $(basename $<).midi
	touch $@
$(FILES_LYD): %.ly.d: %.ly
	./scripts/lilydep.pl $< $@ $(basename $<).pdf $(basename $<).ps $(basename $<).midi
$(FILES_WAV): %.wav: %.midi
	timidity $< -idq -Ow -o $@ > /dev/null
# rule about making mp3 from wav files - I currently don't use it since
# I generated mp3 directly from midi using a pipe between timidity and lame...
#$(FILES_MP3): %.mp3: %.wav
#	lame $< $@
$(FILES_OGG): %.ogg: %.midi
	timidity $< -idq -Ov -o $@ > /dev/null
$(FILES_MP3): %.mp3: %.midi
	timidity $< -idq -Ow -o - | lame - $@

# include the deps files (no warnings)
ifeq ($(USE_DEPS),1)
-include $(FILES_LYD)
endif
