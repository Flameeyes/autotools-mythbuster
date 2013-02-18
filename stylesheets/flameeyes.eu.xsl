<?xml version="1.0"?>
<xsl:stylesheet
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:d="http://docbook.org/ns/docbook"
     xmlns="http://www.w3.org/1999/xhtml"
     exclude-result-prefixes="d"
     version="1.0">

<xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/xhtml/chunk.xsl"/>

<xsl:template name="user.head.content">
  <meta name="description" content="A no-nonsense guide to Autotools by Diego Elio Pettenò" />
  <meta name="keywords" content="autoconf, automake, libtool, gnu, build system, pkg-config, pkgconfig" />
  <link rel="author" href="https://plus.google.com/111148791763071482364?rel=author" />

  <script type="text/javascript"><![CDATA[
    (function() {
    var s = document.createElement('script');
    var t = document.getElementsByTagName('script')[0];

    s.type = 'text/javascript';
    s.async = true;
    s.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
      '//api.flattr.com/js/0.6/load.js?mode=auto';

    t.parentNode.insertBefore(s, t);
    })();
]]></script>
</xsl:template>

<xsl:template name="user.header.navigation">
  <xsl:param name="prev" select="/d:foo"/>
  <xsl:param name="next" select="/d:foo"/>
  <xsl:param name="nav.context"/>

  <xsl:variable name="home" select="/*[1]"/>

  <div id="header">
    <div class="book-title">
      <a accesskey="h">
        <xsl:attribute name="href">
          <xsl:call-template name="href.target">
            <xsl:with-param name="object" select="$home"/>
          </xsl:call-template>
        </xsl:attribute>
	<xsl:text>Autotools Mythbuster</xsl:text>
      </a>
    </div>

    <div class="adsense">
      <script type="text/javascript">
	<![CDATA[
		 google_ad_client = "ca-pub-8947005214934111";
		 google_ad_slot = "7982249742";
		 google_ad_width = 728;
		 google_ad_height = 90;
	]]>
      </script>
      <script type="text/javascript"
	      src="http://pagead2.googlesyndication.com/pagead/show_ads.js"> </script>
    </div>
  </div>

  <div id="navigation">
    <xsl:if test="count($prev)&gt;0">
      <div class="left">
	<a accesskey="p" class="left">
          <xsl:attribute name="href">
            <xsl:call-template name="href.target">
              <xsl:with-param name="object" select="$prev"/>
            </xsl:call-template>
          </xsl:attribute>
	  <xsl:attribute name="title">
            <xsl:apply-templates select="$prev" mode="object.title.markup.textonly"/>
	  </xsl:attribute>
          <xsl:call-template name="navig.content">
            <xsl:with-param name="direction" select="'prev'"/>
          </xsl:call-template>
	</a>
      </div>
    </xsl:if>

    <xsl:if test="count($next)&gt;0">
      <div class="right">
	<a accesskey="n">
          <xsl:attribute name="href">
            <xsl:call-template name="href.target">
              <xsl:with-param name="object" select="$next"/>
            </xsl:call-template>
          </xsl:attribute>
	  <xsl:attribute name="title">
            <xsl:apply-templates select="$next" mode="object.title.markup.textonly"/>
	  </xsl:attribute>
          <xsl:call-template name="navig.content">
            <xsl:with-param name="direction" select="'next'"/>
          </xsl:call-template>
	</a>
      </div>
    </xsl:if>
  </div>
</xsl:template>

<xsl:template name="user.footer.navigation">
  <div id="footer">
    <div id="flattr">
      <a class="FlattrButton"
	 href="http://www.flameeyes.eu/autotools-mythbuster/"
	 title="Autotools Mythbuster"
	 lang="en"> </a>
    </div>

    <p>
      Autotools Mythbuster by <a href="mailto:flameeyes@flameeyes.eu">Diego
      Elio Pettenò</a>.
    </p>
    <p>
      Licensed under a <a
      href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Creative
      Commons Attribution-Noncommercial-Share Alike 3.0 Unported
      License</a>.
    </p>

    <p>
      Based on a work at <a
      href="http://www.flameeyes.eu/autotools-mythbuster/">www.flameeyes.eu</a>.
    </p>
  </div>
</xsl:template>

<xsl:template match="d:section[@role = 'notoc']" mode="toc" />

</xsl:stylesheet>
