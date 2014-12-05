<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="np">
	<section1 id="sNP">
		<secTitle>Syntagmes nominaux</secTitle>
		<p>
<xsl:text>Les syntagmes nominaux peuvent être très complexes.  Cette section se concentre sur la mise en ordre des modificateurs qui sont écrits comme mots indépendants permis dans les syntagmes nominaux avec des noms communs comme unité lexicale principale.  La modification par le articles, les démonstratifs, les possesseurs, les quantificateurs et les mots de degré, les syntagmes adjectivaux et syntagmes </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
				<xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
				<xsl:when test="//pp/@pPos='both'">prépositionnels et/ou postpositionnels</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">prépositionnels et/ou postpositionnels</xsl:when>
			</xsl:choose>
<xsl:text> tout ceci est considéré ici.  Les participes et les gérondifs sont traités à la fin de cette section, mais voir section </xsl:text>
<sectionRef sec="sNPCompounds" />
<xsl:text> pour les noms composés s’ils sont écrits comme mots seuls ou non.  Les syntagmes nominaux avec des noms propres en tête sont discutées dans la section </xsl:text>
<sectionRef sec="sProp" />
<xsl:text> et celles avec des pronoms de tous les types et quantificateurs seront traitées dans les sections </xsl:text>
<sectionRef sec="sPronNP" />
<xsl:text> et </xsl:text>
<sectionRef sec="sQPPartitive" />
<xsl:text>.  Les propositions relatives qui viennent normalement à la fin d’un syntagme nominal sont traités dans la section </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>.</xsl:text>
</p>
		<p>
<xsl:text>Nous commencerons avec les modificateurs qui ont la plus grande portée et nous approcherons ensuite vers le nom.</xsl:text>
</p>
		<section2 id="sNPDegree">
			<secTitle>Quantificateurs de grande portée et de mots de degré</secTitle>
			<p contentType="ctPracticalIntro">
<xsl:text>Les quantificateurs de grande portée et les mots de degré qui modifient le syntagme nominal entier ont été discutés dans la section </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text>. </xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>Les quantificateurs de grande portée et les mots de degré qui modifient le syntagme nominal entier, tels que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tout</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>presque</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>seulement</langData>
<xsl:text>, ont été discutés dans la section </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text>. </xsl:text>
</p>
		   
		   <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@npDegreeClassifier)='yes'">
<p>
<xsl:text>Le tableau suivant revise la façon dont les quantificateurs de grande portée et les mots de degré qui modifient le syntagme nominal entier sone exprimés en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Les formes montrées dans le tableau sont les racines; chacune peut apparaître avec le classificateur approprié attaché.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//qp/@npDegreeClassifier)!='yes'">
<p>
<xsl:text>Le tableau suivant revise la façon dont les quantificateurs de grande portée et les mots de degré qui modifient le syntagme nominal entier sone exprimés en </xsl:text>
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
		   <example num="xNP.NPDegree.12">
<table border="1">
		         <tr>
		         	<th>Morphèmes</th>
		            <th>Glose</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//qp/all),'.','')" />
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
<xsl:text>tout</xsl:text>
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
<xsl:text>tout</xsl:text>
</gloss>
		            </td>
</tr>
</xsl:otherwise>
</xsl:choose>
		         <xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//qp/almost),'.','')" />
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
		               <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>presque</xsl:text>
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
<xsl:text>presque</xsl:text>
</gloss>
		            </td>
</tr>
</xsl:otherwise>
</xsl:choose>
		         <xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//qp/only),'.','')" />
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
		               <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>seulement</xsl:text>
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
<xsl:text>seulement</xsl:text>
</gloss>
		            </td>
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
			<xsl:if test="normalize-space(//qp/@npDegree)='no'">
<p>
<xsl:text>Ces éléments ne sont pas exprimés en tant que mots indépendants qui modifient le syntagme nominal entier. Au lieu de cela ils s’attachent tous à un autre mot dans le syntagme nominal.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='some'">
<p>
<xsl:text>Certains de ces éléments ne sont pas exprimés en tant que mots indépendants qui modifient le syntagme nominal entier. Au lieu de cela ils s’attachent à un autre mot dans le syntagme nominal.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes'">
<p>
<xsl:text>Des exemples de formes clitiques inclues dans les syntagmes nominaux entiers sont:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes'">
<example num="xNP.NPDegree.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/npDegreeCliticExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/npDegreeCliticExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/npDegreeCliticExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/npDegreeCliticExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPDegree.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPDegree.20.1</xsl:text>
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
			<xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes'">
<p>
<xsl:text>Des exemples de formes d’affixes inclues dans des syntagmes nominaux entiers sont:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes'">
<example num="xNP.NPDegree.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/npDegreeAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/npDegreeAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/npDegreeAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/npDegreeAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPDegree.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPDegree.24.1</xsl:text>
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
			<xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes'">
<p>
<xsl:text>Des exemples de formes qui s’attachent comme permis en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> inclus dans les syntagmes nominaux entiers sont:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes'">
<example num="xNP.NPDegree.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/npDegreeOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/npDegreeOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/npDegreeOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/npDegreeOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPDegree.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPDegree.28.1</xsl:text>
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
			
		   <xsl:if test="normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='some'">
<p>
<xsl:text>Les quantificateurs de grande portée et les mots de degré qui sont des mots indépendants se trouvent </xsl:text>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosAfter/@checked)='no' and normalize-space(//qp/npDegreePosBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='no' and normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='no' and normalize-space(//qp/npDegreePosAfter/@checked)='no' and normalize-space(//qp/npDegreePosBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosAfter/@checked)='no' and normalize-space(//qp/npDegreePosBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='no' and normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosBoth/@checked)='yes'">
<xsl:text>après ou des deux côtes du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosOther/@checked)='no'">
<xsl:text> reste de la syntagme nominal.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='no' and normalize-space(//qp/npDegreePosAfter/@checked)='no' and normalize-space(//qp/npDegreePosBoth/@checked)='no' and normalize-space(//qp/NPDegreePosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//qp/npDegreePosOther" />
<xsl:text>.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosOther/@checked)='yes' or normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosOther/@checked)='yes' or normalize-space(//qp/npDegreePosBoth/@checked)='yes' and normalize-space(//qp/npDegreePosOther/@checked)='yes'">
<xsl:text> reste du syntagme nominal et peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//qp/npDegreePosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
</p>
</xsl:if>
		   
		   <xsl:if test="normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='some'">
<p>
<xsl:text>Des exemples de formes de mot indépendant inclus dans les syntagmes nominaux entiers sont:</xsl:text>
</p>
</xsl:if>                        
		   <example num="xNP.NPDegree.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPDegree.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPDegree.34.1</xsl:text>
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
			
			<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//qp/@npDegree)='yes' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//qp/@npDegree)='some'">
<p>
<xsl:text>Dans ces syntagmes nominaux avec les mots qui signifent « tout », « presque » ou « seulement » </xsl:text>
<xsl:choose>
<xsl:when test="//np/@classifierPresent='yes'"> un classificateur est nécessaire.</xsl:when>
					<xsl:when test="//np/@classifierPresent='some'"> un classificateur est présent dans certains syntagmes nominaux de ce type, mais n’est pas requis dans tous.</xsl:when>
					<xsl:when test="//np/@classifierPresent='no'"> un classificateur n’est jamais utilisé.</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//qp/@npDegree)='yes' and normalize-space(//np/@classifierPresent)='yes' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//qp/@npDegree)='some' and normalize-space(//np/@classifierPresent)='yes' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//qp/@npDegree)='yes' and normalize-space(//np/@classifierPresent)='some' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//qp/@npDegree)='some' and normalize-space(//np/@classifierPresent)='some'">
<xsl:text> Le classificateur </xsl:text>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosOther/@checked)='no'">
<xsl:text>se trouve avant le quantificateur de grande portée ou le mot de degré et le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text>peut se trouver avant le quantificateur de grande portée ou le mot de degré et le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes'">
<xsl:text> Il se trouve aussi après le nom et le quantificateur de grande portée ou le mot de degré.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosOther/@checked)='no'">
<xsl:text>se trouve après le nom et le quantificateur de grande portée ou le mot de degré.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text>peut se trouver après le nom et le quantificateur de grande portée ou le mot de degré.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes'">
<xsl:text> Il se trouve aussi après le quantificateur de grande portée ou le mot de degré mais avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosOther/@checked)='no'">
<xsl:text>se trouve après le quantificateur de grande portée ou le mot de degré mais avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text>peut se trouver après le quantificateur de grande portée ou le mot de degré mais avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes'">
<xsl:text> Il se trouve aussi après le nom mais avant le quantificateur de grande portée ou le mot de degré.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosOther/@checked)='no'">
<xsl:text>se trouve après le nom mais avant le quantificateur de grande portée ou le mot de degré.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text>peut se trouver après le nom mais avant le quantificateur de grande portée ou le mot de degré.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes'">
<xsl:text> Il peut s’attacher comme préfixe sur le quantificateur de grande portée ou le mot de degré.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosOther/@checked)='no'">
<xsl:text>s’attache comme préfixe sur le quantificateur de grande portée ou le mot de degré.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text>peut s’attacher comme préfixe sur le quantificateur de grande portée ou le mot de degré.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes'">
<xsl:text> Il peut s’attacher aussi comme suffixe sur le quantificateur de grande portée ou le mot de degré.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='no'">
<xsl:text>s’attache comme suffixe sur le quantificateur de grande portée ou le mot de degré.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text>peut s’attacher comme suffixe sur le quantificateur de grande portée ou le mot de degré.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text> Il peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text>se trouve ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>	
				</xsl:if>
</p>
</xsl:if>
			
			
			<p>
<xsl:text>La négation d’un syntagme nominal se trouve aussi dans cette position de grande portée. Voir section </xsl:text>
<sectionRef sec="sNegNominal" />
<xsl:text> pour des exemples.</xsl:text>
</p>
		   
		</section2>
		<section2 id="sNPArtDem">
			<secTitle>
<xsl:choose>
				<xsl:when test="//np/@artAndDem='no'">Articles et démonstratifs</xsl:when>
			   <xsl:when test="//np/@artAndDem='article'">Articles</xsl:when>
				<xsl:when test="//np/@artAndDem='demonstrative'">Démonstratifs</xsl:when>
				<xsl:when test="//np/@artAndDem='both'">Articles et démonstratifs</xsl:when>
			</xsl:choose>
</secTitle>
			<xsl:if test="normalize-space(//np/@artAndDem)='both'">
<p contentType="ctComparativeIntro">
<xsl:text>En français les articles et les démonstratifs ne viennent pas ensemble dans le même syntagme nominal, mais tous deux viennent avant le nom.  Certaines langues permettent aux deux de paraître dans le même syntagme et ils peuvent se trouver dans de différentes positions par rapport au nom.  Ils ont donc besoin de catégories syntactiques distinctes.</xsl:text>
</p>
</xsl:if>
			<p>
<xsl:text>Comme vu dans la section </xsl:text>
<sectionRef sec="sAdjArtDem" />
<xsl:text>, </xsl:text>
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
					<xsl:when test="//np/@artAndDem='no'"> n’a ni articles ni démonstratifs qui sont réalisés comme mots indépendants.</xsl:when>
					<xsl:when test="//np/@artAndDem='article'"> n’a que des articles qui sont réalisés comme mots indépendants, mais pas de démonstratifs.</xsl:when>
					<xsl:when test="//np/@artAndDem='demonstrative'"> a seulement des démonstratifs qui sont réalisés comme mots indépendants, mais pas d’articles.</xsl:when>
					<xsl:when test="//np/@artAndDem='both'"> a des articles et des démonstratifs qui sont réalisés comme mots indépendants.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
					<xsl:text> Les </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artAndDem='article'">articles</xsl:when>
						<xsl:when test="//np/@artAndDem='demonstrative'">démonstratifs</xsl:when>
						<xsl:when test="//np/@artAndDem='both'">articles et démonstratifs</xsl:when>
					</xsl:choose>
					<xsl:if test="normalize-space(//np/@artAndDem)!='no' and normalize-space(//np/@artCase)='no'">
						<xsl:text> ne</xsl:text>
					</xsl:if>
					<xsl:text> sont </xsl:text>
					<xsl:if test="normalize-space(//np/@artAndDem)!='no' and normalize-space(//np/@artCase)='no'">
						<xsl:text>pas </xsl:text>
					</xsl:if>
					<xsl:text>marqués pour le cas.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(//np/@artAndDem)='article'">
<p>
<xsl:text>L’article se trouve </xsl:text>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyAfter/@checked)='no' and normalize-space(//np/artOnlyBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='no' and normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='no' and normalize-space(//np/artOnlyAfter/@checked)='no' and normalize-space(//np/artOnlyBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyAfter/@checked)='no' and normalize-space(//np/artOnlyBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='no' and normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyOther/@checked)='no'">
<xsl:text> nom.  </xsl:text>
			   </xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='no' and normalize-space(//np/artOnlyAfter/@checked)='no' and normalize-space(//np/artOnlyBoth/@checked)='no' and normalize-space(//np/artOnlyOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/artOnlyOther" />
<xsl:text>.  </xsl:text>
			   </xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyOther/@checked)='yes' or normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyOther/@checked)='yes' or normalize-space(//np/artOnlyBoth/@checked)='yes' and normalize-space(//np/artOnlyOther/@checked)='yes'">
<xsl:text> nom et peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//np/artOnlyOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes' and normalize-space(//np/@artPl)='yes'">
<xsl:text> La présence d’un article est </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artRequired='no'">toujours facultative.</xsl:when>
						<xsl:when test="//np/@artRequired='mass'">facultative avec des noms au pluriel ou noms de masse, mais est exigée avec des noms au singulier.</xsl:when>
						<xsl:when test="//np/@artRequired='yes'">toujours exigée.</xsl:when>
					</xsl:choose>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='no' or normalize-space(//np/@agreeNumber)='yes' and normalize-space(//np/@artPl)='no'">
<xsl:text>  La présence d’un article est </xsl:text>
				<xsl:choose>
					<xsl:when test="//np/@artRequired='no'">toujours facultative.</xsl:when>
					<xsl:when test="//np/@artRequired='yes'">toujours exigée.</xsl:when>
				</xsl:choose>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative'">
<p>
<xsl:text>Le démonstratif se trouve </xsl:text>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyAfter/@checked)='no' and normalize-space(//np/demOnlyBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='no' and normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='no' and normalize-space(//np/demOnlyAfter/@checked)='no' and normalize-space(//np/demOnlyBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyAfter/@checked)='no' and normalize-space(//np/demOnlyBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='no' and normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyOther/@checked)='no'">
<xsl:text> nom.  </xsl:text>
			   </xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='no' and normalize-space(//np/demOnlyAfter/@checked)='no' and normalize-space(//np/demOnlyBoth/@checked)='no' and normalize-space(//np/demOnlyOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/demOnlyOther" />
<xsl:text>r.  </xsl:text>
			   </xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyOther/@checked)='yes' or normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyOther/@checked)='yes' or normalize-space(//np/demOnlyBoth/@checked)='yes' and normalize-space(//np/demOnlyOther/@checked)='yes'">
<xsl:text> nom et peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//np/demOnlyOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes' and normalize-space(//np/@demPl)='yes'">
<xsl:text>  La présence d’un démonstratif est </xsl:text>
				<xsl:choose>
					<xsl:when test="//np/@demRequired='no'">toujours facultative.</xsl:when>
					<xsl:when test="//np/@demRequired='mass'">facultative avec des noms au pluriel ou noms de masse, mais est exigée avec des noms au singulier.</xsl:when>
					<xsl:when test="//np/@demRequired='yes'">toujours exigée.</xsl:when>
				</xsl:choose>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='no' or normalize-space(//np/@agreeNumber)='yes' and normalize-space(//np/@demPl)='no'">
<xsl:text> La présence d’un démonstratif est </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artRequired='no'">toujours facultative.</xsl:when>
						<xsl:when test="//np/@artRequired='yes'">toujours exigée.</xsl:when>
					</xsl:choose>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no'">
<p>
<xsl:text>Les articles et démonstratifs apparaissent tous deux dans la même position, ils ne se trouvent donc pas ensemble dans la même syntagme nominal.  Les articles et les démonstratifs apparaissent </xsl:text>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosAfter/@checked)='no' and normalize-space(//np/demOrArtPosBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='no' and normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='no' and normalize-space(//np/demOrArtPosAfter/@checked)='no' and normalize-space(//np/demOrArtPosBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosAfter/@checked)='no' and normalize-space(//np/demOrArtPosBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='no' and normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtes du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosOther/@checked)='no'">
<xsl:text> nom.  </xsl:text>
				   </xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='no' and normalize-space(//np/demOrArtPosAfter/@checked)='no' and normalize-space(//np/demOrArtPosBoth/@checked)='no' and normalize-space(//np/demOrArtPosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/demOrArtPosOther" />
<xsl:text>.  </xsl:text>
				   </xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosOther/@checked)='yes' or normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosOther/@checked)='yes' or normalize-space(//np/demOrArtPosBoth/@checked)='yes' and normalize-space(//np/demOrArtPosOther/@checked)='yes'">
<xsl:text> nom et peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//np/demOrArtPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@agreeNumber)='yes' and normalize-space(//np/@demPl)='yes'">
<xsl:text>  La présence d’un article ou d’un démonstratif est </xsl:text>
				<xsl:choose>
					<xsl:when test="//np/@demOrArtRequired='no'">toujours facultative.</xsl:when>
					<xsl:when test="//np/@demOrArtRequired='mass'">facultative avec des noms au pluriel ou noms de masse, mais est exigée avec des noms au singulier.</xsl:when>
					<xsl:when test="//np/@demOrArtRequired='yes'">toujours exigée.</xsl:when>
				</xsl:choose>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='no' or normalize-space(//np/@agreeNumber)='yes' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@demPl)='no'">
<xsl:text>  La présence d’un article ou d’un démonstratif est </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demOrArtRequired='no'">toujours facultative.</xsl:when>
						<xsl:when test="//np/@demOrArtRequired='yes'">toujours exigée.</xsl:when>
					</xsl:choose>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no'">
<p>
<xsl:text>Les articles et démonstratifs n’apparaissent pas dans la même position par rapport au nom, </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artBothCooccur='different'">mais les deux ne peuvent pas </xsl:when>
					<xsl:when test="//np/@artBothCooccur='yes'">et les deux peuvent </xsl:when>
				</xsl:choose>
<xsl:text>se trouver ensemble dans le même syntagme nominal.  </xsl:text>
</p>
</xsl:if>
		   
			<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no'">
<p>
<xsl:text>  L’article se trouve </xsl:text>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtAfter/@checked)='no' and normalize-space(//np/demAndArtArtBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='no' and normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='no' and normalize-space(//np/demAndArtArtAfter/@checked)='no' and normalize-space(//np/demAndArtArtBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtAfter/@checked)='no' and normalize-space(//np/demAndArtArtBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='no' and normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtBoth/@checked)='yes'">
<xsl:text>/ après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtOther/@checked)='no'">
<xsl:text> nom.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='no' and normalize-space(//np/demAndArtArtAfter/@checked)='no' and normalize-space(//np/demAndArtArtBoth/@checked)='no' and normalize-space(//np/demAndArtArtOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/demAndArtArtOther" />
<xsl:text>.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtOther/@checked)='yes' or normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtOther/@checked)='yes' or normalize-space(//np/demAndArtArtBoth/@checked)='yes' and normalize-space(//np/demAndArtArtOther/@checked)='yes'">
<xsl:text> nom et peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//np/demAndArtArtOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  La présence d’un article est </xsl:text>
<xsl:choose>
		   	<xsl:when test="//np/@demAndArtArtRequired='no'">toujours facultative.</xsl:when>
		   	<xsl:when test="//np/@demAndArtArtRequired='mass'">facultative avec des noms au pluriel ou noms de masse, mais est exigée avec des noms au singulier.</xsl:when>
		   	<xsl:when test="//np/@demAndArtArtRequired='yes'">toujours exigée.</xsl:when>
		   </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no'">
<p>
<xsl:text>Le démonstratif se trouve </xsl:text>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemAfter/@checked)='no' and normalize-space(//np/demAndArtDemBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='no' and normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='no' and normalize-space(//np/demAndArtDemAfter/@checked)='no' and normalize-space(//np/demAndArtDemBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemAfter/@checked)='no' and normalize-space(//np/demAndArtDemBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='no' and normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemOther/@checked)='no'">
<xsl:text> nom.  </xsl:text>
				   </xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='no' and normalize-space(//np/demAndArtDemAfter/@checked)='no' and normalize-space(//np/demAndArtDemBoth/@checked)='no' and normalize-space(//np/demAndArtDemOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/demAndArtDemOther" />
<xsl:text>.  </xsl:text>
				   </xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemOther/@checked)='yes' or normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemOther/@checked)='yes' or normalize-space(//np/demAndArtDemBoth/@checked)='yes' and normalize-space(//np/demAndArtDemOther/@checked)='yes'">
<xsl:text> nom et peut aussi se trouver  ___</xsl:text>
<xsl:value-of select="//np/demAndArtDemOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  La présence d’un démonstratif est </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demAndArtDemRequired='no'">toujours facultative.</xsl:when>
					<xsl:when test="//np/@demAndArtDemRequired='mass'">facultative avec des noms au pluriel ou noms de masse, mais est exigée avec des noms au singulier.</xsl:when>
					<xsl:when test="//np/@demAndArtDemRequired='yes'">toujours exigée.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
		   
		
			<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<p>
<xsl:text>Des exemples de syntagmes nominaux avec </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artAndDem='article'">des articles</xsl:when>
					<xsl:when test="//np/@artAndDem='demonstrative'">des démonstratifs</xsl:when>
					<xsl:when test="//np/@artAndDem='both'">des articles et/ou des démonstratifs</xsl:when>
				</xsl:choose>
<xsl:text> comme permis en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluent:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<example num="xNP.NPArtDem.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPArtDem.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPArtDem.22.1</xsl:text>
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
	
			<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@artAndDem)='demonstrative'">
<p>
<xsl:text>Dans ces syntagmes nominaux avec démonstratifs</xsl:text>
<xsl:choose>
<xsl:when test="//np/@classifierPresentDem='yes'"> un classificateur est exigé.</xsl:when>
					<xsl:when test="//np/@classifierPresentDem='some'"> un classificateur est présent dans certaines syntagmes nominaux de ce type mais n’est pas exigé en tous.</xsl:when>
					<xsl:when test="//np/@classifierPresentDem='no'"> un classificateur n’est jamais utilisé.</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@classifierPresentDem)='yes' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@classifierPresentDem)='some'">
<xsl:text> Le classificateur </xsl:text>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='no'">
<xsl:text>se trouve avant le démonstratif et le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text>peut se trouver avant le démonstratif et le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes'">
<xsl:text> Il se trouve aussi après le nom et le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='no'">
<xsl:text>se trouve après le nom et le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text>peut se trouver après le nom et le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes'">
<xsl:text> Il se trouve aussi après le démonstratif mais avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='no'">
<xsl:text>se trouve après le démonstratif mais avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text>peut se trouver après le démonstratif mais avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes'">
<xsl:text> Il se trouve aussi après le nom mais avant le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='no'">
<xsl:text>se trouve après le nom mais avant le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text>peut se trouver après le nom mais avant le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes'">
<xsl:text> Il peut aussi s’attacher comme préfixe sur le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='no'">
<xsl:text>s’attache comme préfixe sur le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text>peut s’attacher comme préfixe sur le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes'">
<xsl:text> Il peut aussi s’attacher comme suffixe sur le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='no'">
<xsl:text>s’attache comme suffixe sur le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text>peut s’attacher comme suffixe sur le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text> Il peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificDemPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text>se trouver ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificDemPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>	
				</xsl:if>
</p>
</xsl:if>
			
			<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@artAndDem)='both'">
<p>
<xsl:text>Dans ces syntagmes nominaux avec démonstratifs</xsl:text>
<xsl:choose>
<xsl:when test="//np/@classifierPresentDemBoth='yes'"> un classificateur est exigé.</xsl:when>
					<xsl:when test="//np/@classifierPresentDemBoth='some'"> un classificateur est présent dans certaines syntagmes nominaux de ce type mais n’est pas exigé en tous.</xsl:when>
					<xsl:when test="//np/@classifierPresentDemBoth='no'"> un classificateur n’est jamais utilisé.</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@classifierPresentDemBoth)='yes' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@classifierPresentDemBoth)='some'">
<xsl:text> Le classificateur </xsl:text>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='no'">
<xsl:text>se trouve avant le démonstratif et avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text>peut se trouver avant le démonstratif et avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes'">
<xsl:text> Il se trouve aussi après le nom et le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='no'">
<xsl:text>se trouve après le nom et le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text>peut se trouver après le nom et le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes'">
<xsl:text> Il se trouve aussi après le nom mais avant le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='no'">
<xsl:text>se trouve après le démonstratif mais avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text>peut se trouver après le démonstratif mais avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes'">
<xsl:text> Il se trouve aussi après le nom mais avant le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='no'">
<xsl:text>se trouve après le nom mais avant le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text>peut se trouver après le nom mais avant le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes'">
<xsl:text> Il peut aussi s’attacher comme préfixe sur le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='no'">
<xsl:text>s’attacher comme un préfixe sur le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text>peut s’attacher comme un préfixe sur le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes'">
<xsl:text> Il peut aussi s’attacher comme suffixe sur le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='no'">
<xsl:text>s’attache comme suffixe sur le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text>peut s’attacher comme suffixe sur le démonstratif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text> Il peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificDemBothPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text>se trouve ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificDemBothPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>	
				</xsl:if>
</p>
</xsl:if>
			
		</section2>
		<section2 id="sNPPoss">
			<secTitle>Possesseurs</secTitle>
		   <p contentType="ctPracticalIntro">
<xsl:text>La possession peut s’exprimer normalement par un pronom ou par une syntagme nominal qui consiste en un nom propre, un nom simple ou un nom complètement modifié.</xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>La possession peut s’exprimer normalement par un pronom ou par une syntagme nominal qui consiste en un nom propre, un nom simple ou un nom complètement modifié.  
		   		Cependant le français permet seulement les pronoms dans la position possesseur qu’avant le nom, avec tous les possesseurs nominaux et possesseurs de syntagmes nominaux entiers exprimés dans un syntagme prépositionnelle avec </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>de</langData>
<xsl:text> après le nom.</xsl:text>
</p>
			<p contentType="ctComparativeIntro">
<xsl:text>Dans les langues qui expriment les possesseurs par des noms ou des syntagmes nominaux entiers aussi bien que par des pronoms, beaucoup ajoutent aussi une sorte de marque comme le </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>’s</langData>
<xsl:text> en anglais pour indiquer la possession.  Ces marques sont soit des affixes soit des clitiques sur le nom principal ou sur des clitiques syntagme qui s’attachent à un bout ou à l’autre du syntagme entier.  Quelque fois la marque du syntagme possesseur est écrit comme mot indépendant.  
					La marque en anglais est de ce second type, parce qu’à côté des syntagmes où le </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>’s</langData>
<xsl:text> apparaît attaché au nom principal comme dans </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy’s mother</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « la mère du garçon »</xsl:text>
</gloss>
<xsl:text> il y a aussi des syntagmes qui montrent clairement que le clitique s’attache à la fin du syntagme nominal entier comme dans </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy that I just talked to’s mother</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « la mère du garçon à qui je viens de parler »</xsl:text>
</gloss>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the girl in green’s wonderful speech</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « le discours merveilleux de la fille en vert »</xsl:text>
</gloss>
<xsl:text>.  Ces exemples montrent  que des possesseurs peuvent inclure des syntagmes </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prépositionnels et /ou postpositionnels</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prépositionnels et /ou postpositionnels</xsl:when>
				</xsl:choose>
<xsl:text> et propositions relatives.  Les possesseurs peuvent aussi être incorporés  l’un dans l’autre comme dans </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy’s sister’s dog</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « le chien de la soeur du garçon »</xsl:text>
</gloss>
<xsl:text>.  Cela est permis en français dans le syntagme prépositionnel après le nom.</xsl:text>
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
<xsl:text>, </xsl:text>
<xsl:choose>
		   	<xsl:when test="//np/@possNP='yes'">les syntagmes nominaux et les pronoms peuvent posséder un nom directement, et les deux peuvent se trouver dans un syntagme <xsl:choose>
		   		<xsl:when test="//pp/@pPos='before'">prepositionnel</xsl:when>
		   		<xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
		   		<xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
		   		<xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
		      </xsl:choose>.  </xsl:when>
		   	<xsl:when test="//np/@possNP='yesOnly'">les syntagmes nominaux et les pronoms peuvent posséder un nom directement, mais les syntagmes possesseurs <xsl:choose>
		      	<xsl:when test="//pp/@pPos='before'">prepositionnel</xsl:when>
		      	<xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
		      	<xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
		      	<xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
		   	</xsl:choose> ne sont pas permis.  </xsl:when>
		   	<xsl:when test="//np/@possNP='no'">seuls les pronoms peuvent posséder un nom directement; les syntagmes nominaux possesseurs se trouvent seulement dans un syntagme <xsl:choose>
		   	<xsl:when test="//pp/@pPos='before'">prepositionnel</xsl:when>
		   	<xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
		   	<xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
		   	<xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
		   	</xsl:choose>.  </xsl:when>
		   	<xsl:when test="//np/@possNP='none'">ni les syntagmes nominaux ni les pronoms ne peuvent posséder un nom directement; la possession est exprimée seulement dans une syntagme <xsl:choose>
		      	<xsl:when test="//pp/@pPos='before'">prepositionnel</xsl:when>
		      	<xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
		      	<xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
		      	<xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
		      </xsl:choose>.  </xsl:when>
		   </xsl:choose>
<xsl:if test="normalize-space(//np/@possNP)!='yesOnly'">
<xsl:text>Le syntagme possesseur </xsl:text>
<xsl:choose>
		      	<xsl:when test="//pp/@pPos='before'">prepositionnel</xsl:when>
		      	<xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
		      	<xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
		      	<xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
		   	</xsl:choose>
<xsl:text> se trouve </xsl:text>
<xsl:choose>
		   		<xsl:when test="//np/@possPPPos='before'">avant le</xsl:when>
		   		<xsl:when test="//np/@possPPPos='after'">après le</xsl:when>
		   		<xsl:when test="//np/@possPPPos='either'">d’un côté ou de l’autre du</xsl:when>
		      </xsl:choose>
<xsl:text> nom. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possNP)='yes' or normalize-space(//np/@possNP)='yesOnly'">
<xsl:text>Le syntagme nominal ou le pronom possesseur se trouve </xsl:text>
<xsl:choose>
		      	<xsl:when test="//np/@possNounPos='before'">avant le</xsl:when>
		      	<xsl:when test="//np/@possNounPos='after'">après le</xsl:when>
		      	<xsl:when test="//np/@possNounPos='either'">d’un côté ou de l’autre du</xsl:when>
		      </xsl:choose>
<xsl:text> nom. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possNP)='no'">
<xsl:text>Le pronom possesseur se trouve </xsl:text>
<xsl:choose>
		      	<xsl:when test="//np/@possPronPos='before'">avant le</xsl:when>
		      	<xsl:when test="//np/@possPronPos='after'">après le</xsl:when>
		      	<xsl:when test="//np/@possPronPos='either'">d’un côté ou de l’autre du</xsl:when>
		      </xsl:choose>
<xsl:text> nom.</xsl:text>
</xsl:if>
</p>
		   
			<p>
<xsl:text>Des exemples de syntagmes nominaux possessédés avec des possesseurs simples et incorporés en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluent:</xsl:text>
</p>
			<example num="xNP.NPPoss.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/embeddedExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/embeddedExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/embeddedExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/embeddedExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.14.1</xsl:text>
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
		   <xsl:if test="normalize-space(//np/@possNP)!='yesOnly'">
<p>
<xsl:text>Des exemples avec des syntagmes </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositionnels</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
					<xsl:when test="//pp/@pPos='both'">adpositionnels</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
				</xsl:choose>
<xsl:text> comme possesseur incluent:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@possNP)!='yesOnly'">
<example num="xNP.NPPoss.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/ppExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/ppExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/ppExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/ppExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.18.1</xsl:text>
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
<xsl:text>Des exemples avec des propositions relatives dans le possesseur, incluses dans des phrases complètes et simples sont:</xsl:text>
</p>
			<example num="xNP.NPPoss.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/relClExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/relClExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/relClExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/relClExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.22.1</xsl:text>
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
			<xsl:if test="normalize-space(//np/@possNP)='yes' or normalize-space(//np/@possNP)='yesOnly'">
<p>
<xsl:text>Comme vu dans les exemples ci-dessus, en </xsl:text>
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
					<xsl:when test="//np/@possMarked='no'"> n’a pas de marque spéciale pour distinguer les possesseurs de n’importe quelle autre syntagme nominal.</xsl:when>
					<xsl:when test="//np/@possMarked='yesAffix'"> marque le nom principal dans le possesseur avec un affixe pour distinguer les possesseurs de n’importe quelle autre syntagme nominal.  L’affixe est:</xsl:when>
					<xsl:when test="//np/@possMarked='yesProclitic'"> marque le syntagme entier avec une proclitique qui s’attache au premier mot dans le possesseur pour distinguer les possesseurs de n’importe quelle autre syntagme nominal.  Le clitique est:</xsl:when>
					<xsl:when test="//np/@possMarked='yesEnclitic'"> marque le syntagme entier avec un enclitique qui s’attache au dernier mot dans le possesseur pour distinguer les possesseurs de n’importe quelle autre syntagme nominal.  Le clitique est:</xsl:when>
					<xsl:when test="//np/@possMarked='yesWord'"> marque le syntagme possesseur entier avec un mot indépendant pour le distinguer de toute autre syntagme nominal.  La présence du mot marqué est  <xsl:choose>
						<xsl:when test="//np/@possWordRequired='no'">facultatif dans certains cas.</xsl:when>
						<xsl:when test="//np/@possWordRequired='yes'">toujours exigé.</xsl:when>
					</xsl:choose>  Il se trouve </xsl:when>
				</xsl:choose>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordAfter/@checked)='no' and normalize-space(//np/possWordBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='no' and normalize-space(//np/possWordAfter/@checked)='no' and normalize-space(//np/possWordBoth/@checked)='yes'">
<xsl:text>des les deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordBoth/@checked)='no'">
<xsl:text>d’un côté ou de l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordAfter/@checked)='no' and normalize-space(//np/possWordBoth/@checked)='yes'">
<xsl:text>avant ou des les deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordBoth/@checked)='yes'">
<xsl:text>après ou des les deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordBoth/@checked)='yes'">
<xsl:text>d’un côté ou de l’autre ou des les deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordOther/@checked)='no'">
<xsl:text> syntagme possesseur.  Ce mot est:</xsl:text>
				   </xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='no' and normalize-space(//np/possWordAfter/@checked)='no' and normalize-space(//np/possWordBoth/@checked)='no' and normalize-space(//np/possWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/possWordOther" />
<xsl:text>.  Ce mot est:</xsl:text>
				   </xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordOther/@checked)='yes' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordOther/@checked)='yes' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/possWordOther/@checked)='yes'">
<xsl:text> syntagme possesseur et peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//np/possWordOther" />
<xsl:text>.  Ce mot est:</xsl:text>
</xsl:if>
</p>
</xsl:if>
	<xsl:if test="normalize-space(//np/@possMarked)='yesAffix'">
<example num="xNP.NPPoss.26">
<table border="1">
	      <tr>
	      	<th>Affixe de marque possesseure</th>
	      </tr>
	      <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/possMarkerAffix),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
	   </table>
</example>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@possMarked)='yesProclitic' or normalize-space(//np/@possMarked)='yesEnclitic'">
<example num="xNP.NPPoss.28">
<table border="1">
		         <tr>
		         	<th>Clitique de marque possesseure</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/possMarkerClitic),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@possMarked)='yesWord'">
<example num="xNP.NPPoss.30">
<table border="1">
		         <tr>
		         	<th>Mot de marque possesseure</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/possMarkerWord),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
</xsl:if>
		   
				<p contentType="ctComparativeIntro">
<xsl:text>En anglais les possesseurs et les articles ou démonstratifs ne se trouvent pas dans le même syntagme nominal, à moins que le possesseur soit exprimé dans un syntagme prépositionnel.  Par exemple </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those [the boy’s] books</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> (ces [du garçon] livres-là)</xsl:text>
</gloss>
<xsl:text> n’est pas correct du point de vue grammatical. On devrait utiliser </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those books [of his]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> (ces livres [sont à lui])</xsl:text>
</gloss>
<xsl:text> pour exprimer la même pensée. En français ces éléments ne se trouvent pas ensemble.  Certaines autres langues permettent aux possesseurs et aux articles ou démonstratifs de se trouver dans le même syntagme, le premier exemple ci-dessus serait donc grammatical.</xsl:text>
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
<xsl:text> possesseurs nominaux ou pronominaux </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCooccur='yes'">peuvent</xsl:when>
						<xsl:when test="//np/@possCooccur='no'">ne peuvent pas</xsl:when>
					</xsl:choose>
<xsl:text> se trouver dans le même syntagme que des </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@artAndDem='article'">articles</xsl:when>
						<xsl:when test="//np/@artAndDem='demonstrative'">démonstratifs</xsl:when>
						<xsl:when test="//np/@artAndDem='both'">articles et/ou démonstratifs</xsl:when>
					</xsl:choose>
<xsl:text> dans la position normale de possesseur</xsl:text>
<xsl:choose>
				      <xsl:when test="//np/@possCooccur='yes'">.</xsl:when>
				   	<xsl:when test="//np/@possCooccur='no'">.  En lieu </xsl:when>
				   </xsl:choose>
<xsl:if test="normalize-space(//np/@possCooccur)='no'">
<xsl:text>le possesseur est exprimé dans un syntagme </xsl:text>
				      <xsl:choose>
				      	<xsl:when test="//pp/@pPos='before'">prepositionnel</xsl:when>
				      	<xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
				      	<xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
				      	<xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
				      </xsl:choose>
				      <xsl:text>.</xsl:text>
				   </xsl:if>
</p>
		
		</section2>
		<section2 id="sNPQP">
			<secTitle>Syntagmes de quantité</secTitle>
			<p contentType="ctPracticalIntro">
<xsl:text>Les syntagmes de quantité incluent et les nombres (la section </xsl:text>
<sectionRef sec="sAdjNumbers" />
<xsl:text>) et les quantificateurs de portée plus étroite (la section </xsl:text>
<sectionRef sec="sQPOtherQuantifiers" />
<xsl:text>).</xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>Les syntagmes de quantité incluent et les nombres (section </xsl:text>
<sectionRef sec="sAdjNumbers" />
<xsl:text>) et les quantificateurs de portée plus étroite (la section </xsl:text>
<sectionRef sec="sQPOtherQuantifiers" />
<xsl:text>).  Tels modificateurs marquent le nombre du la syntagme nominal entier.  Des exemples de syntagmes nominaux quantificateurs incluent: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>seuls ces quelques livres</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>les nombreux chiens du garçon</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>seuls les cent premiers garçons</langData>
<xsl:text>.  En français tous les syntagmes quantificateurs se trouvent avant le nom.</xsl:text>
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
<xsl:text> les syntagmes quantificateurs se trouvent </xsl:text>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='no' and normalize-space(//np/qpPosBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='no' and normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='no' and normalize-space(//np/qpPosAfter/@checked)='no' and normalize-space(//np/qpPosBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='no' and normalize-space(//np/qpPosBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='no' and normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosOther/@checked)='no'">
<xsl:text> nom.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='no' and normalize-space(//np/qpPosAfter/@checked)='no' and normalize-space(//np/qpPosBoth/@checked)='no' and normalize-space(//np/qpPosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/qpPosOther" />
<xsl:text>.   </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosOther/@checked)='yes' or normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosOther/@checked)='yes' or normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//np/qpPosOther/@checked)='yes'">
<xsl:text> nom et peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//np/qpPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@qpEitherRestrictedNumPos)='before' and normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='yes' or normalize-space(//np/@qpEitherRestrictedNumPos)='before' and normalize-space(//np/qpPosBoth/@checked)='yes'">
	<xsl:text>Tous les nombres se trouvent avant le nom. </xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@qpEitherRestrictedNumPos)='after' and normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='yes' or normalize-space(//np/@qpEitherRestrictedNumPos)='after' and normalize-space(//np/qpPosBoth/@checked)='yes'">
						<xsl:text>Tous les nombres se trouvent après le nom. </xsl:text>
					</xsl:if>
</p>
				<p>
<xsl:text>Des exemples de syntagmes quantificateurs en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluent:</xsl:text>
</p>
			<example num="xNP.NPQP.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/qpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/qpExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/qpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/qpExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPQP.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPQP.12.1</xsl:text>
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
			
			<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific'">
<p>
<xsl:text>Dans ces syntagmes nominaux avec des nombres ou autres quantificateurs</xsl:text>
<xsl:choose>
<xsl:when test="//np/@classifierPresentQ='yes'"> un classificateur est exigé.</xsl:when>
					<xsl:when test="//np/@classifierPresentQ='some'"> un classificateur est présent dans certains syntagmes nominaux de ce type, mais pas exigé en tous.</xsl:when>
					<xsl:when test="//np/@classifierPresentQ='no'"> un classificateur n’est jamais utilisé.</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)='yes' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)='some'">
<xsl:text> Le classificateur </xsl:text>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosOther/@checked)='no'">
<xsl:text>se trouve avant le quatificateur et le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text>peut se trouver avant le quatificateur et le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes'">
<xsl:text> Il se trouve aussi après le nom et le quantificateur.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosOther/@checked)='no'">
<xsl:text>se trouve après le nom et le quantificateur.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text>peut se trouver après le nom et le quantificateur.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes'">
<xsl:text> Il se trouve aussi après le quantificateur mais avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosOther/@checked)='no'">
<xsl:text>se trouve après le quantificateur mais avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text>peut se trouver après le quantificateur mais avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes'">
<xsl:text> Il se trouve aussi après le nom mais avant le quantificateur.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosOther/@checked)='no'">
<xsl:text>se trouve après le nom mais avant le quantificateur.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text>peut se trouver après le nom mais avant le quantificateur.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes'">
<xsl:text> Il peut s’attacher comme préfixe au quantificateur.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosOther/@checked)='no'">
<xsl:text>s’attache comme préfixe au quantificateur.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text>peut s’attacher comme préfixe au quantificateur.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes'">
<xsl:text> Il peut aussi s’atttacher comme suffixe au quantificateur.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='no'">
<xsl:text>s’attache comme suffixe au quantificateur.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text>peut s’attacher comme suffixe au quantificateur.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text> Il peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificQPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text>se trouve ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificQPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>	
				</xsl:if>
</p>
</xsl:if>
			
			
		</section2>
		<section2 id="sNPAdjP">
			<secTitle>Syntagmes adjectivaux</secTitle>
			<p contentType="ctPracticalIntro">
<xsl:text>On a discuté les adjectifs qualitatifs et leurs modificateurs dans la section </xsl:text>
<sectionRef sec="sAdjQual" />
<xsl:text>. </xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>On a discuté les adjectifs qualitatifs et leurs modificateurs dans la section </xsl:text>
<sectionRef sec="sAdjQual" />
<xsl:text>.  Les syntagmes adjectivaux se trouvent près du nom, donnant des syntagmes nominaux tels que:</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those very dirty old books</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « ces vieux livres très sales »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy’s many black dogs</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « les nombreux chiens noirs du garçon »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only the first ten very eager young boys</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « seulement les dix premiers jeunes garçons très passionés »</xsl:text>
</gloss>
<xsl:text>.  Comme les exemples en anglais le montrent, tous les adjectifs se trouvent avant le nom et au contraire des autres modificateurs discutés précédemment plus qu’un syntagme adjectival est permis.  En français normalement l’adjectif se trouve après le nom, avec quelques exceptions précises; où deux ou plusieurs adjectifs accompagnent un nom, on peut se trouver avant et l’autre(s) après.</xsl:text>
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
<xsl:text> les syntagmes adjectivaux se trouvent </xsl:text>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjPosOther/@checked)='no'">
<xsl:text> nom.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no' and normalize-space(//np/adjPosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/adjPosOther" />
<xsl:text>.   </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjPosOther/@checked)='yes' or normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjPosOther/@checked)='yes' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjPosOther/@checked)='yes'">
<xsl:text> nom et peut se trouver aussi ___</xsl:text>
<xsl:value-of select="//np/adjPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
</p>
		   <p>
<xsl:text>Des exemples de syntagmes nominaux modifiés par des adjectifs qualitatifs ou syntagmes adjectivaux en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluent:</xsl:text>
</p>
			<example num="xNP.NPAdjP.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/adjpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/adjpExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/adjpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/adjpExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPAdjP.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPAdjP.12.1</xsl:text>
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
			<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific'">
<p>
<xsl:text>Dans ces syntagmes nominaux avec adjectifs</xsl:text>
<xsl:choose>
<xsl:when test="//np/@classifierPresentAdj='yes'"> un classificateur est exigé</xsl:when>
					<xsl:when test="//np/@classifierPresentAdj='some'"> un classificateur est présent dans certains syntagmes nominaux de ce type, mais n’est pas exigé dans tous.</xsl:when>
					<xsl:when test="//np/@classifierPresentAdj='no'"> un classificateur n’est jamais utilisé.</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)='yes' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)='some'">
<xsl:text> Le classificateur </xsl:text>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='no'">
<xsl:text>se trouve avant l’adjectif et le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text>peut se trouver avant l’adjectif et le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes'">
<xsl:text> Il se trouve aussi après le nom et l’adjectif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='no'">
<xsl:text>se trouve après le nom et l’adjectif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text>peut se trouver après le nom et l’adjectif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes'">
<xsl:text> Il se trouve aussi après l’adjectif mais avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='no'">
<xsl:text>se trouve après l’adjectif mais avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text>peut se trouver après l’adjectif mais avant le nom.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes'">
<xsl:text> Il se trouve aussi après le nom mais avant l’adjectif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='no'">
<xsl:text>se trouve après le nom mais avant l’adjectif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text>peut se trouver après le nom mais avant l’adjectif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes'">
<xsl:text> Il peut aussi s’attacher comme préfixe à l’adjectif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='no'">
<xsl:text>s’attache comme préfixe à l’adjectif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text>peut s’attacher comme préfixe à l’adjectif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes'">
<xsl:text> Il peut aussi s’attacher comme suffixe à l’adjectif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='no'">
<xsl:text>s’attache comme suffixe à l’adjectif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text>peut s’attacher comme suffixe à l’adjectif.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text> Il peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificAdjPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text>se trouve ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificAdjPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>	
				</xsl:if>
</p>
</xsl:if>
			
			
		</section2>
		<section2 id="sNPPP">
			<secTitle>            <xsl:choose>
				<xsl:when test="//pp/@pPos='before'">Syntagmes prépositionnels</xsl:when>
				<xsl:when test="//pp/@pPos='after'">Syntagmes postpositionnels</xsl:when>
				<xsl:when test="//pp/@pPos='both'">Syntagmes prépositionnels et postpositionnels</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">Syntagmes adpositionnels</xsl:when>
			</xsl:choose>
</secTitle>
			<p contentType="ctPracticalIntro">
<xsl:text>Les noms simples et les noms composés peuvent avoir des modificateurs ou compléments de syntagmes </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prépositionnels et/ou  postpositionnels</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
				</xsl:choose>
<xsl:text>. </xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>Les noms simples et les noms composés peuvent avoir des modificateurs ou compléments de syntagmes </xsl:text>
<xsl:choose>
		   		<xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
		   		<xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
		   		<xsl:when test="//pp/@pPos='both'">prépositionnels et/ou  postpositionnels</xsl:when>
		   		<xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
		   	</xsl:choose>
<xsl:text> tels que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>la grande bouteille [de sirop]</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>la lettre du garçon [à cette fille]</langData>
<xsl:text>.  En plus des syntagmes </xsl:text>
<xsl:choose>
		      	<xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
		      	<xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
		      	<xsl:when test="//pp/@pPos='both'">prépositionnels et/ou  postpositionnels</xsl:when>
		      	<xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
		      </xsl:choose>
<xsl:text>au génitif peuvent prendre la place du possesseur, comme dans </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those dogs [of his]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> (ces chiens-là [sont à lui])</xsl:text>
</gloss>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the tablecloth [of my mother’s]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « la nappe [de ma mère] »</xsl:text>
</gloss>
<xsl:text>.    En français le syntagme prépositionnel vient toujours après le nom.</xsl:text>
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
<xsl:text> syntagme </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prépositionnel et/ou  postpositionnel</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
				</xsl:choose>
<xsl:text> se trouve </xsl:text>
<xsl:choose>
				      	<xsl:when test="//np/@ppPos='before'">avant le</xsl:when>
				      	<xsl:when test="//np/@ppPos='after'">après le</xsl:when>
				      	<xsl:when test="//np/@ppPos='either'">d’un côté ou l’autre de</xsl:when>
				         <xsl:when test="//np/@ppPos='unknown'">_______</xsl:when>
				      </xsl:choose>
<xsl:text> nom qu’il modifie. Des exemples de modificateurs de syntagme </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prépositionnel et/ou  postpositionnel</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
				</xsl:choose>
<xsl:text> en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluent:</xsl:text>
</p>
			<example num="xNP.NPPP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/compPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/compPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/compPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/compPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPP.10.1</xsl:text>
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
<xsl:text>Voir la section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> pour plus de détails sur les syntagmes </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prépositionnels et/ou  postpositionnels</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
				</xsl:choose>
<xsl:text> en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
		</section2>
<section2 id="sNPParticiple">
	<secTitle>Participes et gérondifs</secTitle>
   <p contentType="ctPracticalIntro">
<xsl:text>Les participes ou syntagmes participiaux peuvent agir comme adjectifs qualitatifs qui modifient un nom. </xsl:text>
</p>
   <p contentType="ctComparativeIntro">
<xsl:text>Les participes ou syntagmes participiaux peuvent agir comme adjectifs qualitatifs qui modifient un nom.  Quelques exemples en français avec le participe ou le syntagme participial entre les crochets incluent: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>le soleil [brillant], mon enfant [pleurant]</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>les livres [aimés par des millions].</langData>
</p>
   <p>
<xsl:text>Des exemples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluent:</xsl:text>
</p>
   <example num="xNP.NPParticiple.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/partExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/partExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPParticiple.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiple.10.1</xsl:text>
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
<xsl:text>Un gérondif ou syntagme gérondif peut ressembler à un nom et un complément. Ce syntagme entier occupe une position d’argument normal tel que le sujet, l’objet, l’objet indirect ou l’objet d’une adposition. </xsl:text>
</p>
   <p contentType="ctComparativeIntro">
<xsl:text>Un gérondif ou syntagme gérondif peut ressembler à un nom et un complément. Ce syntagme entier occupe une position d’argument normal tel que le sujet, l’objet, l’objet indirect ou l’objet d’une adposition.  Certains exemples en anglais avec des syntagmes entières avec la syntagme de gérondif entre corchets incluent: : </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Studying grammar] is challenging  « [Etudier la grammaire] est difficile »</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>He likes [reading Latin poetry] « Il aime [lire la poésie latine] »</langData>
<xsl:text>  Des exemples comme ceux-ci en français utiliser l’infinitif au lieu d’un gérondif. Quelques exemples français de gérondifs sont:</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Le voleur a ouvert la porte en [cassant la serrure]</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Nous avons trouvé le chien en [cherchant dans le bois]</langData>
<xsl:text>.  De telles syntagmes peuvent être possessédés ou aussi être modifies en plus et quelquefois seul le gérondif reste seul à la tête d’un syntagme nominal comme dans: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>les gravement blessés</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>les mourants.</langData>
</p>
   <p>
<xsl:text>Des exemples de gérondifs ou de syntagmes gérondifs qui peuvent prendre la place d’un syntagme nominal en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluent:</xsl:text>
</p>
   <example num="xNP.NPParticiple.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partHeadExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/partHeadExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partHeadExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/partHeadExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPParticiple.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiple.18.1</xsl:text>
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
<xsl:text>Ces syntagmes gérondifs peuvent être utilisés dans des syntagmes entiers comme montré ici:</xsl:text>
</p>
   <example num="xNP.NPParticiple.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partHeadSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/partHeadSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partHeadSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/partHeadSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPParticiple.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiple.22.1</xsl:text>
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
   
</section2>		
	</section1>
	
	
		
		
	
	
		
		
		
		
		
	
	
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
	
		
		
		
	
	
		
		
		
		
		
		
		
	

	
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	
   
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	

   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
      
         
         
         
         
         
         
         
        
      
         
         
         
         
         
         
         
        
      
         
         
         
         
         
         
         
        
      
         
         
         
         
         
         
         
        
      
         
         
         
         
         
         
         
        
      
         
         
         
         
         
         
         
        
      
         
         
         
         
         
         
         
        
      
         
         
         
      
      
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
               
      
   
      
   
   
      
      
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
   
   
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
		
		
		
		
	
   
 
   
	
		
	
	
		
		
		
	
	
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
		 
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
		
		
		
		
		
	   
	   
	   
	
	
	   
	   
	   
	   
	   
	   
	   
	   
	   
	
	
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	
   
	
	
		
	
	
	
	
		
		
		
	
	
	
		
		
		
	
		
		
	
	
		
		
		

		
		
		
	
	
		
		
		
	
	
		
	
	
		
	
   
   
   
      
      
      
      
      
      
         
      
      
      
      
      
      
      
        
      
      
      
      
      
      
      
        
      
      
      
      
      
      
      
        
      
      
      
      
      
      
      
        
   
   
      
      
      
      
      
      
         
      
      
      
      
      
      
      
        
      
      
      
      
      
      
      
        
      
      
      
      
      
      
      
        
      
      
      
      
      
      
      
        
   
   
      
      
      
   
   
      
      
      
   

	
	
	
		
	
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	
	
		
	
		
	
		
		
		
		
		
		
		
		
		
		
		
	
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
		
	
		
	
		
		
		
		
		
		
		
		
		
		
		
	
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
		
	
		
		
		
		
		
		
		
	
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	
		
		
		
		
		
		
		
	
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		


</xsl:template>
</xsl:stylesheet>
