<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="pron">
	<section1 id="sPron">
		<secTitle>Pronouns</secTitle>
		<p>
<xsl:text>Pronouns come in various types, including personal pronouns, possessives, reflexives, reciprocals, and indefinites.  These pronouns normally stand alone in the place of a nominal phrase, but they can also be modified by a partitive phrase and in some languages may be modified by determiners and quantifiers.  Each of these types and issues will be looked at in turn, after covering the agreement features on all types of pronouns.
</xsl:text>
</p>
		<section2 id="sPronAgreement">
			<secTitle>Agreement Features on Pronouns</secTitle>
			<p>
<xsl:text>Pronouns normally have either more than or the same number of agreement features as nouns have.  The following chart shows the agreement features used for pronouns in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>.</xsl:text>
</p>
			<example num="xPron.PronAgreement.6">
<table border="1">
					<tr>
						<th>Type of feature</th>
						<th>Feature</th>
					</tr>
					<xsl:if test="normalize-space(////pron/pronAgrFeatFirst/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatFirstExclusive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first exclusive</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatFirstInclusive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first inclusive</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatSecond/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>second</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatThird/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>third</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatSingular/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>singular</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatDual/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>dual</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatPlural/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>plural</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatMasculine/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>masculine</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatFeminine/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>feminine</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatNeuter/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>neuter</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatAnimate/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>animate</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatMinusAnimate/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>inanimate</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatHuman/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>human</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatMinusHuman/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>nonhuman</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////pron/pronAgrFeatClassNumber/@checked)='yes'">
<tr>
						<td>
							<xsl:text>class</xsl:text>
						</td>
						<td>
							<xsl:text>class_number</xsl:text>
						</td>
					</tr>
</xsl:if>
				</table>
</example>
		</section2>
		<section2 id="sPnPersonal">
			<secTitle>Personal Pronouns</secTitle>
			<p>
<xsl:text>Personal pronouns normally have either more than or the same number of case features as nouns have.</xsl:text>
</p>
			<xsl:if test="normalize-space(////np/@case)='none'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> does not have any case distinctions, so there is only a single set of pronouns that can be used in any position in the sentence, as exemplified here, beginning with first person, then second person, then the third person pronouns.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='none'">
<example num="xPron.PnPersonal.8">
<table border="1">
					<caption>
						<xsl:text>Personal Pronouns</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/personalNoCaseExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='nominative'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has a nominative-accusative case system, so there are distinct sets of pronouns for subjects, objects, and possessors.  The personal pronouns which can appear in subject position are shown here, beginning with first person, then second person, then the third person pronouns. </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='nominative'">
<example num="xPron.PnPersonal.12">
<table border="1">
					<caption>
						<xsl:text>Nominative Personal Pronouns</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/personalNomSubjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='nominative'">
<p>
<xsl:text>The personal pronouns which can appear in object position are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='nominative'">
<example num="xPron.PnPersonal.16">
<table border="1">
					<caption>
						<xsl:text>Accusative Personal Pronouns</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/personalNomObjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='nominative'">
<p>
<xsl:text>The personal pronouns which can appear in possessor position are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='nominative'">
<example num="xPron.PnPersonal.20">
<table border="1">
					<caption>
						<xsl:text>Genitive Personal Pronouns</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/personalNomPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='ergative'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has an ergative-absolutive case system, so there are distinct sets of pronouns that can be used as subjects of transitive verbs versus subjects of intransitive verbs and objects of transitive verbs.  The personal pronouns which can appear in subject position of transitive verbs are shown here, beginning with first person, then second person, then the third person pronouns. </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='ergative'">
<example num="xPron.PnPersonal.24">
<table border="1">
					<caption>
						<xsl:text>Ergative Personal Pronouns</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/personalErgSubjectTransExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='ergative'">
<p>
<xsl:text>The personal pronouns which can appear in subject position of intransitive verbs or in object position of transitive verbs are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='ergative'">
<example num="xPron.PnPersonal.28">
<table border="1">
					<caption>
						<xsl:text>Absolutive Personal Pronouns</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/personalErgSubjectIntransExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='ergative'">
<p>
<xsl:text>The personal pronouns which can appear in possessor position are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='ergative'">
<example num="xPron.PnPersonal.32">
<table border="1">
					<caption>
						<xsl:text>Personal Pronouns for Possessors</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/personalErgPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='split'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has a split case system, so there are distinct sets of pronouns  that are normally used as subjects, objects, and possessors, plus some special sets which are used in the split ergativity cases.  The personal pronouns which normally appear in subject position are shown here, beginning with first person, then second person, then the third person pronouns. </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='split'">
<example num="xPron.PnPersonal.36">
<table border="1">
					<caption>
						<xsl:text>Nominative Personal Pronouns</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/personalSplitSubjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='split'">
<p>
<xsl:text>The personal pronouns which normally appear in object position are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='split'">
<example num="xPron.PnPersonal.40">
<table border="1">
					<caption>
						<xsl:text>Accusative Personal Pronouns</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/personalSplitObjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='split'">
<p>
<xsl:text>The personal pronouns which normally appear in possessor position are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='split'">
<example num="xPron.PnPersonal.44">
<table border="1">
					<caption>
						<xsl:text>Genitive Personal Pronouns</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/personalSplitPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='split'">
<p>
<xsl:text>The personal pronouns which can appear in subject position of transitive verbs in the special cases of split ergativity are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='split'">
<example num="xPron.PnPersonal.48">
<table border="1">
					<caption>
						<xsl:text>Ergative Personal Pronouns</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/personalSplitErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='split'">
<p>
<xsl:text>The personal pronouns which appear as subjects of intransitive verbs and objects of transitive verbs in the special cases of split ergativity are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////np/@case)='ergative'">
<example num="xPron.PnPersonal.52">
<table border="1">
					<caption>
						<xsl:text>Absolutive Personal Pronouns</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/personalSplitAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
		</section2>
		<section2 id="sPronPoss">
			<secTitle>Possessive Pronouns</secTitle>
			<p>
<xsl:text>Many languages also have possessive pronouns which can stand alone, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>yours</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mine</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>theirs</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>hers</langData>
<xsl:text> in English.  These are distinct from those pronouns which can occur in possessor position, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>your</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>my</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>their</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>her</langData>
<xsl:text>, which were exemplified under personal pronouns above.</xsl:text>
</p>
			<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//pron/@poss='no'">
<xsl:text> does not have any</xsl:text>
</xsl:when>
					<xsl:when test="//pron/@poss='yes'">
<xsl:text> has</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> possessive pronouns that stand alone as a nominal phrase.  </xsl:text>
<xsl:if test="normalize-space(////pron/@poss)='yes'">
					<xsl:text>These possessive pronouns are </xsl:text>
					<xsl:choose>
						<xsl:when test="//pron/@possAffix='no'">
<xsl:text>not built by adding an affix to the personal pronouns.  They are a distinct set.</xsl:text>
</xsl:when>
						<xsl:when test="//pron/@possAffix='yes'">
<xsl:text>built by adding an affix to the personal pronouns.</xsl:text>
</xsl:when>
						<xsl:when test="//pron/@possAffix='both'">
<xsl:text>built by adding an affix to the personal pronouns, though some forms are distinct, stand alone pronouns.</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text>  The possessive pronouns are given here, beginning with first person, then second person, then third person:</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(////pron/@poss)='yes'">
<example num="xPron.PronPoss.8">
<table border="1">
					<caption>
						<xsl:text>Possessive Pronouns</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/possExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
		</section2>
		<section2 id="sPronRefl">
			<secTitle>Reflexives</secTitle>
			<p>
<xsl:text>Reflexives are another type of pronouns that most languages have.  They occur only in the same case as direct objects and normally must agree with the subject in person, gender, and number features.  Examples in English are: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>herself</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>himself</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>themselves</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>myself</langData>
<xsl:text>.    Some languages have a completely separate set of pronoun forms for reflexives, others use a phrase which consists of a noun (usually meaning ‘self’) that is possessed by the pronoun that refers back to the subject, some languages have a verbal affix which indicates reflexive action, and some languages do not distinguish reflexive constructions at all.</xsl:text>
</p>
			<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//pron/@refl='no'">
<xsl:text> does not have any type of reflexives.</xsl:text>
</xsl:when>
					<xsl:when test="//pron/@refl='yesVerbal'">
<xsl:text> has a verbal affix to indicate reflexive action. </xsl:text>
</xsl:when>
					<xsl:when test="//pron/@refl='yes'">
<xsl:text> has reflexives</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////pron/@refl)='yes'">
					<xsl:text> which </xsl:text>
					<xsl:choose>
						<xsl:when test="//pron/@reflAffix='yes'">
<xsl:text>are built by adding an affix to another pronoun.</xsl:text>
</xsl:when>
						<xsl:when test="//pron/@reflAffix='noWord'">
<xsl:text>are a distinct set of pronouns.</xsl:text>
</xsl:when>
						<xsl:when test="//pron/@reflAffix='noNoun'">
<xsl:text>are phrases consisting of a certain noun with a pronoun as the possessor.</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text>  The forms used for reflexives are given here, beginning with first person, then second person, then third person:</xsl:text>
				</xsl:if>
<xsl:if test="normalize-space(////pron/@refl)='yesVerbal'">
					<xsl:text> Examples of reflexives in </xsl:text>
					<xsl:value-of select="//language/langName" />
					<xsl:text> are:</xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(////pron/@refl)!='no'">
<example num="xPron.PronRefl.8">
<table border="1">
					<caption>
						<xsl:text>Reflexives</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/reflExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////pron/@refl)='yes'">
<p>
<xsl:text>Some examples with a reflexive used in object position of a simple sentence are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////pron/@refl)='yes'">
<example num="xPron.PronRefl.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/reflSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//pron/reflSentExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/reflSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/reflSentExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronRefl.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronRefl.12.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
		</section2>
		<section2 id="sPronRecip">
			<secTitle>Reciprocals</secTitle>
			<p>
<xsl:text>Reciprocals are similar to reflexives except that  they only occur with plural subjects.  They may be formed in the same way reflexives are, or they may be distinct.  For example, in English, the reciprocal forms are phrases: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>each other</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>one another</langData>
<xsl:text>.  Some languages use only a verbal affix to indicate reciprocal action of the plural subject, others have separate pronouns, others use a possessed noun phrase or a quantified noun phrase (as in English), and some do not mark reciprocal action at all.</xsl:text>
</p>
			<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//pron/@recip='no'">
<xsl:text> does not have any type of reciprocals.</xsl:text>
</xsl:when>
					<xsl:when test="//pron/@recip='verbal'">
<xsl:text> uses a verbal affix to indicate reciprocal action.</xsl:text>
</xsl:when>
					<xsl:when test="//pron/@recip='yes'">
<xsl:text> has reciprocals</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////pron/@recip)='yes'">
					<xsl:text> which </xsl:text>
					<xsl:choose>
						<xsl:when test="//pron/@recipAffix='yes'">
<xsl:text>are built by adding an affix to another pronoun.</xsl:text>
</xsl:when>
						<xsl:when test="//pron/@recipAffix='noWord'">
<xsl:text>are a distinct set of pronouns.</xsl:text>
</xsl:when>
						<xsl:when test="//pron/@recipAffix='noNoun'">
<xsl:text>are phrases consisting of a certain noun with a pronoun as the possessor.</xsl:text>
</xsl:when>
						<xsl:when test="//pron/@recipAffix='noQP'">
<xsl:text>are special quantified noun phrases.</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(////pron/@recip)!='no'">
						<xsl:text> Some examples of reciprocals are:</xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(////pron/@recip)!='no'">
<example num="xPron.PronRecip.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/recipExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//pron/recipExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/recipExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/recipExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronRecip.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronRecip.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////pron/@recip)!='no'">
<p>
<xsl:text>Some examples of reciprocals in sentences are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////pron/@recip)!='no'">
<example num="xPron.PronRecip.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/recipSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//pron/recipSentExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/recipSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/recipSentExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronRecip.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronRecip.12.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
		</section2>
		<section2 id="sPronIndef">
			<secTitle>Indefinites</secTitle>
			<p>
<xsl:text>In English, indefinites include </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>everybody</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>everything</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>everyone</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>anybody</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>something</langData>
<xsl:text>, etc.  Also, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nobody</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nothing</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>none</langData>
<xsl:text> are negative versions of the indefinite pronouns.  Note that these are made up of a quantifier (positive or negative) plus an indefinite generic noun. Some languages may not merge them into a single word, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no one</langData>
<xsl:text> for English.</xsl:text>
</p>
			<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, </xsl:text>
<xsl:choose>
					<xsl:when test="//pron/@indef='no'">
<xsl:text>all of the positive indefinites are nominal phrases, rather than being single-word pronouns.</xsl:text>
</xsl:when>
					<xsl:when test="//pron/@indef='yes'">
<xsl:text>some or all of the positive indefinites are merged into single-word pronouns.  Examples of the positive indefinite pronouns include:</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(////pron/@indef)='yes'">
<example num="xPron.PronIndef.8">
<table border="1">
					<caption>
						<xsl:text>Positive Indefinite Pronouns</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/indefExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly' or normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, </xsl:text>
<xsl:choose>
					<xsl:when test="//pron/@negIndef='no'">
<xsl:text>all of the negative indefinites are nominal phrases, rather than being single-word pronouns.</xsl:text>
</xsl:when>
					<xsl:when test="//pron/@negIndef='yes'">
<xsl:text>some or all of the negative indefinites are merged into single-word pronouns.  Examples of the negative indefinite pronouns include:</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)='noPosOnly' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)='yesPosOnly' or normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)='noPosOnly' or normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)='yesPosOnly'">
<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, </xsl:text>
<xsl:choose>
					<xsl:when test="//pron/@negIndef='no'">
<xsl:text>there are no negative indefinite pronouns and no negative indefinite nominal phrases either, since the language does not have any means of negating a nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//pron/@negIndef='yes'">
<xsl:text>all of the negative indefinites are merged into single-word pronouns.  There are no negative indefinite nominal phrases, since the language does not have any means of negating a nominal phrase.  Examples of the negative indefinite pronouns include:</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////pron/@negIndef)='yes'">
<example num="xPron.PronIndef.14">
<table border="1">
					<caption>
						<xsl:text>Negative Indefinite Pronouns</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/negIndefExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
			<p>
<xsl:text>Examples of positive indefinite nominal phrases </xsl:text>
<xsl:if test="normalize-space(////pron/@indef)='yes'">
					<xsl:text>(if any) </xsl:text>
				</xsl:if>
<xsl:text>include:</xsl:text>
</p>
			<example num="xPron.PronIndef.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/indefNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//pron/indefNPExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/indefNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/indefNPExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronIndef.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronIndef.18.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
			<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly' or normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text>Examples of negative indefinite nominal phrases </xsl:text>
<xsl:if test="normalize-space(////pron/@negIndef)='yes'">
					<xsl:text>(if any) </xsl:text>
				</xsl:if>
<xsl:text>include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly' or normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly'">
<example num="xPron.PronIndef.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/negIndefNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//pron/negIndefNPExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/negIndefNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/negIndefNPExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronIndef.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronIndef.22.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly' or normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)='noPosOnly' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)='yesPosOnly' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)='noPosOnly' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)='yesPosOnly' and normalize-space(////pron/@negIndef)='yes'">
<p>
<xsl:text>See section </xsl:text>
<sectionRef sec="sNegNominal" />
<xsl:text> for examples of the negative elements used in sentences and discussion of the negation constructions in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
		</section2>
		<section2 id="sPronNP">
			<secTitle>Pronouns as the Head of a Nominal Phrase</secTitle>
			<p>
<xsl:text>Though pronouns and also demonstratives, quantifiers, and numbers can stand alone as a nominal phrase in the right context, sometimes modifiers are also allowed.  In most languages, these elements cannot be modified by possessors, adjectives, or other quantifiers, although they can be modified by a degree word, an article and/or a demonstrative. English examples of this type include the following: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all twelve</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only he</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just two</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just those few</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>Examples of this type in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
			<example num="xPron.PronNP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/standAloneNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//pron/standAloneNPExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/standAloneNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/standAloneNPExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronNP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronNP.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
			<p>
<xsl:text>In addition, it is possible to have a pronoun, demonstrative, or quantifier modified by a relative clause, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all those who are going with us</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only these two that I saw</langData>
<xsl:text>.  Examples of this type in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, included in full sentences are:</xsl:text>
</p>
			<example num="xPron.PronNP.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/pronRelClExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//pron/pronRelClExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/pronRelClExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/pronRelClExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronNP.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronNP.12.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
			<p>
<xsl:text>Finally, these categories can also be modified by a partitive phrase (or other PP), as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only a few of you</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just that many of those</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only those in there</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all of us</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all by himself</langData>
<xsl:text>.   Examples of this type in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
			<example num="xPron.PronNP.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/partitiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//pron/partitiveExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/partitiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/partitiveExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronNP.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronNP.16.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
			<p>
<xsl:text>This distribution discussed for English can be accounted for by classifying allow pronouns, demonstratives, quantifiers, and numbers as NPs (rather than DPs) in the expanded DP tree structure for nominal phrases.  However, some languages allow pronouns to be modified by possessors and adjectives as well, so the correct category in that case is N.  A few languages may require pronouns to stand alone without any modification at all, making them only DPs.  (Possessive, reflexive, and reciprocal pronouns are always DPs, since they must stand alone.)</xsl:text>
</p>
			<p>
<xsl:text>For </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, the correct category or level in the tree structure for personal pronouns and other elements which can occur without a head noun is </xsl:text>
<xsl:choose>
					<xsl:when test="//pron/@pronounCat='NP'">
<xsl:text>NP, like in English, because they can be modified by </xsl:text>
</xsl:when>
					<xsl:when test="//pron/@pronounCat='N'">
<xsl:text>N, because they can be modified by all the same categories as nouns can, including adjectives and possessors.</xsl:text>
</xsl:when>
					<xsl:when test="//pron/@pronounCat='DP'">
<xsl:text>DP, because they must stand alone in the place of a whole nominal phrase, with no modifiers allowed.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:if test="normalize-space(////pron/@pronounCat)='NP'">
					<xsl:choose>
						<xsl:when test="//qp/@npDegree='yes'">
<xsl:text> degree words,</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@npDegree='no'">
<xsl:text></xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="//np/@artAndDem='demonstrative'">
<xsl:text> demonstratives,</xsl:text>
</xsl:when>
						<xsl:when test="//np/@artAndDem='article'">
<xsl:text> articles,</xsl:text>
</xsl:when>
						<xsl:when test="//np/@artAndDem='both'">
<xsl:text> demonstratives, articles,</xsl:text>
</xsl:when>
						<xsl:when test="//np/@artAndDem='no'">
<xsl:text></xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text> relative clauses and PPs, but not by possessors or adjectives.</xsl:text>
				</xsl:if>
<xsl:text> The optional PP occurs </xsl:text>
<xsl:choose>
						<xsl:when test="//pron/@partitivePos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
						<xsl:when test="//pron/@partitivePos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
						<xsl:when test="//pron/@partitivePos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:text> the element acting as the head of the nominal phrase.</xsl:text>
</p>
		</section2>
	</section1>


































































































































































</xsl:template>
</xsl:stylesheet>
