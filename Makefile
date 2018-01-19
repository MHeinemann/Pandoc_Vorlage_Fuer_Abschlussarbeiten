BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/source
OUTPUTDIR=$(BASEDIR)/output
TEMPLATEDIR=$(BASEDIR)/templates
STYLEDIR=$(BASEDIR)/style

BIBFILE=$(INPUTDIR)/references.bib
OUTPUTFILE = $(OUTPUTDIR)/hausarbeit.pdf

help:
	@echo ' 																	                                    '
	@echo 'Makefile für Pandoc Markdown Vorlage                                   '
	@echo 'für Seminar-/Bachelor-/Master-/Diplomarbeiten                          '
	@echo ' 																	                                    '
	@echo 'Autor: Michael Heinemann 																	            '
	@echo ' 																	                                    '
	@echo 'Usage:                                                                 '
	@echo '   make pdf                         generate a PDF file  			  '
	@echo '                                                                       '
	@echo ' 																	  																	'

pdf:
	pandoc "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTFILE)" \
	-H "$(STYLEDIR)/preamble.tex" \
	--template="$(TEMPLATEDIR)/default.tex" \
	--include-before="$(INPUTDIR)/00_titlepage.tex" \
	--include-after="$(INPUTDIR)/98_appendix.tex" \
	--include-after-body="$(INPUTDIR)/99_eidesstaatliche.tex" \
	--bibliography="$(BIBFILE)" 2>pandoc.log \
	--csl="$(STYLEDIR)/deutsche-gesellschaft-fur-psychologie.csl" \
	--highlight-style=pygments \
	--listings \
	--metadata link-citations=true \
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
