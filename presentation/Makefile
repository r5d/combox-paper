#!/usr/bin/make
#
# combox - presentation
#
# Makefile
#
# By Siddharth Ravikumar <sravik@bgsu.edu>
#
# No rights reserved. Dedicated to Public Domain.
# <https://creativecommons.org/publicdomain/zero/1.0/>

PDF = combox-p.pdf
TEX = p.tex
DVI = p.dvi

all: $(PDF)
	@evince $(PDF) &

$(PDF): $(DVI)
	dvipdf $< $@

$(DVI): $(TEX)
	@latex $<
	@latex $<
	@latex $<

clean:
	rm -f $(PDF) $(DVI) *.aux *.log *~

.PHONY: clean all
