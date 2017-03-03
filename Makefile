BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/source
OUTPUTDIR=$(BASEDIR)/output
TEMPLATEDIR=$(BASEDIR)/templates
STYLEDIR=$(BASEDIR)/style

BIBFILE=$(INPUTDIR)/PBL.bib
OUTPUTFILE = $(OUTPUTDIR)/hausarbeit.pdf

help:
	@echo ' 																	  '
	@echo 'Makefile for the Markdown thesis                                       '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make pdf                         generate a PDF file  			  '
	@echo '                                                                       '
	@echo ' 																	  '
	@echo ' 																	  '
	@echo 'get local templates with: pandoc -D latex/html/etc	  				  '
	@echo 'or generic ones from: https://github.com/jgm/pandoc-templates		  '
	@echo '                                                                       '

pdf:
	pandoc "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTFILE)" \
	-H "$(STYLEDIR)/preamble.tex" \
	--template="$(TEMPLATEDIR)/default.tex" \
	--include-before="$(INPUTDIR)/titlepage.tex" \
	--include-after="$(INPUTDIR)/eiderkl.tex" \
	--bibliography="$(BIBFILE)" 2>pandoc.log \
	--csl="$(STYLEDIR)/deutsche-gesellschaft-fur-psychologie.csl" \
	--highlight-style=pygments \
	--listings \
	-V lang=de-DE \
	-V papersize=A4 \
	-V fontsize=12pt \
	-V mainfont=LiberationSerif \
	-V sansfont=LiberationSans \
	-V monofont=LiberationMono \
	-V linestretch=1.5 \
	-N \
	--latex-engine=xelatex \
	--normalize

.PHONY: help pdf
