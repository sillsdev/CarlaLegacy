<?xml version="1.0" encoding="UTF-8"?>
<!-- XSLT stylesheet to convert PAWS Starter Kit XML file to a Typology Example file -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" version="1.0" encoding="iso-8859-1"  indent="yes"/>
<xsl:param name="prmIdTitle">Typology</xsl:param>
<xsl:param name="prmTextSFM">\t</xsl:param>

<xsl:template match="/">\id PAWS Starter Kit <xsl:value-of select="$prmIdTitle"/> Examples
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:choose>
	<xsl:when test="$prmIdTitle='Typology'">
		<xsl:value-of select="//typology/example"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='QP'">
		<xsl:value-of select="//qp/degreeExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//qp/cardinalExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//qp/cardinalCompoundExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//qp/ordinalExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='AdvP'">
		<xsl:value-of select="//advp/temporalExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//advp/locativeExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//advp/mannerExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//advp/reasonExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='AdjP'">
		<xsl:value-of select="//adjp/example"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='NP'">
		<xsl:value-of select="//qp/example"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//np/example"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//np/embeddedExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//np/qpExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//np/adjpExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//np/compExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pron/indefNPExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='PP'">
		<xsl:value-of select="//pp/example"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//np/ppExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//np/compPPExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pron/ppExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pron/partitiveExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pp/example"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pp/ppExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pp/locExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
		<xsl:when test="$prmIdTitle='Prop'">
		<xsl:value-of select="//prop/example"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//prop/ppExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//prop/relClExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//prop/propAnimateCategory"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//prop/propInanimateCategory"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='Pron'">
			<xsl:value-of select="//pron/reflExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pron/recipExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pron/possExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pron/indefNPExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pron/indefExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pron/standAloneNPExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pron/partitiveExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pron/pronRelClExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='IP'">
		<xsl:value-of select="//ip/example"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pp/sentExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//ip/auxExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//ip/proDropExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//ip/diExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//ip/intransExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//ip/copularExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//ip/passiveExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='Q'">
		<xsl:value-of select="//q/example"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//q/embYNExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//q/contentExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//q/embContentExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='Focus'">
		<xsl:value-of select="//focus/example"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='Neg'">
		<xsl:value-of select="//neg/example"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='Comp'">
		<xsl:value-of select="//comp/example"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='AdvCl'">
		<xsl:value-of select="//advcl/example"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='RelCl'">
		<xsl:value-of select="//relcl/example"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//np/relClExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pron/relClExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text> </xsl:text> <xsl:value-of select="//pron/pronRelClExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='FullNp'">
		<xsl:value-of select="//fullnp/example"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='Coord'">
		<xsl:value-of select="//coord/example"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
</xsl:choose>
</xsl:template>
</xsl:stylesheet>
