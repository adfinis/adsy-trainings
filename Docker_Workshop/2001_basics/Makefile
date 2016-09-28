SOURCES = $(wildcard *.md)
SLIDES  = $(SOURCES:.md=.html)

all: $(SLIDES)

%.html: %.md
	@echo "building $@ from $<" && \
	pandoc \
	--to revealjs \
	--template ../common/revealjs-template.pandoc \
	--standalone \
	--section-divs \
	$< \
	-o $@
