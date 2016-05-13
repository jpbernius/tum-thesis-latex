FILE := main
OUT  := build

pdf:
	# Also see .latexmkrc
	latexmk -outdir=$(OUT) -pdf $(FILE)

pandoc:
	pandoc --filter pandoc-citeproc -o $(OUT)/$(FILE).pdf --template pandoc.tex chapters/*.md

clean:
	rm -rf $(filter-out $(OUT)/$(FILE).pdf, $(wildcard $(OUT)/*))

purge:
	rm -rf $(OUT)

.PHONY: latexmk clean purge
