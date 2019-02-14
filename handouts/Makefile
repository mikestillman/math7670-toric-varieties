all: hw2.pdf

#all: course-info.pdf hw1.pdf

course-info.pdf: course-info.tex
	pdflatex course-info.tex
	open course-info.pdf

hw1.pdf: hw1.tex
	pdflatex hw1.tex
	open hw1.pdf

hw2.pdf: hw2.tex
	pdflatex hw2.tex
	open hw2.pdf

clean:
	rm -rf *.aux *.log

dist-clean: clean
	rm -rf hw1.pdf course-info.pdf
