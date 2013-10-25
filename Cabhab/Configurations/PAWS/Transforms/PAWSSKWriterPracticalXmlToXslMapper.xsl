<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="PAWSSKWriterXmlToXslMapperCommon.xsl"/>
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!--
================================================================
Convert writer description xml file portion to an xslt to help perform the creation of an
 XLINGPAP xml file based on PAWS answers xml file
  Input:    xml file conforming to PAWSSKWriterDescription.dtd and parameter telling which type this is
  Output: XSL file 
================================================================
Revision History is at the end of this file.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Preamble
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -->
   <xsl:variable name="sLangNameCode" select="'en'"/>
    <!--
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        HandleGlossInfoInInterlinear
        routine to deal with gloss information
        Parameters: none
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -->
    <xsl:template name="HandleGlossInfoInInterlinear">
            <xsl:element name="xsl:call-template">
                <xsl:attribute name="name">
                    <xsl:text>DoWordGloss</xsl:text>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="xsl:call-template">
                <xsl:attribute name="name">
                    <xsl:text>DoMorphemeGloss</xsl:text>
                </xsl:attribute>
            </xsl:element>
        </xsl:template>
</xsl:stylesheet>
