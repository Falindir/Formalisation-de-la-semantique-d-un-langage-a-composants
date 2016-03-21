all: comp

comp: bib
	pdflatex rapport.tex
	pdflatex rapport.tex
	pdflatex rapport.tex

bib:
	pdflatex rapport.tex
	bibtex rapport.aux

clean:
	rm -f *~
	rm -f *.bbl *.blg *.log *.toc *.aux
