<?xml version="1.0"?>
<xsl:stylesheet
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:docbook="http://docbook.org/ns/docbook"
     version="1.0">

<xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/xhtml/chunktoc.xsl"/>

<xsl:template name="user.head.content">
  <link rel="stylesheet" type="text/css" href="http://www.flameeyes.eu/autotools-mythbuster/stylesheets/flameeyes.css" />
</xsl:template>

<xsl:template name="user.header.content">
  <div id="footads">
    <script type="text/javascript" src="http://www.flameeyes.eu/autotools-mythbuster/scripts/footads.js">
      <xsl:text> </xsl:text>
    </script>
    <script type="text/javascript"
	    src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      <xsl:text> </xsl:text>
    </script>
  </div>
</xsl:template>

<xsl:template name="user.footer.navigation">
  <div id="licensing">
    <a rel="license"
    href="http://creativecommons.org/licenses/by-nc-sa/3.0/">
      <img id="cc-by-nc-sa"
	  alt="Creative Commons License"
	  src="http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png"
	  />
    </a>

    <p>
      <span xmlns:dc="http://purl.org/dc/elements/1.1/"
      href="http://purl.org/dc/dcmitype/Text" property="dc:title"
      rel="dc:type">Autotools Muthbuster</span> by <a
      xmlns:cc="http://creativecommons.org/ns#"
      href="http://www.flameeyes.eu/autotools-mythbuster/"
      property="cc:attributionName" rel="cc:attributionURL">Diego Elio
      Pettenò</a> is licensed under a <a rel="license"
      href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Creative
      Commons Attribution-Noncommercial-Share Alike 3.0 Unported
      License</a>.
    </p>

    <p>
      Based on a work at <a
      xmlns:dc="http://purl.org/dc/elements/1.1/"
      href="http://www.flameeyes.eu/autotools-mythbuster/"
      rel="dc:source">www.flameeyes.eu</a>.
    </p>
  </div>
</xsl:template>

</xsl:stylesheet>