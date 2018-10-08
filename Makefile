XSLTPROC = xsltproc

XSL-NS-SS = http://docbook.sourceforge.net/release/xsl-ns/current/

SOURCES := main.docbook $(shell find . -type f -name '*.xmli') $(shell find examples -type f)

all: public/index.html public/stylesheets/mythbuster.css

public/index.html: $(SOURCES) stylesheets/flameeyes.eu.xsl
	$(XSLTPROC) \
		--xinclude \
		--stringparam base.dir public/ \
		--stringparam section.autolabel 1 \
		--stringparam chunk.section.depth 1 \
		--stringparam chunk.first.sections 1 \
		--stringparam collect.xref.targets "yes" \
		--stringparam toc.section.depth 1 \
		--stringparam targets.filename "$(patsubst %.xhtml,%.olinkdb,$@)" \
		--stringparam html.stylesheet stylesheets/mythbuster.css \
		--stringparam suppress.navigation 1 \
		stylesheets/flameeyes.eu.xsl \
		$<

public/stylesheets/mythbuster.css: stylesheets/mythbuster.scss
	mkdir -p $(dir $@)
	scss -t compressed --sourcemap=none $< $@

mythbuster-v3.epub: epub/mimetype
	cd epub && zip -r -X ../$@ mimetype \
		&& zip -u -r -X ../$@ META-INF OEBPS

epub/mimetype: $(SOURCES)
	rm -rf epub
	xsltproc \
		--xinclude \
		--stringparam base.dir epub/OEBPS/ \
		$(XSL-NS-SS)/epub3/chunk.xsl \
		$< >/dev/null

mythbuster.epub: $(SOURCES)
	dbtoepub-ns $< -o $@

# Pandoc v1.x *must* have '--latex-engine' while v2.x *must* have '--pdf-engine'.
# Test relies on pandoc v2.x printing an error to stderr (which we redirect to stdout),
# and on $(if) testing True when $(shell) returns non-empty string.
PANDOC_LATEX := $(if $(shell pandoc --latex-engine=xelatex </dev/null 2>&1), \
	--pdf-engine, \
	--latex-engine)

mythbuster.pdf: stylesheets/passthrough.xsl main.docbook
	$(XSLTPROC) --xinclude $^ \
		| pandoc $(PANDOC_LATEX)=xelatex -s -f docbook -o $@

clean:
	rm -rf *~ *.olinkdb public epub mythbuster.epub mythbuster-v3.epub mythbuster.pdf

.PHONY: clean
