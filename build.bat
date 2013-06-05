@echo off

SET BASE=main
xelatex -shell-escape --no-pdf --interaction=nonstopmode %BASE%
bibtex %BASE%
makeglossaries %BASE%
xelatex -shell-escape --no-pdf --interaction=nonstopmode %BASE%
makeglossaries %BASE%
xelatex -shell-escape --interaction=nonstopmode %BASE%

DEL /F *.acn
DEL /F *.acr
DEL /F *.alg
DEL /F *.aux
DEL /F *.bbl
DEL /F *.blg
DEL /F *.dvi
DEL /F *.fdb_latexmk
DEL /F *.glg
DEL /F *.glo
DEL /F *.gls
DEL /F *.idx
DEL /F *.ilg
DEL /F *.ind
DEL /F *.ist
DEL /F *.lof
DEL /F *.log
DEL /F *.lot
DEL /F *.maf
DEL /F *.mtc
DEL /F *.mtc0
DEL /F *.nav
DEL /F *.nlo
DEL /F *.out
DEL /F *.pdfsync
DEL /F *.ps
DEL /F *.snm
DEL /F *.synctex.gz
DEL /F *.toc
DEL /F *.vrb
DEL /F *.xdy
DEL /F *.tdo

MKDIR out
DEL /F out/%BASE%.pdf
MOVE /Y %BASE%.pdf out/
