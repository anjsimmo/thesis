thesis: thesis.pdf
chap1: thesis-chap1.pdf
chap2: thesis-chap2.pdf
chap3: thesis-chap3.pdf
chap4: thesis-chap4.pdf
chap5: thesis-chap5.pdf
chap6: thesis-chap6.pdf
chap7: thesis-chap7.pdf
chap8: thesis-chap8.pdf
chaps: thesis.pdf thesis-chap1.pdf thesis-chap2.pdf thesis-chap3.pdf thesis-chap4.pdf thesis-chap5.pdf thesis-chap6.pdf thesis-chap7.pdf thesis-chap8.pdf

# just one run of latex to update
fast:
	echo "\\\\chrefsfalse" > thesis-includes.tex
	pdflatex thesis

thesis.pdf: *.tex *.bib figs/*.pdf figs/*.png
	echo "Rebuilding thesis"
	# Need to escape the backslash, as Dash shell built-in echo command treats \c as instruction to print no further output
	# Even with double backslash, was still dropping output, so seems to need to be double escaped.
	echo "\\\\chrefsfalse" > thesis-includes.tex
	pdflatex thesis
	biber thesis
	pdflatex thesis
	pdflatex thesis

thesis-chap1.pdf: *.tex *.bib figs/*.pdf figs/*.png
	echo "Building Chap1"
	cp -p thesis.pdf thesis-tmp.pdf
	echo "\includeonly{010}" > thesis-includes.tex
	pdflatex thesis
	biber thesis
	pdflatex thesis
	pdflatex thesis
	mv thesis.pdf thesis-chap1.pdf
	cp -p thesis-tmp.pdf thesis.pdf

thesis-chap2.pdf: *.tex *.bib figs/*.pdf figs/*.png
	echo "Building Chap2"
	cp -p thesis.pdf thesis-tmp.pdf
	echo "\includeonly{020, 102-glossary}" > thesis-includes.tex
	pdflatex thesis
	biber thesis
	pdflatex thesis
	pdflatex thesis
	mv thesis.pdf thesis-chap2.pdf
	cp -p thesis-tmp.pdf thesis.pdf

thesis-chap3.pdf: *.tex *.bib figs/*.pdf figs/*.png
	echo "Building Chap3"
	cp -p thesis.pdf thesis-tmp.pdf
	echo "\includeonly{030, appendix0-model}" > thesis-includes.tex
	pdflatex thesis
	biber thesis
	pdflatex thesis
	pdflatex thesis
	mv thesis.pdf thesis-chap3.pdf
	cp -p thesis-tmp.pdf thesis.pdf

thesis-chap4.pdf: *.tex *.bib figs/*.pdf figs/*.png
	echo "Building Chap4"
	cp -p thesis.pdf thesis-tmp.pdf
	echo "\includeonly{040, appendix1-prov}" > thesis-includes.tex
	pdflatex thesis
	biber thesis
	pdflatex thesis
	pdflatex thesis
	mv thesis.pdf thesis-chap4.pdf
	cp -p thesis-tmp.pdf thesis.pdf

thesis-chap5.pdf: *.tex *.bib figs/*.pdf figs/*.png
	echo "Building Chap5"
	cp -p thesis.pdf thesis-tmp.pdf
	echo "\includeonly{050, appendix2-deidentification}" > thesis-includes.tex
	pdflatex thesis
	biber thesis
	pdflatex thesis
	pdflatex thesis
	mv thesis.pdf thesis-chap5.pdf
	cp -p thesis-tmp.pdf thesis.pdf

thesis-chap6.pdf: *.tex *.bib figs/*.pdf figs/*.png
	echo "Building Chap6"
	cp -p thesis.pdf thesis-tmp.pdf
	echo "\includeonly{060}" > thesis-includes.tex
	pdflatex thesis
	biber thesis
	pdflatex thesis
	pdflatex thesis
	mv thesis.pdf thesis-chap6.pdf
	cp -p thesis-tmp.pdf thesis.pdf

thesis-chap7.pdf: *.tex *.bib figs/*.pdf figs/*.png
	echo "Building Chap7"
	cp -p thesis.pdf thesis-tmp.pdf
	echo "\includeonly{070, appendix3-spatiotemporal}" > thesis-includes.tex
	pdflatex thesis
	biber thesis
	pdflatex thesis
	pdflatex thesis
	mv thesis.pdf thesis-chap7.pdf
	cp -p thesis-tmp.pdf thesis.pdf

thesis-chap8.pdf: *.tex *.bib figs/*.pdf figs/*.png
	echo "Building Chap8"
	cp -p thesis.pdf thesis-tmp.pdf
	echo "\includeonly{080}" > thesis-includes.tex
	pdflatex thesis
	biber thesis
	pdflatex thesis
	pdflatex thesis
	mv thesis.pdf thesis-chap8.pdf
	cp -p thesis-tmp.pdf thesis.pdf

clean:
	-rm *.aux
	-rm *.bbl
	-rm *.blg
	-rm *.log
	-rm *.lof
	-rm *.out
	-rm *.toc
	-rm *.bcf
	-rm *.mtc*
	-rm *.ist
	-rm *.lot
	-rm *.maf
	-rm *.glo
	-rm *.run.xml
	-rm *.acn
	-rm thesis-includes.tex
	-rm thesis.pdf

.PHONY: thesis chap1 chap2 chap3 chap4 chap5 chap6 chap7 chap8 chaps fast clean
