outdir=out

WEB_DIR=aopsys:/home/laurent/www/partoches.bearteam.org

.PHONY: ps ps.gz dvi all pdf pdf.gz clean very_clean tar.gz

$(outdir)/%_c.ly : %.ly
	cat template_c.ly | sed -e s/__input__/$</ > $@

$(outdir)/%_bes.ly : %.ly
	cat template_bes.ly | sed -e s/__input__/$</ > $@

$(outdir)/%_ees.ly : %.ly
	cat template_ees.ly | sed -e s/__input__/$</ > $@

%.dvi: $(outdir)/%.ly
	ly2dvi $<

%.dvi: %.ly
	ly2dvi $<

%.midi: $(outdir)/%_c.ly
	lilypond -m $<
	mv `basename $@ .midi`_c.midi $@

%.ps : %.dvi
	dvips -o $@ $<

%.pdf : %.ps
	ps2pdf $< $@

%.gz : %
	gzip -c $< > $@

%.html : %.php
	php4 -q $< > $@

#%_ees.ly : %.ly
#%_bes.ly : %.ly
#%_c.ly : %.ly

MORCEAUX = \
	agua_de_beber \
	all_blues \
	apres_un_reve \
	autumn_leaves \
	barquino \
	beautiful_love \
	bewitched \
	billies_bounce \
	black_orpheus \
	blue_bossa \
	bluesette \
	blues_in_the_closet \
	blues_march \
	blue_train \
	but_not_for_me \
	bye_bye_black_bird \
	cantaloupe_island \
	cantaloupe_island_with_piano \
	chega_de_saudade \
	cherokee \
	con_alma \
	confirmation \
	corcovado \
	corcovado_lyrics \
	countdown \
	cousin_mary \
	dance_of_the_infidels \
	desafinado \
	early_autumn \
	everything_happens_to_me \
	everythinghappenstome \
	f_blues \
	fly_me_to_the_moon \
	foggy_day \
	foolish_heart \
	footprints \
	four \
	four_brothers \
	full_house \
	freddy_freeloader \
	getoutoftown \
	giant_steps \
	girl_talk \
	how_high_the_moon \
	i_could_write_a_book \
	if_you_could_see_me_now \
	i_got_rhythm \
	iletasong \
	i_ll_remember_april \
	i_love_you \
	imagination \
	insensatez \
	in_your_own_sweet_way \
	i_remember_clifford \
	it_dont_mean_a_thing \
	it_might_as_well_be_spring \
	its_all_right_with_me \
	jordu \
	just_friends \
	just_one_of_those_things \
	las_vegas_tango \
	laura \
	lazy_bird \
	likesomeoneinlove \
	line_for_lyons \
	love_is_here_to_stay \
	loverman \
	lullaby_of_birdland \
	mack_the_knife \
	mack_the_knife_lyrics \
	maiden_voyage \
	mean_to_me \
	meditation \
	miss_jones \
	mood_indigo \
	mr_pc \
	my_favorite_things \
	my_funny_valentine \
	my_funny_valentine_lyrics \
	my_little_suede_shoes \
	naima \
	night_and_day \
	night_in_tunisia \
	nows_the_time \
	o_grande_amor \
	old_devil_moon \
	once_i_loved \
	one_note_samba \
	perdido \
	round_midnight \
	samba_de_uma_nota_so \
	satin_doll \
	september_song \
	shadow_of_your_smile \
	sophisticated_lady \
	someday_my_prince_will_come \
	song_for_my_father \
	so_what \
	speaklow \
	strike_up_the_band \
	summertime \
	sweet_georgia_brown \
	take_five \
	take_the_a_train \
	tenderly \
	theendofaloveaffair \
	the_girl_from_ipanema \
	the_girl_from_ipanema_lyrics \
	the_man_i_love \
	triste \
	unit_seven \
	yougotomyhead \
	youvechanged \
	watermelon_man \
	wave \
	wave_lower \
	whisper_not


MORCEAUX_LY = $(addsuffix .ly,$(MORCEAUX) hallelujah what_a_wonderful_world) 
MORCEAUX_MIDI = $(addsuffix .midi,$(MORCEAUX) hallelujah what_a_wonderful_world) 

SOURCES = $(MORCEAUX_LY) template_c.ly template_bes.ly template_ees.ly \
	chord-name.ly paper.ly defs.ly Makefile

MORCEAUX_C = $(addsuffix _c,$(MORCEAUX)) hallelujah what_a_wonderful_world
MORCEAUX_BES = $(addsuffix _bes,$(MORCEAUX))
MORCEAUX_EES = $(addsuffix _ees,$(MORCEAUX))

MORCEAUX_C_PS = $(addsuffix .ps,$(MORCEAUX_C))
MORCEAUX_C_PS_GZ = $(addsuffix .ps.gz,$(MORCEAUX_C))
MORCEAUX_C_PDF = $(addsuffix .pdf,$(MORCEAUX_C))
MORCEAUX_C_PDF_GZ = $(addsuffix .pdf.gz,$(MORCEAUX_C))
MORCEAUX_C_DVI = $(addsuffix .dvi,$(MORCEAUX_C))
MORCEAUX_C_LY =  $(addsuffix .ly,$(MORCEAUX_C))

MORCEAUX_BES_PS = $(addsuffix .ps,$(MORCEAUX_BES))
MORCEAUX_BES_PS_GZ = $(addsuffix .ps.gz,$(MORCEAUX_BES))
MORCEAUX_BES_PDF = $(addsuffix .pdf,$(MORCEAUX_BES))
MORCEAUX_BES_PDF_GZ = $(addsuffix .pdf.gz,$(MORCEAUX_BES))
MORCEAUX_BES_DVI = $(addsuffix .dvi,$(MORCEAUX_BES))
MORCEAUX_BES_LY =  $(addsuffix .ly,$(MORCEAUX_BES))

MORCEAUX_EES_PS = $(addsuffix .ps,$(MORCEAUX_EES))
MORCEAUX_EES_PS_GZ = $(addsuffix .ps.gz,$(MORCEAUX_EES))
MORCEAUX_EES_PDF = $(addsuffix .pdf,$(MORCEAUX_EES))
MORCEAUX_EES_PDF_GZ = $(addsuffix .pdf.gz,$(MORCEAUX_EES))
MORCEAUX_EES_DVI = $(addsuffix .dvi,$(MORCEAUX_EES))
MORCEAUX_EES_LY =  $(addsuffix .ly,$(MORCEAUX_EES))

MORCEAUX_DVI = $(MORCEAUX_C_DVI) $(MORCEAUX_BES_DVI) $(MORCEAUX_EES_DVI)
MORCEAUX_PS = $(MORCEAUX_C_PS) $(MORCEAUX_BES_PS) $(MORCEAUX_EES_PS)
MORCEAUX_PS_GZ = $(MORCEAUX_C_PS_GZ) $(MORCEAUX_BES_PS_GZ) $(MORCEAUX_EES_PS_GZ)
MORCEAUX_PDF = $(MORCEAUX_C_PDF) $(MORCEAUX_BES_PDF) $(MORCEAUX_EES_PDF)
MORCEAUX_PDF_GZ = $(MORCEAUX_C_PDF_GZ) $(MORCEAUX_BES_PDF_GZ) $(MORCEAUX_EES_PDF_GZ)

default: dvi

$(outdir):
	mkdir $(outdir)

all: ps.gz pdf.gz ps.tar.gz pdf.tar.gz

dvi: $(outdir) $(MORCEAUX_DVI)
ps: $(MORCEAUX_PS)
ps.gz: $(MORCEAUX_PS_GZ)
pdf: $(MORCEAUX_PDF)
pdf.gz: $(MORCEAUX_PDF_GZ)

ps_c: $(MORCEAUX_C_PS)
ps_bes: $(MORCEAUX_BES_PS)
ps_ees: $(MORCEAUX_EES_PS)

dvi_c: $(MORCEAUX_C_DVI)
dvi_bes: $(MORCEAUX_BES_DVI)
dvi_ees: $(MORCEAUX_EES_DVI)

midi: $(MORCEAUX_MIDI)

ps.tar.gz: jazz_c_ps.tar.gz jazz_bes_ps.tar.gz jazz_ees_ps.tar.gz
pdf.tar.gz: jazz_c_pdf.tar.gz jazz_bes_pdf.tar.gz jazz_ees_pdf.tar.gz

jazz_c_ps.tar.gz: $(MORCEAUX_C_PS)
	tar zcf $@ $^

jazz_c_pdf.tar.gz: $(MORCEAUX_C_PDF)
	tar zcf $@ $^

jazz_bes_ps.tar.gz: $(MORCEAUX_BES_PS)
	tar zcf $@ $^

jazz_bes_pdf.tar.gz: $(MORCEAUX_BES_PDF)
	tar zcf $@ $^

jazz_ees_ps.tar.gz: $(MORCEAUX_EES_PS)
	tar zcf $@ $^

jazz_ees_pdf.tar.gz: $(MORCEAUX_EES_PDF)
	tar zcf $@ $^

jazz.tar.gz: $(SOURCES)
	tar zcf $@ $^

index.html: $(MORCEAUX_LY)

WEB_FILES=index.*.php listing.php list.*.php style.css print.css partition.php choix.php modified.php choix.css include.php .htaccess .stamp
# update web directory
install-www: all jazz.tar.gz
	echo `date` > .stamp
	rsync -e ssh -t \
		*.pdf *.ps *.pdf.gz *.ps.gz jazz.tar.gz jazz_*.gz \
		$(MORCEAUX_LY) $(WEB_FILES) $(WEB_DIR)

clean:
	rm -f $(MORCEAUX_DVI) $(MORCEAUX_PS) $(MORCEAUX_PS_GZ) $(MORCEAUX_PDF)

very_clean: clean
	rm -f *~

# dependencies
dvi_targets=$(addprefix $(1)_,c.dvi bes.dvi,ees.dvi)

$(call dvi_targets,wave): wave_inc.ly
$(call dvi_targets,wave_lower): wave_inc.ly

$(call dvi_targets,the_girl_from_ipanema_lyrics): the_girl_from_ipanema_inc.ly
$(call dvi_targets,the_girl_from_ipanema): the_girl_from_ipanema_inc.ly

$(call dvi_targets,corcovado_lyrics): corcovado_inc.ly
$(call dvi_targets,corcovado): corcovado_inc.ly

$(call dvi_targets,my_funny_valentine_lyrics): my_funny_valentine_inc.ly
$(call dvi_targets,my_funny_valentine): my_funny_valentine_inc.ly

$(call dvi_targets,mack_the_knife_lyrics): mack_the_knife_inc.ly
$(call dvi_targets,mack_the_knife): mack_the_knife_inc.ly

