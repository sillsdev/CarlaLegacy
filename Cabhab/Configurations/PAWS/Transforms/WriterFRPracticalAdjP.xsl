<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="adjp">
    <section1 id="sAdjP">
       <secTitle>Adjectifs</secTitle>
        <p>
<xsl:text>Cette section considère les adjectifs qualitatifs, les nombres et autres quantificateurs, les articles et les démonstratifs. Les positions permises pour chacun de ces éléments dans le syntagme nominal seront traitées dans la section </xsl:text>
<sectionRef sec="sNP" />
<xsl:text>.
</xsl:text>
</p>
  <section2 id="sAdjQual">
     <secTitle>Adjectifs qualitatifs</secTitle>
     <p contentType="ctPracticalIntro">
<xsl:text>Les adjectifs qualitatifs expriment la dimension, la couleur, l’âge, la texture, la forme ou la qualité.  Cette section traite des adjectifs qui modifient les noms, par contraste avec les adjectifs qui agissent comme prédicats, qui seront traités dans la section </xsl:text>
<sectionRef sec="sIPCop" />
<xsl:text>.</xsl:text>
</p>
     <p contentType="ctComparativeIntro">
<xsl:text>Les adjectifs qualitatifs expriment la dimension, la couleur, l’âge, la texture, la forme ou la qualité.  Une caractéristique de ce type d’adjectif est qu’un nom peut être modifié par plusieurs et en général l’ordre des adjectifs peut changer (avec un léger changement de signification dû aux changements dans la portée de chaque adjectif).  Par exemple en anglais </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>hard dull brass rods</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> (des tiges ternes durs en cuivre jaune)</xsl:text>
</gloss>
<xsl:text> par contraste avec </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>dull hard brass rods</langData>
<xsl:text> par contraste avec </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>brass hard dull rods</langData>
<xsl:text>, et en français </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>un grand livre intéressant vert</langData>
<xsl:text> par contraste avec </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>un grand livre vert intéressant</langData>
<xsl:text>.</xsl:text>
</p>
     <p contentType="ctComparativeIntro">
<xsl:text> Cette section traite des adjectifs qui modifient les noms, par contraste avec les adjectifs qui agissent comme prédicats.  Les constructions d’adjectifs prédicats seront traités dans la section </xsl:text>
<sectionRef sec="sIPCop" />
<xsl:text>.</xsl:text>
</p>
     
     <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//adjp/@adjectiveClassifier)='yes'">
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
<xsl:text> de racines d’adjectifs qualitatifs sont donnés dans le tableau suivant.
        Chacun peut apparaître avec le classificateur approprié attaché.</xsl:text>
</p>
</xsl:if>              
     <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//adjp/@adjectiveClassifier)!='yes'">
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
<xsl:text> d’adjectifs qualitatifs sont donnés dans le tableau suivant:</xsl:text>
</p>
</xsl:if>              
     <example num="xAdjP.AdjQual.14">
<table border="1">
           <tr>
              <th>Adjectifs qualitatifs</th>
              <th>Glose</th>
           </tr>
           <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//adjp/example),'.','')" />
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
     <p contentType="ctComparativeIntro">
<xsl:text>Normalement les adjectifs qualitatifs eux-mêmes peuvent être modifiés. Des exemples en français sont :
        </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>très grand</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>si bleu</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>extrêmement grand</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>très bien construit</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>très facilement oublié</langData>
<xsl:text>.  Toutes les combinaisons de mots ne fonctionnent pas à cause de la sémantique et d’autres considérations, mais en général certains mots de degré et des adverbes de manière ou des syntagmes adverbiaux de manière peuvent modifier les adjectifs.  Certaines langues ont un affixe sur l’adjectif pour l’intensifier et d’autres langues redoublent l’adjectif.</xsl:text>
</p>
     <xsl:if test="normalize-space(//adjp/@modifiers)='no'">
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
<xsl:text>, les adjectifs ne sont ni modifiés ni intensifiés.</xsl:text>
</p>
</xsl:if>
     <xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersDegree/@checked)='yes'">
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
<xsl:text>, les adjectifs peuvent être modifiés par des mots de degré qui apparaissent </xsl:text>
<xsl:if test="normalize-space(//adjp/degreeBefore/@checked)='yes' and normalize-space(//adjp/degreeAfter/@checked)='no' and normalize-space(//adjp/degreeBoth/@checked)='no'">
<xsl:text>avant</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/degreeBefore/@checked)='no' and normalize-space(//adjp/degreeAfter/@checked)='yes' and normalize-space(//adjp/degreeBoth/@checked)='no'">
<xsl:text>après</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/degreeBefore/@checked)='no' and normalize-space(//adjp/degreeAfter/@checked)='no' and normalize-space(//adjp/degreeBoth/@checked)='yes'">
<xsl:text>des deux côtés de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/degreeBefore/@checked)='yes' and normalize-space(//adjp/degreeAfter/@checked)='yes' and normalize-space(//adjp/degreeBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/degreeBefore/@checked)='yes' and normalize-space(//adjp/degreeAfter/@checked)='no' and normalize-space(//adjp/degreeBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/degreeBefore/@checked)='no' and normalize-space(//adjp/degreeAfter/@checked)='yes' and normalize-space(//adjp/degreeBoth/@checked)='yes'">
<xsl:text>après ou des deux côtes de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/degreeBefore/@checked)='yes' and normalize-space(//adjp/degreeAfter/@checked)='yes' and normalize-space(//adjp/degreeBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/degreeOther/@checked)='no'">
<xsl:text> l’adjectif.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/degreeBefore/@checked)='no' and normalize-space(//adjp/degreeAfter/@checked)='no' and normalize-space(//adjp/degreeBoth/@checked)='no' and normalize-space(//adjp/degreeOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//adjp/degreeOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/degreeBefore/@checked)='yes' and normalize-space(//adjp/degreeOther/@checked)='yes' or normalize-space(//adjp/degreeAfter/@checked)='yes' and normalize-space(//adjp/degreeOther/@checked)='yes' or normalize-space(//adjp/degreeBoth/@checked)='yes' and normalize-space(//adjp/degreeOther/@checked)='yes'">
<xsl:text> l’adjectif peut apparaître aussi ___</xsl:text>
<xsl:value-of select="//adjp/degreeOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//adjp/@adjectiveDegreeClassifier)='yes' and normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersDegree/@checked)='yes'">
<xsl:text>Les racines des mots de degré qui peuvent modifier l’adjectif qualitatif en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont montrées ici.  Chacun peut apparaître avec le classificateur approprié attaché.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' and normalize-space(//adjp/@modifiers)='yes' or normalize-space(//adjp/@adjectiveDegreeClassifier)!='yes' and normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersDegree/@checked)='yes'">
<xsl:text>Les mots de degré qui peuvent modifier les adjectifs qualitatifs en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont montrés ici:</xsl:text>
</xsl:if>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersDegree/@checked)='yes'">
<example num="xAdjP.AdjQual.22">
<table border="1">
           <tr>
              <th>Mots de degré</th>
              <th>Glose</th>
           </tr>
           <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//adjp/adjectiveDegreeExample),'.','')" />
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
     <xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersDegree/@checked)='yes'">
<p>
<xsl:text>Des exemples d’adjectifs qualitatifs avec des mots de degré qui les modifient sont:</xsl:text>
</p>
</xsl:if>          
     <xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersDegree/@checked)='yes'">
<example num="xAdjP.AdjQual.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//adjp/adjectiveDegreePhraseExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//adjp/adjectiveDegreePhraseExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//adjp/adjectiveDegreePhraseExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//adjp/adjectiveDegreePhraseExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQual.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQual.26.1</xsl:text>
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
     
   <xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersManner/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersDegree/@checked)='yes'">
<xsl:text>Les adjectifs aussi peuvent être </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/modifiersDegree/@checked)='no'">
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, les adjectifs peuvent être </xsl:text>
</xsl:if>
<xsl:text>modifiés par des adverbes de manière ou des syntagmes adverbiaux de manière qui apparaissent</xsl:text>
<xsl:if test="normalize-space(//adjp/mannerBefore/@checked)='yes' and normalize-space(//adjp/mannerAfter/@checked)='no' and normalize-space(//adjp/mannerBoth/@checked)='no'">
<xsl:text>avant</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/mannerBefore/@checked)='no' and normalize-space(//adjp/mannerAfter/@checked)='yes' and normalize-space(//adjp/mannerBoth/@checked)='no'">
<xsl:text>après</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/mannerBefore/@checked)='no' and normalize-space(//adjp/mannerAfter/@checked)='no' and normalize-space(//adjp/mannerBoth/@checked)='yes'">
<xsl:text>des deux côtés de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/mannerBefore/@checked)='yes' and normalize-space(//adjp/mannerAfter/@checked)='yes' and normalize-space(//adjp/mannerBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/mannerBefore/@checked)='yes' and normalize-space(//adjp/mannerAfter/@checked)='no' and normalize-space(//adjp/mannerBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/mannerBefore/@checked)='no' and normalize-space(//adjp/mannerAfter/@checked)='yes' and normalize-space(//adjp/mannerBoth/@checked)='yes'">
<xsl:text>après ou des deux côtes de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/mannerBefore/@checked)='yes' and normalize-space(//adjp/mannerAfter/@checked)='yes' and normalize-space(//adjp/mannerBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/mannerOther/@checked)='no'">
<xsl:text> l’adjectif.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/mannerBefore/@checked)='no' and normalize-space(//adjp/mannerAfter/@checked)='no' and normalize-space(//adjp/mannerBoth/@checked)='no' and normalize-space(//adjp/mannerOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//adjp/mannerOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/mannerBefore/@checked)='yes' and normalize-space(//adjp/mannerOther/@checked)='yes' or normalize-space(//adjp/mannerAfter/@checked)='yes' and normalize-space(//adjp/mannerOther/@checked)='yes' or normalize-space(//adjp/mannerBoth/@checked)='yes' and normalize-space(//adjp/mannerOther/@checked)='yes'">
<xsl:text> l’adjectif peut apparaître aussi ___</xsl:text>
<xsl:value-of select="//adjp/mannerOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text> Des exemples d’adjectifs qualitatifs avec des adverbes de manière qui les modifient sont:</xsl:text>
</p>
</xsl:if>          
     <xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersManner/@checked)='yes'">
<example num="xAdjP.AdjQual.30">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//adjp/adjectiveMannerPhraseExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//adjp/adjectiveMannerPhraseExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//adjp/adjectiveMannerPhraseExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//adjp/adjectiveMannerPhraseExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQual.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQual.30.1</xsl:text>
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
     
     <xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersAttaches/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//adjp/modifiersDegree/@checked)='yes' or normalize-space(//adjp/modifiersManner/@checked)='yes'">
<xsl:text>Les adjectifs peuvent aussi avoir </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/modifiersDegree/@checked)='no' and normalize-space(//adjp/modifiersManner/@checked)='no'">
<xsl:text>En </xsl:text>
        <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, il y a </xsl:text>
</xsl:if>
<xsl:text>des affixes ou clitiques qui s’attachent à l’adjectif qualitatif pour l’intensifier. Les affixes ou clitiques de degré qui peuvent modifier les adjectifs qualitatifs sont:</xsl:text>
</p>
</xsl:if>
     <xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersAttaches/@checked)='yes'">
<example num="xAdjP.AdjQual.34">
<table border="1">
           <tr>
              <th>Affixes ou clitiques de degré</th>
              <th>Glose</th>
           </tr>
           <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//adjp/adjectiveDegreeAffixExample),'.','')" />
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
     <xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersAttaches/@checked)='yes'">
<p>
<xsl:text>Des exemples d’adjectifs qualitatifs avec un affixe ou un clitique de degré attaché sont:</xsl:text>
</p>
</xsl:if>
     <xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersAttaches/@checked)='yes'">
<example num="xAdjP.AdjQual.38">
<table border="1">
           <tr>
              <th>Adjectifs qualitatifs modifiés</th>
              <th>Glose</th>
           </tr>
           <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//adjp/adjectivePhraseAffixExample),'.','')" />
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
     
     <xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersRedup/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//adjp/modifiersDegree/@checked)='yes' or normalize-space(//adjp/modifiersManner/@checked)='yes' or normalize-space(//adjp/modifiersAttaches/@checked)='yes'">
<xsl:text>Les adjectifs peuvent aussi utiliser redoublement </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/modifiersDegree/@checked)='no' and normalize-space(//adjp/modifiersManner/@checked)='no' and normalize-space(//adjp/modifiersAttaches/@checked)='no'">
<xsl:text>En </xsl:text>
           <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, le redoublement est utilisé </xsl:text>
</xsl:if>
<xsl:text>pour intensifier la signification de l’adjectif qualitatif.  Des exemples d’adjectifs qualitatifs avec le redoublement qui les modifient ou intensifient sont:</xsl:text>
</p>
</xsl:if>
     <xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersRedup/@checked)='yes'">
<example num="xAdjP.AdjQual.42">
<table border="1">
           <tr>
              <th>Adjectifs qualitatifs redoublés</th>
              <th>Glose</th>
           </tr>
           <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//adjp/adjectiveDegreeRedupExample),'.','')" />
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
     
     <xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersOther/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//adjp/modifiersDegree/@checked)='yes' or normalize-space(//adjp/modifiersManner/@checked)='yes' or normalize-space(//adjp/modifiersAttaches/@checked)='yes' or normalize-space(//adjp/modifiersRedup/@checked)='yes'">
<xsl:text>Les adjectifs peuvent aussi être </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//adjp/modifiersDegree/@checked)='no' and normalize-space(//adjp/modifiersManner/@checked)='no' and normalize-space(//adjp/modifiersAttaches/@checked)='no' and normalize-space(//adjp/modifiersRedup/@checked)='no'">
<xsl:text>En </xsl:text>
           <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, les adjectifs sont </xsl:text>
</xsl:if>
<xsl:text>modifiés ou intensifiés par ___</xsl:text>
<xsl:value-of select="//adjp/modifiersOther" />
<xsl:text>.  Des exemples d’adjectifs qualitatifs qui sont modifiés ou intensifiés de cette façon sont:</xsl:text>
</p>
</xsl:if>
     <xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/modifiersOther/@checked)='yes'">
<example num="xAdjP.AdjQual.46">
<table border="1">
           <tr>
              <th>Adjectifs qualitatifs modifiés ou intensifiés</th>
              <th>Glose</th>
           </tr>
           <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//adjp/adjectiveDegreeOtherExample),'.','')" />
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
   
            <section2 id="sAdjNumbers">
                <secTitle>Nombres</secTitle>
               <p contentType="ctPracticalIntro">
<xsl:text>Les nombres viennent sous deux formes: les nombres cardinaux pour compter et les nombres ordinaux qui montrent la position. </xsl:text>
</p>
               <p contentType="ctComparativeIntro">
<xsl:text>Les nombres viennent sous deux formes: les nombres cardinaux pour compter et les nombres ordinaux qui montrent la position.  Les nombres ne peuvent pas être modifiés par des mots de degré comme le peuvent les adjectifs qualitatifs bien qu’ils se trouvent habituellement dans la même position que les quantificateurs.  
                     Les nombres cadinaux peuvent cependant être modifiés par des nombres ordinaux et par </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>suivant</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>dernier</langData>
<xsl:text>, comme par exemple </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>les premier vingt garçons</langData>
<xsl:text> ou
                    </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>les cent années suivantes</langData>
<xsl:text>.  Les nombres ordinaux et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>suivant</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>dernier</langData>
<xsl:text> peuvent aussi modifier des noms directement comme par exemple </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>la troisième fille</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>le dernier garçon</langData>
<xsl:text>.  
                    </xsl:text>
</p>
                <section3 id="sQPNumbersCardinal">
                   <secTitle>Nombres cardinaux</secTitle>
                   <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@numberClassifier)='yes'">
<p>
<xsl:text>Les formes de base des nombres cardinaux sont données dans le tableau suivante. Chacune peut se trouver avec le classificateur approprié attaché.</xsl:text>
</p>
</xsl:if>
                   <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//qp/@numberClassifier)!='yes'">
<p>
<xsl:text>Les formes de base des nombres cardinaux sont données dans le tableau suivante:</xsl:text>
</p>
</xsl:if>
                    <example num="xAdjP.AdjNumbers.QPNumbersCardinal.8">
<table border="1">
                            <tr>
                                <th>Glose</th>
                               <th>Nombres cardinaux</th>
                            </tr>
                            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers1),'.','')" />
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
<td align="left" rowspan="1">
<xsl:text>1</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>1</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers2),'.','')" />
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
<td align="left" rowspan="1">
<xsl:text>2</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>2</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers3),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>3</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>3</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers4),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.1" select="string-length(normalize-space($sExampleValue3.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.1 != 0 and $sExampleValue3.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>4</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>4</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue4.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers5),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.1" select="string-length(normalize-space($sExampleValue4.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.1 != 0 and $sExampleValue4.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>5</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>5</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue5.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers6),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.1" select="string-length(normalize-space($sExampleValue5.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.1 != 0 and $sExampleValue5.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>6</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>6</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue6.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers7),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.1" select="string-length(normalize-space($sExampleValue6.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.1 != 0 and $sExampleValue6.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>7</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>7</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue7.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers8),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.1" select="string-length(normalize-space($sExampleValue7.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.1 != 0 and $sExampleValue7.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>8</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>8</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue8.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers9),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.1" select="string-length(normalize-space($sExampleValue8.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.1 != 0 and $sExampleValue8.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>9</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>9</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue9.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers10),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.1" select="string-length(normalize-space($sExampleValue9.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.1 != 0 and $sExampleValue9.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>10</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>10</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue10.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers11),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10.1" select="string-length(normalize-space($sExampleValue10.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength10.1 != 0 and $sExampleValue10.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>11</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>11</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue11.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers12),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11.1" select="string-length(normalize-space($sExampleValue11.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength11.1 != 0 and $sExampleValue11.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>12</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>12</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue12.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers13),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12.1" select="string-length(normalize-space($sExampleValue12.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength12.1 != 0 and $sExampleValue12.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>13</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>13</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue13.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers14),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13.1" select="string-length(normalize-space($sExampleValue13.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength13.1 != 0 and $sExampleValue13.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>14</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>14</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue14.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers15),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14.1" select="string-length(normalize-space($sExampleValue14.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength14.1 != 0 and $sExampleValue14.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>15</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>15</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue15.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers16),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength15.1" select="string-length(normalize-space($sExampleValue15.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength15.1 != 0 and $sExampleValue15.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength15.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>16</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>16</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue16.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers17),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength16.1" select="string-length(normalize-space($sExampleValue16.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength16.1 != 0 and $sExampleValue16.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength16.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>17</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>17</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue17.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers18),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength17.1" select="string-length(normalize-space($sExampleValue17.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength17.1 != 0 and $sExampleValue17.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength17.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>18</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>18</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue18.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers19),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength18.1" select="string-length(normalize-space($sExampleValue18.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength18.1 != 0 and $sExampleValue18.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength18.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>19</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>19</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue19.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers20),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength19.1" select="string-length(normalize-space($sExampleValue19.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength19.1 != 0 and $sExampleValue19.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength19.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>20</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>20</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue20.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers30),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength20.1" select="string-length(normalize-space($sExampleValue20.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength20.1 != 0 and $sExampleValue20.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength20.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>30</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>30</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue21.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers40),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength21.1" select="string-length(normalize-space($sExampleValue21.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength21.1 != 0 and $sExampleValue21.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength21.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>40</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>40</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue22.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers50),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength22.1" select="string-length(normalize-space($sExampleValue22.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength22.1 != 0 and $sExampleValue22.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength22.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>50</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>50</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue23.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers60),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength23.1" select="string-length(normalize-space($sExampleValue23.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength23.1 != 0 and $sExampleValue23.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength23.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>60</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>60</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue24.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers70),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength24.1" select="string-length(normalize-space($sExampleValue24.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength24.1 != 0 and $sExampleValue24.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength24.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>70</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>70</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue25.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers80),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength25.1" select="string-length(normalize-space($sExampleValue25.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength25.1 != 0 and $sExampleValue25.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue25.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue25.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength25.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>80</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>80</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue26.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers90),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength26.1" select="string-length(normalize-space($sExampleValue26.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength26.1 != 0 and $sExampleValue26.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue26.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue26.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength26.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>90</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>90</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue27.1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers100),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength27.1" select="string-length(normalize-space($sExampleValue27.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength27.1 != 0 and $sExampleValue27.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue27.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue27.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength27.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>100</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>100</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                        </table>
</example>
                   <p>
<xsl:text>Voici quelques exemples de syntagmes nominaux qui contiennent de différents nombres cardinaux avec un nom:</xsl:text>
</p>
                   <example num="xAdjP.AdjNumbers.QPNumbersCardinal.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/cardinalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/cardinalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/cardinalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/cardinalExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjNumbers.QPNumbersCardinal.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjNumbers.QPNumbersCardinal.12.1</xsl:text>
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
<xsl:text>pratique Les nombres cardinaux plus grands peuvent être des composés qui peuvent être écrits comme mots indépendants.  Des exemples de nombres composés en </xsl:text>
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
                   <p contentType="ctComparativeIntro">
<xsl:text>Les nombres cardinaux plus grands peuvent être des composés qui peuvent être écrits comme mots indépendants, tells que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cent trente trois</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>quatre mille troise</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>six mille cent trente-et-un</langData>
<xsl:text>.  
                         Des exemples de nombres composés en </xsl:text>
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
                   <example num="xAdjP.AdjNumbers.QPNumbersCardinal.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/cardinalCompoundExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/cardinalCompoundExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/cardinalCompoundExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/cardinalCompoundExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjNumbers.QPNumbersCardinal.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjNumbers.QPNumbersCardinal.18.1</xsl:text>
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
<xsl:text>Comme vu ci-dessus, la position des unités et les conjonctions, si nécessaires, en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont sur la partie </xsl:text>
<xsl:choose>
                           <xsl:when test="//qp/@cardinalHead='initial'">première ou initiale </xsl:when>
                            <xsl:when test="//qp/@cardinalHead='final'">finale </xsl:when>
                        </xsl:choose>
<xsl:text>du nombre composé.
                        </xsl:text>
</p>
                </section3>
                <section3 id="sQPNumbersOrdinal">
                   <secTitle>Nombres ordinaux</secTitle>
                   <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@numberClassifier)='yes'">
<p>
<xsl:text>Les formes de base des dix premiers nombres ordinaux et les mots qui signifient </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>suivant</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>dernier</langData>
<xsl:text> sont donnés dans le tableau suivante.  Chacune peut se trouver avec le classificateur approprié attaché.</xsl:text>
</p>
</xsl:if>
                   <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//qp/@numberClassifier)!='yes'">
<p>
<xsl:text>Les formes de base des dix premiers nombres ordinaux et les mots qui signifient </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>suivant</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>dernier</langData>
<xsl:text> sont données dans le tableau suivante:</xsl:text>
</p>
</xsl:if>
                   
                    <example num="xAdjP.AdjNumbers.QPNumbersOrdinal.8">
<table border="1">
                            <tr>
                                <th>Glose</th>
                               <th>Nombres ordinaux</th>
                            </tr>
                           <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//qp/ordinalNumbers1),'.','')" />
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
<td align="left" rowspan="1">
<xsl:text>premier</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>premier</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//qp/ordinalNumbers2),'.','')" />
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
<td align="left" rowspan="1">
<xsl:text>deuxième</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>deuxième</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//qp/ordinalNumbers3),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>troisième</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>troisième</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//qp/ordinalNumbers4),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.1" select="string-length(normalize-space($sExampleValue3.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.1 != 0 and $sExampleValue3.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>quartrième</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>quartrième</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue4.1">
<xsl:value-of select="translate(string(//qp/ordinalNumbers5),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.1" select="string-length(normalize-space($sExampleValue4.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.1 != 0 and $sExampleValue4.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>cinquième</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>cinquième</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue5.1">
<xsl:value-of select="translate(string(//qp/ordinalNumbers6),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.1" select="string-length(normalize-space($sExampleValue5.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.1 != 0 and $sExampleValue5.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>sixième</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>sixième</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue6.1">
<xsl:value-of select="translate(string(//qp/ordinalNumbers7),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.1" select="string-length(normalize-space($sExampleValue6.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.1 != 0 and $sExampleValue6.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>septième</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>septième</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue7.1">
<xsl:value-of select="translate(string(//qp/ordinalNumbers8),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.1" select="string-length(normalize-space($sExampleValue7.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.1 != 0 and $sExampleValue7.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>huitième</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>huitième</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue8.1">
<xsl:value-of select="translate(string(//qp/ordinalNumbers9),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.1" select="string-length(normalize-space($sExampleValue8.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.1 != 0 and $sExampleValue8.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>neuvième</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>neuvième</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue9.1">
<xsl:value-of select="translate(string(//qp/ordinalNumbers10),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.1" select="string-length(normalize-space($sExampleValue9.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.1 != 0 and $sExampleValue9.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>dixième</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>dixième</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                       <xsl:variable name="sExampleValue10.1">
<xsl:value-of select="translate(string(//qp/nextExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10.1" select="string-length(normalize-space($sExampleValue10.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength10.1 != 0 and $sExampleValue10.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>suivant</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>suivant</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                           <xsl:variable name="sExampleValue11.1">
<xsl:value-of select="translate(string(//qp/lastExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11.1" select="string-length(normalize-space($sExampleValue11.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength11.1 != 0 and $sExampleValue11.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>dernier</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>dernier</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                        </table>
</example>
                   <xsl:if test="normalize-space(//qp/ordinalAffix/@checked)='yes'">
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
<xsl:if test="normalize-space(//qp/ordinalAffix/@checked)='yes' and normalize-space(//qp/ordinalIndependent/@checked)='yes' or normalize-space(//qp/ordinalAffix/@checked)='yes' and normalize-space(//qp/ordinalWord/@checked)='yes' or normalize-space(//qp/ordinalAffix/@checked)='yes' and normalize-space(//qp/ordinalOther/@checked)='yes'">
<xsl:text>certains </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalAffix/@checked)='yes' and normalize-space(//qp/ordinalIndependent/@checked)='no' and normalize-space(//qp/ordinalWord/@checked)='no' and normalize-space(//qp/ordinalOther/@checked)='no'">
<xsl:text>les </xsl:text>
</xsl:if>
<xsl:text>nombres ordinaux sont formés en ajoutant un affixe au nombre cardinal. L’affixe est:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//qp/ordinalAffix/@checked)='yes'">
<example num="xAdjP.AdjNumbers.QPNumbersOrdinal.12">
<table border="1"> 
              <tr>
                 <th>Affixes ordinaux</th>
                 <th>Glose</th>
              </tr>
              <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//qp/ordinalAffixExample),'.','')" />
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
                   
                   <xsl:if test="normalize-space(//qp/ordinalWord/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//qp/ordinalAffix/@checked)='no'">
<xsl:text>En </xsl:text>
                      <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
                      <xsl:text> les </xsl:text>
                         <xsl:if test="normalize-space(//qp/ordinalWord/@checked)='yes' and normalize-space(//qp/ordinalIndependent/@checked)='yes' or normalize-space(//qp/ordinalAffix/@checked)='yes' and normalize-space(//qp/ordinalWord/@checked)='yes' or normalize-space(//qp/ordinalWord/@checked)='yes' and normalize-space(//qp/ordinalOther/@checked)='yes'">
<xsl:text>certains </xsl:text>
</xsl:if>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalAffix/@checked)='yes'">
<xsl:text>Certains </xsl:text>
</xsl:if>
<xsl:text> nombres ordinaux sont formés en ajoutant un autre mot </xsl:text>
<xsl:if test="normalize-space(//qp/ordinalWordBefore/@checked)='yes' and normalize-space(//qp/ordinalWordAfter/@checked)='no' and normalize-space(//qp/ordinalWordBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalWordBefore/@checked)='no' and normalize-space(//qp/ordinalWordAfter/@checked)='yes' and normalize-space(//qp/ordinalWordBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalWordBefore/@checked)='no' and normalize-space(//qp/ordinalWordAfter/@checked)='no' and normalize-space(//qp/ordinalWordBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalWordBefore/@checked)='yes' and normalize-space(//qp/ordinalWordAfter/@checked)='yes' and normalize-space(//qp/ordinalWordBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalWordBefore/@checked)='yes' and normalize-space(//qp/ordinalWordAfter/@checked)='no' and normalize-space(//qp/ordinalWordBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalWordBefore/@checked)='no' and normalize-space(//qp/ordinalWordAfter/@checked)='yes' and normalize-space(//qp/ordinalWordBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalWordBefore/@checked)='yes' and normalize-space(//qp/ordinalWordAfter/@checked)='yes' and normalize-space(//qp/ordinalWordBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalWordOther/@checked)='no'">
<xsl:text> nombre cardinal.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalWordBefore/@checked)='no' and normalize-space(//qp/ordinalWordAfter/@checked)='no' and normalize-space(//qp/ordinalWordBoth/@checked)='no' and normalize-space(//qp/ordinalWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//qp/ordinalWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalWordBefore/@checked)='yes' and normalize-space(//qp/ordinalWordOther/@checked)='yes' or normalize-space(//qp/ordinalWordAfter/@checked)='yes' and normalize-space(//qp/ordinalWordOther/@checked)='yes' or normalize-space(//qp/ordinalWordBoth/@checked)='yes' and normalize-space(//qp/ordinalWordOther/@checked)='yes'">
<xsl:text> nombre cardinal et il peut aussi se trouver ___ </xsl:text>
<xsl:value-of select="//qp/ordinalWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>Le mot ordinal est:</xsl:text>
</p>
</xsl:if>
                   <xsl:if test="normalize-space(//qp/ordinalWord/@checked)='yes'">
<example num="xAdjP.AdjNumbers.QPNumbersOrdinal.16">
<table border="1">
                         <tr>
                            <th>Mots ordinaux</th>
                            <th>Glose</th>
                         </tr>
                         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//qp/ordinalWordExample),'.','')" />
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
                   <xsl:if test="normalize-space(//qp/ordinalAffix/@checked)='no' and normalize-space(//qp/ordinalIndependent/@checked)='yes' and normalize-space(//qp/ordinalWord/@checked)='no' and normalize-space(//qp/ordinalOther/@checked)='no'">
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
<xsl:text> tous les nombres ordinaux sont des mots distinct de nombres cardinaux.  </xsl:text>
</p>
</xsl:if>
                   <xsl:if test="normalize-space(//qp/ordinalAffix/@checked)='no' and normalize-space(//qp/ordinalIndependent/@checked)='yes' and normalize-space(//qp/ordinalWord/@checked)='no' and normalize-space(//qp/ordinalOther/@checked)='yes'">
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
<xsl:text> certains nombres ordinaux sont des mots distincts des nombres cardinaux et certains sont formés par ___ </xsl:text>
<xsl:value-of select="//qp/ordinalOther" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
                   <xsl:if test="normalize-space(//qp/ordinalAffix/@checked)='yes' and normalize-space(//qp/ordinalIndependent/@checked)='yes' and normalize-space(//qp/ordinalOther/@checked)='no' or normalize-space(//qp/ordinalWord/@checked)='yes' and normalize-space(//qp/ordinalIndependent/@checked)='yes' and normalize-space(//qp/ordinalOther/@checked)='no'">
<p>
<xsl:text>Cependant certains nombres ordinaux sont des mots distincts des nombres cardinaux.  </xsl:text>
</p>
</xsl:if>
                   <xsl:if test="normalize-space(//qp/ordinalAffix/@checked)='yes' and normalize-space(//qp/ordinalIndependent/@checked)='yes' and normalize-space(//qp/ordinalOther/@checked)='yes' or normalize-space(//qp/ordinalWord/@checked)='yes' and normalize-space(//qp/ordinalIndependent/@checked)='yes' and normalize-space(//qp/ordinalOther/@checked)='yes'">
<p>
<xsl:text>Cependant, certains nombres ordinaux sont des mots distincts des nombres cardinaux et certains sont formés par ___ </xsl:text>
<xsl:value-of select="//qp/ordinalOther" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
                   <p>
<xsl:text>Des exemples de nombres ordinaux modifiant un nom dans un syntagme nominal sont:</xsl:text>
</p>
                   <example num="xAdjP.AdjNumbers.QPNumbersOrdinal.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/ordinalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/ordinalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/ordinalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/ordinalExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjNumbers.QPNumbersOrdinal.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjNumbers.QPNumbersOrdinal.28.1</xsl:text>
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
                   
                   <xsl:if test="normalize-space(//qp/ordinalBefore/@checked)='yes' or normalize-space(//qp/ordinalAfter/@checked)='yes' or normalize-space(//qp/ordinalBoth/@checked)='yes' or normalize-space(//qp/ordinalNumOther/@checked)='yes'">
<p>
<xsl:text>Lorsque des nombres ordinaux ou des mots signifiant </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>suivant</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>dermier</langData>
<xsl:text> modifient un nombre cardinal, ils se trouvent </xsl:text>
<xsl:if test="normalize-space(//qp/ordinalBefore/@checked)='yes' and normalize-space(//qp/ordinalAfter/@checked)='no' and normalize-space(//qp/ordinalBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalBefore/@checked)='no' and normalize-space(//qp/ordinalAfter/@checked)='yes' and normalize-space(//qp/ordinalBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalBefore/@checked)='no' and normalize-space(//qp/ordinalAfter/@checked)='no' and normalize-space(//qp/ordinalBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalBefore/@checked)='yes' and normalize-space(//qp/ordinalAfter/@checked)='yes' and normalize-space(//qp/ordinalBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalBefore/@checked)='yes' and normalize-space(//qp/ordinalAfter/@checked)='no' and normalize-space(//qp/ordinalBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalBefore/@checked)='no' and normalize-space(//qp/ordinalAfter/@checked)='yes' and normalize-space(//qp/ordinalBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalBefore/@checked)='yes' and normalize-space(//qp/ordinalAfter/@checked)='yes' and normalize-space(//qp/ordinalBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalNumOther/@checked)='no'">
<xsl:text> nombre cardinal.  Voici des exemples de syntagmes nominaux avec des nombres ordinaux qui modifient un nombre cardinal et un nom:</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalBefore/@checked)='no' and normalize-space(//qp/ordinalAfter/@checked)='no' and normalize-space(//qp/ordinalBoth/@checked)='no' and normalize-space(//qp/ordinalNumOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//qp/ordinalNumOther" />
<xsl:text>.   Voici des exemples de syntagmes nominaux avec des nombres ordinaux qui modifient un nombre cardinal et un nom:</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/ordinalBefore/@checked)='yes' and normalize-space(//qp/ordinalNumOther/@checked)='yes' or normalize-space(//qp/ordinalAfter/@checked)='yes' and normalize-space(//qp/ordinalNumOther/@checked)='yes' or normalize-space(//qp/ordinalBoth/@checked)='yes' and normalize-space(//qp/ordinalNumOther/@checked)='yes'">
<xsl:text> nombre cardinal et peut aussi se trouver  ___</xsl:text>
<xsl:value-of select="//qp/ordinalNumOther" />
<xsl:text>.   Voici des exemples de syntagmes nominaux avec des nombres ordinaux qui modifient un nombre cardinal et un nom:</xsl:text>
</xsl:if>
</p>
</xsl:if>
                   <xsl:if test="normalize-space(//qp/ordinalBefore/@checked)='yes' or normalize-space(//qp/ordinalAfter/@checked)='yes' or normalize-space(//qp/ordinalBoth/@checked)='yes' or normalize-space(//qp/ordinalNumOther/@checked)='yes'">
<example num="xAdjP.AdjNumbers.QPNumbersOrdinal.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/ordinalCardinalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/ordinalCardinalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/ordinalCardinalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/ordinalCardinalExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjNumbers.QPNumbersOrdinal.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjNumbers.QPNumbersOrdinal.32.1</xsl:text>
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
                   <xsl:if test="normalize-space(//qp/ordinalBefore/@checked)='yes' or normalize-space(//qp/ordinalAfter/@checked)='yes' or normalize-space(//qp/ordinalBoth/@checked)='yes' or normalize-space(//qp/ordinalNumOther/@checked)='yes'">
<p>
<xsl:text>Des exemples de modificateurs qui signifient </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>suivant</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>dermier</langData>
<xsl:text> qui modifient un nombre cardinal et un nom ou un nom seulement dans un syntagme nominal incluent:</xsl:text>
</p>
</xsl:if>
                   <xsl:if test="normalize-space(//qp/ordinalBefore/@checked)='no' and normalize-space(//qp/ordinalAfter/@checked)='no' and normalize-space(//qp/ordinalBoth/@checked)='no' and normalize-space(//qp/ordinalNumOther/@checked)='no' and normalize-space(//qp/ordinalNumNowhere/@checked)='yes'">
<p>
<xsl:text>Les nombres ordinaux ou les mots qui signifient </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>suivant</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>dermier</langData>
<xsl:text> ne modifient pas un nombre cardinal en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  
                      Des exemples de modificateurs qui signifient </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>suivant</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>dermier</langData>
<xsl:text> qui modifient un nom seulement dans un syntagme nominal incluent:</xsl:text>
</p>
</xsl:if>
                    <example num="xAdjP.AdjNumbers.QPNumbersOrdinal.38">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/nextlastNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/nextlastNPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/nextlastNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/nextlastNPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjNumbers.QPNumbersOrdinal.38</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjNumbers.QPNumbersOrdinal.38.1</xsl:text>
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
            </section3>
            
        </section2>
        
        <section2 id="sAdjQP">
           <secTitle>Quantificateurs</secTitle>
           <p contentType="ctPracticalIntro">
<xsl:text>Des quantificateurs peuvent apparaître dans différents endroits dans le syntagme nominal basé sur leur portéel. Trois types de quantificateurs seront traités ici, suivis de constructions partitives.</xsl:text>
</p>
           <p contentType="ctComparativeIntro">
<xsl:text>Des quantificateurs peuvent apparaître dans différents endroits dans le syntagme nominal basé sur leur portéel.  La plupart des langues ont trois groupes de quantificateurs en plus des nombres: des quantificateurs  de large portée signifiant que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tout</langData>
<xsl:text> modifiera le syntagme nominal en entier, des déterminatifs tels que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>quelques</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>certains</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>chaque</langData>
<xsl:text>, qui ne se trouvent pas avec d’autres modificateurs exceptés des adjectifs, et des quantificateurs comme de portée plus restreinte tels que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>beaucoup</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>plusiers</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nombreaux</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>peu de</langData>
<xsl:text>.  Chaque type sera considéré l’un après l’autre et ensuite les constructions partitives seront traitées.
             </xsl:text>
</p>
         <section3 id="sQPAll">
            <secTitle>Des quantificateurs qui modifient le syntagme nominal entier</secTitle>
            <p contentType="ctPracticalIntro">
<xsl:text>Les quantificateurs signifiant </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tout</langData>
<xsl:text> se trouvent habituellement en première (ou en dernière) position dans le syntagme nominal, dans une position distincte des autres quantificateurs mais au même endroit que certains mots de degré ou marqueurs de focus (voir la section </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text>).</xsl:text>
</p>
            <p contentType="ctComparativeIntro">
<xsl:text>Les quantificateurs qui signifient </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tout</langData>
<xsl:text> semblent être une catégorie à part.  Ils se trouvent en général en première (ou dernière) position dans un syntagme nominal, dans une position distincte des autres quantificateurs mais au même endroit que des mots de degré tels que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>seulement</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>seuls</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>juste</langData>
<xsl:text>  (qui peuvent fonctionner comme des marqueurs de focus qu’on traitera dans section </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text>) et les mots de degré comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>presque</langData>
<xsl:text> (qui peut se présenter avec </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tout</langData>
<xsl:text>).   Des exemples en français sont:</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tous les sinq enfants</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>seulement les trois enfants de Suzanne</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>presque tous les jeunes enfants de Jean</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>seulement quelques enfants tristes</langData>
<xsl:text>.</xsl:text>
</p>
            <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@npDegreeClassifier)='yes'">
<p>
<xsl:text>Le tableau suivant montre la façon dont les quantificateurs de grande portée et les éléments de degré qui modifient le syntagme nominal entier sont exprimés en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Les formes montrées dans le tableau sont les racines; chacune peut apparaître avec les classificateurs appropriés attachés.</xsl:text>
</p>
</xsl:if>
            <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//qp/@npDegreeClassifier)!='yes'">
<p>
<xsl:text>Le tableau suivant montre la façon dont les quantificateurs de grande portée les éléments de degré qui modifient le syntagme nominal sont exprimée en </xsl:text>
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
            <example num="xAdjP.AdjQP.QPAll.12">
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
<xsl:text>seulement, seuls, juste</xsl:text>
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
<xsl:text>seulement, seuls, juste</xsl:text>
</gloss>
                     </td>
</tr>
</xsl:otherwise>
</xsl:choose>
               </table>
</example>
            <xsl:if test="normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='some'">
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
<xsl:if test="normalize-space(//qp/@npDegree)='yes'">
<xsl:text> ils sont exprimés comme des mots indépendants qui modifient le syntagme nominal entier.  Ils se trouvent </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/@npDegree)='some'">
<xsl:text> certains de ceux-ci sont exprimés comme des mots indépendants qui modifient le syntagme nominal entier.  Ils se trouvent </xsl:text>
</xsl:if>
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
<xsl:text> reste de le syntagme nominal et peuvent aussi se trouver  ___</xsl:text>
<xsl:value-of select="//qp/npDegreePosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
</p>
</xsl:if>
            <xsl:if test="normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='some'">
<p>
<xsl:text>Des exemples de formes de mots indépendants inclus dans des syntagmes nominaux entiers sont:</xsl:text>
</p>
</xsl:if>                        
            <example num="xAdjP.AdjQP.QPAll.18">
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
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPAll.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPAll.18.1</xsl:text>
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
            
            <xsl:if test="normalize-space(//qp/@npDegree)='no' or normalize-space(//qp/@npDegree)='some'">
<p>
<xsl:if test="normalize-space(//qp/@npDegree)='no'"> <xsl:text>En </xsl:text>
                  <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
                  <xsl:text> ici ceux-ci ne sont pas exprimés comme mots indépendants qui modifient le syntagme nominal entire. Au lieu de cela, ils s’attachent tous</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/@npDegree)='some'">
<xsl:text>D’autres ne sont pas exprimés comme des mots indépendants qui modifient le syntagme nominal entier.  Au lieu de cela, ils s’attachent</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='no'">
<xsl:text> comme proclitique phrasal à l’avant de n’importe quel mot qui commence le syntagme nominal.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreeTypeProclitic/@checked)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypePrefix/@checked)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='no'">
<xsl:text> comme enclitique phrasal à la fin de n’importe quel mot qui termine le syntagme nominal.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypePrefix/@checked)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='no'">
<xsl:text> comme clitique phrasal soit devant n’importe quel mot qui commence le syntagme nominal ou à la fin de n’importe quel mot qui finit le syntagme nominal.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreeTypeProclitic/@checked)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='no'">
<xsl:text> comme préfixes au nom principal du syntagme nominal.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreeTypeProclitic/@checked)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes'">
<xsl:text> comme suffixes au nom principal du syntagme nominal.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreeTypeProclitic/@checked)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes'">
<xsl:text> comme préfixes ou suffixes au nom principal du syntagme nominal.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='no' or normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes' or normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes' or normalize-space(//qp/npDegreeTypeProclitic/@checked)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='no' or normalize-space(//qp/npDegreeTypeProclitic/@checked)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypePrefix/@checked)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes' or normalize-space(//qp/npDegreeTypeProclitic/@checked)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes' or normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes' or normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='no' or normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypePrefix/@checked)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes' or normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes'">
<xsl:text> comme clitiques au début ou à la fin du syntagme nominal ou comme affixes au nom principal du syntagme nominal.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreeTypeProclitic/@checked)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='no' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//qp/npDegreeTypeOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes' or normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes' or normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes' or normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes'">
<xsl:text>  Certains s’attachent aussi ___</xsl:text>
<xsl:value-of select="//qp/npDegreeTypeOther" />  <xsl:text>.</xsl:text>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>   
            <xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de formes clitiques inclues dans des syntagmes nominaux:</xsl:text>
</p>
</xsl:if>
            <xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes'">
<example num="xAdjP.AdjQP.QPAll.24">
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
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPAll.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPAll.24.1</xsl:text>
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
<xsl:text>Voici des exemples de formes d’affixes inclues dans des syntagmes nominaux:</xsl:text>
</p>
</xsl:if>
            <xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes'">
<example num="xAdjP.AdjQP.QPAll.28">
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
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPAll.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPAll.28.1</xsl:text>
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
<xsl:text>Voici des exemples de formes qui s’attachent comme permises en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> inclues dans des syntagmes nominaux entiers:</xsl:text>
</p>
</xsl:if>
            <xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes'">
<example num="xAdjP.AdjQP.QPAll.32">
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
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPAll.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPAll.32.1</xsl:text>
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
         </section3>
           
            <section3 id="sQPDeterminers">
               <secTitle>Les quantificateurs qui ne se trouvent pas avec les déterminatifs</secTitle>
               <p contentType="ctPracticalIntro">
<xsl:text>Le deuxième groupe comprend des quantificateurs comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>quelques</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>certains</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>chaque</langData>
<xsl:text> qui normalement ne permettent pas d’autres déterminatifs comme des articles, des démonstratifs ou des possesseurs dans le syntagme nominal.</xsl:text>
</p>
               <p contentType="ctComparativeIntro">
<xsl:text>Le deuxième groupe comprend des quantificateurs comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>quelques</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>certains</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>chaque</langData>
<xsl:text> qui normalement ne permettent pas d’autres démonstratifs comme des articles, des démonstratifs ou des possesseurs dans le syntagme nominal.  Certains exemples de syntagmes nominaux en français qui incluent ces quantificateurs sont:  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>quelques enfants tristes</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>presque chaque petite fille que je vois</langData>
<xsl:text>.  Des exemples non grammaticaux tels que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>* chaque le méchant garçon</langData>
<xsl:text>, ou, en anglais, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>* those some boys</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> (ces quelques garçons)</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute> * Sue’s some sad children</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> (les quelques enfants tristes de Suzannes)</xsl:text>
</gloss>
<xsl:text> illustrent que ces  quantificateurs ne se trouvent pas avec des articles, démonstratifs ou possessifs.  Remarquez qu’un exemple comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>some of the children</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> (quelques’uns des enfants)</xsl:text> </gloss>
<xsl:text> est grammatical en anglais, mais c’est le cas de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>some</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « quelques »</xsl:text>
</gloss>
<xsl:text> à la tête de le syntagme nominal, avec un
                     syntagme partitif </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>of the children</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « des enfants »</xsl:text>
</gloss>
<xsl:text> qui la modifient et qui sera traitée dans la section </xsl:text>
<sectionRef sec="sQPPartitive" />
<xsl:text>. </xsl:text>
</p>
  
               <xsl:if test="normalize-space(//qp/@determinerClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Le tableau suivant montre la façon dont ces quantificateurs qui agissent comme déterminatif unique sont exprimés en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Les formes montrées dans le tableau sont les racines, chacune d’entre elles peut venir avec le classificateur approprié attaché.</xsl:text>
</p>
</xsl:if>
               <xsl:if test="normalize-space(//qp/@determinerClassifier)!='yes' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>Le tableau suivant montre comment ces quantificateurs qui agissent comme déterminant unique sont exprimés en </xsl:text>
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
               <example num="xAdjP.AdjQP.QPDeterminers.12">
<table border="1">
                     <tr>
                        <th>Morphèmes</th>
                        <th>Glose</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//qp/some),'.','')" />
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
<xsl:text>quelques, certains</xsl:text>
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
<xsl:text>quelques, certains</xsl:text>
</gloss>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                     <xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//qp/any),'.','')" />
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
<xsl:text>quelconque</xsl:text>
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
<xsl:text>quelconque</xsl:text>
</gloss>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                     <xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//qp/every),'.','')" />
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
<xsl:text>chaque</xsl:text>
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
<xsl:text>chaque</xsl:text>
</gloss>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                  </table>
</example>
               <xsl:if test="normalize-space(//qp/@determinerType)='yes' or normalize-space(//qp/@determinerType)='some'">
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
<xsl:if test="normalize-space(//qp/@determinerType)='yes'">
<xsl:text> ceux-ci sont exprimés comme mots indépendants. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/@determinerType)='some'">
<xsl:text> certains sont exprimés comme mots indépendants.  </xsl:text>
</xsl:if>
<xsl:text>Des exemples qui montrent leur usage dans des syntagmes nominaux entiers sont:</xsl:text>
</p>
</xsl:if> 
               <xsl:if test="normalize-space(//qp/@determinerType)='yes' or normalize-space(//qp/@determinerType)='some'">
<example num="xAdjP.AdjQP.QPDeterminers.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/determinerExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/determinerExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/determinerExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/determinerExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPDeterminers.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPDeterminers.16.1</xsl:text>
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
                  <xsl:if test="normalize-space(//qp/@determinerType)='yes' or normalize-space(//qp/@determinerType)='some'">
<p>
<xsl:text>Comme les exemples le montrent, </xsl:text>
<xsl:if test="normalize-space(//qp/@determiner)='yes'">
<xsl:text>ces quantificateurs ne se trouvent pas avec d’autres déteminants.  Ils se trouvent </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/@determiner)='some'">
<xsl:text>certains de ces quantificateurs ne se trouvent pas avec d’autres déterminants mais d’autres peuvent se trouver soit comme les quantificateurs de grande portée discutés dans la section précédente soit comme les quantificateurs de portée plus réduite qui seront traités dans la prochaine section.  Ceux qui ne se trouvent pas avec d’autres déterminants se trouvent </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/@determiner)='noAll'">
<xsl:text>ces quantificateurs peuvent se trouver avec d’autres déterminants; ils sont donc comme les quantificateurs de grande portée discutés dans la section précédente.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/@determiner)='noQ'">
<xsl:text>ces quantificateurs peuvent se trouver avec d’autres déterminants; ils sont donc comme les quantificateurs de portée plus réduite qui seront traités dans la prochaine section.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='some'">
    <xsl:if test="normalize-space(//qp/determinerPosBefore/@checked)='yes' and normalize-space(//qp/determinerPosAfter/@checked)='no' and normalize-space(//qp/determinerPosBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
    <xsl:if test="normalize-space(//qp/determinerPosBefore/@checked)='no' and normalize-space(//qp/determinerPosAfter/@checked)='yes' and normalize-space(//qp/determinerPosBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
    <xsl:if test="normalize-space(//qp/determinerPosBefore/@checked)='no' and normalize-space(//qp/determinerPosAfter/@checked)='no' and normalize-space(//qp/determinerPosBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
    <xsl:if test="normalize-space(//qp/determinerPosBefore/@checked)='yes' and normalize-space(//qp/determinerPosAfter/@checked)='yes' and normalize-space(//qp/determinerPosBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
    <xsl:if test="normalize-space(//qp/determinerPosBefore/@checked)='yes' and normalize-space(//qp/determinerPosAfter/@checked)='no' and normalize-space(//qp/determinerPosBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
    <xsl:if test="normalize-space(//qp/determinerPosBefore/@checked)='no' and normalize-space(//qp/determinerPosAfter/@checked)='yes' and normalize-space(//qp/determinerPosBoth/@checked)='yes'">
<xsl:text>après ou des deux côtes du</xsl:text>
</xsl:if>
    <xsl:if test="normalize-space(//qp/determinerPosBefore/@checked)='yes' and normalize-space(//qp/determinerPosAfter/@checked)='yes' and normalize-space(//qp/determinerPosBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
    <xsl:if test="normalize-space(//qp/determinerPosOther/@checked)='no'">
<xsl:text> nom principal.  </xsl:text>
                  </xsl:if>
    <xsl:if test="normalize-space(//qp/determinerPosBefore/@checked)='no' and normalize-space(//qp/determinerPosAfter/@checked)='no' and normalize-space(//qp/determinerPosBoth/@checked)='no' and normalize-space(//qp/determinerPosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//qp/determinerPosOther" />
<xsl:text>.  </xsl:text>
                  </xsl:if>
    <xsl:if test="normalize-space(//qp/determinerPosBefore/@checked)='yes' and normalize-space(//qp/determinerPosOther/@checked)='yes' or normalize-space(//qp/determinerPosAfter/@checked)='yes' and normalize-space(//qp/determinerPosOther/@checked)='yes' or normalize-space(//qp/determinerPosBoth/@checked)='yes' and normalize-space(//qp/determinerPosOther/@checked)='yes'">
<xsl:text> nom principal  et peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//qp/determinerPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
</xsl:if>
</p>
</xsl:if>

               <xsl:if test="normalize-space(//qp/@determinerType)='no' or normalize-space(//qp/@determinerType)='some'">
<p>
<xsl:if test="normalize-space(//qp/@determinerType)='no'"> <xsl:text>En </xsl:text>
                     <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
                     <xsl:text> ceux-ci ne sont pas exprimés comme mots indépendants.  Au lieu de cela ils s’attachent tous</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/@determinerType)='some'">
<xsl:text>D’autres ne sont pas exprimés comme des mots indépendants qui modifient le syntagme nominal entier.  Au lieu de cela ils s’attachent</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/determinerTypeProclitic/@checked)='yes' and normalize-space(//qp/determinerTypeEnclitic/@checked)='no' and normalize-space(//qp/determinerTypePrefix/@checked)='no' and normalize-space(//qp/determinerTypeSuffix/@checked)='no'">
<xsl:text> comme proclitique phrasal au devant de chaque mot qui commence le syntagme nominal.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/determinerTypeProclitic/@checked)='no' and normalize-space(//qp/determinerTypeEnclitic/@checked)='yes' and normalize-space(//qp/determinerTypePrefix/@checked)='no' and normalize-space(//qp/determinerTypeSuffix/@checked)='no'">
<xsl:text>comme enclitique phrasal à la fin de chaque mot qui finit le syntagme nominal.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/determinerTypeProclitic/@checked)='yes' and normalize-space(//qp/determinerTypeEnclitic/@checked)='yes' and normalize-space(//qp/determinerTypePrefix/@checked)='no' and normalize-space(//qp/determinerTypeSuffix/@checked)='no'">
<xsl:text>comme clitique phrasal soit au devant du mot qui commence le syntagme nominal ou à la fin du mot qui termine le syntagme nominal.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/determinerTypeProclitic/@checked)='no' and normalize-space(//qp/determinerTypeEnclitic/@checked)='no' and normalize-space(//qp/determinerTypePrefix/@checked)='yes' and normalize-space(//qp/determinerTypeSuffix/@checked)='no'">
<xsl:text> comme préfixes sur le nom principal du syntagme nominal.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/determinerTypeProclitic/@checked)='no' and normalize-space(//qp/determinerTypeEnclitic/@checked)='no' and normalize-space(//qp/determinerTypePrefix/@checked)='no' and normalize-space(//qp/determinerTypeSuffix/@checked)='yes'">
<xsl:text> comme suffixes sur le nom principal du syntagme nominal.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/determinerTypeProclitic/@checked)='no' and normalize-space(//qp/determinerTypeEnclitic/@checked)='no' and normalize-space(//qp/determinerTypePrefix/@checked)='yes' and normalize-space(//qp/determinerTypeSuffix/@checked)='yes'">
<xsl:text> comme soit préfixes soit suffixes sur le nom principal du syntagme nominal.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/determinerTypeProclitic/@checked)='yes' and normalize-space(//qp/determinerTypeEnclitic/@checked)='no' and normalize-space(//qp/determinerTypePrefix/@checked)='yes' and normalize-space(//qp/determinerTypeSuffix/@checked)='no' or normalize-space(//qp/determinerTypeProclitic/@checked)='yes' and normalize-space(//qp/determinerTypeEnclitic/@checked)='no' and normalize-space(//qp/determinerTypePrefix/@checked)='no' and normalize-space(//qp/determinerTypeSuffix/@checked)='yes' or normalize-space(//qp/determinerTypeProclitic/@checked)='yes' and normalize-space(//qp/determinerTypeEnclitic/@checked)='no' and normalize-space(//qp/determinerTypePrefix/@checked)='yes' and normalize-space(//qp/determinerTypeSuffix/@checked)='yes' or normalize-space(//qp/determinerTypeProclitic/@checked)='no' and normalize-space(//qp/determinerTypeEnclitic/@checked)='yes' and normalize-space(//qp/determinerTypePrefix/@checked)='yes' and normalize-space(//qp/determinerTypeSuffix/@checked)='no' or normalize-space(//qp/determinerTypeProclitic/@checked)='no' and normalize-space(//qp/determinerTypeEnclitic/@checked)='yes' and normalize-space(//qp/determinerTypePrefix/@checked)='no' and normalize-space(//qp/determinerTypeSuffix/@checked)='yes' or normalize-space(//qp/determinerTypeProclitic/@checked)='no' and normalize-space(//qp/determinerTypeEnclitic/@checked)='yes' and normalize-space(//qp/determinerTypePrefix/@checked)='yes' and normalize-space(//qp/determinerTypeSuffix/@checked)='yes' or normalize-space(//qp/determinerTypeProclitic/@checked)='yes' and normalize-space(//qp/determinerTypeEnclitic/@checked)='no' and normalize-space(//qp/determinerTypePrefix/@checked)='yes' and normalize-space(//qp/determinerTypeSuffix/@checked)='yes' or normalize-space(//qp/determinerTypeProclitic/@checked)='yes' and normalize-space(//qp/determinerTypeEnclitic/@checked)='yes' and normalize-space(//qp/determinerTypePrefix/@checked)='yes' and normalize-space(//qp/determinerTypeSuffix/@checked)='no' or normalize-space(//qp/determinerTypeProclitic/@checked)='yes' and normalize-space(//qp/determinerTypeEnclitic/@checked)='yes' and normalize-space(//qp/determinerTypePrefix/@checked)='no' and normalize-space(//qp/determinerTypeSuffix/@checked)='yes' or normalize-space(//qp/determinerTypeProclitic/@checked)='yes' and normalize-space(//qp/determinerTypeEnclitic/@checked)='yes' and normalize-space(//qp/determinerTypePrefix/@checked)='yes' and normalize-space(//qp/determinerTypeSuffix/@checked)='yes'">
<xsl:text> soit comme clitiques au début ou à la fin du syntagme nominal, soit comme affixes sur le nom principal du syntagme nominal.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/determinerTypeProclitic/@checked)='no' and normalize-space(//qp/determinerTypeEnclitic/@checked)='no' and normalize-space(//qp/determinerTypePrefix/@checked)='no' and normalize-space(//qp/determinerTypeSuffix/@checked)='no' and normalize-space(//qp/determinerTypeOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//qp/determinerTypeOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/determinerTypeProclitic/@checked)='yes' and normalize-space(//qp/determinerTypeOther/@checked)='yes' or normalize-space(//qp/determinerTypeEnclitic/@checked)='yes' and normalize-space(//qp/determinerTypeOther/@checked)='yes' or normalize-space(//qp/determinerTypePrefix/@checked)='yes' and normalize-space(//qp/determinerTypeOther/@checked)='yes' or normalize-space(//qp/determinerTypeSuffix/@checked)='yes' and normalize-space(//qp/determinerTypeOther/@checked)='yes'">
<xsl:text>  Certains s’attachent aussi ___</xsl:text>
<xsl:value-of select="//qp/determinerTypeOther" />  <xsl:text>.</xsl:text>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>   
               <xsl:if test="normalize-space(//qp/@determinerType)='no' and normalize-space(//qp/determinerTypeProclitic/@checked)='yes' or normalize-space(//qp/@determinerType)='no' and normalize-space(//qp/determinerTypeEnclitic/@checked)='yes' or normalize-space(//qp/@determinerType)='some' and normalize-space(//qp/determinerTypeProclitic/@checked)='yes' or normalize-space(//qp/@determinerType)='some' and normalize-space(//qp/determinerTypeEnclitic/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de formes clitiques dans des syntagmes nominaux entiers:</xsl:text>
</p>
</xsl:if>
               <xsl:if test="normalize-space(//qp/@determinerType)='no' and normalize-space(//qp/determinerTypeProclitic/@checked)='yes' or normalize-space(//qp/@determinerType)='no' and normalize-space(//qp/determinerTypeEnclitic/@checked)='yes' or normalize-space(//qp/@determinerType)='some' and normalize-space(//qp/determinerTypeProclitic/@checked)='yes' or normalize-space(//qp/@determinerType)='some' and normalize-space(//qp/determinerTypeEnclitic/@checked)='yes'">
<example num="xAdjP.AdjQP.QPDeterminers.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/determinerCliticExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/determinerCliticExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/determinerCliticExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/determinerCliticExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPDeterminers.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPDeterminers.24.1</xsl:text>
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
               <xsl:if test="normalize-space(//qp/@determinerType)='no' and normalize-space(//qp/determinerTypePrefix/@checked)='yes' or normalize-space(//qp/@determinerType)='no' and normalize-space(//qp/determinerTypeSuffix/@checked)='yes' or normalize-space(//qp/@determinerType)='some' and normalize-space(//qp/determinerTypePrefix/@checked)='yes' or normalize-space(//qp/@determinerType)='some' and normalize-space(//qp/determinerTypeSuffix/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de formes d’affixes dans des syntagmes nominaux entiers:</xsl:text>
</p>
</xsl:if>
               <xsl:if test="normalize-space(//qp/@determinerType)='no' and normalize-space(//qp/determinerTypePrefix/@checked)='yes' or normalize-space(//qp/@determinerType)='no' and normalize-space(//qp/determinerTypeSuffix/@checked)='yes' or normalize-space(//qp/@determinerType)='some' and normalize-space(//qp/determinerTypePrefix/@checked)='yes' or normalize-space(//qp/@determinerType)='some' and normalize-space(//qp/determinerTypeSuffix/@checked)='yes'">
<example num="xAdjP.AdjQP.QPDeterminers.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/determinerAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/determinerAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/determinerAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/determinerAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPDeterminers.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPDeterminers.28.1</xsl:text>
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
               <xsl:if test="normalize-space(//qp/@determinerType)='no' and normalize-space(//qp/determinerTypeOther/@checked)='yes' or normalize-space(//qp/@determinerType)='some' and normalize-space(//qp/determinerTypeOther/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de formes qui s’attachent comme permis en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> dans des syntagmes nominaux entiers:</xsl:text>
</p>
</xsl:if>
               <xsl:if test="normalize-space(//qp/@determinerType)='no' and normalize-space(//qp/determinerTypeOther/@checked)='yes' or normalize-space(//qp/@determinerType)='some' and normalize-space(//qp/determinerTypeOther/@checked)='yes'">
<example num="xAdjP.AdjQP.QPDeterminers.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/determinerOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/determinerOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/determinerOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/determinerOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPDeterminers.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPDeterminers.32.1</xsl:text>
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
            </section3>

           <section3 id="sQPOtherQuantifiers">
              <secTitle>Autres quantificateurs et mots de degré</secTitle>
              <p contentType="ctPracticalIntro">
<xsl:text>D’autres quantificateurs se trouvent dans le syntagme nominal montrant leur portée plus réduite.   Ces quantificateurs peuvent être normalement modifiés par des mots de degré.</xsl:text>
</p>
              <p contentType="ctComparativeIntro">
<xsl:text>D’autres quantificateurs comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>beaucoup</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>plusiers</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nombreaux</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>peu de</langData>
<xsl:text> se trouvent dans une position différente dans le syntagme nominal montrant leur portée plus réduite.   
                 En anglais c’est après un article, démonstratif ou possessif et avant un adjectif  et nom, comme par exemple </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>a few sad children  (peu de enfants tristes)</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue’s many black dogs  (les nombreux chiens noirs de Suzanne)</langData>
<xsl:text>.
                       De plus, ces quantificateurs peuvent normalement être modifiés par des mots de degré comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>très</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tant</langData>
<xsl:text> comme par exemple </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>des chiens très nombreux</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>so much
                       waste</langData>
<xsl:text>; en français </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>très</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tant</langData>
<xsl:text> comme par exemple </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>des chiens très nombreux</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tant d’ordures</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>très peu de enfants</langData>
<xsl:text>.</xsl:text>
</p>
                 <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@quantifierClassifier)='yes'">
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
<xsl:text> on trouve les types de quantificateurs suivants. Les formes montreés dans le tableau sone les racines; chacune peut apparaître avec le classificateur approprié attaché.</xsl:text>
</p>
</xsl:if>
                 <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//qp/@quantifierClassifier)!='yes'">
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
<xsl:text> on trouve les types de quantificateurs suivants:</xsl:text>
</p>
</xsl:if>
                 
                 <example num="xAdjP.AdjQP.QPOtherQuantifiers.12">
<table border="1">
                       <tr>
                          <th>Quantificateurs</th>
                          <th>Glose</th>
                       </tr>
                       <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//qp/many),'.','')" />
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
<xsl:text>beaucoup, plusiers, nombreaux (many)</xsl:text>
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
<xsl:text>beaucoup, plusiers, nombreaux (many)</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                       <xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//qp/much),'.','')" />
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
<xsl:text>beaucoup, plusiers, nombreaux (much)</xsl:text>
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
<xsl:text>beaucoup, plusiers, nombreaux (much)</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                       <xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//qp/few),'.','')" />
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
<xsl:text>peu de</xsl:text>
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
<xsl:text>peu de</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
                       <xsl:variable name="sExampleValue3.0">
<xsl:value-of select="translate(string(//qp/otherQ),'.','')" />
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
                 <xsl:if test="normalize-space(//qp/@degree)='no'">
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
<xsl:text> les quantificateurs ne sont pas modifiés ou intensifiés.</xsl:text>
</p>
</xsl:if>
                 <xsl:if test="normalize-space(//qp/@degree)='yes' or normalize-space(//qp/@degree)='some'">
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
<xsl:text> il y a </xsl:text>
<xsl:if test="normalize-space(//qp/@degree)='some'">
<xsl:text>certains </xsl:text>
</xsl:if>
<xsl:text>mots de degré qui peuvent modifier les quantificateurs.  Ces mots de degré se trouvent </xsl:text>
<xsl:if test="normalize-space(//qp/degreeBefore/@checked)='yes' and normalize-space(//qp/degreeAfter/@checked)='no' and normalize-space(//qp/degreeBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/degreeBefore/@checked)='no' and normalize-space(//qp/degreeAfter/@checked)='yes' and normalize-space(//qp/degreeBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/degreeBefore/@checked)='no' and normalize-space(//qp/degreeAfter/@checked)='no' and normalize-space(//qp/degreeBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/degreeBefore/@checked)='yes' and normalize-space(//qp/degreeAfter/@checked)='yes' and normalize-space(//qp/degreeBoth/@checked)='no'">
<xsl:text>d’un côté ou l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/degreeBefore/@checked)='yes' and normalize-space(//qp/degreeAfter/@checked)='no' and normalize-space(//qp/degreeBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/degreeBefore/@checked)='no' and normalize-space(//qp/degreeAfter/@checked)='yes' and normalize-space(//qp/degreeBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/degreeBefore/@checked)='yes' and normalize-space(//qp/degreeAfter/@checked)='yes' and normalize-space(//qp/degreeBoth/@checked)='yes'">
<xsl:text>d’un côté ou l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/degreeOther/@checked)='no'">
<xsl:text> quantificateur.  </xsl:text>
                    </xsl:if>
<xsl:if test="normalize-space(//qp/degreeBefore/@checked)='no' and normalize-space(//qp/degreeAfter/@checked)='no' and normalize-space(//qp/degreeBoth/@checked)='no' and normalize-space(//qp/degreeOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//qp/degreeOther" />
<xsl:text>.  </xsl:text>
                    </xsl:if>
<xsl:if test="normalize-space(//qp/degreeBefore/@checked)='yes' and normalize-space(//qp/degreeOther/@checked)='yes' or normalize-space(//qp/degreeAfter/@checked)='yes' and normalize-space(//qp/degreeOther/@checked)='yes' or normalize-space(//qp/degreeBoth/@checked)='yes' and normalize-space(//qp/degreeOther/@checked)='yes'">
<xsl:text> quantificateur peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//qp/degreeOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
</p>
</xsl:if>
              <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@degreeClassifier)='yes' and normalize-space(//qp/@degree)='yes' or normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@degreeClassifier)='yes' and normalize-space(//qp/@degree)='some'">
<p>
<xsl:text>Les raciness des mots de degré qui peuvent modifier les quantificateurs en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont montrés ici. Chacun peut apparaître avec le classificateur approprié attaché.</xsl:text>
</p>
</xsl:if>
              <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' and normalize-space(//qp/@degreeClassifier)!='yes' and normalize-space(//qp/@degree)='yes' or normalize-space(//typology/@classifier)!='yesAgr' and normalize-space(//qp/@degreeClassifier)!='yes' and normalize-space(//qp/@degree)='some'">
<p>
<xsl:text>Les mots de degré qui peuvent modifier les quantificateurs en </xsl:text>
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
                 
                 <xsl:if test="normalize-space(//qp/@degree)='yes' or normalize-space(//qp/@degree)='some'">
<example num="xAdjP.AdjQP.QPOtherQuantifiers.22">
<table border="1">
                       <tr>
                          <th>Mots de degré qui modifient des quantificateurs</th>
                          <th>Glose</th>
                       </tr>
                       <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//qp/degreeWordExample),'.','')" />
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
              <xsl:if test="normalize-space(//qp/@degree)='yes' or normalize-space(//qp/@degree)='some'">
<p>
<xsl:text>Voici des exemples qui montrent les mots de degré modifiant un quantificateur:</xsl:text>
</p>
</xsl:if>
                 <xsl:if test="normalize-space(//qp/@degree)='yes' or normalize-space(//qp/@degree)='some'">
<example num="xAdjP.AdjQP.QPOtherQuantifiers.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/degreeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/degreeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/degreeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/degreeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPOtherQuantifiers.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPOtherQuantifiers.26.1</xsl:text>
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

              <xsl:if test="normalize-space(//qp/@degree)='attaches' or normalize-space(//qp/@degree)='some'">
<p>
<xsl:if test="normalize-space(//qp/@degree)='attaches'"> <xsl:text>En </xsl:text>
                    <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
                    <xsl:text> les modificateurs de degré ne sont pas exprimés comme des mots indépendants. Au lieu de cela ils s’attachent au quantificateur</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/@degree)='some'">
<xsl:text>D’autres modificateurs de degré ne sont pas exprimés comme mots indépendants.  Au lieu de cela ils s’attachent au quantificateur en tant que</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/degreeTypePrefix/@checked)='yes' and normalize-space(//qp/degreeTypeSuffix/@checked)='no'">
<xsl:text> préfixes.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/degreeTypePrefix/@checked)='no' and normalize-space(//qp/degreeTypeSuffix/@checked)='yes'">
<xsl:text> suffixes.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/degreeTypePrefix/@checked)='yes' and normalize-space(//qp/degreeTypeSuffix/@checked)='yes'">
<xsl:text> préfixes et suffixes.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/degreeTypePrefix/@checked)='no' and normalize-space(//qp/degreeTypeSuffix/@checked)='no' and normalize-space(//qp/degreeTypeOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//qp/degreeTypeOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/degreeTypePrefix/@checked)='yes' and normalize-space(//qp/degreeTypeOther/@checked)='yes' or normalize-space(//qp/degreeTypeSuffix/@checked)='yes' and normalize-space(//qp/degreeTypeOther/@checked)='yes'">
<xsl:text>  Certains s’attachent aussi ___</xsl:text>
<xsl:value-of select="//qp/degreeTypeOther" />  <xsl:text>.</xsl:text>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>   
              <xsl:if test="normalize-space(//qp/@degree)='attaches' or normalize-space(//qp/@degree)='some'">
<p>
<xsl:text>Les affixes de degré qui peuvent modifier les quantificateurs en </xsl:text>
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
              
              <xsl:if test="normalize-space(//qp/@degree)='attaches' or normalize-space(//qp/@degree)='some'">
<example num="xAdjP.AdjQP.QPOtherQuantifiers.32">
<table border="1">
                    <tr>
                       <th>Affixes de degré qui modifient des quantificateurs</th>
                       <th>Glose</th>
                    </tr>
                    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//qp/degreeAttachesExample),'.','')" />
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
              <xsl:if test="normalize-space(//qp/@degree)='attaches' or normalize-space(//qp/@degree)='some'">
<p>
<xsl:text>Voici des exemples qui montrent les mots de degré modifiant un quantificateur dans un syntagme nominal:</xsl:text>
</p>
</xsl:if>
              <xsl:if test="normalize-space(//qp/@degree)='attaches' or normalize-space(//qp/@degree)='some'">
<example num="xAdjP.AdjQP.QPOtherQuantifiers.36">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/degreeAttachesNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/degreeAttachesNPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/degreeAttachesNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/degreeAttachesNPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPOtherQuantifiers.36</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPOtherQuantifiers.36.1</xsl:text>
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
              
           </section3>
           
        <section3 id="sQPPartitive">
           <secTitle>Partitives</secTitle>
           <p contentType="ctPracticalIntro">
<xsl:text>Tous les quantificateurs y compris les nombres peuvent normalement se trouver dans des constructions partitives, qui sont utilisées pour signifier qu’on ne parle que d’une partie d’un groupe.  Les constructions partitives ont normalement un syntagme prépositionnel ou postpositionnel qui modifie le quantificateur, qui indique le groupe ou entité  discuté.  Il se peut que certaines langues utilisent une proposition relative pour exprimer le groupe au lieu d’un syntagme adpositionnel.
              </xsl:text>
</p>
           <p contentType="ctComparativeIntro">
<xsl:text>Tous les quantificateurs y compris les nombres peuvent normalement se trouver dans des constructions partitives, qui sont utilisées pour signifier qu’on ne parle que d’une partie d’un groupe.  Des exemples incluent: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>quelques-uns des enfants</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>plusieurs des filles plus agées</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>beaucoup des femmes</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>dix des garçons seulement</langData>
<xsl:text>.  Comme les exemples le montrent les constructions partitives de cette sorte ont normalement un syntagme prepositionel ou postpositionnel qui modifie le quantificateur, qui indique le groupe ou entité discuté.  Certaines langues peuvent utiliser une proposition relative pour exprimer le groupe de la construction partitive au lieu d’un syntagme adpositionnel.
              </xsl:text>
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
        <xsl:when test="//qp/@partitive='no'">une proposition relative est utilisée en lieu d’ un syntagme <xsl:choose>
           <xsl:when test="//pp/@pPos='before'">prépositionnel </xsl:when>
           <xsl:when test="//pp/@pPos='after'">postpositionnel </xsl:when>
           <xsl:when test="//pp/@pPos='both'">adpositionnel </xsl:when>
           <xsl:when test="//pp/@pPos='unknown'">adpositionnel </xsl:when>
        </xsl:choose>pour exprimer le groupe.</xsl:when>
        <xsl:when test="//qp/@partitive='other'">un autre moyen que soit un syntagme adpositionnel soit une proposition relative est utilisée pour exprimer une signification partitive. </xsl:when>
        <xsl:when test="//qp/@partitive='yes'"> un syntagme <xsl:choose>
           <xsl:when test="//pp/@pPos='before'">prépositionnel </xsl:when>
           <xsl:when test="//pp/@pPos='after'">postpositionnel </xsl:when>
           <xsl:when test="//pp/@pPos='both'">adpositionnel </xsl:when>
           <xsl:when test="//pp/@pPos='unknown'">adpositionnel </xsl:when>
        </xsl:choose>qui se trouve <xsl:choose>
           <xsl:when test="//qp/@partitivePPPos='before'">avant</xsl:when>
           <xsl:when test="//qp/@partitivePPPos='after'">après</xsl:when>
           <xsl:when test="//qp/@partitivePPPos='either'">de chaque côté de</xsl:when>
           <xsl:when test="//qp/@partitivePPPos='unknown'">______</xsl:when>
        </xsl:choose>  le quantificateur qui exprime le groupe.  Les <xsl:choose>
           <xsl:when test="//pp/@pPos='before'">prepositions </xsl:when>
           <xsl:when test="//pp/@pPos='after'">postpositions </xsl:when>
           <xsl:when test="//pp/@pPos='both'">prepositions ou postpositions </xsl:when>
           <xsl:when test="//pp/@pPos='unknown'">prepositions ou postpositions </xsl:when>
        </xsl:choose>spéciaux utilizes dans des syntagmes partitifs sont:</xsl:when>
     </xsl:choose>
<xsl:if test="normalize-space(//qp/@partitive)='other'"> 
           <xsl:text> Cette construction est ___</xsl:text>
<xsl:value-of select="//qp/partitiveConstruction" />
           <xsl:text>.   </xsl:text>
        </xsl:if>
</p>      
           <xsl:if test="normalize-space(//qp/@partitive)='yes'">
<example num="xAdjP.AdjQP.QPPartitive.10">
<table border="1">
                 <tr>
                    <xsl:if test="normalize-space(//pp/@pPos)='before'">
<th>Prépositions partitives</th>
</xsl:if>
                    <xsl:if test="normalize-space(//pp/@pPos)='after'">
<th>Postpositions partitives</th>
</xsl:if>
                    <xsl:if test="normalize-space(//pp/@pPos)='both' or normalize-space(//pp/@pPos)='unknown'">
<th>Adpositions partitives</th>
</xsl:if>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//qp/partitiveOf),'.','')" />
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
<xsl:text>Voici des exemples qui montrent la façon dont la signification partitive est exprimée en </xsl:text>
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
           <example num="xAdjP.AdjQP.QPPartitive.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/partitiveQExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/partitiveQExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/partitiveQExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/partitiveQExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPPartitive.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPPartitive.14.1</xsl:text>
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
           <xsl:if test="normalize-space(//qp/@partitive)='no'">
<p>
<xsl:text>Voir la section </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text> pour la structure des propositions relatives.</xsl:text>
</p>
</xsl:if>
        </section3>
        </section2>
     <section2 id="sAdjArtDem">
        <secTitle>Articles et démonstratifs</secTitle>
         <p contentType="ctComparativeIntro">
<xsl:text>En français, les articles sont </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>un, une, des</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>le, la, les</langData>
<xsl:text>.  Les démonstratifs en français comprennent </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ce, cette, ces</langData>
<xsl:text>.  Quelques exemples simples sont: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>un livre, une pomme, des livres, le livre, la pomme, les livres</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ce livre, cette pomme, ces livres</langData>
<xsl:text>.</xsl:text>
</p>
         <p>
<xsl:text>Certaines langues n’ont qu’un groupe, soit des articles soit des démonstratifs.  Il y a des langues qui n’ont aucun type exprimé comme mots indépendants.</xsl:text>
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
                <xsl:when test="//np/@artAndDem='no'"> il n’y a ni articles ni démonstratifs qui sont réalisés comme mots indépendants.</xsl:when>
                <xsl:when test="//np/@artAndDem='article'"> il n’y a que des articles qui sont réalisés comme mots indépendants, pas de démonstratifs.</xsl:when>
                <xsl:when test="//np/@artAndDem='demonstrative'"> il n’y a que les démonstratifs qui sont réalisés comme mote indépendants, pas d’articles.</xsl:when>
                <xsl:when test="//np/@artAndDem='both'"> il y a et des articles et des démonstratifs réalisés comme mots indépendants.</xsl:when>
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
                   <xsl:text>ne </xsl:text>
                </xsl:if>
                <xsl:text> sont </xsl:text>
                 <xsl:if test="normalize-space(//np/@artAndDem)!='no' and normalize-space(//np/@artCase)='no'">
                     <xsl:text>pas </xsl:text>
                 </xsl:if>
                <xsl:text>marqués pour le cas.</xsl:text>
             </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)!='no' and normalize-space(//np/@artDemClassifier)='yes'">
<xsl:text> Les </xsl:text>
               <xsl:choose>
                  <xsl:when test="//np/@artAndDem='article'">articles</xsl:when>
                  <xsl:when test="//np/@artAndDem='demonstrative'">démonstratifs</xsl:when>
                  <xsl:when test="//np/@artAndDem='both'">articles et démonstratifs</xsl:when>
               </xsl:choose>
               <xsl:text> sont marqués avec des classificateurs pour s’accorder avec le nom.  Seules les racines sont montrées ici, chacune peut se voir avec le classificateur approprié attaché.</xsl:text>
            </xsl:if>
</p>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' or normalize-space(//np/@artAndDem)='both'">
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
              <xsl:when test="//np/@artDefOnly='no'"> les articles définis et indéfinis sont des mots évidents.</xsl:when>
              <xsl:when test="//np/@artDefOnly='yes'"> seul l’article défini est évident; les noms indéfinis ne sont pas marqués.</xsl:when>
              <xsl:when test="//np/@artDefOnly='indef'"> seul l’article indéfini est evident; les noms définis ne sont pas marqués.</xsl:when>
           </xsl:choose>
<xsl:text>  De plus il y a </xsl:text>
<xsl:choose>
              <xsl:when test="//np/@artPl='no'">un groupe d’articles seulement qui sont utilisés avec des noms au singulier et au pluriel.</xsl:when>
              <xsl:when test="//np/@artPl='yes'">des formes distinctes d’articles pour le singulier et le pluriel pour s’accorder avec le nom.</xsl:when>
           </xsl:choose>
</p>
</xsl:if>
        
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='none' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artCase)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='none' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artCase)='no'">
<p>
<xsl:text>Les articles en </xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='none' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='none' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artCase)='no' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artCase)='no' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.14">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Articles</th>
                 <th>Glose</th>
              </tr>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/articleExample),'.','')" />
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
<xsl:text>Défini</xsl:text>
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
<xsl:text>Défini</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//np/articleIndefExample),'.','')" />
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
<xsl:text>Indéfini</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>		   
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='none' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='none' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artCase)='no' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artCase)='no' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.16">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Articles</th>
                 <th>Glose</th>
              </tr>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/articleExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/articlePlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/articleIndefExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/articleIndefPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	

        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Puisqu’en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> il y a un système de cas nominatif-accusatif, il y a des groups distincts d’articles pour modifier les sujets et les objets et les possessifs.  Les articles qui peuvent être utilisés avec les sujets sont montrés dans le tableau suivant:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.20">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Articles au nominatif</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/articleNomExample),'.','')" />
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
<xsl:text>Défini</xsl:text>
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
<xsl:text>Défini</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//np/articleIndefNomExample),'.','')" />
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
<xsl:text>Indéfini</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.22">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Articles au nominatif</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/articleNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singular</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singular</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/articlePlNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/articleIndefNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singular</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singular</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/articleIndefPlNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les articles qui peuvent être utilisés avec les objets sont montrés dans le tableau suivant:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.26">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Articles à l’accusatif</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/articleAccExample),'.','')" />
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
<xsl:text>Défini</xsl:text>
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
<xsl:text>Défini</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//np/articleIndefAccExample),'.','')" />
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
<xsl:text>Indéfini</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.28">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Articles à l’accusatif</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/articleAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/articlePlAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/articleIndefAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/articleIndefPlAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les articles qui peuvent être utilisés avec les posesseurs sont montrés dans le tableau suivant:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.32">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Articles au génitif</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/articleGenExample),'.','')" />
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
<xsl:text>Défini</xsl:text>
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
<xsl:text>Défini</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//np/articleIndefGenExample),'.','')" />
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
<xsl:text>Indéfini</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.34">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Articles au génitif</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/articleGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/articlePlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/articleIndefGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/articleIndefPlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Puisqu’en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> il y a un système de cas ergatif-absolutif, il y a des groups distincts d’articles pour modifier les sujets de verbes transitifs par contraste avec les sujets de verbes intransitifs et les objets de verbes transitifs par contraste avec les possessifs.  Les articles qui peuvent être utilisés avec des sujets de verbes transitifs sont montrés dans le tableau suivant:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.38">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Articles ergatifs</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/articleErgExample),'.','')" />
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
<xsl:text>Défini</xsl:text>
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
<xsl:text>Défini</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//np/articleIndefErgExample),'.','')" />
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
<xsl:text>Indéfini</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.40">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Articles ergatifs</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/articleErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/articlePlErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/articleIndefErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/articleIndefPlErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les articles qui peuvent être utilisés avec les sujets de verbes intransitifs et les objets de verbes transitifs sont montrés dans le tableau suivant:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.44">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Articles absolutifs</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/articleAbsExample),'.','')" />
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
<xsl:text>Défini</xsl:text>
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
<xsl:text>Défini</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//np/articleIndefAbsExample),'.','')" />
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
<xsl:text>Indéfini</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.46">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Articles absolutifs</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/articleAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/articlePlAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/articleIndefAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/articleIndefPlAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@possCaseErg)='genitive'">
<p>
<xsl:text>Les articles qui peuvent être utilisés avec les possesseurs sont montrés dans le tableau suivant:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.50">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Articles au génitif</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/articleErgGenExample),'.','')" />
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
<xsl:text>Défini</xsl:text>
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
<xsl:text>Défini</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//np/articleErgIndefGenExample),'.','')" />
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
<xsl:text>Indéfini</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.52">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Articles au génitif</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/articleErgGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/articleErgPlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/articleErgIndefGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/articleErgIndefPlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Puisqu’en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> il y a a un système de cas divisé, il y a des groups distincts d’articles qui modifient les sujets, les objets at les possesseurs,  plus quelques groupes additionnels pour les conditions spéciales d’ergativité divisé.  Les articles qui peuvent être utilisés avec les sujets sont montrés dans le tableau suivant:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.56">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Articles au nominatif</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/articleSplitNomExample),'.','')" />
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
<xsl:text>Défini</xsl:text>
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
<xsl:text>Défini</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//np/articleSplitIndefNomExample),'.','')" />
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
<xsl:text>Indéfini</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.58">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Articles au nominatif</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/articleSplitNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/articleSplitPlNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/articleSplitIndefNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/articleSplitIndefPlNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les articles qui peuvent être utilisés avec les objets directs sont montrés dans le tableau suivant:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.62">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Articles à l’accusatif</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/articleSplitAccExample),'.','')" />
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
<xsl:text>Défini</xsl:text>
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
<xsl:text>Défini</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//np/articleSplitIndefAccExample),'.','')" />
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
<xsl:text>Indéfini</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.64">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Articles à l’accusatif</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/articleSplitAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/articleSplitPlAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/articleSplitIndefAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/articleSplitIndefPlAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les articles qui peuvent être utilisés avec les possesseurs sont:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.68">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Articles au génitif</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/articleSplitGenExample),'.','')" />
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
<xsl:text>Défini</xsl:text>
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
<xsl:text>Défini</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//np/articleSplitIndefGenExample),'.','')" />
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
<xsl:text>Indéfini</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.70">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Articles au génitif</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/articleSplitGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/articleSplitPlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/articleSplitIndefGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/articleSplitIndefPlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les articles qui peuvent être utilisés avec les sujets de verbes transitifs sous les conditions spéciales d’ergativité divisé sont montrés dans le tableau suivant:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.74">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Articles ergatifs</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/articleSplitErgExample),'.','')" />
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
<xsl:text>Défini</xsl:text>
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
<xsl:text>Défini</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//np/articleSplitIndefErgExample),'.','')" />
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
<xsl:text>Indéfini</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.76">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Articles ergatifs</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/articleSplitErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/articleSplitPlErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/articleSplitIndefErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/articleSplitIndefPlErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les articles qui peuvent être utilisés avec les sujets de verbes intransitifs et les objets de verbes transitifs sous les conditions spéciales d’ergativité divisé sont:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.80">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Articles absolutifs</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/articleSplitAbsExample),'.','')" />
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
<xsl:text>Défini</xsl:text>
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
<xsl:text>Défini</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//np/articleSplitIndefAbsExample),'.','')" />
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
<xsl:text>Indéfini</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.82">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Articles absolutifs</th>
                 <th>Glose</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/articleSplitAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/articleSplitPlAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/articleSplitIndefAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/articleSplitIndefPlAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      
        
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)!='none' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)!='none' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Il y a un autre groupe d’articles qui peuvent être utilisés avec </xsl:text>
<xsl:if test="normalize-space(//typology/@caseExperiencer)='yesDat'">
<xsl:text>les sujets de verbes d’expérienceur ou </xsl:text>
</xsl:if>
<xsl:text>les objets indirects montrés dans le tableau suivante:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)!='none' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@caseExperiencer)='yesDat' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.86">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Articles au datif</th>
                 <th>Glose</th>
              </tr>	
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/articleDatExample),'.','')" />
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
<xsl:text>Défini</xsl:text>
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
<xsl:text>Défini</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//np/articleIndefDatExample),'.','')" />
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
<xsl:text>Indéfini</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)!='none' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)!='none' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.88">
<table border="1">
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Articles au datif</th>
                 <th>Glose</th>
              </tr>	
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/articleDatExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/articlePlDatExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Défini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/articleIndefDatExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/articleIndefPlDatExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Indéfini</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
</xsl:if>
           </table>
</example>
</xsl:if>	      	
        
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<p>
<xsl:text>La table suivante montre toutes les formes pour une comparaison plus facile: </xsl:text>
<object type="tComment"> Vous devez entrer ici la forme dans chaque cellule. Effacez ce paragraphe et cette table si vous ne désirez pas l’utiliser.</object>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.92">
<table border="1">
              <caption>
<xsl:text>Résumé d’articles</xsl:text>
</caption>
              <tr>
                 <th>Type</th>
                 <th>Nominatif</th>
                 <th>Accusatif</th>
                 <th>Génitif</th>
                 <th>Datif</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<tr>
                 <td align="left">
<xsl:text>Défini</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<tr>
                 <td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<p>
<xsl:text>La table suivante montre toutes les formes pour une comparaison plus facile. </xsl:text>
<object type="tComment"> Vous devez entrer ici la forme dans chaque cellule. Effacez ce paragraphe et cette table si vous ne désirez pas l’utiliser.</object>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.96">
<table border="1">
              <caption>
<xsl:text>Résumé d’articles</xsl:text>
</caption>
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Nominatif</th>
                 <th>Accusatif</th>
                 <th>Génitif</th>
                 <th>Datif</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<tr>
                 <td align="left" rowspan="2">
<xsl:text>Défini</xsl:text>
</td>
                 <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<tr>
                 <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<tr>
                 <td align="left" rowspan="2">
<xsl:text>Indéfini</xsl:text>
</td>
                 <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<tr>
                 <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<p>
<xsl:text>La table suivante montre toutes les formes pour une comparaison plus facile: </xsl:text>
<object type="tComment"> Vous devez entrer ici la forme dans chaque cellule. Effacez ce paragraphe et cette table si vous ne désirez pas l’utiliser.</object>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.100">
<table border="1">
              <caption>
<xsl:text>Résumé d’articles</xsl:text>
</caption>
              <tr>
                 <th>Type</th>
                 <th>Ergatif</th>
                 <th>Absolutif</th>
                 <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<th>Génitif</th>
</xsl:if>
                 <th>Datif</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<tr>
                 <td align="left">
<xsl:text>Défini</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<tr>
                 <td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<p>
<xsl:text>La table suivante montre toutes les formes pour une comparaison plus facile: </xsl:text>
<object type="tComment"> Vous devez entrer ici la forme dans chaque cellule. Effacez ce paragraphe et cette table si vous ne désirez pas l’utiliser.</object>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.104">
<table border="1">
              <caption>
<xsl:text>Résumé d’articles</xsl:text>
</caption>
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>Ergatif</th>
                 <th>Absolutif</th>
                 <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<th>Génitif</th>
</xsl:if>
                 <th>Datif</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<tr>
                 <td align="left" rowspan="2">
<xsl:text>Défini</xsl:text>
</td>
                 <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<tr>
                 <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<tr>
                 <td align="left" rowspan="2">
<xsl:text>Indéfini</xsl:text>
</td>
                 <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<tr>
                 <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
           </table>
</example>
</xsl:if>	     
        
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<p>
<xsl:text>La table suivante montre toutes les formes pour une comparaison plus facile: </xsl:text>
<object type="tComment"> Vous devez entrer ici la forme dans chaque cellule. Effacez ce paragraphe et cette table si vous ne désirez pas l’utiliser.</object>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.108">
<table border="1">
              <caption>
<xsl:text>Résumé d’articles</xsl:text>
</caption>
              <tr>
                 <th>Type</th>
                 <th>NOM</th>
                 <th>ACC</th>
                 <th>GEN</th>
                 <th>DAT</th>
                 <th>ERG</th>
                 <th>ABS</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<tr>
                 <td align="left">
<xsl:text>Défini</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<tr>
                 <td align="left">
<xsl:text>Indéfini</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
           </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<p>
<xsl:text>La table suivante montre toutes les formes pour une comparaison plus facile: </xsl:text>
<object type="tComment"> Vous devez entrer ici la forme dans chaque cellule. Effacez ce paragraphe et cette table si vous ne désirez pas l’utiliser.</object>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.112">
<table border="1">
              <caption>
<xsl:text>Résumé d’articles</xsl:text>
</caption>
              <tr>
                 <th>Type</th>
                 <th>Nombre</th>
                 <th>NOM</th>
                 <th>ACC</th>
                 <th>GEN</th>
                 <th>DAT</th>
                 <th>ERG</th>
                 <th>ABS</th>
              </tr>			
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<tr>
                 <td align="left" rowspan="2">
<xsl:text>Défini</xsl:text>
</td>
                 <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='indef'">
<tr>
                 <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<tr>
                 <td align="left" rowspan="2">
<xsl:text>Indéfini</xsl:text>
</td>
                 <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
              <xsl:if test="normalize-space(//np/@artDefOnly)!='yes'">
<tr>
                 <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
                 <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
              </tr>
</xsl:if>
           </table>
</example>
</xsl:if>	      
          
        
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' or normalize-space(//np/@artAndDem)='both'">
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
<xsl:text>  il y a </xsl:text>
<xsl:choose>
              <xsl:when test="//np/@demPl='no'">un groupe seulement de démonstratifs qui sont utilisés avec des noms au singulier et au pluriel.</xsl:when>
              <xsl:when test="//np/@demPl='yes'">des formes séparées de démonstratifs au singulier et au pluriel pour s’accorder au nom.</xsl:when>
           </xsl:choose>
<xsl:text> Ces démonstratifs qui modifient un nom sont </xsl:text>
<xsl:choose>
              <xsl:when test="//pron/@demAdjSame='yes'">identiques aux pronoms démonstratifs </xsl:when>
              <xsl:when test="//pron/@demAdjSame='some'">quelques fois le même mais quelques fois distincts des pronoms démonstratifs </xsl:when>
              <xsl:when test="//pron/@demAdjSame='no'">distincts des pronoms démonstratifs </xsl:when>
           </xsl:choose>
<xsl:text>vus dans la section </xsl:text>
<sectionRef sec="sPronDem" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
        
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='none' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='none' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@artCase)='no' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artCase)='no' and normalize-space(//np/@artPl)='no'">
<p>
<xsl:text>Les démonstratifs en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont montrés dans le tableau suivant, basés sur la distance de celui qui parle:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='none' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='none' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@artCase)='no' and normalize-space(//np/@artPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artCase)='no' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.118">
<table border="1">
              <tr>
                 <th>Distance</th>
                 <th>Démonstratifs</th>
                 <th>Glose</th>
              </tr>			
              <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/demProximalExample),'.','')" />
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
<xsl:text>Proximale</xsl:text>
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
<xsl:text>Proximale</xsl:text>
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
<xsl:value-of select="translate(string(//np/demMedialExample),'.','')" />
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
<xsl:text>Médiale</xsl:text>
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
<xsl:text>Médiale</xsl:text>
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
              <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//np/demDistalExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
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
<xsl:text>Distale</xsl:text>
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
        
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='none' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='none' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@artCase)='no' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artCase)='no' and normalize-space(//np/@artPl)='yes'">
<p>
<xsl:text>Les démonstratifs en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont montrés dans le tableau suivant, basés sur la distance de celui qui parle:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='none' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='none' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@artCase)='no' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artCase)='no' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.122">
<table border="1">
              <tr>
                 <th>Distance</th>
                 <th>Nombre</th>
                 <th>Démonstratifs</th>
                 <th>Glose</th>
              </tr>			
              <xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/demProximalExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
              <xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/demProximalPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
              <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/demMedialExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
              <xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/demMedialPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
              <xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//np/demDistalExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
              <xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//np/demDistalPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
        
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Puisqu’en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> il y a a un système de cas nominatif-accusatif, il y a des groups distincts de démonstratifs qui peuvent être utilisés avec des sujets et des objets et des possesseurs.  Les démonstratifs qui peuvent être utilisés avec des sujets sont montrés dans le tableau suivant, basés sur la distance de celui qui parle:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.126">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Démonstratifs au nominatif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/demProximalNomExample),'.','')" />
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
<xsl:text>Proximale</xsl:text>
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
<xsl:text>Proximale</xsl:text>
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
<xsl:value-of select="translate(string(//np/demMedialNomExample),'.','')" />
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
<xsl:text>Médiale</xsl:text>
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
<xsl:text>Médiale</xsl:text>
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
	            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//np/demDistalNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
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
<xsl:text>Distale</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.128">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>Démonstratifs au nominatif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/demProximalNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/demProximalPlNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/demMedialNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/demMedialPlNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//np/demDistalNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//np/demDistalPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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

        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les démonstratifs qui peuvent être utilisés avec des objets directs sont montrés dans le tableau suivant, basés sur la distance de celui qui parle:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.132">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Démonstratifs à l’accusatif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/demProximalAccExample),'.','')" />
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
<xsl:text>Proximale</xsl:text>
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
<xsl:text>Proximale</xsl:text>
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
<xsl:value-of select="translate(string(//np/demMedialAccExample),'.','')" />
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
<xsl:text>Médiale</xsl:text>
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
<xsl:text>Médiale</xsl:text>
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
	            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//np/demDistalAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
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
<xsl:text>Distale</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.134">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>Démonstratifs à l’accusatif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/demProximalAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/demProximalPlAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/demMedialAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/demMedialPlAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//np/demDistalAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//np/demDistalPlAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les démonstratifs qui peuvent être utilisés avec des possesseurs sont montrés dans le tableau suivant, basés sur la distance de celui qui parle:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.138">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Démonstratifs au génitif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/demProximalGenExample),'.','')" />
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
<xsl:text>Proximale</xsl:text>
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
<xsl:text>Proximale</xsl:text>
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
<xsl:value-of select="translate(string(//np/demMedialGenExample),'.','')" />
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
<xsl:text>Médiale</xsl:text>
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
<xsl:text>Médiale</xsl:text>
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
	            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//np/demDistalGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
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
<xsl:text>Distale</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.140">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>Démonstratifs au génitif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/demProximalGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/demProximalPlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/demMedialGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/demMedialPlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//np/demDistalGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//np/demDistalPlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	      
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Puisqu’en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> il y a a un système de cas ergatif-absolutif, il y a des groups distincts de démonstratifs pour les sujets de verbes transitifs par contraste avec les sujets de verbes intransitifs et les object de verbes transitifs</xsl:text>
<xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<xsl:text> par contraste avec les possesseurs</xsl:text>
</xsl:if>
<xsl:text>.  Les démonstratifs qui peuvent être utilisés avec des sujets de verbes transitifs sont montrés dans le tableau suivant, basés sur la distance de celui qui parle:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.144">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Démonstratifs ergatifs</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/demProximalErgExample),'.','')" />
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
<xsl:text>Proximale</xsl:text>
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
<xsl:text>Proximale</xsl:text>
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
<xsl:value-of select="translate(string(//np/demMedialErgExample),'.','')" />
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
<xsl:text>Médiale</xsl:text>
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
<xsl:text>Médiale</xsl:text>
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
	            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//np/demDistalErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
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
<xsl:text>Distale</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.146">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>Démonstratifs ergatifs</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/demProximalErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/demProximalPlErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/demMedialErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/demMedialPlErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//np/demDistalErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//np/demDistalPlErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les pronoms démonstratifs qui peuvent être utilisés avec des sujets de verbes intransitifs ou avec les objets de verbes transitifs sont montrés dans le tableau suivant, basés sur la distance de celui qui parle:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.150">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Démonstratifs absolutifs</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/demProximalAbsExample),'.','')" />
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
<xsl:text>Proximale</xsl:text>
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
<xsl:text>Proximale</xsl:text>
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
<xsl:value-of select="translate(string(//np/demMedialAbsExample),'.','')" />
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
<xsl:text>Médiale</xsl:text>
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
<xsl:text>Médiale</xsl:text>
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
	            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//np/demDistalAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
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
<xsl:text>Distale</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.152">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>Démonstratifs absolutifs</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/demProximalAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/demProximalPlAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/demMedialAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/demMedialPlAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//np/demDistalAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//np/demDistalPlAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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

        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@possCaseErg)='genitive'">
<p>
<xsl:text>Les pronoms démonstratifs qui peuvent être utilisés avec des possesseurs sont montrés dans le tableau suivant, basés sur la distance de celui qui parle:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@demPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@demPl)='no'">
<example num="xAdjP.AdjArtDem.156">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Démonstratifs au génitif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/demErgProximalGenExample),'.','')" />
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
<xsl:text>Proximale</xsl:text>
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
<xsl:text>Proximale</xsl:text>
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
<xsl:value-of select="translate(string(//np/demErgMedialGenExample),'.','')" />
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
<xsl:text>Médiale</xsl:text>
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
<xsl:text>Médiale</xsl:text>
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
	            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//np/demErgDistalGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
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
<xsl:text>Distale</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@demPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@artCase)='yes' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@demPl)='yes'">
<example num="xAdjP.AdjArtDem.158">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>Démonstratifs au génitif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/demErgProximalGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/demErgProximalPlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/demErgMedialGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/demErgMedialPlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//np/demErgDistalGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//np/demErgDistalPlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	      
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Puisqu’en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> il y a a un système de cas divisé, il y a des groups distincts de démonstratifs pour le système de cas nominatif-accusatif normal, pour les sujets par contraste avec les objets par contraste avec les possesseurs, at aussi d’autres pour les cas spéciaux quand le système de cas ergative-absolutif est utilisé pour modifier les sujets de verbes transitifs par contraste avec les sujets de verbes intransitifs et les objets de verbes transitifs.</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les démonstratifs qui peuvent être utilisés avec des sujets pour le système de cas nominatif-accusatif normal sont montrés dans le tableau suivant, basés sur la distance de celui qui parle:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.164">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Démonstratifs au nominatif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/demSplitProximalNomExample),'.','')" />
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
<xsl:text>Proximale</xsl:text>
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
<xsl:text>Proximale</xsl:text>
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
<xsl:value-of select="translate(string(//np/demSplitMedialNomExample),'.','')" />
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
<xsl:text>Médiale</xsl:text>
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
<xsl:text>Médiale</xsl:text>
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
	            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//np/demSplitDistalNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
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
<xsl:text>Distale</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.166">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>Démonstratifs au nominatif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/demSplitProximalNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/demSplitProximalPlNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/demSplitMedialNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/demSplitMedialPlNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//np/demSplitDistalNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//np/demSplitDistalPlNomExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les démonstratifs qui peuvent être utilisés avec des objets directs pour le système de cas Nominatif-Accusatif normal sont montrés dans le tableau suivant, basés sur la distance de celui qui parle:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.170">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Démonstratifs à l’accusatif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/demSplitProximalAccExample),'.','')" />
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
<xsl:text>Proximale</xsl:text>
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
<xsl:text>Proximale</xsl:text>
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
<xsl:value-of select="translate(string(//np/demSplitMedialAccExample),'.','')" />
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
<xsl:text>Médiale</xsl:text>
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
<xsl:text>Médiale</xsl:text>
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
	            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//np/demSplitDistalAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
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
<xsl:text>Distale</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.172">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>Démonstratifs à l’accusatif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/demSplitProximalAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/demSplitProximalPlAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/demSplitMedialAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/demSplitMedialPlAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//np/demSplitDistalAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//np/demSplitDistalPlAccExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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

        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les démonstratifs qui peuvent être utilisés avec des possesseurs sont montrés dans le tableau suivant, basés sur la distance de celui qui parle:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.176">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Démonstratifs au génitif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/demSplitProximalGenExample),'.','')" />
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
<xsl:text>Proximale</xsl:text>
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
<xsl:text>Proximale</xsl:text>
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
<xsl:value-of select="translate(string(//np/demSplitMedialGenExample),'.','')" />
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
<xsl:text>Médiale</xsl:text>
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
<xsl:text>Médiale</xsl:text>
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
	            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//np/demSplitDistalGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
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
<xsl:text>Distale</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.178">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>Démonstratifs au génitif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/demSplitProximalGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/demSplitProximalPlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/demSplitMedialGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/demSplitMedialPlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//np/demSplitDistalGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//np/demSplitDistalPlGenExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	      	      
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les démonstratifs qui peuvent être utilisés avec des sujets de verbes transitifs dans les situations d’ergativité divisée sont montrés dans le tableau suivant, basés sur la distance de celui qui parle:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.182">
<table border="1">
	            <tr>
	            <th>Distance</th>
	               <th>Démonstratifs ergatifs</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/demSplitProximalErgExample),'.','')" />
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
<xsl:text>Proximale</xsl:text>
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
<xsl:text>Proximale</xsl:text>
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
<xsl:value-of select="translate(string(//np/demSplitMedialErgExample),'.','')" />
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
<xsl:text>Médiale</xsl:text>
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
<xsl:text>Médiale</xsl:text>
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
	            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//np/demSplitDistalErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
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
<xsl:text>Distale</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.184">
<table border="1">
	             <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>Démonstratifs ergatifs</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/demSplitProximalErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/demSplitProximalPlErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/demSplitMedialErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/demSplitMedialPlErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//np/demSplitDistalErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//np/demSplitDistalPlErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>Les démonstratifs qui peuvent être utilisés avec des sujets de verbes intransitifs dans des situations d’érgativité divisé sont montrés dans le tableau suivant, basés sur la distance de celui qui parle:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.188">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Démonstratifs absolutifs</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/demSplitProximalAbsExample),'.','')" />
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
<xsl:text>Proximale</xsl:text>
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
<xsl:text>Proximale</xsl:text>
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
<xsl:value-of select="translate(string(//np/demSplitMedialAbsExample),'.','')" />
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
<xsl:text>Médiale</xsl:text>
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
<xsl:text>Médiale</xsl:text>
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
	            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//np/demSplitDistalAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
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
<xsl:text>Distale</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.190">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>Démonstratifs absolutifs</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/demSplitProximalAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/demSplitProximalPlAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/demSplitMedialAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/demSplitMedialPlAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//np/demSplitDistalAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//np/demSplitDistalPlAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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

        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)!='none' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)!='none'">
<p>
<xsl:text>Il y a un autre groupe de démonstratifs qui peuvent être utilisés avec </xsl:text>
<xsl:if test="normalize-space(//typology/@caseExperiencer)='yesDat'">
<xsl:text>des sujets de verbes expérienceurs ou avec </xsl:text>
</xsl:if>
<xsl:text>des objets indirects, comme montré dans le tableau suivant, basés sur la distance de celui qui parle:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)!='none' and normalize-space(//np/@demPl)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)!='none' and normalize-space(//np/@demPl)='no'">
<example num="xAdjP.AdjArtDem.194">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Démonstratifs au datif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//np/demProximalDatExample),'.','')" />
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
<xsl:text>Proximale</xsl:text>
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
<xsl:text>Proximale</xsl:text>
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
<xsl:value-of select="translate(string(//np/demMedialDatExample),'.','')" />
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
<xsl:text>Médiale</xsl:text>
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
<xsl:text>Médiale</xsl:text>
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
	            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//np/demDistalDatExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
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
<xsl:text>Distale</xsl:text>
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
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)!='none' and normalize-space(//np/@demPl)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)!='none' and normalize-space(//np/@demPl)='yes'">
<example num="xAdjP.AdjArtDem.196">
<table border="1">
	            <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>Démonstratifs au datif</th>
	               <th>Glose</th>
	            </tr>			
	            <xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//np/demProximalDatExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//np/demProximalPlDatExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Proximale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//np/demMedialDatExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//np/demMedialPlDatExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Médiale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	            <xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//np/demDistalDatExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Singulier</xsl:text>
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
	            <xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//np/demDistalPlDatExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
<xsl:text>Distale</xsl:text>
</td>
<td align="left">
<xsl:text>Pluriel</xsl:text>
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
	      
	      <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>La table suivante montre toutes les formes pour une comparaison plus facile. </xsl:text>
<object type="tComment"> Vous devez entrer ici la forme dans chaque cellule. Effacez ce paragraphe et cette table si vous ne désirez pas l’utiliser.</object>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.200">
<table border="1">
	            <caption>
<xsl:text>Résumé des démonstratifs</xsl:text>
</caption>
	            <tr>
	               <th>Distance</th>
	               <th>Nominatif</th>
	               <th>Accusatif</th>
	               <th>Génitif</th>
	               <th>Datif</th>
	            </tr>		
	            <tr>
	               <td align="left">
<xsl:text>Proximale</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left">
<xsl:text>Médiale</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left">
<xsl:text>Distale</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	         </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>La table suivante montre toutes les formes pour une comparaison plus facile. </xsl:text>
<object type="tComment"> Vous devez entrer ici la forme dans chaque cellule. Effacez ce paragraphe et cette table si vous ne désirez pas l’utiliser.</object>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.204">
<table border="1">
	            <caption>
<xsl:text>Résumé des démonstratifs</xsl:text>
</caption>
	            <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>Nominatif</th>
	               <th>Accusatif</th>
	               <th>Génitif</th>
	               <th>Datif</th>
	            </tr>			
	            <tr>
	               <td align="left" rowspan="2">
<xsl:text>Proximal</xsl:text>
</td>
	               <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left" rowspan="2">
<xsl:text>Medial</xsl:text>
</td>
	               <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left" rowspan="2">
<xsl:text>Distal</xsl:text>
</td>
	               <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	         </table>
</example>
</xsl:if>	      


        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>La table suivante montre toutes les formes pour une comparaison plus facile. </xsl:text>
<object type="tComment"> Vous devez entrer ici la forme dans chaque cellule. Effacez ce paragraphe et cette table si vous ne désirez pas l’utiliser.</object>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.208">
<table border="1">
	            <caption>
<xsl:text>Résumé des démonstratifs</xsl:text>
</caption>
	            <tr>
	               <th>Distance</th>
	               <th>Ergatif</th>
	               <th>Absolutif</th>
	               <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<th>Génitif</th>
</xsl:if>
	               <th>Datif</th>
	            </tr>			
	            <tr>
	               <td align="left">
<xsl:text>Proximale</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left">
<xsl:text>Médiale</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left">
<xsl:text>Distale</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	         </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>La table suivante montre toutes les formes pour une comparaison plus facile. </xsl:text>
<object type="tComment"> Vous devez entrer ici la forme dans chaque cellule. Effacez ce paragraphe et cette table si vous ne désirez pas l’utiliser.</object>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.212">
<table border="1">
	            <caption>
<xsl:text>Résumé des démonstratifs</xsl:text>
</caption>
	            <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>Ergatif</th>
	               <th>Absolutif</th>
	               <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<th>Génitif</th>
</xsl:if>
	               <th>Datif</th>
	               </tr>			
	            <tr>
	               <td align="left" rowspan="2">
<xsl:text>Proximal</xsl:text>
</td>
	               <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               </tr>
	            <tr>
	               <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               </tr>
	            <tr>
	               <td align="left" rowspan="2">
<xsl:text>Medial</xsl:text>
</td>
	               <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               </tr>
	            <tr>
	               <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               </tr>
	            <tr>
	               <td align="left" rowspan="2">
<xsl:text>Distal</xsl:text>
</td>
	               <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               </tr>
	            <tr>
	               <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <xsl:if test="normalize-space(//np/@possCaseErg)='genitive'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               </tr>
	         </table>
</example>
</xsl:if>	     
	      
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>La table suivante montre toutes les formes pour une comparaison plus facile. </xsl:text>
<object type="tComment"> Vous devez entrer ici la forme dans chaque cellule. Effacez ce paragraphe et cette table si vous ne désirez pas l’utiliser.</object>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='no' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.216">
<table border="1">
	            <caption>
<xsl:text>Résumé des démonstratifs</xsl:text>
</caption>
	            <tr>
	               <th>Distance</th>
	               <th>NOM</th>
	               <th>ACC</th>
	               <th>GEN</th>
	               <th>DAT</th>
	               <th>ERG</th>
	               <th>ABS</th>
	               </tr>			
	            <tr>
	               <td align="left">
<xsl:text>Proximale</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left">
<xsl:text>Médiale</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left">
<xsl:text>Distale</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	         </table>
</example>
</xsl:if>	      
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<p>
<xsl:text>La table suivante montre toutes les formes pour une comparaison plus facile. </xsl:text>
<object type="tComment">Vous devez entrer ici la forme dans chaque cellule. Effacez ce paragraphe et cette table si vous ne désirez pas l’utiliser.</object>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@case)='split' and normalize-space(//np/@demPl)='yes' and normalize-space(//np/@artCase)='yes'">
<example num="xAdjP.AdjArtDem.220">
<table border="1">
	            <caption>
<xsl:text>Résumé des démonstratifs</xsl:text>
</caption>
	            <tr>
	               <th>Distance</th>
	               <th>Nombre</th>
	               <th>NOM</th>
	               <th>ACC</th>
	               <th>GEN</th>
	               <th>DAT</th>
	               <th>ERG</th>
	               <th>ABS</th>
	            </tr>			
	            <tr>
	               <td align="left" rowspan="2">
<xsl:text>Proximal</xsl:text>
</td>
	               <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left" rowspan="2">
<xsl:text>Medial</xsl:text>
</td>
	               <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left" rowspan="2">
<xsl:text>Distal</xsl:text>
</td>
	               <td align="left">
<xsl:text>Singulier</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	            <tr>
	               <td align="left">
<xsl:text>Pluriel</xsl:text>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	               <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	            </tr>
	         </table>
</example>
</xsl:if>	      
	      

        
        
        <xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<p>
<xsl:text>Voir la section </xsl:text>
<sectionRef sec="sNPArtDem" />
<xsl:text> pour des exemples dans les syntagmes nominaux.</xsl:text>
</p>
</xsl:if>
     </section2>
        
    </section1>
  
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     

   

   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
         
         
         
      
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
 
 
    
    
    
    
    
    
    
    
    
    
    
 
   
      
   
   
      
      
      
     
      
      
      
   
   
      
         
      
   
      
   
         
            
            
            
            
            
            
            
            
            
            
            
         
      
         
         
         
         
         
         
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         

   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
    
  
   
      
      
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
   
      
         
         
         
         
         
         
         
      
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
 
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
      
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
      
         
         
         
         
         
         
         
         
 
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
  
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
   
      
   
   
      
   

   
   
   
 

   

   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
   
      
         
         
         
      
   
      
      
      
   
   
      
      
      
   
      
         
         
         
         
         
         
      
         
         
         
         
         
         
         
           
   
      
   
   
      
   

   

   
      
   
   
      

      
   
   
   
      
   
   
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
         
      
   
   
      
      
      

      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
        
        
        
        
        
        
        
    
    
        
        
        
        
        
        
        
    
    
        
        
        
        
        
        
        
        
        
        
        
    
    
        
        
        
        
        
        
        
    
    
        
        
        
        
        
        
        
    
    
        
        
        
        
        
        
        
    
    
        
        
        
        
        
        
        
    
    
        
    
    
        
        
        
    
    
        
        
        
    
    
        
        
        
    
    
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
    
        
        
        
        
        
    
   
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
            
      
      
         
         
         
         
         
         
         
         
                 
      
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
         
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
       
   
 
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
         
   
   
      
      
      
      
      
      
      
      
              
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
         
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
       
   
   
   
      
      
      
      
      
      
          
   
   
      
      
      
      
         
   
   
      
      
      
    
   
      
      
      
    

   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
       
      
   
   
      
      
      
      
      
      
      
      
              
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
         
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
       
   
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
         
   
   
      
      
      
      
      
      
      
      
              
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
         
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
       
   
   
      
   
   
      
      
      
      
      
      
          
   
   
      
      
      
      
         
   
   
      
      
      
    
   
      
      
      
    
   
    
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
     
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
     
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
         
   
      
      
      
      
      
      
      
       
   
      
      
        
   
   
      
      
        
   
   
      
      
      
      
      
      
      
   
   
   
      
    
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
   
</xsl:template>
</xsl:stylesheet>
