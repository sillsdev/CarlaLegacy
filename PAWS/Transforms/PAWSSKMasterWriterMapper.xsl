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
	<xsl:variable name="sMasterLetterList">a b c d e f g h i j k l m n o p q r s t u v w x y z aa bb cc dd ee ff gg hh ii jj kk ll mm nn oo pp qq rr ss tt uu vv ww xx yy zz </xsl:variable>
	<!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Main template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
	<xsl:template match="/">
		<xsl:processing-instruction name="xml-stylesheet">
			<xsl:text>type="text/xsl" href="XLingPap1.xsl"</xsl:text>
		</xsl:processing-instruction>
		<lingPaper>
			<frontMatter>
				<title>PAWS-Generated Grammar Write-Up<br/> for <xsl:value-of select="//language/langName"/>
				</title>
				<author>FIRST AUTHOR NAME GOES HERE</author>
				<author>SECOND AUTHOR NAME GOES HERE (if there's only one, delete this)</author>
				<affiliation>AFFILIATION GOES HERE</affiliation>
				<date>DATE GOES HERE</date>
				<contents showLevel="3"/>
				<abstract>
					<p>ABSTRACT GOES HERE</p>
				</abstract>
			</frontMatter>
			<xsl:apply-templates select="/" mode="intro"/>
			<xsl:apply-templates select="/" mode="qp"/>
			<xsl:apply-templates select="/" mode="advp"/>
			<xsl:apply-templates select="/" mode="adjp"/>
			<xsl:apply-templates select="/" mode="np"/>
			<xsl:apply-templates select="/" mode="prop"/>
			<xsl:apply-templates select="/" mode="pron"/>
			<xsl:apply-templates select="/" mode="pp"/>
			<xsl:apply-templates select="/" mode="ip"/>
			<xsl:apply-templates select="/" mode="comp"/>
			<xsl:apply-templates select="/" mode="ques"/>
			<xsl:apply-templates select="/" mode="relcl"/>
			<xsl:apply-templates select="/" mode="advcl"/>
			<xsl:apply-templates select="/" mode="neg"/>
			<xsl:apply-templates select="/" mode="coord"/>
			<xsl:apply-templates select="/" mode="focus"/>
			<xsl:apply-templates select="/" mode="excl"/>
			<backMatter>
				<endnotes/>
				<references/>
			</backMatter>
			<languages>
				<language id="lPAWSSKEnglish" name="PAWSSKEnglish" color="black" font-style="italic"/>
				<language id="lGloss" name="GlossLanguage" color="#446688"/>
				<language name="vernacular">
					<xsl:attribute name="id">
						<xsl:text>lVernacular</xsl:text>
<!-- Now we want to use lVernacular so XXE works well
   <xsl:value-of select="//language/langAbbr"/>-->
					</xsl:attribute>
					<xsl:attribute name="font-family">
						<xsl:value-of select="//language/font/fontName"/>
					</xsl:attribute>
					<xsl:attribute name="font-size">
						<xsl:value-of select="//language/font/fontSize"/>
						<xsl:text>pt</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="color">
						<xsl:value-of select="//language/font/fontColor"/>
					</xsl:attribute>
					<xsl:if test="//language/font/@bold='True'">
						<xsl:attribute name="font-weight">
							<xsl:text>bold</xsl:text>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="//language/font/@italic='True'">
						<xsl:attribute name="font-style">
							<xsl:text>italic</xsl:text>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="//language/font/@under='True' or //language/font/@strike='True'">
						<xsl:attribute name="cssSpecial">
							<xsl:text>text-decoration:</xsl:text>
							<xsl:choose>
								<xsl:when test="//language/font/@under='True'">
									<xsl:text>underline;</xsl:text>
								</xsl:when>
								<xsl:otherwise>line-through;</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="//language/font/@rtl='True'">
						<xsl:attribute name="rtl">
							<xsl:text>yes</xsl:text>
						</xsl:attribute>
					</xsl:if>
				</language>
			</languages>
			<types>
				<type id="tComment" font-weight="bold" color="red"/>
			</types>
		</lingPaper>
	</xsl:template>
	<!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Include other templates
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
	<xsl:include href="WriterIntroAndTypology.xsl"/>
	<xsl:include href="WriterQP.xsl"/>
	<xsl:include href="WriterAdvP.xsl"/>
	<xsl:include href="WriterAdjP.xsl"/>
	<xsl:include href="WriterNP.xsl"/>
	<xsl:include href="WriterProp.xsl"/>
	<xsl:include href="WriterPron.xsl"/>
	<xsl:include href="WriterPP.xsl"/>
	<xsl:include href="WriterIP.xsl"/>
	<xsl:include href="WriterComp.xsl"/>
	<xsl:include href="WriterQues.xsl"/>
	<xsl:include href="WriterRelCl.xsl"/>
	<xsl:include href="WriterAdvCl.xsl"/>
	<xsl:include href="WriterNeg.xsl"/>
	<xsl:include href="WriterCoord.xsl"/>
	<xsl:include href="WriterFocus.xsl"/>
	<xsl:include href="WriterExcl.xsl"/>
	<!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoFree
	routine to create empty free line for interlinear
		Parameters: none
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
	<xsl:template name="DoFree">
		<free>
			<gloss lang="lGloss">ENTER FREE TRANSLATION HERE.</gloss>
		</free>
	</xsl:template>
	<!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoGloss
	routine to create empty gloss line for interlinear
		Parameters: none
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
	<xsl:template name="DoGloss">
		<line>
			<gloss lang="lGloss">ENTER GLOSS HERE</gloss>
		</line>
	</xsl:template>
	<!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
OutputColExamples
	routine to create column examples recursively
		Parameters: sExamples: text of examples
							 iLength: length of example text
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
	<xsl:template name="OutputColExamples">
		<xsl:param name="sExamples"/>
		<xsl:param name="iLength"/>
		<xsl:if test="string-length($sExamples) != 0">
			<xsl:variable name="sBefore" select="substring-before($sExamples, '&#xA;')"/>
			<xsl:variable name="sLine">
				<xsl:choose>
					<xsl:when test="string-length($sBefore) = 0">
						<xsl:value-of select="$sExamples"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$sBefore"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<tr>
				<td>
					<langData>
						<xsl:attribute name="lang">
							<xsl:text>lVernacular</xsl:text>
<!-- Now we want to use lVernacular so XXE works well
   <xsl:value-of select="//language/langAbbr"/>-->
						</xsl:attribute>
						<xsl:value-of select="$sLine"/>
					</langData>
				</td>
			</tr>
			<!-- now recurse -->
			<xsl:call-template name="OutputColExamples">
				<xsl:with-param name="sExamples">
					<xsl:value-of select="substring-after($sExamples,'&#xA;')"/>
				</xsl:with-param>
				<xsl:with-param name="iLength">
					<xsl:value-of select="string-length(substring-after($sExamples,'&#xA;'))"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
OutputInterlinearExamples
	routine to create interlinear examples recursively
		Parameters: sExamples: text of examples
							 iLength: length of example text
							 sExNumber: example number to use
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
	<xsl:template name="OutputInterlinearExamples">
		<xsl:param name="sExamples"/>
		<xsl:param name="iLength"/>
		<xsl:param name="sExNumber"/>
		<xsl:param name="sLetterList"/>
		<xsl:if test="string-length($sExamples) != 0">
			<xsl:variable name="sNewLetterList" select="concat(normalize-space($sLetterList),' ')"/>
			<xsl:variable name="sFirstLetter" select="substring-before($sNewLetterList,' ')"/>
			<xsl:variable name="sRestOfTheLetters" select="substring-after($sNewLetterList,' ')"/>
			<xsl:variable name="sBefore" select="substring-before($sExamples, '&#xA;')"/>
			<xsl:variable name="sLine">
				<xsl:choose>
					<xsl:when test="string-length($sBefore) = 0">
						<xsl:value-of select="$sExamples"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$sBefore"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<listInterlinear>
				<xsl:attribute name="letter">
					<xsl:value-of select="$sExNumber"/>
					<xsl:value-of select="$sFirstLetter"/>
				</xsl:attribute>
				<lineGroup>
					<line>
						<langData>
							<xsl:attribute name="lang">
								<xsl:text>lVernacular</xsl:text>
<!-- Now we want to use lVernacular so XXE works well.
   <xsl:value-of select="//language/langAbbr"/>-->
							</xsl:attribute>
							<xsl:value-of select="$sLine"/>
						</langData>
					</line>
					<xsl:call-template name="DoGloss"/>
				</lineGroup>
				<xsl:call-template name="DoFree"/>
			</listInterlinear>
			<!-- now recurse -->
			<xsl:call-template name="OutputInterlinearExamples">
				<xsl:with-param name="sExamples">
					<xsl:value-of select="substring-after($sExamples,'&#xA;')"/>
				</xsl:with-param>
				<xsl:with-param name="iLength">
					<xsl:value-of select="string-length(substring-after($sExamples,'&#xA;'))"/>
				</xsl:with-param>
				<xsl:with-param name="sExNumber">
					<xsl:value-of select="$sExNumber"/>
				</xsl:with-param>
				<xsl:with-param name="sLetterList">
					<xsl:value-of select="$sRestOfTheLetters"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
<!--
================================================================
Revision History
- - - - - - - - - - - - - - - - - - -
20-Apr-2006  Andy Black  Make changes for XLingPap version 1.9.0; pave way for use iwth XMLmind
08-Oct-2002  Andy Black  Make changes for XLingPap version 1.4.1
02-Aug-2002  Andy Black  Add rest of the sections; add column output;
											rework interlinear output to create unique example ids
26-Jul-2002    Andy Black  Initial version
================================================================
 -->
