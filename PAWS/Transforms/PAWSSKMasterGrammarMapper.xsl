<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
	<xsl:text>|PC-PATR Grammar file for PAWS Starter Kit
| C Black    July 2002 non-binary features for agr, case only - not infl
| case and animate back under agr
| DP structure redone, especially Art/Dem, mass distinction, possessors
| added poss_suffix, poss_prefix rather than requiring split off
| number marking languages don't default to singular, then separate PSRs not needed
| additional feature templates added; prefix/suffix grouped

|------------------------------------------------------------------------------
|-Phrase structure rules
</xsl:text>
	<xsl:apply-templates select="/" mode="templates"/>
	<xsl:apply-templates select="/" mode="adjp"/>
	<xsl:apply-templates select="/" mode="advp"/>
<!--    <xsl:apply-templates select="/" mode="np"/> -->
	<xsl:apply-templates select="/" mode="qp"/>
  </xsl:template>
  <xsl:include href="starter6templates.xsl"/>
  <xsl:include href="starter6adjp.xsl"/>
  <xsl:include href="starter6advp.xsl"/>
  <xsl:include href="starter6qp.xsl"/>
<!--   <xsl:include href="starter6np.xsl"/> -->
</xsl:stylesheet>
