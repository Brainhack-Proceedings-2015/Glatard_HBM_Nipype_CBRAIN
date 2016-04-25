all: brainhack-report-formatted.tex architecture.pdf
	pdflatex brainhack-report-formatted.tex
	bibtex brainhack-report-formatted
	pdflatex brainhack-report-formatted.tex
	pdflatex brainhack-report-formatted.tex
	texcount brainhack-report-formatted.tex

brainhack-report-formatted.tex: brainhack-report-template.tex brainhack-report.bib brainhack-report.md
	pandoc -s -S -N --template brainhack-report-template.tex brainhack-report.md -o brainhack-report-formatted.tex

architecture.pdf: architecture.svg
	inkscape -D -z --file=architecture.svg --export-pdf=architecture.pdf --export-latex
	
clean:
	rm *.aux *.bbl *.log *.blg *.out
