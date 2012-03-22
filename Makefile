presentation: 
	rm -f *.aux *.log *.nav *.snm *.toc
	xelatex presentation/presentation.tex

clean:
	cabal clean
	rm -f *.aux *.log *.nav *.snm *.toc *.out *.vrb

.PHONY: presentation