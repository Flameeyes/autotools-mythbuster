XSLTPROC = xsltproc

XSL-NS-SS = http://docbook.sourceforge.net/release/xsl-ns/current/

index.xhtml: main.docbook
	$(XSLTPROC) \
		--xinclude \
		--stringparam section.autolabel 1 \
		--stringparam chunk.section.depth 0 \
		--stringparam use.id.as.filename 1 \
		--stringparam collect.xref.targets "yes" \
		--stringparam targets.filename "$(patsubst %.xhtml,%.olinkdb,$@)" \
		stylesheets/flameeyes.eu.xsl \
		$<

clean:
	rm -f *~ *.html *.olinkdb
