# SPDX-FileCopyrightText: 2009- Diego Elio Pettenò
#
# SPDX-License-Identifier: CC-BY-SA-3.0

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
	sassc -t compressed -M $< $@

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

clean:
	rm -rf *~ *.olinkdb public epub mythbuster.epub mythbuster-v3.epub

.PHONY: clean
