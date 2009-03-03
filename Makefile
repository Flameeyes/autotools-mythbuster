XSLTPROC = xsltproc

XSL-NS-SS = http://docbook.sourceforge.net/release/xsl-ns/current/

index.xhtml: main.docbook
	$(XSLTPROC) \
		--xinclude \
		--stringparam section.autolabel 1 \
		--stringparam chunk.section.depth 0 \
		--stringparam collect.xref.targets "yes" \
		--stringparam targets.filename "$(patsubst %.xhtml,%.olinkdb,$@)" \
		$(XSL-NS-SS)/xhtml-1_1/chunk.xsl \
		$<

clean:
	rm -f *~ *.html

