<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" doctype-system="XLingPap.dtd"/>
  <!--
================================================================
Convert PAWS answers xml file to an XLingPap xml file
  Input:    xml file conforming to PAWSStarterKit.dtd
  Output: XLingPap xml file
================================================================
Revision History is at the end of this file.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Preamble
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Main template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="/">
  <xsl:processing-instruction name="xml-stylesheet">
  <xsl:text>type="text/xsl" href="c:\fw\ww\XLingPap\XLingPap1.xsl"</xsl:text>
  </xsl:processing-instruction>
<lingPaper css="engWriteUp.css">
	<xsl:apply-templates select="/" mode="x"/>
</lingPaper>
  </xsl:template>
  <xsl:include href="..\XMLWriterDescriptions\XSL Output.xsl"/>
</xsl:stylesheet>
<!--
================================================================
Revision History
- - - - - - - - - - - - - - - - - - -
26-Jul-2002    Andy Black  Initial version
================================================================
 -->
