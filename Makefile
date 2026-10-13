.PHONY: pdf preview

pdf:
	latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex

preview: pdf
	cp main.pdf preview/main.pdf
