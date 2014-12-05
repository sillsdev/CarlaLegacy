<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="n">
	<section1 id="sN">
		<secTitle>Noms</secTitle>
		<p>
<xsl:text>Les noms sont des mots qui décrivent principalement des personnes, des animaux, des endroits ou des choses.  Ils peuvent aussi être utilisés pour exprimer des idées, des pensées ou des émotions.</xsl:text>
</p>
		<p>
<xsl:text>Les sections suivantes traitent l’accord du nom, le cas et la possession en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Les types de noms composés permis en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont donnés dans la section </xsl:text>
<sectionRef sec="sNPCompounds" />
<xsl:text>.  Tous les éléments qui peuvent modifier des noms en syntagmes nominaux complets sont traités dans la section </xsl:text>
<sectionRef sec="sNP" />
<xsl:text>.</xsl:text>
</p>
		<section2 id="sNPAgr">
			<secTitle>Accord</secTitle>
		   <p contentType="ctPracticalIntro">
<xsl:text>L’accord entre au moins certains modificateurs et le mot principal peuvent être requis en le nombre, l’animéité, le genre, la classe ou autres éléments.</xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>Beaucoup de langues demandent un accord entre au moins certains modificateurs et le nom principal.  En plus de un accord numérique cet accord peut aussi inclure l’animéité, le genre, la classe ou autres éléments.</xsl:text>
</p>
			<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//np/@agreeNumber='no'"> il n’y a pas d’accord de nombre.  Au lieu de cela le marqueur du nombre vient du nombre ou du quantificateur.</xsl:when>
					<xsl:when test="//np/@agreeNumber='yes'"> les différents modificateurs nominaux sont en accord de nombre avec le nom principal.</xsl:when>
				</xsl:choose>
</p>
			<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<p>
<xsl:text>Les exemples qui montrent un accord de nombre dans des syntagmes nominaux en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> comprennent:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Il n’y a pas d’accord en nombre, animéité, genre, classe ou autres éléments entre les modificateurs et le nom principal. </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/agreeClass/@checked)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Les modificateurs et le nom principal ont un accord de classe. Voici des exemples qui montrent l’accord de classe dans les syntagmes nominaux en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Un classificateur qui a un accord de classe ou type du nom est présent avec des noms qui sont comptés ou spécifiés mais d’autres modificateurs ne sont pas marqués pour la classe comme montrés dans les exemples qui suivent:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Les exemples qui montrent un accord d’animéitéentre le nom principal et ses modificateurs dans des syntagmes nominaux en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> comprennent:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Les modificateurs et le nom principal ont un accord de genre en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> comme montrés dans les exemples qui suivent:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/agreeGender/@checked)='yes'">
<example num="xN.NPAgr.30">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeGenderExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeGenderExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeGenderExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeGenderExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPAgr.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Les syntagmes en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> montrent l’accord en  ___</xsl:text>
<xsl:value-of select="//np/agreeOtherFeat" />
<xsl:text>.  Voici des exemples de ce type d’accord:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
		</section2>
	   <section2 id="sNPCase">
	   <secTitle>Cas</secTitle>
	      <p contentType="ctPracticalIntro">
<xsl:text>Les noms et leurs modificateurs peuvent aussi être marqués pour le cas.  Les systèmes de cas aident à distinguer le rôle d’un nom ou pronom par rapport au verbe.</xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>Les noms et leurs modificateurs peuvent être marqués pour le cas.  Le système de cas le plus commun est nominatif-accusatif.  Le français a ce système bien que seulement les pronoms sont marqués pour le cas en français.  Dans un système nominatif-accusatif les sujets de verbes transitifs et intransitifs sont au cas nominatif, alors que les objets directs sont à l’accusatif.  Les possesseurs sont au cas génitif.  Les pronoms nominatifs en français sont: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>je, tu, il, elle, nous, vous, ils, elles</langData>
<xsl:text>.  Les pronoms à l’accusatif sont: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>me, te, le, la, nous, vous, les</langData>
<xsl:text>.  Les pronoms au génitif incluent: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mon, ma, mes, ton, ta, tes, son, sa, ses, notre, nos, votre, vos, leur, leurs</langData>
<xsl:text>.  Ainsi, nous disons </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ils le chassent</langData>
<xsl:text> et non </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Les chassent il</langData>
<xsl:text>. </xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text> Une langue possédant un système casuel de type nominatif-accusatif peut avoir un marqueur qui distingue les sujets-expérienceurs des sujets-agents.  Des verbes avec des sujets-expérienceurs sont</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>apparaître, voir, craindre être trouvé, vouloir, aimer</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>rire</langData>
<xsl:text>. </xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>
	         	Dans un système casuel ergatif-absolutif les sujets des verbes transitifs ont la marque de l’ergatif, tandis que les objets des verbes transitifs et les sujets des verbes intransitifs prennent la marque du cas absolutif.  Le cas des possesseurs n’est pas linguistiquement homogène.  Certaines langues qui possèdent un système casuel ergative-absolutif ont simplement de différents groupes de marqueurs d’accord verbal mais n’ont pas de marqueur pour les noms.  Ce type de marquage d’accord sera traité à la section </xsl:text>
<sectionRef sec="sIPAgr" />
<xsl:text>.</xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>
	         	Certaines langues sont encore plus complexes en ce sens qu’elles ont normalement un système casuel nominatif-accusatif, toutefois dans quelques circonstances grammaticales, par exemple un temps ou aspect particulier ou un élément d’accord pour une personne particulière le système de cas passe à l’ergatif-absolutif. Cela s’appelle « ergativité dédoublée ».</xsl:text>
</p>
	      <p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
	         	<xsl:when test="//typology/@case='none'"> il n’y a pas de système de cas.   Le même groupe exact de pronoms peut être utilisé dans n’importe quelle position dans la phrase et il n’y a pas de marquage sur les noms ou sur les modificateurs de noms basé sur leur position dans la phrase.</xsl:when>
	         	<xsl:when test="//typology/@case='nominative'"> a un système de cas nominatif-accusatif.   Les sujets de verbes transitifs et intransitifs sont marqués de la même façon et utilisent le même groupe de pronoms, mais les objets de verbes transitifs sont marqués différemment.</xsl:when>
	         	<xsl:when test="//typology/@case='ergative'"> a un système de cas ergative-absolutif.   Les sujets de verbes intransitifs et les onbjets de verbes transitifs sont marqués de la même façon, mais les sujets de verbes transitifs sont marqués différemment.</xsl:when>
	         	<xsl:when test="//typology/@case='split'"> a un système de cas dédoublé.   Normalement la langue suit le système casuel nominatif-accusatif, mais le système ergatif-absolutif s’utilise sous certaines conditions grammaticales.</xsl:when>
	         </xsl:choose>
<xsl:if test="normalize-space(//typology/@case)='split'"> 
	      		<xsl:text> Les conditions où le système casuel ergative-absolutif s’utilise sont ___</xsl:text>
<xsl:value-of select="//typology/splitConditions" />
	      		<xsl:text>.   </xsl:text>
	      	</xsl:if>
</p>
	      
	   	<p>
<xsl:text>Cela est montré dans les exemples suivants de phrases transitives avec des sujets agent où le sujet et l’objet sont des syntagmes nominaux:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Remarquez les formes des pronoms utilisés pour le sujet-agent et l’objet dans ces phrases transitives:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Dans les exemples intransitifs aves des syntagmes nominaux comme sujet, </xsl:text>
<xsl:choose>
	         	<xsl:when test="//typology/@case='nominative'">le marquage du cas correspond à celui des sujets dans les phrases transitives ci-dessus.</xsl:when>
	         	<xsl:when test="//typology/@case='ergative'">le marquage du cas correspond à celui des objets dans les phrases transitives ci-dessus.</xsl:when>
	         	<xsl:when test="//typology/@case='split'">le marquage du cas sur la plupart des sujets correspond à celui des sujets dans les phrases transitives ci-dessus, mais dans certaines situations il correspond à celui des objets dans les phrases transitives.</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Les exemples de phrases intransitives avec des pronoms indépendants comme sujets vérifient </xsl:text>
<xsl:choose>
	         	<xsl:when test="//typology/@case='none'">qu’il n’y a pas de distinction puisque les mêmes pronoms peuvent apparaître comme sujets des verbes transitifs et comme objets de verbes intransitifs.</xsl:when>
	         	<xsl:when test="//typology/@case='nominative'">que le même groupe de pronoms peut apparaître comme sujets des verbes transitifs et intransitifs, alors que des pronoms différents sont utilisés comme objets de verbes transitifs.</xsl:when>
	         	<xsl:when test="//typology/@case='ergative'">que le même groupe de pronoms peut apparaître comme sujets des verbes intransitifs et comme objets des verbes transitifs, alors que des pronoms différents sont utilisés comme sujets de verbes transitifs.</xsl:when>
	         	<xsl:when test="//typology/@case='split'">que le même groupe de pronoms peut normalement apparaître comme sujets des verbes transitifs et intransitifs, alors que des pronoms différents sont utilisés comme objets de verbes transitifs.  Qu’en certains cas, cependant, le même groupe de pronoms peut apparaître comme sujets des verbes intransitifs et comme objets des verbes transitifs, alors que des pronoms différents sont utilisés comme sujets de verbes transitifs.</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> </xsl:text>
<xsl:choose>
	      	<xsl:when test="//typology/@caseExperiencer='no'">le même marquage de cas et le même groupe de pronoms est utilisé pour les sujets agents et les sujets expérienceurs.</xsl:when>
	      	<xsl:when test="//typology/@caseExperiencer='yesObj'">les sujets expérienceurs utilisent le même marquage de cas et le même groupe de pronoms comme objets de verbes transitifs que le font les sujets agents.  Nous supposons que les sujets expérienceur ont le cas datif, comme objets indirects, ainsi les cas accusatif et datif sont marqués de la même façon dans cette langue.</xsl:when>
	      	<xsl:when test="//typology/@caseExperiencer='yesDat'">le marquage de cas et le groupe de pronoms utilisés par les sujets expérienceurs sont différents de ceux utilisés par les sujets et objets de verbes ayant un sujet agent.  Ceci est le cas datif, utilisé aussi pour les objets indirects.</xsl:when>
	      </xsl:choose>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseN)='no' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseN)='no'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> </xsl:text>
<xsl:choose>
	      	<xsl:when test="//typology/@caseExperiencer='no'">le même groupe de pronoms est utilisé pour les sujets agents et les sujets expérienceurs.</xsl:when>
	      	<xsl:when test="//typology/@caseExperiencer='yesObj'">les sujets expérienceurs utilisent et le même groupe de pronoms comme objets de verbes transitifs que le font les sujets agents.  Nous supposons que les sujets expérienceur ont le cas datif, comme objets indirects, ainsi les cas accusatif et datif sont marqués de la même façon dans cette langue.</xsl:when>
	      	<xsl:when test="//typology/@caseExperiencer='yesDat'">le groupe de pronoms utilisé par les sujets expérienceurs est différent de celui utilisé par les sujets et objets de verbes ayant un sujet agent.  Ceci est le cas datif, utilisé aussi pour les objets indirects.</xsl:when>
	      </xsl:choose>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@caseN)='yes'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> </xsl:text>
<xsl:choose>
	      	<xsl:when test="//typology/@caseExperiencer='no'">le même marquage de cas et le même groupe de pronoms est utilisé pour les sujets agents et les sujets expérienceurs.</xsl:when>
	      	<xsl:when test="//typology/@caseExperiencer='yesObj'">les sujets expérienceurs utilisent le même marquage et le même groupe de pronoms comme objets de verbes transitifs que le font les sujets agents.  Nous supposons que les sujets expérienceur ont le cas datif, comme objets indirects, ainsi les cas absolutif et datif sont marqués de la même façon dans cette langue.</xsl:when>
	      	<xsl:when test="//typology/@caseExperiencer='yesDat'">le marquage de cas et le groupe de pronoms utilisés par les sujets expérienceurs sont différents de ceux utilisés par les sujets et objets de verbes ayant un sujet agent.  Ceci est le cas datif, utilisé aussi pour les objets indirects.</xsl:when>
	      </xsl:choose>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@caseN)='no'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> </xsl:text>
<xsl:choose>
	      	<xsl:when test="//typology/@caseExperiencer='no'">le même groupe de pronoms est utilisé pour les sujets agents et les sujets expérienceurs.</xsl:when>
	      	<xsl:when test="//typology/@caseExperiencer='yesObj'">les sujets expérienceurs utilisent le même groupe de pronoms comme objets de verbes transitifs que le font les sujets agents.  Nous supposons que les sujets expérienceur ont le cas datif, comme objets indirects, ainsi les cas absolutif et datif sont marqués de la même façon dans cette langue.</xsl:when>
	      	<xsl:when test="//typology/@caseExperiencer='yesDat'">le groupe de pronoms utilisé par les sujets expérienceurs est différent de celui utilisé par les sujets et objets de verbes ayant un sujet agent.  Ceci est le cas datif, utilisé aussi pour les objets indirects.</xsl:when>
	      </xsl:choose>
</p>
</xsl:if>
	      
	   	<xsl:if test="normalize-space(//typology/@case)='none' and normalize-space(//typology/@caseExperiencer)='no'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> le même groupe de pronoms est utilisé pour les sujets agents et expérienceurs.</xsl:text>
</p>
</xsl:if>
	   	<xsl:if test="normalize-space(//typology/@case)='none' and normalize-space(//typology/@caseExperiencer)!='no'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> au moins certains des pronoms utilisés pour les expérienceurs sont différents de ceux utilisés pour les sujets agents.</xsl:text>
</p>
</xsl:if>
	      
	   	<p>
<xsl:text>Ceci se voit dans les exemples suivants de phrases transitives avec des verbes qui ont un sujet expérienceur, où le sujet et l’objet sont des syntagmes nominaux:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Remarquez les formes des pronoms utilisés pour les sujets expérienceurs et les objets dans ces phrases transitives:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Il y a des cas additionnels pour les relations grammaticales mineures qui peuvent être marquées sur les syntagmes nominaux dans les langues qui marquent le cas sur les noms. Les langues sans marquage de cas et celles qui montrent seulement le cas dans les pronoms expriment normalement ces relations grammaticales supplémentaires par des syntagmes adpositionnels.
	      </xsl:text>
</p>
	   	<p contentType="ctComparativeIntro">
<xsl:text>Il y a plus de cas à considérer à part ceux du sujet et de l’objet.  Ceux-ci peuvent inclure le cas ablatif pour une source ou une origine, le cas génitif pour types ou possesseurs, le cas datif pour les objets indirects, le cas instrumental pour les moyens, le cas locatif pour les endroits, le cas vocatif pour une adresse directe, et le cas oblique est parfois utilisé pour des relations grammaticales mineures.
	   		Ces cas supplémentaires sont en général marqués par des marqueurs de cas sur les syntagmes nominaux eux-mêmes dans les langues qui marquent normalement le cas sur les noms ou les syntagmes nominaux de même que sur les pronoms.  Pour les langues sans marquage de cas et celles qui montrent seulement le cas sur les pronoms, ces relations grammaticales supplémentaires sont normalement exprimées par des syntagmes adpositionnels.
	      </xsl:text>
</p>
	   	<xsl:if test="normalize-space(//typology/@case)='none'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> il n’y aucune sorte de distinctions de cas.  Les relations grammaticales mineures sont donc exprimées par des syntagmes </xsl:text>
<xsl:choose>
	   		<xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
	   		<xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
	   		<xsl:when test="//pp/@pPos='both'">prépositionnels or postpositionnels</xsl:when>
	   		<xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
	   	</xsl:choose>
<xsl:text> plutôt que par des syntagmes nominaux (voir la section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
	   	<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='no'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> les distinctions de cas ne sont marquées ni sur les noms ni sur les syntagmes nominaux, seul le pronom distingue le cas.  Les relations grammaticales mineures sont donc exprimées par des syntagmes </xsl:text>
<xsl:choose>
	      	<xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
	      	<xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
	      	<xsl:when test="//pp/@pPos='both'">prépositionnels or postpositionnels</xsl:when>
	      	<xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
	   	</xsl:choose>
<xsl:text> plutôt que par des syntagmes nominaux (voir la section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).  Les distinctions dans les pronoms seront décrites dans la section </xsl:text>
<sectionRef sec="sPronPersonal" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
	   	<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='yes'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> les cas est marqué et sur les pronoms et sur les noms ou syntagmes nominaux. </xsl:text>
<xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseDefault)='nominative' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseDefault)='nominative'">
	         	<xsl:text>  Le cas nominatif est le cas par défaut (non marqué). </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='yes' and normalize-space(//np/caseWordOther/@checked)='no'">	            
	      	<xsl:text>Les marqueurs de cas sont écrits comme un mot indépendant et se trouvent </xsl:text>
	      	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
	      	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
	      	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
	      	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>d’un côté ou de l’autre du</xsl:text>
</xsl:if>
	      	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
	      	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
	      	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>d’un côté ou de l’autre ou des deux côtés du</xsl:text>
</xsl:if>
	      	<xsl:text> reste du syntagme nominal.  </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='yes' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'"> 
	         	<xsl:text>Les marqueurs de cas sont écrits comme un mot indépendant et se trouvent ___</xsl:text>
<xsl:value-of select="//np/caseWordOther" />
	            <xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='yes' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBefore/@checked)='yes' or normalize-space(//np/@caseWord)!='no' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' or normalize-space(//np/@caseWord)!='no' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
	         	<xsl:text>Les marqueurs de cas sont écrits comme un mot indépendant et se trouvent </xsl:text>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>d’un côté ou de l’autre du</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>d’un côté ou de l’autre ou des deux côtés du</xsl:text>
</xsl:if>
	         	<xsl:text> reste du syntagme nominal, et peuvent se trouver ___</xsl:text>
<xsl:value-of select="//np/caseWordOther" />
<xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='no'">	            
	         	<xsl:text>Certains des marqueurs de cas sont écrits comme un mot indépendant et se trouvent </xsl:text>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>d’un côté ou de l’autre du</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>d’un côté ou de l’autre ou des deux côtés du</xsl:text>
</xsl:if>
	         	<xsl:text> reste du syntagme nominal.  </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'"> 
	         	<xsl:text>Certains des marqueurs de cas sont écrits comme un mot indépendant et se trouvent ___</xsl:text>
<xsl:value-of select="//np/caseWordOther" />
	            <xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBefore/@checked)='yes' or normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' or normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
	         	<xsl:text>Certains des marqueurs de cas sont écrits comme un mot indépendant et se trouvent </xsl:text>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>d’un côté ou de l’autre du</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>d’un côté ou de l’autre ou des deux côtés du</xsl:text>
</xsl:if>
	         	<xsl:text> reste du syntagme nominal, et peuvent se trouver ___</xsl:text>
<xsl:value-of select="//np/caseWordOther" />
<xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some'">
<xsl:text>D’autres </xsl:text>
	   			<xsl:if test="normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>marqueurs de cas se rattachent  au début du mot initial dans le syntagme nominal.</xsl:text>
</xsl:if>
	   			<xsl:if test="normalize-space(//np/caseAttachesEnclitic/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>marqueurs de cas se rattachent  à la fin du mot final dans le syntagme nominal.</xsl:text>
</xsl:if>
	   			<xsl:if test="normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>marqueurs de cas se rattachent  au début du mot initial et d’autres se rattachent  à la fin du mot final dans le syntagme nominal.</xsl:text>
</xsl:if>
	   			<xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>les marqueurs de cas sont des préfixes qui se rattachent au nom  principal.</xsl:text>
</xsl:if>
	   			<xsl:if test="normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>les marqueurs de cas sont des suffixes qui se rattachent au nom  principal.</xsl:text>
</xsl:if>
	   			<xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>les marqueurs de cas sont des préfixes et certains cont des suffixes qui se rattachent au nom  principal.</xsl:text>
</xsl:if>
	   			<xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes'">
<xsl:text>les marqueurs de cas sont des clitiques qui se rattachent ou au début du mot initial ou  à la fin du mot final dans le syntagme nominal et certains sont des affixes qui se rattachent au nom  principal.</xsl:text>
</xsl:if>
	   			<xsl:if test="normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes'">
<xsl:text>  Certains peuvent s’attacher aussi ___</xsl:text>
<xsl:value-of select="//np/caseAttachesOther" />
	               <xsl:text>.   </xsl:text>
</xsl:if>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'"> 
	         	<xsl:text>Certains des marqueurs de cas de rattachent ___</xsl:text>
<xsl:value-of select="//np/caseAttachesOther" />
	            <xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='no'">  <xsl:text></xsl:text>
	         	<xsl:if test="normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>Les marqueurs de cas se rattachent  au début du mot initial dans le syntagme nominal.</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseAttachesEnclitic/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>Les marqueurs de cas se rattachent  à la fin du mot final dans le syntagme nominal.</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>Certains des marqueurs de cas se rattachent  au début du mot initial et d’autres se rattachent  à la fin du mot final dans le syntagme nominal.</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>Les marqueurs de cas sont des préfixes qui se rattachent au nom  principal.</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>Les marqueurs de cas sont des suffixes qui se rattachent au nom  principal.</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>Certains des marqueurs de cas sont des préfixes et d’autres sont des suffixes qui se rattachent au nom  principal.</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes'">
<xsl:text>Certains des marqueurs de cas sont des clitiques qui se rattachent ou au début du mot initial ou à la fin du mot final dans le syntagme nominal et certains sont des affixes qui se rattachent au nom  principal.</xsl:text>
</xsl:if>
	         	<xsl:if test="normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes'">
<xsl:text>  Certains aussi peuvent se rattacher ___</xsl:text>
<xsl:value-of select="//np/caseAttachesOther" />
	               <xsl:text>.   </xsl:text>
</xsl:if>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='no' and normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'"> 
	         	<xsl:text>Les marqueurs de cas se rattachent ___</xsl:text>
<xsl:value-of select="//np/caseAttachesOther" />
	            <xsl:text>.   </xsl:text>
	         </xsl:if>
</p>
</xsl:if>
	   	<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='yes'">
<p>
<xsl:text>Les marqueurs de cas utilisés sur des noms ou le syntagmes nominaux en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont montrés dans le tableau ci-dessous.</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='yes'">
<example num="xCase">
<table border="1">
	            <caption>
	            	<xsl:text>Marqueurs de cas</xsl:text>
	            </caption>
	            <tr>
	            	<th>Morphèmes</th>
	               <th>Cas</th>
	            	<th>Utilisation</th>
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
	               	<xsl:text>nominatif</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>sujets</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	               	<xsl:text>nominatif</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>sujets</xsl:text>
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
	               	<xsl:text>accusatif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>objets directs et autre usages</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	               	<xsl:text>accusatif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>objets directs et autre usages</xsl:text>
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
	               	<xsl:text>ergatif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>sujets de verbes transitifs</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	               	<xsl:text>ergatif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>sujets de verbes transitifs</xsl:text>
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
	               	<xsl:text>ergatif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>sujets de verbes transitifs et possesseurs</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	               	<xsl:text>ergatif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>sujets de verbes transitifs et possesseurs</xsl:text>
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
	               	<xsl:text>absolutif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>sujets de verbes intransitifs et objets de verbes transitifs</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	               	<xsl:text>absolutif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>sujets de verbes intransitifs et objets de verbes transitifs</xsl:text>
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
	               	<xsl:text>absolutif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>sujets de verbes intransitifs et objets de verbes transitifs et possesseurs</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	               	<xsl:text>absolutif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>sujets de verbes intransitifs et objets de verbes transitifs et possesseurs</xsl:text>
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
	               	<xsl:text>genitif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>possesseurs</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	               	<xsl:text>genitif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>possesseurs</xsl:text>
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
	               	<xsl:text>datif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>objets indirects</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	               	<xsl:text>datif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>objets indirects</xsl:text>
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
	               	<xsl:text>datif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>objets indirects et sujets expérienceurs</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	               	<xsl:text>datif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>objets indirects et sujets expérienceurs</xsl:text>
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
	                  <xsl:text>ablatif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>source ou origine</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	                  <xsl:text>ablatif</xsl:text>
	               </td>
<td align="left">
	               	<xsl:text>source ou origine</xsl:text>
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
	                  	<xsl:text>instrument, moyen ou agence</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	                     <xsl:text>instrumental</xsl:text>
	                  </td>
<td align="left">
	                  	<xsl:text>instrument, moyen ou agence</xsl:text>
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
	                        <xsl:text>locatif</xsl:text>
	                     </td>
<td align="left">
	                        <xsl:text>lieu</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	                        <xsl:text>locatif</xsl:text>
	                     </td>
<td align="left">
	                        <xsl:text>lieu</xsl:text>
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
	                           <xsl:text>vocatif</xsl:text>
	                        </td>
<td align="left">
	                        	<xsl:text>adresse directe</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	                           <xsl:text>vocatif</xsl:text>
	                        </td>
<td align="left">
	                        	<xsl:text>adresse directe</xsl:text>
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
	                           	<xsl:text>relation grammaticale mineure générale</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	                              <xsl:text>oblique</xsl:text>
	                           </td>
<td align="left">
	                           	<xsl:text>relation grammaticale mineure générale</xsl:text>
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
	                                 <xsl:text>autre</xsl:text>
	                              </td>
<td align="left">
	                              	<xsl:text>autres marqueurs spécifiques</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
	                                 <xsl:text>autre</xsl:text>
	                              </td>
<td align="left">
	                              	<xsl:text>autres marqueurs spécifiques</xsl:text>
	                              </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>	      
	   </section2>
	   
		<section2 id="sNPoss">
			<secTitle>Possesseurs</secTitle>
			<p>
<xsl:text>La possession peut s’exprimer par un pronom, par un simple nom ou par un syntagme nominal complet (voir la section </xsl:text>
<sectionRef sec="sNPPoss" />
<xsl:text>).  Le cas et les caractéristiques d’accord sur des noms possessés ou sur des noms agissant comme possesseurs sont traités ici.</xsl:text>
<xsl:if test="normalize-space(//np/@possAbsolutive)='yes'">
<xsl:text>  The special affix that occurs on nouns when they are not possessed or pluralized is also discussed.</xsl:text>
</xsl:if>
</p>
			<section3 id="sNPPossCase">
				<secTitle>Cas du possesseur</secTitle>
				<xsl:if test="normalize-space(//typology/@case)='none'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, comme discuté dans la section </xsl:text>
<sectionRef sec="sNPCase" />
<xsl:text>,  il n’ya pas de système casuel. Il n’y a donc pas de marquage sur les noms, ni groupe distinct de pronoms utilisés pour les possesseurs.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='nominative'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> on utilise le système casuel nominatif-accusatif normal, et les possesseurs sont marqués par le cas génitif.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='split'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> les possesseurs sont marqués par le cas génitif, suivant la partie normale nominatif-accusatif du système de cas dédoublé.  Dans les parties qui montrent une ergativité dédoublée,  les possesseurs sont marqués avec </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCaseErg='ergative'">le cas ergative, le même marquage que les sujets de verbes transitifs.</xsl:when>
						<xsl:when test="//np/@possCaseErg='absolutive'">le cas absolutif, le même marquage que les sujets de verbes intransitifs et le même marquage que les objets de verbes transitifs.</xsl:when>
						<xsl:when test="//np/@possCaseErg='genitive'">le cas génitif aussi.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='ergative'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> on utilise le système casuel ergatif-absolutif, et les possesseurs sont marqués par </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCaseErg='ergative'">le cas ergatif, le même marquage que les sujets de verbes transitifs.</xsl:when>
						<xsl:when test="//np/@possCaseErg='absolutive'">le cas absolutif, le même marquage que les sujets de verbes intransitifs et les objets de verbes transitifs.</xsl:when>
						<xsl:when test="//np/@possCaseErg='genitive'">le cas génitif, un parquage distinct pour les possesseurs.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none'">
<p contentType="ctPracticalIntro">
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
			      	<xsl:when test="//np/@possNounCaseChange='no'">la fonction grammaticale du nom principal relatif au verbe détermine son cas, non la présence d’un possesseur.</xsl:when>
			      	<xsl:when test="//np/@possNounCaseChange='yes'">le cas du nom principal s’accorde avec le cas du possesseur lorsqu’un possesseur est présent.</xsl:when>
			      </xsl:choose>
<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
<xsl:text> S’il y a un modificateur adjectival dans le syntagme nominal, le cas du nom principal change </xsl:text>
			      <xsl:choose>
			      	<xsl:when test="//np/@adjpCaseChange='no'">seulement quand un  possesseur est present; cependant, l’adjectif peut/doit aussi porter ce cas.</xsl:when>
			      	<xsl:when test="//np/@adjpCaseChange='yes'">pour s’accorder avec le cas normal d’un possesseur même si seulement un modificateur adjectival est présent.</xsl:when>
			      </xsl:choose>
			      </xsl:if>
<xsl:if test="normalize-space(//np/@adjpCaseAffix)!='no' and normalize-space(//np/@adjpCaseChange)='yes'">
			      	<xsl:text> Lorsqu’un </xsl:text>
			      	<xsl:choose>
			      		<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">suffixe</xsl:when>
			      		<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">préfixe</xsl:when>
			      	</xsl:choose>
			      	<xsl:text> explicite </xsl:text>
			      	<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//typology/@case)='nominative'">
			      		<xsl:text>génitif </xsl:text>
			            </xsl:if>
			            <xsl:if test="normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
			               <xsl:text>ou </xsl:text>
			            </xsl:if>
			            <xsl:text></xsl:text>
			            <xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
			               <xsl:text>ergatif </xsl:text>
			            </xsl:if>
			            <xsl:text></xsl:text>
			            <xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
			               <xsl:text>absolutif </xsl:text>
			            </xsl:if>
			      	<xsl:text> est présent sur le nom principal, cela indique qu’un modificateur adjectival ou/et un possesseur doit être présent dans le syntagme.  Si l’adjectif set marqué avec ce </xsl:text>
			      	<xsl:choose>
			      		<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">suffixe</xsl:when>
			      		<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">préfixe</xsl:when>
			      	</xsl:choose>
			      	<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//typology/@case)='nominative'">
			      		<xsl:text> génitif </xsl:text>
			            </xsl:if>
			            <xsl:if test="normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
			               <xsl:text>ou</xsl:text>
			            </xsl:if>
			            <xsl:text></xsl:text>
			            <xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
			               <xsl:text> ergatif </xsl:text>
			            </xsl:if>
			            <xsl:text></xsl:text>
			            <xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
			               <xsl:text> absolutif </xsl:text>
			            </xsl:if>
			            <xsl:text></xsl:text>
			      	<xsl:text> un autre adjectif et/ou un possesseur doit aussi être présent.</xsl:text>
			         </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)!='none'">
<p contentType="ctComparativeIntro">
<xsl:text>En certaines langues, dans un syntagme nominal possessé le nom principal et ses modificateurs s’accordent avec le cas du possesseur.  En d’autres langues, le possesseur est marqué avec son propre cas, par exemple le génitif, tandis que le nom principal est marqué d’un cas selon sa position relatif au verbe, nominatif ou accusative, ergative ou absolutif, selon le système casuel.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none'">
<p contentType="ctComparativeIntro">
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possNounCaseChange='no'">la function grammaticale du nom principal relatif au verbe determine son cas, non la presence d’un possesseur.</xsl:when>
						<xsl:when test="//np/@possNounCaseChange='yes'">le cas du nom principal s’accorde avec le cas du possesseur lorsqu’un possesseur est présent.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>Des langues comme </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> qui changent le cas du nom principal quand un posssesseur est présent changent aussi normalement le cas des adjectifs pour s’y accorder. Certaines langues de ce type changent le cas du nom principal quand un modificateur adjectival seulement est present, même s’il n’y a pas de possesseur.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> e cas du nom principal </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@adjpCaseChange='no'">ne change que quand un possesseur est present, bien que dans cette situation un adjectif intervenant peut/doit aussi porter ce cas.</xsl:when>
						<xsl:when test="//np/@adjpCaseChange='yes'">change pour s’accorder avec le cas normal d’un possesseur même si un modificateur adjectival seulement est present.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@adjpCaseChange)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>De plus, certaines langues de ce dernier type ont un affixe explicite qui marque le génitif (ou le cas normal des possesseurs) sur le nom principal pour indiquer qu’il doit y avoir soit un adjectif ou un possesseur dans ce syntagme nominal. Dans cette situation, l’adjectif et/ou le possesseur sera aussi au génitif (ou au cas normal des possesseurs); cependant, le marquage de cas ne sera pas explicite sur le modificateur le plus haut dans le syntagme nominal.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@adjpCaseChange)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> le marquage de cas </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@adjpCaseAffix='no'">n’est pas traité avec un affixe.</xsl:when>
						<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">est  traité de cette façon distinctive.  </xsl:when>
						<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">est  traité de cette façon distinctive.  </xsl:when>
					</xsl:choose>
<xsl:if test="normalize-space(//np/@adjpCaseAffix)!='no' and normalize-space(//np/@adjpCaseChange)='yes'">
						<xsl:text>Lorsque le  </xsl:text>
						<xsl:choose>
							<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">suffixe</xsl:when>
							<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">préfixe</xsl:when>
						</xsl:choose>
						<xsl:text> explicite </xsl:text>
						<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//typology/@case)='nominative'">
							<xsl:text>génitif </xsl:text>
						</xsl:if>
						<xsl:if test="normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
							<xsl:text>ou </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
							<xsl:text>ergatif </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
							<xsl:text>absolutif </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:text> est présent sur le nom principal cela indique qu’un modificateur adjectival ou/et un possesseur doit être présent dans le syntagme.  Si l’adjectif set marqué avec ce </xsl:text>
						<xsl:choose>
							<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">suffixe </xsl:when>
							<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">préfixe </xsl:when>
						</xsl:choose>
						<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//typology/@case)='nominative'">
							<xsl:text>génitif</xsl:text>
						</xsl:if>
						<xsl:if test="normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
							<xsl:text> ou </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
							<xsl:text>ergatif</xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
							<xsl:text>absolutif</xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:text>, un autre adjectif et/ou un possesseur doit aussi être présent.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			</section3>
			
			<section3 id="sNPPossAgreement">
				<secTitle>Accord du possesseur</secTitle>
				<p>
<xsl:text>L’accord du possesseur vient normalement sous deux formes de base:</xsl:text>
</p>
				<ul>
					<li>
						<xsl:text>Un affixe qui se trouve sur des noms alienablement possédés pour indiquer qu’ils sont possessés et par conséquent qu’ils doivent avoir un possesseur dans le syntagme nominal.  Les noms inalienablement possédés ne demandent pas de marquage, mais doivent toujours avoir un possesseur.  Ceux-ci incluent, mais ne sont pas limités à, des termes de parenté ou des parties du corps.</xsl:text>
					</li>
					<li>
						<xsl:text>Un affixe qui s’accorde avec le possesseur (ou éventuellement exprime le possesseur par lui-même). </xsl:text>
					</li>
				</ul>
				<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possAlienable='no'"> il n’y a pas de distinction</xsl:when>
						<xsl:when test="//np/@possAlienable='yes'"> il y a une distinction</xsl:when>
					</xsl:choose>
<xsl:text> entre les noms possessés alienables et inalienables.  </xsl:text>
<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
						<xsl:text>L’affixe qui marque les noms possessés alienables quand ils ont un possesseur est:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
<example num="xN.NPoss.NPPossAgreement.10">
<table border="1">
					<tr>
						<th>Affixe possessif</th>
						<th>Glose</th>
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
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					</table>
</example>
</xsl:if>
				<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> les noms </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possAgr='no'">ne sont pas</xsl:when>
						<xsl:when test="//np/@possAgr='yes'">sont</xsl:when>
					</xsl:choose>
<xsl:text> marqués avec un affixe pronominal ou clitique qui s’accorde avec le possesseur ou exprime le possesseur par lui-même.  </xsl:text>
<xsl:if test="normalize-space(//np/@possAgr)='yes'">
						<xsl:text>Voir les pronoms personnels dépendants utilisés pour des possesseurs donnés dans la section </xsl:text>
<sectionRef sec="sPronPersonal" />
<xsl:text>. </xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<p>
<xsl:text>Voir la section </xsl:text>
<sectionRef sec="sNPPoss" />
<xsl:text> pour obtenir des exemples de noms possédés.</xsl:text>
</p>
			</section3>
		   <xsl:if test="normalize-space(//np/@possAbsolutive)='yes'">
<section3 id="sNPossAbsolutive">
		   	<secTitle>Marquage absolutif</secTitle>
		   	<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ont un affixe qui se trouve sur les noms quand ils ne sont pas possédés ou pluralisés ou éventuellement quand il n’y a pas de modificateur.  Cet affixe est connu comme marqueur absolutif, mais le nom est en rapport avec le marqueur du cas absolutif utilisé dans des langues avec un système de cas ergatif-absolutif. 
		   	</xsl:text>
</p>
		   	<p>
<xsl:text>Les formes de l’affixe utilisé en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont:</xsl:text>
</p>
		      <xsl:if test="normalize-space(//np/@possAbsolutive)='yes'">
<example num="xN.NPoss.NPossAbsolutive.8">
<table border="1">
		            <tr>
		               <th>Affixes absolutifs</th>
		               <th>Glose</th>
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
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
			<secTitle>Composés nominaux</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>Beaucoup de langues sont comme l’anglais dans le fait qu’elles ont des modificateurs nominaux.  Il peut sembler que tous les noms peuvent être utilisés comme adjectifs, mais en y regardant de plus près il se révèle que les varais adjectifs viennent avant le modificateur nominal comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>large, round [syrup bottle]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> (une grande bouteille à syrop ronde)</xsl:text>
</gloss>
<xsl:text> mais non pas  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>*round, syrup large bottle</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> (ronde, syrop grande bouteille)</xsl:text>
</gloss>
<xsl:text>.  Les modificateurs nominaux seront donc traités de noms composés qui s’écrivent comme mots indépendents.</xsl:text>
</p>
			<p contentType="ctComparativeIntro">
<xsl:text>Dans les exemples en anglais ci-dessus, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>bottle</langData>
<xsl:text> est clairement le nom principal plutôt que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>syrup</langData>
<xsl:text>, parce que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>syrup</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « syrop »</xsl:text>
</gloss>
<xsl:text> restreint le type de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>bottle</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « bouteille »</xsl:text>
</gloss>
<xsl:text> et non vice versa.  Dans tous les noms composés et les constructions modificateur nominal en anglais, le principal est le nom le plus à droite dans la série.</xsl:text>
</p>
			<p contentType="ctComparativeIntro">
<xsl:text>Par contraste, en français de tels exemples sont plus rares.  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Kitchen table</langData>
<xsl:text> peut être traduit </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>table de cuisine</langData>
<xsl:text> s’il s’agit d’un type de meuble en général, ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>la table de la cuisine</langData>
<xsl:text> si c’est une table en particulier, celle dans la cuisine. </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Table cuisine</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cuisine table</langData>
<xsl:text> ne seraient pas permis. Certains noms peuvent agir en adjective - par exemple, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>panneau indicateur</langData>
<xsl:text> mais </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>indicateur de vitesse</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>Les noms composés incluent ceux qui sont combinés dans un seul mot de même que ceux qui sont écrits comme deux mots indépendants ou plus.  Voici des exemples de quelques catégories typiques de noms composés.</xsl:text>
</p>
		   <example num="xN.NPCompounds.12">
<table border="1">
		      	<caption>
<xsl:text>Noms composés pour les parties du corps </xsl:text>
</caption>
		         <tr>
		         	<th>Nom composé</th>
		         	<th>Glose pour chaque nom</th>
		         	<th>Glose pour chaque nom composé</th>
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
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:text>Noms composés pour les termes de parenté</xsl:text>
</caption>
		         <tr>
		         	<th>Nom composé</th>
		         	<th>Glose pour chaque nom</th>
		         	<th>Glose pour chaque nom composé</th>
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
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:text>Noms composés pour la nourriture</xsl:text>
</caption>
		         <tr>
		         	<th>Nom composé</th>
		         	<th>Glose pour chaque nom</th>
		         	<th>Glose pour chaque nom composé</th>
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
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:text>Noms composés qui décrivent le matériel dont le nom est construit</xsl:text>
</caption>
		         <tr>
		         	<th>Nom composé</th>
		         	<th>Glose pour chaque nom</th>
		         	<th>Glose pour chaque nom composé</th>
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
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
		   <example num="xN.NPCompounds.20">
<table border="1">
		      	<caption>
<xsl:text>Autres noms composés</xsl:text>
</caption>
		         <tr>
		         	<th>Nom composé</th>
		         	<th>Glose pour chaque nom</th>
		         	<th>Glose pour chaque nom composé</th>
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
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
		   
		   
			<xsl:if test="normalize-space(//np/@comp)='no'">
<p>
<xsl:text>Comme le montrent ces exemples, en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> il n’y a pas de noms composés ou de modificateurs de nom qui sont écrits comme mots indépendants.  Ils sont tous écrits comme un mot simple avec le nom principal.  </xsl:text>
<xsl:choose>
			   	<xsl:when test="//np/@compHeadMorpheme='left'">La racine du nom à gauche est </xsl:when>
			   	<xsl:when test="//np/@compHeadMorpheme='right'">La racine du nom à droite est </xsl:when>
			   	<xsl:when test="//np/@compHeadMorpheme='either'">La racine du nom à gauche ou celle à droite peut être </xsl:when>
			   </xsl:choose>
<xsl:text>le nom principal dans ces composés à mot unique.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@comp)='yes'">
<p>
<xsl:text>Comme le montrent ces exemples, en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> il y a des noms composés ou de modificateurs de nom qui sont écrits comme mots indépendants.  </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@compHead='left'">Le nom à gauche est </xsl:when>
					<xsl:when test="//np/@compHead='right'">Le nom à droite est </xsl:when>
					<xsl:when test="//np/@compHead='either'">Le nom à gauche ou celui à droite peut être </xsl:when>
				</xsl:choose>
<xsl:text>le nom principal dans ces composés à mots multiples.  Dans les noms composés qui sont écrits comme mot unique avec le nom principal,  </xsl:text>
<xsl:choose>
			   	<xsl:when test="//np/@compHeadMorpheme='left'">la racine du nom à gauche est </xsl:when>
			   	<xsl:when test="//np/@compHeadMorpheme='right'">la racine du nom à droite est </xsl:when>
			   	<xsl:when test="//np/@compHeadMorpheme='either'">la racine du nom à gauche ou celle à droite peut être </xsl:when>
			   </xsl:choose>
<xsl:text>le nom principal.</xsl:text>
</p>
</xsl:if>
		</section2>

	</section1>

	

	
		
		
		
		
		
		
		
		
		
		
		
		
	
   
      
   	
   	
   
	
		
		
		
	
	
      
   
   
      
   
   
      
   
 
	
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
   
      
      
      
      
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
      
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
       
         
         
         
         
         
      
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
  
      
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	

	
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
		 
		
	
	
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
	
	
		
	
	
	
	
		
		
		
	
	
	
		
		
		
	
		
		
	
	
		
		
		

		
		
		
	
	
		
		
		
	
	
		
	
	
		
	
   
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
   
   
      
   
</xsl:template>
</xsl:stylesheet>
