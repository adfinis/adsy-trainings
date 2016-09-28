SOURCES = $(wildcard *.md)
SLIDES  = $(SOURCES:.md=.html)

$(SLIDES): $(SOURCES)
	@pandoc \
	--to revealjs \
	--template ../common/revealjs-template.pandoc \
	--standalone \
	--section-divs \
	$< \
	-o $@
