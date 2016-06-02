FILE := main
OUT  := build

pdf:
	# Also see .latexmkrc
	latexmk -outdir=$(OUT) -pdf $(FILE)

pandoc:
	pandoc \
		--filter pandoc-citeproc  \
		--filter pandoc-citeproc-preamble \
		-M citeproc-preamble=pages/bibliography_preamble.tex \
		--template pandoc.tex
		-o $(OUT)/$(FILE).pdf \	# Out
		chapters/*.md			# In

clean:
	rm -rf $(filter-out $(OUT)/$(FILE).pdf, $(wildcard $(OUT)/*))

purge:
	rm -rf $(OUT)

.PHONY: latexmk clean purge
