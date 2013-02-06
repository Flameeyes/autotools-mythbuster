XSLTPROC = xsltproc

XSL-NS-SS = http://docbook.sourceforge.net/release/xsl-ns/current/

SOURCES := main.docbook $(shell find . -type f -name '*.xmli') $(shell find examples -type f)

all: public/index.html public/stylesheets/mythbuster.css

public/index.html: $(SOURCES) stylesheets/mythbuster.xsl
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
		stylesheets/mythbuster.xsl \
		$<

public/stylesheets/mythbuster.css: stylesheets/mythbuster.scss
	mkdir -p $(dir $@)
	scss -t compressed $< $@

clean:
	rm -f *~ *.olinkdb
	find public -name '*.html' -delete

.PHONY: clean
