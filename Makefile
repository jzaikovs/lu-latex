BASE=main

default: all clean

all: 
	rm -f ./out/${BASE}.pdf
	xelatex --no-pdf --interaction=nonstopmode ${BASE}
	bibtex ${BASE}
	makeglossaries ${BASE}
	xelatex --no-pdf --interaction=nonstopmode ${BASE}
	makeglossaries ${BASE}
	xelatex --interaction=nonstopmode ${BASE}

clean:
	rm -f *.acn *.acr *.alg *.aux *.bbl *.blg *.dvi *.fdb_latexmk *.glg *.glo *.gls *.idx *.ilg *.ind *.ist *.lof *.log *.lot *.maf *.mtc *.mtc0 *.nav *.nlo *.out *.pdfsync *.ps *.snm *.synctex.gz *.toc *.vrb *.xdy *.tdo *.xdv
	mkdir -p ./out/
	mv $(BASE).pdf ./out/
