all: pkubanek.pdf

#LBT.eps: LBT.jpg
#	convert $< eps2:$@

DOTFILES:= 

pkubanek.pdf: pkubanek.tex $(DOTFILES)
	pdflatex $<
	pdflatex $<

%.pdf: %.dot
	dot -Tpdf -o$@ $?

zip: pkubanek.pdf
	tar -cvjf pkubanek.tar.bz2 --xform "s#^#pkubanek/#" pkubanek.pdf Makefile pkubanek.tex $(DOTFILES) rmaa.cls

clean:
	$(RM) pkubanek.pdf $(DOTFILES)
