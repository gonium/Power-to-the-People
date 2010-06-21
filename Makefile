pdflatex=pdflatex
bibtex=bibtex

SRC=main.tex 
SRC_ADDITIONAL=frontpage.tex einleitung.tex demandside.tex \
			   umsetzung.tex
			   #ch03/ch03.tex ch04/ch04.tex ch05/ch05.tex bib/bib.tex
BIB=main.bib
AUX=$(SRC:.tex=.aux)
PDF=$(SRC:.tex=.pdf)

default: all

all: pdf

pdf: $(PDF)

$(PDF): $(SRC) $(SRC_ADDITIONAL) $(BIB)
	-rm -f $(AUX)
	$(pdflatex) $<
	$(bibtex) $(AUX)
	$(pdflatex) $<
	$(pdflatex) $<

clean:
	-rm -f *~
	-rm -f $(PDF)
	-rm -f $(AUX)
	-rm -f *.log
	-rm -f *.bbl
	-rm -f *.out
	-rm -f *.blg

.PHONY: default all clean

