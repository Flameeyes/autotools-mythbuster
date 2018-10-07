<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" />
  <xsl:param name="defines-uri" required="yes"/>

  <xsl:template match="* | @*">
  <xsl:copy><xsl:copy-of select="@*"/><xsl:apply-templates/></xsl:copy>
  </xsl:template>

  <xsl:template match="ifdef">
    <xsl:variable name="contents" select="child::node()"/>
    <xsl:variable name="defines" select="document($defines-uri)/defines"/>
    <xsl:variable name="val" select="@select"/>

    <xsl:for-each select="$defines">
      <xsl:if test="def=$val">
        <xsl:apply-templates select="$contents"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
