<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="focus">
   <section1 id="sFocus">
      <secTitle>Constructions de focus et de thème</secTitle>
	  <p contentType="ctPracticalIntro">
<xsl:text>
	     Cette section traite deux sortes de constructions qui attirent l’attention à un élément particulier.  Puisque les thèmes se trouvent en dehors des constructions de focus et ont une portée plus étendue, nous les considérerons en priorité. Il est possible qu’une seule phrase ait à la fois un syntagme de thème et un syntagme de focus.</xsl:text>
</p>
      <p contentType="ctComparativeIntro">
<xsl:text>
         Cette section traite deux sortes de constructions qui attirent l’attention à un élément particulier.  Puisque les thèmes se trouvent en dehors des constructions de focus et ont une portée plus étendue, nous les considérerons en priorité.  L’exemple </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Quant à Guillaume, le football il joue ___ le mieux</langData>
<xsl:text> montre qu’une seule phrase peut avoir un syntagme de thème et de focus à la fois.  Dans ce cas le thème </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Guillaume</langData>
<xsl:text> est introduit par le marqueur de thème </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>quant à</langData>
<xsl:text>, puis la phrase de focus </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>football</langData>
<xsl:text> qui a été déplacé de sa place normale dans la phrase.</xsl:text>
</p>
   <section2 id="sFocusTopics">
      <secTitle>Thèmes et marqueurs de thème</secTitle>
		 <p contentType="ctPracticalIntro">
<xsl:text>
		    Selon la définition ici, les constructions de thème se composent d’un syntagme de thème suivi d’une phrase complète ou d’une question et séparée d’habitude par la ponctuation.  Certain marqueurs peuvent aussi être utilisés pour signaler les thèmes. </xsl:text>
</p>
      <p contentType="ctComparativeIntro">
<xsl:text>
         Selon la définition ici, les constructions de thème se composent d’un syntagme de thème suivi d’une phrase complète ou d’une question et séparée d’habitude par la ponctuation.  Certain marqueurs peuvent aussi être utilisés pour signaler les thèmes, comme montré dans les exemples suivants en français: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Quant à Jean, je pense qu’il fera un bon médecin</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Parlant de Jeanne, où est-elle?</langData>
</p>
      
      <xsl:if test="normalize-space(//focus/@topic)='no'">
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
<xsl:text> les syntagmes de thème ne sont pas permis. </xsl:text>
</p>
</xsl:if>
      <xsl:if test="normalize-space(//focus/@topic)='yes'">
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
<xsl:text> il y a des syntagmes de thème qui se trouvent </xsl:text>
<xsl:choose>
			   <xsl:when test="//focus/@topicPos='before'">avant</xsl:when>
               <xsl:when test="//focus/@topicPos='after'">après</xsl:when>
			   <xsl:when test="//focus/@topicPos='unknown'">_______</xsl:when>
            </xsl:choose>
<xsl:text> la phrase principale ou question.   Certains exemples comprennent:</xsl:text>
</p>
</xsl:if>
		 <xsl:if test="normalize-space(//focus/@topic)='yes'">
<example num="xFocus.FocusTopics.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//focus/topicExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//focus/topicExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//focus/topicExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//focus/topicExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xFocus.FocusTopics.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xFocus.FocusTopics.12.1</xsl:text>
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
      <xsl:if test="normalize-space(//focus/@topic)='yes'">
<p>
<xsl:text>Comme les exemples le montrent le syntagme de thème </xsl:text>
<xsl:choose>
			   <xsl:when test="//focus/@topicMarker='no'">n’est pas marqué par un marqueur de thème. Seulement la position dans la phrase et peut-être la ponctuation distinguent le syntagme de thème.</xsl:when>
			   <xsl:when test="//focus/@topicMarker='yesWord'">est marqué par certains mots ou certaines phrases.</xsl:when>
			   <xsl:when test="//focus/@topicMarker='yesClitic'">est marqué par un  clitique ou plusieurs qui s’attache(nt) au syntagme de thème.  Ces clitiques sont: </xsl:when>
			   <xsl:when test="//focus/@topicMarker='yesAffix'">marqués par un affixe ou plusieurs qui s’attache(nt) au nom principal dans le syntagme de thème. Ces affixes sont: </xsl:when>
			</xsl:choose>
<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord'">
<xsl:text>Les marqueurs de thème se trouvent </xsl:text>
			   <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='yes' and normalize-space(//focus/topicMarkerAfter/@checked)='no' and normalize-space(//focus/topicMarkerBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
            <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='no' and normalize-space(//focus/topicMarkerAfter/@checked)='yes' and normalize-space(//focus/topicMarkerBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
            <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='no' and normalize-space(//focus/topicMarkerAfter/@checked)='no' and normalize-space(//focus/topicMarkerBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
            <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='yes' and normalize-space(//focus/topicMarkerAfter/@checked)='yes' and normalize-space(//focus/topicMarkerBoth/@checked)='no'">
<xsl:text>d’un côté ou de l’autre du</xsl:text>
</xsl:if>
            <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='yes' and normalize-space(//focus/topicMarkerAfter/@checked)='no' and normalize-space(//focus/topicMarkerBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
            <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='no' and normalize-space(//focus/topicMarkerAfter/@checked)='yes' and normalize-space(//focus/topicMarkerBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
            <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='yes' and normalize-space(//focus/topicMarkerAfter/@checked)='yes' and normalize-space(//focus/topicMarkerBoth/@checked)='yes'">
<xsl:text>d’un côté ou de l’autre ou des deux côtés du</xsl:text>
</xsl:if>
            <xsl:if test="normalize-space(//focus/topicMarkerOther/@checked)='no'">
<xsl:text> syntagme de thème.  </xsl:text>
			   </xsl:if>
			   <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='no' and normalize-space(//focus/topicMarkerAfter/@checked)='no' and normalize-space(//focus/topicMarkerBoth/@checked)='no' and normalize-space(//focus/topicMarkerOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//focus/topicMarkerOther" />
<xsl:text>.  </xsl:text>
			   </xsl:if>
            <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='yes' and normalize-space(//focus/topicMarkerOther/@checked)='yes' or normalize-space(//focus/topicMarkerAfter/@checked)='yes' and normalize-space(//focus/topicMarkerOther/@checked)='yes' or normalize-space(//focus/topicMarkerBoth/@checked)='yes' and normalize-space(//focus/topicMarkerOther/@checked)='yes'">
<xsl:text> syntagme de thème et peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//focus/topicMarkerOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
            <xsl:text> Un marqueur de thème est </xsl:text>
<xsl:choose>
               <xsl:when test="//focus/@topicMarkerRequired='no'">facultatif</xsl:when>
               <xsl:when test="//focus/@topicMarkerRequired='yes'">exigé</xsl:when>
</xsl:choose>
            <xsl:text> chaque fois qu’il y a un syntagme de thème.  Les marqueurs de thèmes sont:</xsl:text>
			</xsl:if>
</p>
</xsl:if>
		 <xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord'">
<example num="xFocus.FocusTopics.16">
<table border="1">
			   <tr>
			      <th>Marqueurs de thème</th>
				  <th>Glose</th>
			   </tr>
			   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//focus/topicMarkerExample),'.','')" />
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
      <xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesClitic'">
<example num="xFocus.FocusTopics.18">
<table border="1">
            <tr>
               <th>Clitiques de marqueurs de thème</th>
               <th>Glose</th>
            </tr>
            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//focus/topicMarkerCliticExample),'.','')" />
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
      <xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesAffix'">
<example num="xFocus.FocusTopics.20">
<table border="1">
            <tr>
               <th>Affixes de marqueurs de thème</th>
               <th>Glose</th>
            </tr>
            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//focus/topicMarkerAffixExample),'.','')" />
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
   </section2>

	  <section2 id="sFocusFocus">
	     <secTitle>Syntagmes de focus et marqueurs de focus</secTitle>
	     <p contentType="ctPracticalIntro">
<xsl:text>Les constructions de thème ont aussi un syntagme nominal qui se trouve soit en premier soit en dernier et peut être séparé par la ponctuation.  Cependant, par contraste avec les thèmes, le syntagme de focus est déplacé de sa position normale dans la phrase, laissant un vide.  Certains marqueurs peuvent être utilisés pour marquer le syntagme de focus.</xsl:text>
</p>
	     <p contentType="ctComparativeIntro">
<xsl:text>Les constructions de focus ont aussi un syntagme nominal qui se trouve soit en premier soit en dernier et peut être séparé par la ponctuation.  Cependant, par contraste avec les thèmes, le syntagme de focus est déplacé de sa position normale dans la phrase, laissant un vide.  Certains marqueurs tels que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>seulement</langData>
<xsl:text> en français, peuvent être utilisés pour marquer le syntagme de focus. Les constructions de focus ne sont pas utilisées fréquemment dans les langues SVO, puisque le sujet est habituellement en focus et est déjà en premier  dans l’ordre normal. Les langues avec d’autres ordres de mots telles que les langues VSO peuvent faire un usage extensif de constructions de focus. Des exemples en français de constructions de thème comprennent: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Les filles, j’aime __</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Le football, Guillaume le joue __ le mieux</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Seulement ce garçon-là, Gérald l’a frappé __ </langData>
<xsl:text>.</xsl:text>
</p>
	     
	     <xsl:if test="normalize-space(//focus/@focus)='no'">
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
<xsl:text> un syntagme de focus ne doit pas être déplacé avant ou après le reste de la phrase au lieu de sa position normale. </xsl:text>
</p>
</xsl:if>
	     <xsl:if test="normalize-space(//focus/@focus)='yes'">
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
<xsl:text> il y a des syntagmes de focus qui se trouvent </xsl:text>
<xsl:choose>
			   <xsl:when test="//focus/@focusPos='before'">avant</xsl:when>
               <xsl:when test="//focus/@focusPos='after'">après</xsl:when>
			   <xsl:when test="//focus/@focusPos='unknown'">_______</xsl:when>
            </xsl:choose>
<xsl:text> le reste de la phrase.   En voici quelques exemples:</xsl:text>
</p>
</xsl:if>
		 <xsl:if test="normalize-space(//focus/@focus)='yes'">
<example num="xFocus.FocusFocus.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//focus/focusExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//focus/focusExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//focus/focusExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//focus/focusExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xFocus.FocusFocus.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xFocus.FocusFocus.12.1</xsl:text>
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
	     <xsl:if test="normalize-space(//focus/@focus)='yes'">
<p>
<xsl:text>Comme les exemples le montrent, le syntagme de focus </xsl:text>
<xsl:choose>
			   <xsl:when test="//focus/@focusMarker='no'">n’est pas marqué par un marqueur de focus. Seule la position dans la phrase et peut-être la ponctuation distinguent le syntagme de focus.</xsl:when>
			   <xsl:when test="//focus/@focusMarker='yesWord'">est marqué par certains mots ou syntagmes. </xsl:when>
			   <xsl:when test="//focus/@focusMarker='yesClitic'">est marqué par un clitique ou plusieurs qui s’attache(nt) au syntagme de focus. Ces clitiques sont:</xsl:when>
			   <xsl:when test="//focus/@focusMarker='yesAffix'">est marqué par un affixe ou plusieurs qui s’attache(nt) au nom principal dans le syntagme de focus.  Ces affixes sont:</xsl:when>
			</xsl:choose>
<xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord'">
<xsl:text>Les marqueurs de focus se trouvent </xsl:text>
	            <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='yes' and normalize-space(//focus/topicMarkerAfter/@checked)='no' and normalize-space(//focus/topicMarkerBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
	           <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='no' and normalize-space(//focus/focusMarkerAfter/@checked)='yes' and normalize-space(//focus/focusMarkerBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
	           <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='no' and normalize-space(//focus/focusMarkerAfter/@checked)='no' and normalize-space(//focus/focusMarkerBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
	           <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='yes' and normalize-space(//focus/focusMarkerAfter/@checked)='yes' and normalize-space(//focus/focusMarkerBoth/@checked)='no'">
<xsl:text>d’un côté ou de l’autre du</xsl:text>
</xsl:if>
	           <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='yes' and normalize-space(//focus/focusMarkerAfter/@checked)='no' and normalize-space(//focus/focusMarkerBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
	           <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='no' and normalize-space(//focus/focusMarkerAfter/@checked)='yes' and normalize-space(//focus/focusMarkerBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
	           <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='yes' and normalize-space(//focus/focusMarkerAfter/@checked)='yes' and normalize-space(//focus/focusMarkerBoth/@checked)='yes'">
<xsl:text>d’un côté ou de l’autre ou des deux côtés du</xsl:text>
</xsl:if>
	           <xsl:if test="normalize-space(//focus/focusMarkerOther/@checked)='no'">
<xsl:text> syntagme de focus.  </xsl:text>
			   </xsl:if>
			   <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='no' and normalize-space(//focus/focusMarkerAfter/@checked)='no' and normalize-space(//focus/focusMarkerBoth/@checked)='no' and normalize-space(//focus/focusMarkerOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//focus/focusMarkerOther" />
<xsl:text>.  </xsl:text>
			   </xsl:if>
	           <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='yes' and normalize-space(//focus/focusMarkerOther/@checked)='yes' or normalize-space(//focus/focusMarkerAfter/@checked)='yes' and normalize-space(//focus/focusMarkerOther/@checked)='yes' or normalize-space(//focus/focusMarkerBoth/@checked)='yes' and normalize-space(//focus/focusMarkerOther/@checked)='yes'">
<xsl:text> syntagme de focus et peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//focus/focusMarkerOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
	           <xsl:text> Un marqueur de focus est </xsl:text>
<xsl:choose>
	              <xsl:when test="//focus/@focusMarkerRequired='no'">facultatif</xsl:when>
	              <xsl:when test="//focus/@focusMarkerRequired='yes'">exigé</xsl:when>
</xsl:choose>
	           <xsl:text> chaque fois qu’il y a un syntagme de focus. Les marqueurs de focus sont:</xsl:text>
			</xsl:if>
</p>
</xsl:if>
		 <xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord'">
<example num="xFocus.FocusFocus.16">
<table border="1">
			   <tr>
			      <th>Marqueurs de focus</th>
				  <th>Glose</th>
			   </tr>
			   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//focus/focusMarkerExample),'.','')" />
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
	     <xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesClitic'">
<example num="xFocus.FocusFocus.18">
<table border="1">
	           <tr>
	              <th>Clitiques de marqueurs de focus</th>
	              <th>Glose</th>
	           </tr>
	           <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//focus/focusMarkerCliticExample),'.','')" />
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
	     <xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesAffix'">
<example num="xFocus.FocusFocus.20">
<table border="1">
	           <tr>
	              <th>Affixes de marqueurs de focus</th>
	              <th>Glose</th>
	           </tr>
	           <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//focus/focusMarkerAffixExample),'.','')" />
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
	     

	  </section2>

   </section1>
   
	  
   
   
	  
   
   
	  
	  
	  
   
   
      
      
      
   
   
      
      
      
   
   
	  
	  
	  
   

   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
   
	  
   
   
	  
   
   
	  
	  
	  
   
   
      
      
      
   
   
      
      
      
   
   
	  
	  
	  
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   

</xsl:template>
</xsl:stylesheet>
