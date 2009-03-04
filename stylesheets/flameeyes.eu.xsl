<?xml version="1.0"?>
<xsl:stylesheet 
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:docbook="http://docbook.org/ns/docbook"
     version="1.0">

<xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/xhtml-1_1/chunk.xsl"/>

<xsl:template name="user.head.content">
  <link rel="stylesheet" type="text/css" href="stylesheets/flameeyes.css" />
</xsl:template>

<xsl:template name="user.footer.content">
  <div id="footads">
    <script type="text/javascript" src="scripts/footads.js">
      <xsl:text> </xsl:text>
    </script>
    <script type="text/javascript"
	    src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      <xsl:text> </xsl:text>
    </script>
  </div>
</xsl:template>

</xsl:stylesheet>
