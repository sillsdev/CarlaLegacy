<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="n">
	<section1 id="sN">
		<secTitle>Nouns</secTitle>
		<p>
<xsl:text>Nouns are the words which principally describe persons, animals, places or things.  They can also be used to express ideas, thoughts or emotions.</xsl:text>
</p>
		<p>
<xsl:text>The following sections cover noun agreement, case and possession in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  The types of noun compounds allowed in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are given in section </xsl:text>
<sectionRef sec="sNPCompounds" />
<xsl:text>.  All of the elements than can modify nouns in full nominal phrases are covered in section </xsl:text>
<sectionRef sec="sNP" />
<xsl:text>.</xsl:text>
</p>
		<section2 id="sNPAgr">
			<secTitle>Agreement</secTitle>
		   <p contentType="ctPracticalIntro">
<xsl:text>Agreement between at least some of the modifiers and the head noun may be requiured in number, animacy,  gender, class or other features.</xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>Many languages require agreement between at least some of the modifiers and the head noun.  While English only has number agreement, in other languages this agreement may also include animacy, gender, class or other features.</xsl:text>
</p>
			<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@agreeNumber='no'"> there is no number agreement.  Instead, number marking comes from the number or quantifier.</xsl:when>
					<xsl:when test="//np/@agreeNumber='yes'"> the various nominal modifiers agree in number with the head noun.</xsl:when>
				</xsl:choose>
</p>
			<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<p>
<xsl:text>Examples showing number agreement in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> nominal phrases include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<example num="xN.NPAgr.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeNumberExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeNumberExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeNumberExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeNumberExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPAgr.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPAgr.12.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//np/agreeClass/@checked)='no' and normalize-space(//np/agreeClassifier/@checked)='no' and normalize-space(//np/agreeGender/@checked)='no' and normalize-space(//np/agreeAnimacy/@checked)='no' and normalize-space(//np/agreeOtherFeat/@checked)='no' and normalize-space(//np/agreeOtherNone/@checked)='yes'">
<p>
<xsl:text>There is no agreement in animacy, gender, class or other features between the modifiers and the head noun. </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/agreeClass/@checked)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>The modifiers and the head noun agree in class.  Examples showing class agreement in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> nominal phrases include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/agreeClass/@checked)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<example num="xN.NPAgr.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeClassExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeClassExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeClassExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeClassExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPAgr.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPAgr.18.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//np/agreeClassifier/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific'">
<p>
<xsl:text>A classifier which agrees with the class or type of the noun is present with nouns that are counted or specified, but other modifiers are not marked for class, as shown in the following examples:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/agreeClassifier/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific'">
<example num="xN.NPAgr.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeClassifierExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeClassifierExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeClassifierExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeClassifierExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPAgr.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPAgr.22.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//np/agreeAnimacy/@checked)='yes'">
<p>
<xsl:text>Examples showing animacy agreement between the head noun and its modifiers in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> nominal phrases include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/agreeAnimacy/@checked)='yes'">
<example num="xN.NPAgr.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeAnimacyExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeAnimacyExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeAnimacyExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeAnimacyExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPAgr.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPAgr.26.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//np/agreeGender/@checked)='yes'">
<p>
<xsl:text>The noun and its modifiers agree in gender in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, as shown in the followng examples:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/agreeGender/@checked)='yes'">
<example num="xN.NPAgr.30">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeGenderExample" />
</xsl:variable>
<xsl:variable name="iExampleLength14" select="string-length(normalize-space($sExampleValue14))" />
<xsl:choose>
<xsl:when test="$iExampleLength14 != 0 and $sExampleValue14 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPAgr.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPAgr.30.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
		   <xsl:if test="normalize-space(//np/agreeOtherFeat/@checked)='yes'">
<p>
<xsl:text>Nominal phrases in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> show agreement in ___</xsl:text>
<xsl:value-of select="//np/agreeOtherFeat" />
<xsl:text>.  Examples of this type of agreement include:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/agreeOtherFeat/@checked)='yes'">
<example num="xN.NPAgr.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPAgr.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPAgr.34.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
									 <xsl:text>other</xsl:text>
								  </td>
<td align="left">
									 <xsl:text>any other specific markers</xsl:text>
								  </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			 </table>
</example>
</xsl:if>
		</section2>
	   <section2 id="sNPCase">
	   <secTitle>Case</secTitle>
	      <p contentType="ctPracticalIntro">
<xsl:text>Nouns and their modifiers may also be marked for case.  Case systems help distinguish the role of a noun or pronoun with respect to the verb.</xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>Nouns and their modifiers may be marked for case.  The most common case system is nominative-accusative.  This is the system English has, though only pronouns are marked for case in English.  In a nominative-accusative system, subjects of both transitive and intransitive verbs are in nominative case, while direct objects are accusative case.  Possessors are genitive case.  The nominative pronouns in English are: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I, we, you, he, she, they</langData>
<xsl:text>.  The accusative pronouns are: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>me, us, you, him, her, them</langData>
<xsl:text>.  The genitive pronouns include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>my, our, your, his, her, their</langData>
<xsl:text>.  Therefore, we say </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>They hit him</langData>
<xsl:text> and not </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Them hit he</langData>
<xsl:text>. </xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text> A language with a basic nominative-accusative case system may have different case marking for Experiencer subjects than for Agent subjects.  Some verbs with Experiencer subjects are </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>appear, see, fear, be found, want, like</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>laugh</langData>
<xsl:text>. </xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>
	            In an ergative-absolutive case system, subjects of transitive verbs are marked with the ergative case, while objects of transitive verbs and subjects of intransitive verbs are marked with the absolutive case.  The case of possessors is not set cross-linguistically.  Some languages with an ergative-absolutive system simply have different sets of verbal agreement markers, but no marking on nouns.  This type of agreement marking will be handled in section </xsl:text>
<sectionRef sec="sIPAgr" />
<xsl:text>.</xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>
	            Some languages are even more complex in that they normally have a nominative-accusative case system but under some grammatical conditions, such as a particular tense or aspect or a particular person agreement feature, the case system switches to ergative-absolutive.  This is called “split ergativity”.</xsl:text>
</p>
	      <p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
	            <xsl:when test="//typology/@case='none'"> does not have any case system.   The exact same set of pronouns may be used in any position in the sentence and there is no marking on nouns or on any noun modifiers based on their position in the sentence.</xsl:when>
	            <xsl:when test="//typology/@case='nominative'"> has a nominative-accusative case system.   Subjects of both transitive and intransitive verbs are marked in the same way and use the same set of pronouns, but objects of transitive verbs are marked differently.</xsl:when>
	            <xsl:when test="//typology/@case='ergative'"> has an ergative-absolutive case system.   Subjects of intransitive verbs and objects of transitive verbs are marked in the same way and use the same set of pronouns, but subjects of transitive verbs are marked differently.</xsl:when>
	            <xsl:when test="//typology/@case='split'"> has a split case system.    The language normally follows the nominative-accusative case system, but the ergative-absolutive system is used under certain grammatical conditions.</xsl:when>
	         </xsl:choose>
<xsl:if test="normalize-space(//typology/@case)='split'"> 
	      		<xsl:text> The conditions where the ergative-absolutive case system is used are ___</xsl:text>
<xsl:value-of select="//typology/splitConditions" />
	      		<xsl:text>.   </xsl:text>
	      	</xsl:if>
</p>
	      
	      <p>
<xsl:text>This is shown in the following examples of transitive sentences with Agent subjects where the subject and object are nominal phrases:</xsl:text>
</p>
	      <example num="xN.NPCase.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPCase.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPCase.18.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>    
	      <p>
<xsl:text>Note the forms of the pronouns used for the Agent subject and object in these transitive sentences:</xsl:text>
</p>
	      <example num="xN.NPCase.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/pnExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/pnExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/pnExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/pnExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPCase.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPCase.22.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
	      <xsl:if test="normalize-space(//np/@caseN)='yes' and normalize-space(//typology/@case)!='none'">
<p>
<xsl:text>In the intransitive examples with nominal phrases as the subjects, </xsl:text>
<xsl:choose>
	            <xsl:when test="//typology/@case='nominative'">the case marking matches that of the subejcts in the transitive sentences above.</xsl:when>
	            <xsl:when test="//typology/@case='ergative'">the case marking matches that of the objects in the transitive sentences above.</xsl:when>
	            <xsl:when test="//typology/@case='split'">the case marking on most of the subjects matches that of the subjects in the transitive sentences above, but in certain situations, it matches that of the objects in trantitive sentences.</xsl:when>
	         </xsl:choose>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//np/@caseN)='yes' and normalize-space(//typology/@case)!='none'">
<example num="xN.NPCase.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/intExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/intExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/intExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/intExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPCase.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPCase.26.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
	      <p>
<xsl:text>The examples of intransitive sentences with independent pronouns as subjects verify that </xsl:text>
<xsl:choose>
	            <xsl:when test="//typology/@case='none'">there is no case distinction, as the same pronouns can appear as subjects of both transitive and intransitive verbs and as objects of transitive verbs.</xsl:when>
	            <xsl:when test="//typology/@case='nominative'">the same set of pronouns can appear as subjects of both transitive and intransitive verbs, while different pronouns are used as objects of transitive verbs.</xsl:when>
	            <xsl:when test="//typology/@case='ergative'">the same set of pronouns can appear as subjects of intransitive verbs and objects of transitive verbs, while different pronouns are used as subjects of transitive verbs.</xsl:when>
	            <xsl:when test="//typology/@case='split'">the same set of pronouns can normally appear as subjects of both transitive and intransitive verbs, while different pronouns are used as objects of transitive verbs.  However, in certain cases, the same set of pronouns can appear as subjects of intransitive verbs and objects of transitive verbs, while different pronouns are used as subjects of transitive verbs.</xsl:when>
	         </xsl:choose>
</p>
	      <example num="xN.NPCase.30">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/pnIntExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/pnIntExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/pnIntExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/pnIntExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPCase.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPCase.30.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
	      
	      <xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseN)='yes' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseN)='yes'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
	         <xsl:when test="//typology/@caseExperiencer='no'">the same case marking and pronoun set is used for both Agent and Experiencer subjects.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesObj'">Experiencer subjects use the same case marking and pronoun set as objects of  transitive verbs with an Agent subject do.  We assume that Experiencer subjects have dative case, like indirect objects, so accusative case and dative case are marked the same in this language.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesDat'">Experiencer subjects use a case marking and pronoun set which is distinct from both the subject and object of verbs with an Agent subject.  This is the dative case, also used for indirect objects.</xsl:when>
	      </xsl:choose>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseN)='no' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseN)='no'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
	         <xsl:when test="//typology/@caseExperiencer='no'">the same pronoun set is used for both Agent and Experiencer subjects.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesObj'">Experiencer subjects use the same pronoun set as objects of  transitive verbs with an Agent subject do.  We assume that Experiencer subjects have dative case, like indirect objects, so the accusative and dative pronouns are the same in this language.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesDat'">Experiencer subjects use a pronoun set which is distinct from both the subject and object of verbs with an Agent subject.  These are the dative pronouns, also used for indirect objects.</xsl:when>
	      </xsl:choose>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@caseN)='yes'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
	         <xsl:when test="//typology/@caseExperiencer='no'">the same case marking and pronoun set is used for both Agent and Experiencer subjects.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesObj'">Experiencer subjects use the same case marking and pronoun set as objects of  transitive verbs with an Agent subject do.  We assume that Experiencer subjects have dative case, like indirect objects, so absolutive case and dative case are marked the same in this language.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesDat'">Experiencer subjects use a case marking and pronoun set which is distinct from both the subject and object of verbs with an Agent subject.  This is the dative case, also used for indirect objects.</xsl:when>
	      </xsl:choose>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@caseN)='no'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
	         <xsl:when test="//typology/@caseExperiencer='no'">the same pronoun set is used for both Agent and Experiencer subjects.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesObj'">Experiencer subjects use the same pronoun set as objects of  transitive verbs with an Agent subject do.  We assume that Experiencer subjects have dative case, like indirect objects, so the absolutive and dative pronouns are the same in this language.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesDat'">Experiencer subjects use a pronoun set which is distinct from both the subject and object of verbs with an Agent subject.  These are the dative pronouns, also used for indirect objects.</xsl:when>
	      </xsl:choose>
</p>
</xsl:if>
	      
	      <xsl:if test="normalize-space(//typology/@case)='none' and normalize-space(//typology/@caseExperiencer)='no'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the same pronoun set is used for both Agent and Experiencer subjects.</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)='none' and normalize-space(//typology/@caseExperiencer)!='no'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, at least some of the pronouns used for Experiencer subjects are distinct from those used for Agent subjects.</xsl:text>
</p>
</xsl:if>
	      
	      <p>
<xsl:text>This is shown in the following examples of transitive sentences with verbs which have Experiencer subjects, where the subject and object are nominal phrases:</xsl:text>
</p>
	      <example num="xN.NPCase.46">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPCase.46</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPCase.46.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>    
	      <p>
<xsl:text>Note the forms of the pronouns used for the Experiencer subjects and the objects in these transitive sentences:</xsl:text>
</p>
	      <example num="xN.NPCase.50">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerPnExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerPnExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerPnExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerPnExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPCase.50</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPCase.50.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>

	      <p contentType="ctPracticalIntro">
<xsl:text>There are additional cases for the minor grammatical relations which may be marked on the nominal phrases in languages which mark case on nouns. Languages without any case marking and those which only show case in the pronouns normally express these additional grammatical relations via adpositional phrases.
	      </xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>There are more cases to consider beyond that of the subject and object, also.  These may include ablative case for a source or origin, genitive case for kinds or possessors, dative case for indirect objects, instrumental case for means or instruments, locative case for locations, vocative case for direct address, and oblique case is sometimes used for the minor grammatical relations.
	         These additional cases are usually marked via case markers on the nominal phrases themselves in languages which normally mark case on nouns or nominal phrases as well as pronouns.  For languages without any case marking and those which only show case in the pronouns, these additional grammatical relations are normally expressed via adpositional phrases.
	      </xsl:text>
</p>
	      <xsl:if test="normalize-space(//typology/@case)='none'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, there are not any kind of case distinctions.  Therefore, the minor grammatical relations are expressed by </xsl:text>
<xsl:choose>
	         <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
	         <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
	         <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
	         <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
	      </xsl:choose>
<xsl:text> phrases, rather than by nominal phrases (see section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='no'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, case distinctions are not marked on nouns or nominal phrases; only the pronoun sets distinguish case.  Therefore, the minor grammatical relations are expressed by </xsl:text>
<xsl:choose>
	            <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
	            <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
	            <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
	            <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
	      </xsl:choose>
<xsl:text> phrases, rather than by nominal phrases (see section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).  The case distinctions in the pronouns will be delineated in section </xsl:text>
<sectionRef sec="sPronPersonal" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='yes'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, case is marked on both pronouns and nouns or nominal phrases. </xsl:text>
<xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseDefault)='nominative' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseDefault)='nominative'">
	            <xsl:text>  Nominative case is the default (unmarked) case. </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='yes' and normalize-space(//np/caseWordOther/@checked)='no'">	            
	         <xsl:text>The case markers are written as an independent word and occur </xsl:text>
	         <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
	         <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
	         <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
	         <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
	         <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
	         <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
	         <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>on either side or on  both sides of</xsl:text>
</xsl:if>
	         <xsl:text> the rest of the nominal phrase.  </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='yes' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'"> 
	            <xsl:text>The case markers are written as an independent word and occur ___</xsl:text>
<xsl:value-of select="//np/caseWordOther" />
	            <xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='yes' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBefore/@checked)='yes' or normalize-space(//np/@caseWord)!='no' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' or normalize-space(//np/@caseWord)!='no' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
	            <xsl:text>The case markers are written as an independent word and occur </xsl:text>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>on either side or on  both sides of</xsl:text>
</xsl:if>
	            <xsl:text> the rest of the nominal phrase, and they may also occur ___</xsl:text>
<xsl:value-of select="//np/caseWordOther" />
<xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='no'">	            
	            <xsl:text>Some of the case markers are written as an independent word and occur </xsl:text>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>on either side or on  both sides of</xsl:text>
</xsl:if>
	            <xsl:text> the rest of the nominal phrase.  </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'"> 
	            <xsl:text>Some of the case markers are written as an independent word and occur ___</xsl:text>
<xsl:value-of select="//np/caseWordOther" />
	            <xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBefore/@checked)='yes' or normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' or normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
	            <xsl:text>Some of the case markers are written as an independent word and occur </xsl:text>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>on either side or on  both sides of</xsl:text>
</xsl:if>
	            <xsl:text> the rest of the nominal phrase, and some may also occur ___</xsl:text>
<xsl:value-of select="//np/caseWordOther" />
<xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some'">
<xsl:text>Other </xsl:text>
	            <xsl:if test="normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>case markers attach to the beginning of the initial word in the nominal phrase.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesEnclitic/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>case markers attach to the end of the final word in the nominal phrase.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>case markers attach to the beginning of the initial word and some attach to the end of the final word in the nominal phrase.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>case markers are prefixes which attach to the head noun.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>case markers are suffixes which attach to the head noun.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>case markers are prefixes and some are suffixes which attach to the head noun.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes'">
<xsl:text>case markers are clitics which attach to either the beginning of the initial word or the end of the final word in the nominal phrase and some are affixes which attach to the head noun.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes'">
<xsl:text>  Some may also attach ___</xsl:text>
<xsl:value-of select="//np/caseAttachesOther" />
	               <xsl:text>.   </xsl:text>
</xsl:if>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'"> 
	            <xsl:text>Some of the case markers attach ___</xsl:text>
<xsl:value-of select="//np/caseAttachesOther" />
	            <xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='no'">  <xsl:text></xsl:text>
	            <xsl:if test="normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>The case markers attach to the beginning of the initial word in the nominal phrase.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesEnclitic/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>The case markers attach to the end of the final word in the nominal phrase.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>Some of the case markers attach to the beginning of the initial word and some attach to the end of the final word in the nominal phrase.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>The case markers are prefixes which attach to the head noun.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>The case markers are suffixes which attach to the head noun.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>Some of the case markers are prefixes and some are suffixes which attach to the head noun.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes'">
<xsl:text>Some of the case markers are clitics which attach to either the beginning of the initial word or the end of the final word in the nominal phrase and some are affixes which attach to the head noun.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes'">
<xsl:text>  Some may also attach ___</xsl:text>
<xsl:value-of select="//np/caseAttachesOther" />
	               <xsl:text>.   </xsl:text>
</xsl:if>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='no' and normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'"> 
	            <xsl:text>The case markers attach ___</xsl:text>
<xsl:value-of select="//np/caseAttachesOther" />
	            <xsl:text>.   </xsl:text>
	         </xsl:if>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='yes'">
<p>
<xsl:text>The case markers used on nouns or nominal phrases in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown in the following table.</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='yes'">
<example num="xCase">
<table border="1">
	            <caption>
	               <xsl:text>Case markers</xsl:text>
	            </caption>
	            <tr>
	               <th>Morphemes</th>
	               <th>Case</th>
	               <th>Use</th>
	            </tr>
	            <xsl:if test="normalize-space(//typology/@case)='nominative' or normalize-space(//typology/@case)='split'">
<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/nominative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>nominative</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>subjects</xsl:text>
	               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                  <xsl:text>nominative</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>subjects</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@case)='nominative' or normalize-space(//typology/@case)='split'">
<xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//np/accusative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.0" select="string-length(normalize-space($sExampleValue1.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.0 != 0 and $sExampleValue1.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>accusative</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>direct objects and other uses</xsl:text>
	               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                  <xsl:text>accusative</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>direct objects and other uses</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)!='ergative' or normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='ergative'">
<xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//np/ergative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.0" select="string-length(normalize-space($sExampleValue2.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.0 != 0 and $sExampleValue2.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>ergative</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>subjects of transitive verbs</xsl:text>
	               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                  <xsl:text>ergative</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>subjects of transitive verbs</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:variable name="sExampleValue3.0">
<xsl:value-of select="translate(string(//np/ergative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.0" select="string-length(normalize-space($sExampleValue3.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.0 != 0 and $sExampleValue3.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>ergative</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>subjects of transitive verbs and possessors</xsl:text>
	               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                  <xsl:text>ergative</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>subjects of transitive verbs and possessors</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)!='absolutive' or normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='absolutive'">
<xsl:variable name="sExampleValue4.0">
<xsl:value-of select="translate(string(//np/absolutive),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.0" select="string-length(normalize-space($sExampleValue4.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.0 != 0 and $sExampleValue4.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>absolutive</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>subjects of intransitive verbs and objects of transitive verbs</xsl:text>
	               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                  <xsl:text>absolutive</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>subjects of intransitive verbs and objects of transitive verbs</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:variable name="sExampleValue5.0">
<xsl:value-of select="translate(string(//np/absolutive),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.0" select="string-length(normalize-space($sExampleValue5.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.0 != 0 and $sExampleValue5.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>absolutive</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>subjects of intransitive verbs and objects of transitive verbs and possessors</xsl:text>
	               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                  <xsl:text>absolutive</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>subjects of intransitive verbs and objects of transitive verbs and possessors</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@case)='nominative' or normalize-space(//typology/@case)='split' or normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)='genitive'">
<xsl:variable name="sExampleValue6.0">
<xsl:value-of select="translate(string(//np/genitive),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.0" select="string-length(normalize-space($sExampleValue6.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.0 != 0 and $sExampleValue6.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>genitive</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>possessors</xsl:text>
	               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                  <xsl:text>genitive</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>possessors</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@caseExperiencer)='no'">
<xsl:variable name="sExampleValue7.0">
<xsl:value-of select="translate(string(//np/dative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.0" select="string-length(normalize-space($sExampleValue7.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.0 != 0 and $sExampleValue7.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>dative</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>indirect objects</xsl:text>
	               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                  <xsl:text>dative</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>indirect objects</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@caseExperiencer)!='no'">
<xsl:variable name="sExampleValue8.0">
<xsl:value-of select="translate(string(//np/dative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.0" select="string-length(normalize-space($sExampleValue8.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.0 != 0 and $sExampleValue8.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>dative</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>indirect objects and Experiencer subjects</xsl:text>
	               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                  <xsl:text>dative</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>indirect objects and Experiencer subjects</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:variable name="sExampleValue9.0">
<xsl:value-of select="translate(string(//np/ablative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.0" select="string-length(normalize-space($sExampleValue9.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.0 != 0 and $sExampleValue9.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>ablative</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>source or origin</xsl:text>
	               </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                  <xsl:text>ablative</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>source or origin</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	               <xsl:variable name="sExampleValue10.0">
<xsl:value-of select="translate(string(//np/instrumental),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10.0" select="string-length(normalize-space($sExampleValue10.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength10.0 != 0 and $sExampleValue10.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                     <xsl:text>instrumental</xsl:text>
	                  </td>
<td align="left">
	                     <xsl:text>instrument, means or agency</xsl:text>
	                  </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                     <xsl:text>instrumental</xsl:text>
	                  </td>
<td align="left">
	                     <xsl:text>instrument, means or agency</xsl:text>
	                  </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	                  <xsl:variable name="sExampleValue11.0">
<xsl:value-of select="translate(string(//np/locative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11.0" select="string-length(normalize-space($sExampleValue11.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength11.0 != 0 and $sExampleValue11.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                        <xsl:text>locative</xsl:text>
	                     </td>
<td align="left">
	                        <xsl:text>location</xsl:text>
	                     </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                        <xsl:text>locative</xsl:text>
	                     </td>
<td align="left">
	                        <xsl:text>location</xsl:text>
	                     </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	                     <xsl:variable name="sExampleValue12.0">
<xsl:value-of select="translate(string(//np/vocative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12.0" select="string-length(normalize-space($sExampleValue12.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength12.0 != 0 and $sExampleValue12.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                           <xsl:text>vocative</xsl:text>
	                        </td>
<td align="left">
	                           <xsl:text>direct address</xsl:text>
	                        </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                           <xsl:text>vocative</xsl:text>
	                        </td>
<td align="left">
	                           <xsl:text>direct address</xsl:text>
	                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	                        <xsl:variable name="sExampleValue13.0">
<xsl:value-of select="translate(string(//np/oblique),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13.0" select="string-length(normalize-space($sExampleValue13.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength13.0 != 0 and $sExampleValue13.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                              <xsl:text>oblique</xsl:text>
	                           </td>
<td align="left">
	                              <xsl:text>general minor grammatical relation</xsl:text>
	                           </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                              <xsl:text>oblique</xsl:text>
	                           </td>
<td align="left">
	                              <xsl:text>general minor grammatical relation</xsl:text>
	                           </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	                           <xsl:variable name="sExampleValue14.0">
<xsl:value-of select="translate(string(//np/other),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14.0" select="string-length(normalize-space($sExampleValue14.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength14.0 != 0 and $sExampleValue14.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                                 <xsl:text>other</xsl:text>
	                              </td>
<td align="left">
	                                 <xsl:text>any other specific markers</xsl:text>
	                              </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
	                                 <xsl:text>other</xsl:text>
	                              </td>
<td align="left">
	                                 <xsl:text>any other specific markers</xsl:text>
	                              </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>	      
	   </section2>
	   
		<section2 id="sNPoss">
			<secTitle>Possessors</secTitle>
			<p>
<xsl:text>Possession can normally be expressed by a pronoun, by a simple noun, or by a full nominal phrase (see section </xsl:text>
<sectionRef sec="sNPPoss" />
<xsl:text>).  The case and agreement features on possessed nouns or nouns acting as possessors are covered here.</xsl:text>
<xsl:if test="normalize-space(//np/@possAbsolutive)='yes'">
<xsl:text>  The special affix that occurs on nouns when they are not possessed or pluralized is also discussed.</xsl:text>
</xsl:if>
</p>
			<section3 id="sNPPossCase">
				<secTitle>Possessor Case</secTitle>
				<xsl:if test="normalize-space(//typology/@case)='none'">
<p>
<xsl:text>As discussed in section </xsl:text>
<sectionRef sec="sNPCase" />
<xsl:text>, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> does not have any case system.  Therefore, there is no case marking on nouns nor a distinct set of pronouns used for possessors.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='nominative'">
<p>
<xsl:text>Within the normal nominative-accusative case system followed by </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, possessors are marked with the genitive case.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='split'">
<p>
<xsl:text>Possessors in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are marked with the genitive case, following the normal nominative-accusative part of the split case system.  In the parts which display split ergativity, possessors are marked with the </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCaseErg='ergative'">ergative case, the same marking as the subjects of transitive verbs.</xsl:when>
						<xsl:when test="//np/@possCaseErg='absolutive'">absolutive case, the same marking as the subjects of intransitive verbs and the objects of transitive verbs.</xsl:when>
						<xsl:when test="//np/@possCaseErg='genitive'">genitive case also.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='ergative'">
<p>
<xsl:text>Within the ergative-absolutive case system followed by </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, possessors are marked with the </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCaseErg='ergative'">ergative case, the same marking as the subjects of transitive verbs.</xsl:when>
						<xsl:when test="//np/@possCaseErg='absolutive'">absolutive case, the same marking as the subjects of intransitive verbs and the objects of transitive verbs.</xsl:when>
						<xsl:when test="//np/@possCaseErg='genitive'">genitive case, a distinct marking for possessors.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none'">
<p contentType="ctPracticalIntro">
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
			         <xsl:when test="//np/@possNounCaseChange='no'"> The grammatical function of the head noun relative to the verb determines its case, not the presence of a possessor.</xsl:when>
			         <xsl:when test="//np/@possNounCaseChange='yes'"> The case of the head noun matches the case of the possessor, when a possessor is present.</xsl:when>
			      </xsl:choose>
<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
<xsl:text> If there is an adjective modifier in the nominal phrase, the case of the head noun </xsl:text>
			      <xsl:choose>
			         <xsl:when test="//np/@adjpCaseChange='no'">only changes when a possessor is present, though the adjective may/must also carry that case.</xsl:when>
			         <xsl:when test="//np/@adjpCaseChange='yes'">changes to match the normal case of a possessor even if just an adjectival modifier is present.</xsl:when>
			      </xsl:choose>
			      </xsl:if>
<xsl:if test="normalize-space(//np/@adjpCaseAffix)!='no' and normalize-space(//np/@adjpCaseChange)='yes'">
			            <xsl:text> When the overt </xsl:text>
			            <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//typology/@case)='nominative'">
			               <xsl:text>genitive </xsl:text>
			            </xsl:if>
			            <xsl:if test="normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
			               <xsl:text>or </xsl:text>
			            </xsl:if>
			            <xsl:text></xsl:text>
			            <xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
			               <xsl:text>ergative </xsl:text>
			            </xsl:if>
			            <xsl:text></xsl:text>
			            <xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
			               <xsl:text>absolutive </xsl:text>
			            </xsl:if>
			            <xsl:text></xsl:text>
			            <xsl:choose>
			               <xsl:when test="//np/@adjpCaseAffix='yesSuffix'">suffix</xsl:when>
			               <xsl:when test="//np/@adjpCaseAffix='yesPrefix'">prefix</xsl:when>
			            </xsl:choose>
			            <xsl:text> is present on the head noun, it indicates that an adjectival modifier and/or a possessor must be present in the phrase.  If the adjective is marked with this </xsl:text>
			            <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//typology/@case)='nominative'">
			               <xsl:text>genitive </xsl:text>
			            </xsl:if>
			            <xsl:if test="normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
			               <xsl:text>or </xsl:text>
			            </xsl:if>
			            <xsl:text></xsl:text>
			            <xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
			               <xsl:text>ergative </xsl:text>
			            </xsl:if>
			            <xsl:text></xsl:text>
			            <xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
			               <xsl:text>absolutive </xsl:text>
			            </xsl:if>
			            <xsl:text></xsl:text>
			            <xsl:choose>
			               <xsl:when test="//np/@adjpCaseAffix='yesSuffix'">suffix,</xsl:when>
			               <xsl:when test="//np/@adjpCaseAffix='yesPrefix'">prefix,</xsl:when>
			            </xsl:choose>
			            <xsl:text> then another adjective and/or a possessor must also be present.</xsl:text>
			         </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)!='none'">
<p contentType="ctComparativeIntro">
<xsl:text>In some languages, in a possessed noun phrase the head noun and any modifiers matches the case of the possessor.  In other languages, the possessor is marked with its own case, say genitive, while the head noun is marked with case depending on its position relative to the verb: nominative or accusative, ergative or absolutive depending on the case system.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none'">
<p contentType="ctComparativeIntro">
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possNounCaseChange='no'">the grammatical function of the head noun relative to the verb determines its case, not the presence of a possessor.</xsl:when>
						<xsl:when test="//np/@possNounCaseChange='yes'">the case of the head noun matches the case of the possessor, when a possessor is present.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>Languages like </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> which change the case of the head noun when a possessor is present normally also change the case of intervening adjectives to match.  Some languages of this type also change the case of the head noun when only an adjectival modifier is present, even when there is no possessor.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the case of the head noun </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@adjpCaseChange='no'">only changes when a possessor is present, though in that situation an intervening adjective may/must also carry that case.</xsl:when>
						<xsl:when test="//np/@adjpCaseChange='yes'">changes to match the normal case of a possessor even if just an adjectival modifier is present.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@adjpCaseChange)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>Further, some languages of this latter type have an overt affix which marks the genitive case (or the normal case of possessors) on the head noun to indicate that there must be either an adjective or a possessor in that nominal phrase.  In this situation, the adjective and/or possessor will also be in genitive case (or the normal case of possessors), though the case marking will not be overt on the highest modifier in the nominal phrase.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@adjpCaseChange)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the case marking </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@adjpCaseAffix='no'">is not handled via an affix.</xsl:when>
						<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">is handled in this distinctive way.  </xsl:when>
						<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">is handled in this distinctive way.  </xsl:when>
					</xsl:choose>
<xsl:if test="normalize-space(//np/@adjpCaseAffix)!='no' and normalize-space(//np/@adjpCaseChange)='yes'">
						<xsl:text>When the overt </xsl:text>
						<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//typology/@case)='nominative'">
							<xsl:text>genitive </xsl:text>
						</xsl:if>
						<xsl:if test="normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
							<xsl:text>or </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
							<xsl:text>ergative </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
							<xsl:text>absolutive </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:choose>
							<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">suffix</xsl:when>
							<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">prefix</xsl:when>
						</xsl:choose>
						<xsl:text> is present on the head noun, it indicates that an adjectival modifier and/or a possessor must be present in the phrase.  If the adjective is marked with this </xsl:text>
						<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//typology/@case)='nominative'">
							<xsl:text>genitive </xsl:text>
						</xsl:if>
						<xsl:if test="normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
							<xsl:text>or </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
							<xsl:text>ergative </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
							<xsl:text>absolutive </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:choose>
							<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">suffix,</xsl:when>
							<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">prefix,</xsl:when>
						</xsl:choose>
						<xsl:text> then another adjective and/or a possessor must also be present.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			</section3>
			
			<section3 id="sNPPossAgreement">
				<secTitle>Possessor Agreement</secTitle>
				<p>
<xsl:text>Possessor agreement normally comes in two basic forms:</xsl:text>
</p>
				<ul>
					<li>
						<xsl:text>An affix that occurs on alienably possessed nouns to indicate that they are possessed and therefore must have a possessor in the nominal phrase.  Inalienably possessed nouns do not take any marking, but must always have a possessor.  These include, but are not limited to, kinship terms and body parts.</xsl:text>
					</li>
					<li>
						<xsl:text>An affix that agrees with the possessor (or possibly expresses the possessor by itself).</xsl:text>
					</li>
				</ul>
				<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possAlienable='no'"> does not distinguish</xsl:when>
						<xsl:when test="//np/@possAlienable='yes'"> makes a distinction</xsl:when>
					</xsl:choose>
<xsl:text> between alienably and inalienably possessed nouns.  </xsl:text>
<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
						<xsl:text>The affix which marks alienably possessed nouns when they have a possessor is:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
<example num="xN.NPoss.NPPossAgreement.10">
<table border="1">
					<tr>
						<th>Possessive affix</th>
						<th>Gloss</th>
					</tr>
						<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/possAlienableAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					</table>
</example>
</xsl:if>
				<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, nouns </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possAgr='no'">are not</xsl:when>
						<xsl:when test="//np/@possAgr='yes'">are</xsl:when>
					</xsl:choose>
<xsl:text> marked with a pronominal affix or clitic which either agrees with the possessor or expresses the possessor by itself.  </xsl:text>
<xsl:if test="normalize-space(//np/@possAgr)='yes'">
					   <xsl:text>See the dependent personal pronouns used for possessors, given in section </xsl:text>
<sectionRef sec="sPronPersonal" />
<xsl:text>. </xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
			   <p>
<xsl:text>See section </xsl:text>
<sectionRef sec="sNPPoss" />
<xsl:text> for examples of possessed nouns.</xsl:text>
</p>
			</section3>
		   <xsl:if test="normalize-space(//np/@possAbsolutive)='yes'">
<section3 id="sNPossAbsolutive">
		      <secTitle>Absolutive Marking</secTitle>
		      <p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has an affix that occurs on nouns when they are not possessed or pluralized, or possibly when there are no modifiers.  This affix is known as the absolutive marker, but the name is not related to the absolutive case marker used in languages with an ergative-absolutive case system.</xsl:text>
</p>
		      <p>
<xsl:text>The forms of the affix used in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are:</xsl:text>
</p>
		      <xsl:if test="normalize-space(//np/@possAbsolutive)='yes'">
<example num="xN.NPoss.NPossAbsolutive.8">
<table border="1">
		            <tr>
		               <th>Absolutive affix</th>
		               <th>Gloss</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/possAbsolutiveAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		         </table>
</example>
</xsl:if>
		      
		   </section3>
</xsl:if>
		   
		</section2>
		<section2 id="sNPCompounds">
			<secTitle>Noun Compounds</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>Many languages are like English, in that they have noun modifiers.  It may seem like all nouns can also be used as adjectives, but a closer look reveals that true adjectives come before the noun modifier, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>large, round [syrup bottle]</langData>
<xsl:text> but not </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>*round, syrup large bottle</langData>
<xsl:text>.  Therefore, noun modifiers will be treated as compound nouns which are written as independent words.</xsl:text>
</p>
			<p contentType="ctComparativeIntro">
<xsl:text>In the English examples above, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>bottle</langData>
<xsl:text> is clearly the head noun rather than </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>syrup</langData>
<xsl:text>, because </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>syrup</langData>
<xsl:text> is restricting the type of </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>bottle</langData>
<xsl:text>, not the other way around.  In all compound nouns and noun modifier constructions in English, the head is the right-most noun in the series.</xsl:text>
</p>
		   <p>
<xsl:text>Noun compounds include those which are combined into a single word as well as those written as two or more independent words.  Some typical categories of noun compounds are exemplified here.</xsl:text>
</p>
		   <example num="xN.NPCompounds.10">
<table border="1">
		         <caption>
<xsl:text>Compounds for Body Parts</xsl:text>
</caption>
		         <tr>
		            <th>Compound</th>
		            <th>Gloss for each noun</th>
		            <th>Gloss for the compound</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/compBodyPartExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
		   <example num="xN.NPCompounds.12">
<table border="1">
		         <caption>
<xsl:text>Compounds for Kinship Terms</xsl:text>
</caption>
		         <tr>
		            <th>Compound</th>
		            <th>Gloss for each noun</th>
		            <th>Gloss for the compound</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/compKinshipExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
		   <example num="xN.NPCompounds.14">
<table border="1">
		         <caption>
<xsl:text>Compounds for Foods</xsl:text>
</caption>
		         <tr>
		            <th>Compound</th>
		            <th>Gloss for each noun</th>
		            <th>Gloss for the compound</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/compFoodExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
		   <example num="xN.NPCompounds.16">
<table border="1">
		         <caption>
<xsl:text>Compounds describing the Material the Noun is Constructed from</xsl:text>
</caption>
		         <tr>
		            <th>Compound</th>
		            <th>Gloss for each noun</th>
		            <th>Gloss for the compound</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/compMaterialExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
		   <example num="xN.NPCompounds.18">
<table border="1">
	<caption>
<xsl:text>Other Noun Compounds</xsl:text>
</caption>
		         <tr>
		            <th>Compound</th>
		            <th>Gloss for each noun</th>
		            <th>Gloss for the compound</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/compExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
		   
		   
			<xsl:if test="normalize-space(//np/@comp)='no'">
<p>
<xsl:text>As shown in the examples, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> does not  have any compound nouns or noun modifiers that are written as independent words.  They are all written as a single word with the head noun.  </xsl:text>
<xsl:choose>
			      <xsl:when test="//np/@compHeadMorpheme='left'">The left-most noun root is </xsl:when>
			      <xsl:when test="//np/@compHeadMorpheme='right'">The right-most noun root is </xsl:when>
			      <xsl:when test="//np/@compHeadMorpheme='either'">Either noun root may be </xsl:when>
			   </xsl:choose>
<xsl:text>head in these single-word compounds.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@comp)='yes'">
<p>
<xsl:text>As shown in the examples, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has compound nouns or noun modifiers that are written as independent words.  </xsl:text>
<xsl:choose>
				   <xsl:when test="//np/@compHead='left'">The left-most noun is </xsl:when>
				   <xsl:when test="//np/@compHead='right'">The right-most noun is </xsl:when>
				   <xsl:when test="//np/@compHead='either'">Either noun may be </xsl:when>
				</xsl:choose>
<xsl:text>the head in these multi-word compounds.  In the compounds which are written as a single word with the head noun,  </xsl:text>
<xsl:choose>
			      <xsl:when test="//np/@compHeadMorpheme='left'">the left-most noun root is </xsl:when>
			      <xsl:when test="//np/@compHeadMorpheme='right'">the right-most noun root is </xsl:when>
			      <xsl:when test="//np/@compHeadMorpheme='either'">either noun root may be </xsl:when>
			   </xsl:choose>
<xsl:text>the head.</xsl:text>
</p>
</xsl:if>
		</section2>

	</section1>

	

	
		
		
		
		
		
		
		
		
		
		
		
		
	
   
      
   	
   	
   
	
		
		
		
	
	
      
   
   
      
   
   
      
   
 
	
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
   
      
      
      
      
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
      
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
       
         
         
         
         
         
      
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
  
      
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	

	
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
		 
		
	
	
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
	
	
		
	
	
	
	
		
		
		
	
	
	
		
		
		
	
		
		
	
	
		
		
		

		
		
		
	
	
		
		
		
	
	
		
	
	
		
	
   
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
   
   
      
   
</xsl:template>
</xsl:stylesheet>
