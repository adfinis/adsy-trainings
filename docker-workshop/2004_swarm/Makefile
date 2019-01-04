SOURCES = $(wildcard *.md)
SLIDES  = $(SOURCES:.md=.html)
PDFS  = $(SOURCES:.md=.pdf)

.PHONY: all clean

all: $(SLIDES) $(PDFS)

%.pdf: %.md
	@echo "building $@ from $<" && \
	pandoc \
	--to beamer \
	$< \
	-o $@

%.html: %.md
	@echo "building $@ from $<" && \
	pandoc \
	--to revealjs \
	--template ../common/revealjs-template.pandoc \
	--standalone \
	--section-divs \
	--no-highlight \
	$< \
	-o $@

clean:
	-rm -f *.html *.pdf
