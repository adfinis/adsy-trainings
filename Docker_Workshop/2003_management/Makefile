SOURCES = $(wildcard *.md)
SLIDES  = $(SOURCES:.md=.html)

.PHONY: all clean

all: $(SLIDES)

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
	-rm -f *.html
