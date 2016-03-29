<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:text>Extracted interlinear examples from PAWS grammar
        </xsl:text>
        
        <xsl:apply-templates select="//*[contains(name(),'Example') or name()='example']" mode="interlinear"/>
    </xsl:template>
    
    <xsl:template match="*" mode="interlinear">
        <xsl:if test="string-length(normalize-space(.)) &gt; 0">
            <xsl:text>&#xa;</xsl:text>
            <xsl:value-of select="name(..)"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:text>&#xa;</xsl:text>
            <xsl:apply-templates/>
        </xsl:if>
    </xsl:template>
    
    
</xsl:stylesheet>
