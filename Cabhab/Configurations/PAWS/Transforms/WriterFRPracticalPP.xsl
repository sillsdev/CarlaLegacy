<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="pp">
    <section1 id="sPP">
        <secTitle>
            <xsl:choose>
               <xsl:when test="//pp/@pPos='before'">Syntagmes prépositionnels</xsl:when>
               <xsl:when test="//pp/@pPos='after'">Syntagmes postpositionnels </xsl:when>
               <xsl:when test="//pp/@pPos='both'">Syntagmes adpositionnels</xsl:when>
               <xsl:when test="//pp/@pPos='unknown'">Syntagmes adpositionnels</xsl:when>
            </xsl:choose>
            </secTitle>
       <p contentType="ctComparativeIntro">
<xsl:text>Cette section traite de la structure des syntagmes adpositionnels qui expriment généralement le lieu, l’accompagnement, le but, l’instrument, le receveur ou l’agent pour les langues qui n’ont pas de marque de cas sur les noms ou sur les syntagmes nominaux.  Normalement les langues avec marque de cas ont toujours des syntagmes adpositionnels de lieu et temps.</xsl:text>
</p>
       <p contentType="ctComparativeIntro">
<xsl:text>Les prépositions precedent leurs complements, tandis que les postpositions les suivent.  En français il y a des prépositions comme montré ici dans </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pour Jean</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>devant la porte</langData>
<xsl:text>.  Les prépositions ou postpositions peuvent être des mots indépendants ou des clitiques qui se rattachent au bord du complément ou à sa tête.</xsl:text>
</p>
       <xsl:if test="normalize-space(//np/@caseN)='no'">
<p contentType="ctPracticalIntro">
<xsl:text>Les syntagmes adpositionnels peuvent exprimer le lieu et le temps de même que des relations grammaticales de l’accompagnement, le but, l’instrument, le receveur, le possesseur ou l’agent puisque le cas n’est pas marqué sur le nom ou syntagme nominal en </xsl:text>
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
</xsl:if>
       <xsl:if test="normalize-space(//np/@caseN)='yes'">
<p contentType="ctPracticalIntro">
<xsl:text>Normalement les syntagmes adpositionnels expriment seulement le lieu et le temps puisque le cas est marqué sur le nom ou sur le syntagme nominal en </xsl:text>
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
</xsl:if>
       <p>
<xsl:text>Voici quelques exemples de syntagmes de lieu </xsl:text>
<xsl:choose>
             <xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
          <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
          <xsl:when test="//pp/@pPos='both'">adpositionnels</xsl:when>
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
<xsl:text>:</xsl:text>
</p>
       <example num="xPP.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/ppExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/ppExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/ppExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/ppExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.14.1</xsl:text>
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
<xsl:text>Comme les exemples le montrent, le </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>  a des </xsl:text>
<xsl:choose>
               <xsl:when test="//pp/@pPos='before'">prépositions seulement.  </xsl:when>
                <xsl:when test="//pp/@pPos='after'">postpositions seulement.  </xsl:when>
               <xsl:when test="//pp/@pPos='both'">prépositions et des postpositions.  </xsl:when>
                <xsl:when test="//pp/@pPos='unknown'">_____-positions suelement.  </xsl:when>
            </xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
               <xsl:when test="//pp/@pType='word'">Ce sont tous des mots indépendants.</xsl:when>
               <xsl:when test="//pp/@pType='clitic'">Ce sont tous des clitiques attachés à un autre mot. </xsl:when>
               <xsl:when test="//pp/@pType='both'">Certains sont écrits comme mots indépendants mais quelques-uns sont des clitiques attachés à un autre mot.  </xsl:when>
            </xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pType)!='word'">
               <xsl:text>Les clitiques se rattachent </xsl:text>
                <xsl:choose>
                   <xsl:when test="//pp/@attaches='edge'">au bord</xsl:when>
                   <xsl:when test="//pp/@attaches='head'">à la tête</xsl:when>
                </xsl:choose>
               <xsl:text> du complément.  </xsl:text>
            </xsl:if>
<xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//pp/@ppClassifier)='yes' and normalize-space(//pp/@pType)!='clitic'">
<xsl:choose>
   <xsl:when test="//pp/@pPos='before'">Les prépositions</xsl:when>
           <xsl:when test="//pp/@pPos='after'">Les postpositions</xsl:when>
   <xsl:when test="//pp/@pPos='both'">Les prépositions et postpositions</xsl:when>
              <xsl:when test="//pp/@pPos='unknown'">Les adpositions</xsl:when>
</xsl:choose>
   <xsl:text> sont marquées avec des classificateurs en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> comme partie du système d’accord concordant.  Seules les racines sont montrées ici dans les tableaux mais les syntagmes montrent les formes entières marquées avec des classificateurs.</xsl:text> </xsl:if>
</p>
       <xsl:if test="normalize-space(//pp/@pPos)='before'">
<p>
<xsl:text>Voici des exemples de prépositions </xsl:text>
<xsl:if test="normalize-space(//pp/@bodyPart)='yes'">
<xsl:text>régulières </xsl:text>
</xsl:if>
<xsl:text>utilisées dans des syntagmes de lieu:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//pp/@pPos)='before'">
<example num="xPP.20">
<table border="1">
              <tr>
                 <th>Prépositions</th>
                 <th>Glose</th>
              </tr>				
              <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/locativePrepExample),'.','')" />
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
       <xsl:if test="normalize-space(//pp/@pPos)='after'">
<p>
<xsl:text>Voici des exemples de postpositions </xsl:text>
<xsl:if test="normalize-space(//pp/@bodyPart)='yes'">
<xsl:text>régulières </xsl:text>
</xsl:if>
<xsl:text>utilisées dans des syntagmes de lieu:</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='after'">
<example num="xPP.24">
<table border="1">
             <tr>
                <th>Postpositions</th>
                <th>Glose</th>
             </tr>				
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/locativePostExample),'.','')" />
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
       <xsl:if test="normalize-space(//pp/@pPos)='both' or normalize-space(//pp/@pPos)='unknown'">
<p>
<xsl:text>Voici des exemples de prépositions et postpositions </xsl:text>
<xsl:if test="normalize-space(//pp/@bodyPart)='yes'">
<xsl:text>régulières </xsl:text>
</xsl:if>
<xsl:text>utilisées dans des syntagmes de lieu:</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='both' or normalize-space(//pp/@pPos)='unknown'">
<example num="xPP.28">
<table border="1">
             <tr>
                <th>Type</th>
                <th>Morphèmes</th>
                <th>Glose</th>
             </tr>				
             <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//pp/locativePrepExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.1" select="string-length(normalize-space($sExampleValue0.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.1 != 0 and $sExampleValue0.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Prépositions</xsl:text>
</td>
</xsl:with-param>
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
<td align="left">
<xsl:text>Prépositions</xsl:text>
</td>
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
             <xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//pp/locativePostExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.1" select="string-length(normalize-space($sExampleValue1.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.1 != 0 and $sExampleValue1.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Postpositions</xsl:text>
</td>
</xsl:with-param>
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
<td align="left">
<xsl:text>Postpositions</xsl:text>
</td>
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
       <xsl:if test="normalize-space(//pp/@pPos)='before' or normalize-space(//pp/@pPos)='both'">
<p>
<xsl:text>Voici des exemples de syntagmes prépositionnels utilisés dans des syntagmes de lieu:</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='before' or normalize-space(//pp/@pPos)='both'">
<example num="xPP.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/locativePrepPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/locativePrepPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/locativePrepPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/locativePrepPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.32.1</xsl:text>
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
       <xsl:if test="normalize-space(//pp/@pPos)='after' or normalize-space(//pp/@pPos)='both'">
<p>
<xsl:text>Voici des exemples de syntagmes postpositionnels  utilisée dans des syntagmes de lieu:</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='after' or normalize-space(//pp/@pPos)='both'">
<example num="xPP.36">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/locativePostPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/locativePostPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/locativePostPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/locativePostPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.36</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.36.1</xsl:text>
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
       <xsl:if test="normalize-space(//pp/@bodyPart)='yes'">
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
<xsl:text> utilise principalement des mots des parties du corps pour exprimer le lieu dans des syntagmes </xsl:text>
<xsl:choose>
          <xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
          <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
          <xsl:when test="//pp/@pPos='both'">prépositionnels et postpositionnels</xsl:when>
          <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
</xsl:choose>
<xsl:text>.  Voici des exemples des </xsl:text>
<xsl:choose>
             <xsl:when test="//pp/@pPos='before'">prépositions</xsl:when>
             <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
             <xsl:when test="//pp/@pPos='both'">prépositions et postpositions</xsl:when>
             <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>
</xsl:choose>
<xsl:text> des parties du corps:</xsl:text>
</p>
</xsl:if>      
       <xsl:if test="normalize-space(//pp/@pPos)='before' and normalize-space(//pp/@bodyPart)='yes'">
<example num="xPP.40">
<table border="1">
             <tr>
                <th>Partie du corps</th>
                <th>Glose comme nom</th>
                <th>Glose comme préposition</th>
             </tr>				
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/bodyPartPrepExample),'.','')" />
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
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='after' and normalize-space(//pp/@bodyPart)='yes'">
<example num="xPP.42">
<table border="1">
             <tr>
                <th>Partie du corps</th>
                <th>Glose come nom</th>
                <th>Glose comme postposition</th>
             </tr>				
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/bodyPartPostExample),'.','')" />
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
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='both' and normalize-space(//pp/@bodyPart)='yes' or normalize-space(//pp/@pPos)='unknown' and normalize-space(//pp/@bodyPart)='yes'">
<example num="xPP.44">
<table border="1">
             <tr>
                <th>Type</th>
                <th>Partie du corps</th>
                <th>Glose comme nom</th>
                <th>Glose comme adposition</th>
             </tr>				
             <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//pp/bodyPartPrepExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.1" select="string-length(normalize-space($sExampleValue0.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.1 != 0 and $sExampleValue0.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Prépositions</xsl:text>
</td>
</xsl:with-param>
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
<td align="left">
<xsl:text>Prépositions</xsl:text>
</td>
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
             <xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//pp/bodyPartPostExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.1" select="string-length(normalize-space($sExampleValue1.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.1 != 0 and $sExampleValue1.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Postpositions</xsl:text>
</td>
</xsl:with-param>
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
<td align="left">
<xsl:text>Postpositions</xsl:text>
</td>
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
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='before' or normalize-space(//pp/@pPos)='both' and normalize-space(//pp/@bodyPart)='yes'">
<p>
<xsl:text>Voici des exemples de syntagmes prépositionnels de lieu qui utilisent des parties du corps:</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='before' or normalize-space(//pp/@pPos)='both' and normalize-space(//pp/@bodyPart)='yes'">
<example num="xPP.48">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/bodyPartPrepPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/bodyPartPrepPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/bodyPartPrepPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/bodyPartPrepPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.48</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.48.1</xsl:text>
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
       <xsl:if test="normalize-space(//pp/@pPos)='after' or normalize-space(//pp/@pPos)='both' and normalize-space(//pp/@bodyPart)='yes'">
<p>
<xsl:text>Voici des exemples de syntagmes postpositionnels de lieu qui utilisent des parties du corps:</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='after' or normalize-space(//pp/@pPos)='both' and normalize-space(//pp/@bodyPart)='yes'">
<example num="xPP.52">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/bodyPartPostPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/bodyPartPostPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/bodyPartPostPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/bodyPartPostPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.52</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.52.1</xsl:text>
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
       <xsl:if test="normalize-space(//np/@caseN)='no'">
<p>
<xsl:text>Les </xsl:text>
<xsl:choose>
          <xsl:when test="//pp/@pPos='before'">prépositions</xsl:when>
          <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
          <xsl:when test="//pp/@pPos='both'">prépositions et postpositions</xsl:when>
          <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>
</xsl:choose>
<xsl:text> qui sont utilisées comme un type de marqueur du cas pour les relations grammaticales mineures sont montrées en </xsl:text>
<exampleRef num="xCaseP" equal="no" letterOnly="no" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//np/@caseN)='no'">
<example num="xCaseP">
<table border="1">
             <caption>
                <xsl:text>Marqueurs de cas adpositionaux</xsl:text>
             </caption>
             <tr>
                <th>Adpositions</th>
                <th>Cas</th>
                <th>Utilisation</th>
             </tr>
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/genitiveP),'.','')" />
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
                   <xsl:text>génitif</xsl:text>
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
                   <xsl:text>génitif</xsl:text>
                </td>
<td align="left">
                   <xsl:text>possesseurs</xsl:text>
                </td>
</tr>
</xsl:otherwise>
</xsl:choose>
             <xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//pp/dativeP),'.','')" />
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
             <xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//pp/ablativeP),'.','')" />
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
             <xsl:variable name="sExampleValue3.0">
<xsl:value-of select="translate(string(//pp/instrumentalP),'.','')" />
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
                   <xsl:text>instrumental</xsl:text>
                </td>
<td align="left">
                   <xsl:text>instrument, moyen ou agent</xsl:text>
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
                   <xsl:text>instrument, moyen ou agent</xsl:text>
                </td>
</tr>
</xsl:otherwise>
</xsl:choose>
             <xsl:variable name="sExampleValue4.0">
<xsl:value-of select="translate(string(//pp/vocativeP),'.','')" />
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
             <xsl:variable name="sExampleValue5.0">
<xsl:value-of select="translate(string(//pp/obliqueP),'.','')" />
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
          </table>
</example>
</xsl:if>	      
       
                <p>
<xsl:text>Tous les exemples ci-dessus ont un nom, un nom  propre ou un syntagme nominal comme complément.  Des modificateurs possibles du syntagme </xsl:text>
<xsl:choose>
                      <xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
                      <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
                      <xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
                      <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
</xsl:choose>
<xsl:text> entire sont considérés ensuite. Puis des exemples d’autres types de compléments permis sont donnés dans la section </xsl:text>
<sectionRef sec="sPPComps" />
<xsl:text>.</xsl:text>
</p>
        <section2 id="sPPModifiers">
           <secTitle>Modificateurs</secTitle>
            <p contentType="ctComparativeIntro">
<xsl:text>Il y a normalement quelques mots de degré qui peuvent modifier un syntagme </xsl:text>
<xsl:choose>
                   <xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
                   <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
                   <xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
                   <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
                </xsl:choose>
<xsl:text> entier, tels que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>juste</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tout</langData>
<xsl:text> dans </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>juste après le  coin</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tout au bout de la rue</langData>
<xsl:text>. Certaines langues ont un groupe d’adverbes de lieu signifiant </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>« juste ici »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>« juste là »</xsl:text>
</gloss>
<xsl:text> qui peuvent modifier les syntagmes adpositionnels. Les ordinaux peuvent aussi modifier les syntagmes </xsl:text>
<xsl:choose>
                   <xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
                   <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
                   <xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
                   <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
                </xsl:choose>
<xsl:text> comme dans </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[le] suivant dans la queue</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[le] premier sorti de la porte</langData>
<xsl:text>.  En plus, certains adverbes de manière peuvent modifier des syntagmes </xsl:text>
<xsl:choose>
                   <xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
                   <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
                   <xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
                   <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
                </xsl:choose>
<xsl:text> comme dans </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>presque dans le trou</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>carrément sur la table </langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>presque sur l’enemi</langData>
<xsl:text>.</xsl:text>
</p>
           <p contentType="ctPracticalIntro">
<xsl:text>Généralement, il y a certains mots de degré, ordinaux et adverbes de manière qui peuvent modifier un syntagme </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
              </xsl:choose>
<xsl:text> entier.</xsl:text>
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
                   <xsl:when test="//pp/@modifiers='no'"> il n’y a pas de modificateurs qui se trouvent soit avant soit après le syntagme entier.</xsl:when>
                   <xsl:when test="//pp/@modifiers='yes'"> un syntagme <xsl:choose>
                      <xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
                      <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
                      <xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel</xsl:when>
                      <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
                   </xsl:choose> entier peuvent être modifiés par les catégories suivants de mots indépendants.</xsl:when>
                </xsl:choose>
<xsl:if test="normalize-space(//pp/@modifiers)='no'">
<xsl:text>  Ni les mots de degré ni les ordinaux ni les adverbes ne peuvent modifier les syntagmes </xsl:text>
                    <xsl:choose>
                       <xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
                       <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
                       <xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel</xsl:when>
                       <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
                    </xsl:choose>
                  <xsl:text> comme mots indépendants.</xsl:text> </xsl:if>
<xsl:text></xsl:text>
</p>
                
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierDegree/@checked)='yes'">
<p>
<xsl:text>Les syntagmes </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prépositionnels ou postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
              </xsl:choose>
<xsl:text> peuvent être modifiés par des mots de degré qui se trouvent </xsl:text>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='yes' and normalize-space(//pp/ppDegreePosAfter/@checked)='no' and normalize-space(//pp/ppDegreePosBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='no' and normalize-space(//pp/ppDegreePosAfter/@checked)='yes' and normalize-space(//pp/ppDegreePosBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='no' and normalize-space(//pp/ppDegreePosAfter/@checked)='no' and normalize-space(//pp/ppDegreePosBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='yes' and normalize-space(//pp/ppDegreePosAfter/@checked)='yes' and normalize-space(//pp/ppDegreePosBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='yes' and normalize-space(//pp/ppDegreePosAfter/@checked)='no' and normalize-space(//pp/ppDegreePosBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='no' and normalize-space(//pp/ppDegreePosAfter/@checked)='yes' and normalize-space(//pp/ppDegreePosBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='yes' and normalize-space(//pp/ppDegreePosAfter/@checked)='yes' and normalize-space(//pp/ppDegreePosBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosOther/@checked)='no'">
<xsl:text> syntagme entier.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='no' and normalize-space(//pp/ppDegreePosAfter/@checked)='no' and normalize-space(//pp/ppDegreePosBoth/@checked)='no' and normalize-space(//pp/ppDegreePosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//pp/ppDegreePosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='yes' and normalize-space(//pp/ppDegreePosOther/@checked)='yes' or normalize-space(//pp/ppDegreePosAfter/@checked)='yes' and normalize-space(//pp/ppDegreePosOther/@checked)='yes' or normalize-space(//pp/ppDegreePosBoth/@checked)='yes' and normalize-space(//pp/ppDegreePosOther/@checked)='yes'">
<xsl:text> syntagme entier et peut se trouver aussi ___</xsl:text>
<xsl:value-of select="//pp/ppDegreePosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>Les mots de degré qui peuvent modifier le syntagme </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
              </xsl:choose>
<xsl:text> entier en </xsl:text>
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
</xsl:if>
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierDegree/@checked)='yes'">
<example num="xPP.PPModifiers.12">
<table border="1">
                 <tr>
                    <th>Mots de degré</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/degree),'.','')" />
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierDegree/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de syntagmes </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prépositionnels ou postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
              </xsl:choose>
<xsl:text> avec des mots de degré qui les modifient:</xsl:text>
</p>
</xsl:if>          
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierDegree/@checked)='yes'">
<example num="xPP.PPModifiers.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/degreeWithPP" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/degreeWithPP))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/degreeWithPP" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/degreeWithPP))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPModifiers.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPModifiers.16.1</xsl:text>
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
           
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOrdinal/@checked)='yes'">
<p>
<xsl:text>Les syntagmes </xsl:text>
<xsl:choose>
                    <xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
                    <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
                    <xsl:when test="//pp/@pPos='both'">prépositionnels ou postpositionnels</xsl:when>
                    <xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
                 </xsl:choose>
<xsl:text> peuvent être modifies </xsl:text>
<xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierDegree/@checked)='yes'">
<xsl:text>aussi </xsl:text>
</xsl:if>
<xsl:text>par des nombres ordinaux ou des mots qui se trouvent</xsl:text>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='yes' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='no' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='no' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='yes' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='no' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='no' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='yes' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='yes' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='yes' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='no' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='no' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='yes' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='yes' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='yes' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosOther/@checked)='no'">
<xsl:text> syntagme entier.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='no' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='no' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='no' and normalize-space(//pp/ppOrdinalPosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//pp/ppOrdinalPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='yes' and normalize-space(//pp/ppOrdinalPosOther/@checked)='yes' or normalize-space(//pp/ppOrdinalPosAfter/@checked)='yes' and normalize-space(//pp/ppOrdinalPosOther/@checked)='yes' or normalize-space(//pp/ppOrdinalPosBoth/@checked)='yes' and normalize-space(//pp/ppOrdinalPosOther/@checked)='yes'">
<xsl:text> syntagme entier et peut se trouver aussi ___</xsl:text>
<xsl:value-of select="//pp/ppOrdinalPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>Les ordinaux qui peuvent modifier le syntagme </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
              </xsl:choose>
<xsl:text> entier en </xsl:text>
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
</xsl:if>
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOrdinal/@checked)='yes'">
<example num="xPP.PPModifiers.20">
<table border="1">
                 <tr>
                    <th>Mots ordinaux</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/ordinal),'.','')" />
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOrdinal/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de syntagmes </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prépositionnels ou postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
              </xsl:choose>
<xsl:text> avec des mots ordinaux qui les modifient:</xsl:text>
</p>
</xsl:if>          
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOrdinal/@checked)='yes'">
<example num="xPP.PPModifiers.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/ordinalWithPP" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/ordinalWithPP))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/ordinalWithPP" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/ordinalWithPP))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPModifiers.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPModifiers.24.1</xsl:text>
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
           
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierManner/@checked)='yes'">
<p>
<xsl:text>Les syntagmes </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prépositionnels ou postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
              </xsl:choose>
<xsl:text> peuvent être modifies </xsl:text>
<xsl:if test="normalize-space(//pp/ppModifierDegree/@checked)='yes' or normalize-space(//pp/ppModifierOrdinal/@checked)='yes'">
<xsl:text>aussi </xsl:text>
</xsl:if>
<xsl:text>par des adverbs de manière qui se trouvent </xsl:text>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='yes' and normalize-space(//pp/ppMannerPosAfter/@checked)='no' and normalize-space(//pp/ppMannerPosBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='no' and normalize-space(//pp/ppMannerPosAfter/@checked)='yes' and normalize-space(//pp/ppMannerPosBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='no' and normalize-space(//pp/ppMannerPosAfter/@checked)='no' and normalize-space(//pp/ppMannerPosBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='yes' and normalize-space(//pp/ppMannerPosAfter/@checked)='yes' and normalize-space(//pp/ppMannerPosBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='yes' and normalize-space(//pp/ppMannerPosAfter/@checked)='no' and normalize-space(//pp/ppMannerPosBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='no' and normalize-space(//pp/ppMannerPosAfter/@checked)='yes' and normalize-space(//pp/ppMannerPosBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='yes' and normalize-space(//pp/ppMannerPosAfter/@checked)='yes' and normalize-space(//pp/ppMannerPosBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosOther/@checked)='no'">
<xsl:text> syntagme entier.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='no' and normalize-space(//pp/ppMannerPosAfter/@checked)='no' and normalize-space(//pp/ppMannerPosBoth/@checked)='no' and normalize-space(//pp/ppMannerPosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//pp/ppMannerPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='yes' and normalize-space(//pp/ppMannerPosOther/@checked)='yes' or normalize-space(//pp/ppMannerPosAfter/@checked)='yes' and normalize-space(//pp/ppMannerPosOther/@checked)='yes' or normalize-space(//pp/ppMannerPosBoth/@checked)='yes' and normalize-space(//pp/ppMannerPosOther/@checked)='yes'">
<xsl:text> syntagme entier et peut se trouver aussi ___</xsl:text>
<xsl:value-of select="//pp/ppMannerPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>Les adverbs de manière qui peuvent modifier le syntagme </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
              </xsl:choose>
<xsl:text> entier en </xsl:text>
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
</xsl:if>
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierManner/@checked)='yes'">
<example num="xPP.PPModifiers.28">
<table border="1">
                 <tr>
                    <th>Adverbes de manière</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/manner),'.','')" />
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierManner/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de syntagmes </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prépositionnels ou postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
              </xsl:choose>
<xsl:text> avec des adverbs de manière qui les modifient:</xsl:text>
</p>
</xsl:if>          
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierManner/@checked)='yes'">
<example num="xPP.PPModifiers.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/mannerWithPP" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/mannerWithPP))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/mannerWithPP" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/mannerWithPP))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPModifiers.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPModifiers.32.1</xsl:text>
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
           
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierLocative/@checked)='yes'">
<p>
<xsl:text>Les syntagmes </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prépositionnels ou postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
              </xsl:choose>
<xsl:text> peuvent être modifies </xsl:text>
<xsl:if test="normalize-space(//pp/ppModifierDegree/@checked)='yes' or normalize-space(//pp/ppModifierOrdinal/@checked)='yes' or normalize-space(//pp/ppModifierManner/@checked)='yes'">
<xsl:text>aussi </xsl:text>
</xsl:if>
<xsl:text>par des adverbs de lieu qui se trouvent </xsl:text>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='yes' and normalize-space(//pp/ppLocativePosAfter/@checked)='no' and normalize-space(//pp/ppLocativePosBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='no' and normalize-space(//pp/ppLocativePosAfter/@checked)='yes' and normalize-space(//pp/ppLocativePosBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='no' and normalize-space(//pp/ppLocativePosAfter/@checked)='no' and normalize-space(//pp/ppLocativePosBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='yes' and normalize-space(//pp/ppLocativePosAfter/@checked)='yes' and normalize-space(//pp/ppLocativePosBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='yes' and normalize-space(//pp/ppLocativePosAfter/@checked)='no' and normalize-space(//pp/ppLocativePosBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='no' and normalize-space(//pp/ppLocativePosAfter/@checked)='yes' and normalize-space(//pp/ppLocativePosBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='yes' and normalize-space(//pp/ppLocativePosAfter/@checked)='yes' and normalize-space(//pp/ppLocativePosBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosOther/@checked)='no'">
<xsl:text> syntagme entier.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='no' and normalize-space(//pp/ppLocativePosAfter/@checked)='no' and normalize-space(//pp/ppLocativePosBoth/@checked)='no' and normalize-space(//pp/ppLocativePosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//pp/ppLocativePosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='yes' and normalize-space(//pp/ppLocativePosOther/@checked)='yes' or normalize-space(//pp/ppLocativePosAfter/@checked)='yes' and normalize-space(//pp/ppLocativePosOther/@checked)='yes' or normalize-space(//pp/ppLocativePosBoth/@checked)='yes' and normalize-space(//pp/ppLocativePosOther/@checked)='yes'">
<xsl:text> syntagme entier et peut se trouver aussi ___</xsl:text>
<xsl:value-of select="//pp/ppLocativePosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>Les adverbs de lieu qui peuvent modifier le syntagme </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
              </xsl:choose>
<xsl:text> entier en </xsl:text>
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
</xsl:if>
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierLocative/@checked)='yes'">
<example num="xPP.PPModifiers.36">
<table border="1">
                 <tr>
                    <th>Adverbes de lieu</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/locative),'.','')" />
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierLocative/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de syntagmes </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prépositionnels ou postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
              </xsl:choose>
<xsl:text> avec des adverbs de lieu qui les modifient:</xsl:text>
</p>
</xsl:if>          
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierLocative/@checked)='yes'">
<example num="xPP.PPModifiers.40">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/locativeWithPP" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/locativeWithPP))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/locativeWithPP" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/locativeWithPP))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPModifiers.40</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPModifiers.40.1</xsl:text>
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
           
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOther/@checked)='yes'">
<p>
<xsl:text>Les syntagmes </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prépositionnels ou postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
              </xsl:choose>
<xsl:text> peuvent être modifies </xsl:text>
<xsl:if test="normalize-space(//pp/ppModifierDegree/@checked)='yes' or normalize-space(//pp/ppModifierOrdinal/@checked)='yes' or normalize-space(//pp/ppModifierManner/@checked)='yes' or normalize-space(//pp/ppModifierLocative/@checked)='yes'">
<xsl:text>aussi </xsl:text>
</xsl:if>
<xsl:text>par ___</xsl:text>
<xsl:value-of select="//pp/ppModifierOther" />
<xsl:text>.  Voici des exemples de ces autres éléments qui peuvent modifier le syntagme </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
              </xsl:choose>
<xsl:text> entier en </xsl:text>
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
</xsl:if>
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOther/@checked)='yes'">
<example num="xPP.PPModifiers.44">
<table border="1">
                 <tr>
                    <th>Modificateurs</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/otherMod),'.','')" />
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOther/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de syntagmes </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prépositionnels ou postpositionnels</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
              </xsl:choose>
<xsl:text> avec ces autres éléments qui les modifient:</xsl:text>
</p>
</xsl:if>          
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOther/@checked)='yes'">
<example num="xPP.PPModifiers.48">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/otherModWithPP" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/otherModWithPP))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/otherModWithPP" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/otherModWithPP))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPModifiers.48</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPModifiers.48.1</xsl:text>
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
         <section2 id="sPPComps">
            <secTitle>Compléments autres que les syntagmes nominaux</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>Certaines </xsl:text>
<xsl:choose>
                        <xsl:when test="//pp/@pPos='before'">prépositions</xsl:when>
                        <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='both'">prépositions or postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
                    </xsl:choose>
<xsl:text>  peuvent rester seules sans un complément dû à un mouvement de particule comme dans les phrases en anglais </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Come [right in]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Entrez, entrez! (littéralement, entrez [droit dans]) »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John turned the light [on/off]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « Jean a allumé/éteint la lumière" (littéralement, Jean a tourné la lumière [sur / de]) »</xsl:text>
</gloss>
<xsl:text>.  Aussi certaines langues permettent des </xsl:text>
<xsl:choose>
                        <xsl:when test="//pp/@pPos='before'">prépositions</xsl:when>
                        <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='both'">prépositions or postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
                    </xsl:choose>
<xsl:text> de rester seules quand leur complément fait partie d’une question,  comme dans </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Who(m) did you give the book [to _ ]?</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « A qui as-tu donné le livre? (littéralement, Qui as-tu donné le livre [à]?) »</xsl:text>
</gloss>
<xsl:text> en anglais.   Aucun de ces exemples n’est correct en français.</xsl:text>
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
                       <xsl:when test="//pp/@alone='no'"> il n’est pas permis aux </xsl:when>
                       <xsl:when test="//pp/@alone='yes'"> il est permis à certains </xsl:when>
                    </xsl:choose>
<xsl:text>ses </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
                        <xsl:text>prépositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
                        <xsl:text>postpositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
                        <xsl:text>adpositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
                        <xsl:text>prépositions ou postpositions</xsl:text>
                    </xsl:if>
<xsl:text> de rester seules sans complément dû au mouvement. </xsl:text>
<xsl:if test="normalize-space(//pp/@alone)='yes'">
                       <xsl:text>Voici des exemples dans des phrases complètes:</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
</p>
                <xsl:if test="normalize-space(//pp/@alone)='yes'">
<example num="xPP.PPComps.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/aloneExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/aloneExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/aloneExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/aloneExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPComps.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPComps.8.1</xsl:text>
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
 
            <p contentType="ctComparativeIntro">
<xsl:text>La plupart des langues permettent des adverbes de lieu comme compléments de </xsl:text>
<xsl:choose>
                        <xsl:when test="//pp/@pPos='before'">prépositions</xsl:when>
                        <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='both'">prépositions ou postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
                    </xsl:choose>
<xsl:text>, par exemple en anglais </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>over there</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « là-bas »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>in here</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « ci-dedans »</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
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
                       <xsl:when test="//pp/@locative='no'"> il n’est pas permis aux </xsl:when>
                       <xsl:when test="//pp/@locative='yes'">  il est permis à certains </xsl:when>
                    </xsl:choose>
<xsl:text> adverbes de lieu comme compléments de </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
                        <xsl:text>prépositions.</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
                        <xsl:text>postpositions.</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
                        <xsl:text>adpositions.</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
                        <xsl:text>prépositions et postpositions.</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@locative)='yes'">
                       <xsl:text>  Voici des exemples avec des complements adverbiaux de lieu:</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
</p>
                <xsl:if test="normalize-space(//pp/@locative)='yes'">
<example num="xPP.PPComps.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/locExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/locExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/locExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/locExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPComps.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPComps.14.1</xsl:text>
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

            <p contentType="ctComparativeIntro">
<xsl:text>Les </xsl:text>
<xsl:choose>
                        <xsl:when test="//pp/@pPos='before'">prépositions</xsl:when>
                        <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='both'">prépositions et postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
                    </xsl:choose>
<xsl:text> de lieu sont un groupe spécial dans ce sens qu’elles peuvent prendre un autre syntagme </xsl:text>
<xsl:choose>
                       <xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
                       <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
                       <xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel</xsl:when>
                       <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
                    </xsl:choose>
<xsl:text> comme complément.  Des exemples en anglais de ce type sont: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>up [to the top]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> (en haut [jusqu’au sommet])</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>around [behind the shed]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> (autour [derrière la cabane])</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>over [by the table]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  (là-bas [près de la table])</xsl:text>
</gloss>
<xsl:text>.  Ceci n’est pas permis en français.</xsl:text>
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
                       <xsl:when test="//pp/@ppComp='no'"> il n’y a pas de </xsl:when>
                        <xsl:when test="//pp/@ppComp='yes'"> il y a des </xsl:when>
                    </xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
                        <xsl:text>prépositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
                        <xsl:text>postpositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
                        <xsl:text>adpositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
                        <xsl:text>prépositions et postpositions</xsl:text>
                    </xsl:if>
<xsl:text> de lieu qui prennent un syntagme </xsl:text>
<xsl:choose>
                       <xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
                       <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
                       <xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel</xsl:when>
                       <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
                    </xsl:choose>
<xsl:text> de lieu comme complément.  </xsl:text>
<xsl:if test="normalize-space(//pp/@ppComp)='yes'">
                       <xsl:text>Voici des exemples:</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
</p>
                <xsl:if test="normalize-space(//pp/@ppComp)='yes'">
<example num="xPP.PPComps.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/compPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/compPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/compPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/compPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPComps.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPComps.20.1</xsl:text>
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

            <p contentType="ctComparativeIntro">
<xsl:text>Les temporels tels que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>avant</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>après</langData>
<xsl:text> sont des </xsl:text>
<xsl:choose>
                      <xsl:when test="//pp/@pPos='before'">prépositions</xsl:when>
                      <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                      <xsl:when test="//pp/@pPos='both'">prépositions ou postpositions</xsl:when>
                      <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
                   </xsl:choose>
<xsl:text> quand ils prennent un syntagme nominal comme complément comme dans </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>avant vous</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>après cela</langData>
<xsl:text>.  En anglais ils peuvent aussi être suivi d’un complément gérondif comme dans </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before [signing the contract]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « avant de [signer le contrat] »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after [buying our new house]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « après [avoir acheté notre nouvelle maison] »</xsl:text>
</gloss>
<xsl:text> puisque les gérondifs sont un type spécial de syntagme nominal.  En français il faudrait un infinitif au lieu d’un gérondif dans  le syntagme équivalent.</xsl:text>
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
                       <xsl:when test="//pp/@tempComp='no'"> il y en a pas </xsl:when>
                       <xsl:when test="//pp/@tempComp='yes'"> il y a </xsl:when>
                    </xsl:choose>
<xsl:text>des </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
                        <xsl:text>prépositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
                        <xsl:text>postpositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
                        <xsl:text>adpositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
                        <xsl:text>prépositions ou postpositions</xsl:text>
                    </xsl:if>
<xsl:text> temporelles qui prennent un syntagme nominal ou un gérundif comme complément.  </xsl:text>
<xsl:if test="normalize-space(//pp/@tempComp)='yes'">
                       <xsl:text>Voici des exemples en phrases completes:</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
</p>
                <xsl:if test="normalize-space(//pp/@tempComp)='yes'">
<example num="xPP.PPComps.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/tempExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/tempExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/tempExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/tempExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPComps.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPComps.26.1</xsl:text>
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
            <xsl:if test="normalize-space(//pp/@tempComp)='yes'">
<p contentType="ctPracticalIntro">
<xsl:text>Ces mêmes </xsl:text>
<xsl:choose>
                  <xsl:when test="//pp/@pPos='before'">prépositions</xsl:when>
                  <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                  <xsl:when test="//pp/@pPos='both'">prépositions ou postpositions</xsl:when>
                  <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
               </xsl:choose>
<xsl:text> temporelles peuvent aussi avoir des phrases comme compléments.  Dans cette fonction ce sont des adverbes temporels et la phrase entière est une phrase adverbiale qui modifie habituellement la phrase principale.  De tels exemples seront détaillés dans la section </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
            <xsl:if test="normalize-space(//pp/@tempComp)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>Ces mêmes </xsl:text>
<xsl:choose>
                  <xsl:when test="//pp/@pPos='before'">prépositions</xsl:when>
                  <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                  <xsl:when test="//pp/@pPos='both'">prépositions ou postpositions</xsl:when>
                  <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
               </xsl:choose>
<xsl:text> temporelles peuvent aussi avoir des phrases comme compléments, comme par exemple en anglais </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before [the rain stops]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « avant que [la pluie s’arrête] »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after [John came home]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « après que [Jean soit rentré] »</xsl:text>
</gloss>
<xsl:text>.  (En français l’adverbe est suivi du complémentiseur « que » et une proposition au subjonctif.)  Utilisés ainsi ce sont des adverbes temporels au lieu de </xsl:text>
<xsl:choose>
                  <xsl:when test="//pp/@pPos='before'">prépositions</xsl:when>
                  <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                  <xsl:when test="//pp/@pPos='both'">prépositions ou postpositions</xsl:when>
                  <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
               </xsl:choose>
<xsl:text> et le syntagme entier est une proposition adverbial qui modifie la phrase principale. De tels exemples seront détaillés dans la section </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
         </section2>
    </section1>
   
      
      
      
      
      
   
   
   
        
    
    
        
    
    
        
    
    
        
    
    
        
    
    
        
    
    
        
    
   
      
      
      
   
   
        
    
    
        
    


   

   
      
   
   
      

   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
   
   
      
   
   
      
   
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
   

</xsl:template>
</xsl:stylesheet>
