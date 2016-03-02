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
REPORT_TEX = combox.tex
REPORT_AUX = combox.aux
REPORT_INCLUDES = graphs/*.tex chapters/*.tex bib/combox.bib appendix/*.tex prologue/*.tex
DVI = combox.dvi

all: $(PDF)
	@evince $(PDF) &

$(PDF): $(DVI)
	@dvipdf $< $@

$(DVI): $(REPORT_TEX) $(REPORT_INCLUDES)
	@latex  $<
	@bibtex $(REPORT_AUX)
	@latex $<
	@latex $<

clean:
	rm -f $(PDF) *.aux *.dvi *.log *~

.PHONY: clean all
