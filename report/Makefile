#!/usr/bin/make
#
# combox - report
#
# Makefile
#
# By Siddharth Ravikumar <sravik@bgsu.edu>
#
# No rights reserved. Dedicated to Public Domain.
# <https://creativecommons.org/publicdomain/zero/1.0/>

PDF = combox-report.pdf
SRC = combox.tex
DVI = combox.dvi

all: $(PDF)
	@evince $(PDF) &

$(PDF): $(DVI)
	@dvipdf $< $@

$(DVI): $(SRC)
	@latex  $<; latex $<; latex $<

clean:
	rm -f $(PDF) *.aux *.dvi *.log *~

.PHONY: clean all
