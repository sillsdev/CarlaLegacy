<?xml version="1.0" encoding="UTF-8"?>
<!-- XSLT stylesheet to convert PAWS Starter Kit XML file to a Typology Example file -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" version="1.0" encoding="iso-8859-1"  indent="yes"/>
<xsl:param name="prmIdTitle">Typology</xsl:param>
<xsl:param name="prmTextSFM">\t</xsl:param>

<xsl:template match="/">\id PAWS Starter Kit <xsl:value-of select="$prmIdTitle"/> Examples
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:choose>
	<xsl:when test="$prmIdTitle='QP'">
		<xsl:value-of select="//qp/degreeExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//qp/cardinalCompoundExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='AdvP'">
		<xsl:value-of select="//advp/temporalExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//advp/locativeExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//advp/mannerExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='AdjP'">
		<xsl:value-of select="//adjp/example"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='NP'">
		<xsl:value-of select="//qp/example"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//qp/negExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//qp/negCooccurExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//qp/determinerNPExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//qp/determinerNegNPExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//qp/ordinalExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//np/example"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//np/embeddedExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//np/qpExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//np/adjpExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//np/partExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//np/compExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//np/partHeadExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
		<xsl:when test="$prmIdTitle='Prop'">
		<xsl:value-of select="//prop/example"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='Pron'">
			<xsl:value-of select="//pron/reflExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pron/recipExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pron/possExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pron/indefNPExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pron/indefExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pron/negIndefNPExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pron/negIndefExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pron/standAloneNPExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='PP'">
		<xsl:value-of select="//pp/example"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//np/ppExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//np/compPPExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pron/partitiveExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pp/ppExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pp/locExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pp/compPPExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//prop/ppExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='IP'">
		<xsl:value-of select="//ip/example"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//np/partHeadSentExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pp/sentExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pp/aloneExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//ip/proDropExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//ip/auxExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//ip/auxNonfiniteExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//ip/auxOtherExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//ip/example"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//ip/diExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//ip/intransExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//ip/motionExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//ip/copularExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//ip/passiveExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//ip/proDropExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pron/reflSentExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pron/recipSentExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//typology/example"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='Comp'">
		<xsl:value-of select="//comp/finiteExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//comp/finiteOrNonfiniteExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//comp/DPCPExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//comp/nonfiniteExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//nonfiniteProDropExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//comp/nonfiniteCPOrProDropExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//otherExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='Q'">
		<xsl:value-of select="//q/example"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//q/embYNExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//q/contentExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//q/embContentExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pp/aloneExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='RelCl'">
		<xsl:value-of select="//relcl/sentExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//relcl/headlessExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//np/relClExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//pron/pronRelClExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//prop/relClExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='AdvCl'">
		<xsl:value-of select="//advcl/tempSentExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//advp/reasonExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='Neg'">
		<xsl:value-of select="//neg/degreeSubjExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//neg/determinerSubjExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//neg/pronounSubjExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//neg/advTemporalExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//neg/advLocativeExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//neg/auxExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//neg/auxAffixExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//neg/verbAffixExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//neg/objectExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//neg/indirectObjectExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//neg/subjectObjectExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='Coord'">
		<xsl:value-of select="//coord/sentExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//coord/vpExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//coord/dpExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//coord/adjExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='Focus'">
		<xsl:value-of select="//focus/topicExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//focus/focusExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
	<xsl:when test="$prmIdTitle='Excl'">
		<xsl:value-of select="//excl/greetExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//excl/intjExample"/><xsl:text>&#xa;</xsl:text>
<xsl:value-of select="$prmTextSFM"/><xsl:text>&#x20;</xsl:text> <xsl:value-of select="//excl/exclExample"/><xsl:text>&#xa;</xsl:text>
		</xsl:when>
</xsl:choose>
</xsl:template>
</xsl:stylesheet>
