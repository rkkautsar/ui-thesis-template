# Tools
LATEXMK = latexmk
RM = rm -fr	

# Project-specific settings
DOCNAME = thesis

# Targets
all: doc
doc: pdf
pdf: $(DOCNAME).pdf

# Rules
%.pdf: %.tex
	$(LATEXMK) -synctex=1 -pdf -shell-escape -outdir=out -file-line-error $*

mostlyclean:
	$(LATEXMK) -silent -outdir=out -c
	$(RM) *.bbl

clean: mostlyclean
	$(LATEXMK) -silent -outdir=out -C
	$(RM) *.run.xml *.synctex.gz
	$(RM) *.d
	$(RM) out

.PHONY: all clean doc mostlyclean pdf

# Include auto-generated dependencies
-include *.d
