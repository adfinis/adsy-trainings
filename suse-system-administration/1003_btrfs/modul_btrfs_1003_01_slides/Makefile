SOURCES = $(wildcard *.md)
SLIDES  = $(SOURCES:.md=.html)
PDFS  = $(SOURCES:.md=.pdf)
TMP_PDFS = $(wildcard tmp-slides-*.pdf)
DEST = builds/

PANDOCCMD=pandoc --to revealjs --template ../common/revealjs-template.pandoc --standalone --section-divs --no-highlight
PHANTOMCMD=../../phantomjs/bin/phantomjs ../common/phantomjs-revealjs-slide-capture.js
GSCMD=gs -q -dPDFSETTINGS=/printer -dNOPAUSE -dBATCH -sDEVICE=pdfwrite

.PHONY: all clean

all: $(SLIDES) $(PDFS)

%.pdf: %.html
	@echo "building $@ from $<" && \
	$(PHANTOMCMD) $< && \
	$(GSCMD) -sOutputFile=$(DEST)$@ $$(ls tmp-slide-*.pdf) && \
	rm -f $$(ls tmp-slide-*.pdf)
	mv *.html $(DEST)


%.html: %.md
	@echo "building $@ from $<" && \
	$(PANDOCCMD) $< -o $@

clean:
	-rm -f *.html *.pdf
