<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="neg">
    <section1 id="sNeg">
       <secTitle>Constructions Négatives</secTitle>
        <p>
<xsl:text>On présentera d’abord les éléments verbaux négatifs, les adverbes négatifs, les pronoms indéfinis négatifs, et la négation des syntagmes nominaux. Ensuite on précisera le type du système de négation qui caracterise </xsl:text>
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
        <section2 id="sNegVerbal">
           <secTitle>Négation de l’auxiliaire et du verbe</secTitle>
              
              <p contentType="ctComparativeIntro">
<xsl:text>Dans certaines langues la négation du verbe se fait par moyen d’un élément auxiliaire; dans d’autres par moyen d’un affixe verbal. L’anglais possède l’auxiliaire </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> (ne)</xsl:text>
</gloss>
<xsl:text> - mot indépendent qui suit toujours un autre auxiliaire - et la forme contractée </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-n’t</langData>
<xsl:text> qui s’attache comme suffixe à l’auxiliaire. Quelques exemples de phrases négatives en anglais sont: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy did not eat the banana</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Le garçon n’a pas mangé la banane »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy didn’t eat the banana</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Le garçon n’a pas mangé la banane »</xsl:text>
</gloss>
<xsl:text>.  En français la negation se fait par le moyen de deux auxiliaires </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ne</langData>
<xsl:text> - mot indépendent qui précède le verbe, et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pas</langData>
<xsl:text> qui le suit. Quelques exemples de phrases négatives en français sont: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Le garçon n’a pas trouvé sa montre</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Je ne le vois pas</langData>
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
                    <xsl:when test="//neg/@negVerbal='yes'"> la negation du verbe  s’exprime des façons suivantes. </xsl:when>				
                    <xsl:when test="//neg/@negVerbal='no'"> il n’y a  aucun moyen d’exprimer la négation, ni sur l’auxiliaire ni sur le verbe.</xsl:when>			
                 </xsl:choose>
</p>
           <xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Certains auxiliaires négatifs s’écrivent comme des mots indépendents.  L’auxiliaire négatif </xsl:text>
<xsl:choose>
                 <xsl:when test="//neg/@negAuxRequiresAux='no'">peut être le seul auxiliaire du syntagme.</xsl:when>
                 <xsl:when test="//neg/@negAuxRequiresAux='yes'">n’est pas nécessairement le seul auxiliaire du syntagme; il faut la présence d’un auxiliaire positif.</xsl:when>
           </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.10">
<table border="1">
              <tr>
                 <th>Auxiliaires négatifs</th>
                 <th>Glose</th>
              </tr>
              <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negAuxExample),'.','')" />
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
           
           
              <xsl:if test="normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Il y a </xsl:text>
<xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<xsl:text>aussi </xsl:text>
</xsl:if>
<xsl:text>un affixe négatif qui s’attache à un auxiliaire positif pour le mettre au négatif. Parmi les exemples des affixes d’auxiliaire négatif qui s’attachent à un auxiliaire positif on peut citer:</xsl:text>
</p>
</xsl:if>
                 <xsl:if test="normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.14">
<table border="1">
                       <tr>
                          <th>Auxiliaires négatifs</th>
                          <th>Glose</th>
                       </tr>
                       <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negAuxAffixExample),'.','')" />
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
          
           <xsl:if test="normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Il y a </xsl:text>
<xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes' or normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<xsl:text>aussi </xsl:text>
</xsl:if>
<xsl:text>un affixe négatif qui s’attache au verbe pour le mettre au négatif. Parmi les exemples des affixes verbaux qui s’attachent à un verbe on peut citer:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.18">
<table border="1">
                 <tr>
                    <th>Verbes à marqueur négatif</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negVerbExample),'.','')" />
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
           <xsl:if test="normalize-space(//neg/negVerbalOther/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Il y a </xsl:text>
<xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes' or normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes' or normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<xsl:text>aussi  </xsl:text>
</xsl:if>
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/negVerbalOther" />
<xsl:text>.  Parmi les exemples des éléments verbaux négatifs on peut citer:</xsl:text>
</p>
</xsl:if>  
           <xsl:if test="normalize-space(//neg/negVerbalOther/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.22">
<table border="1">
                 <tr>
                    <th>Éléments verbaux négatifs</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negVerbalOtherExample),'.','')" />
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
           
           <xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Parmi les auxiliaires négatifs qu’on utilise dans une phrase complète (sans arguments négatifs) on peut citer:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/auxExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/auxExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/auxExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/auxExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.26.1</xsl:text>
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
           <xsl:if test="normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Parmi les exemples des affixes auxiliaires négatifs attachés à un auxiliaire positif qu’on utilise dans une phrase complète on cite:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.30">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/auxAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/auxAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/auxAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/auxAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.30.1</xsl:text>
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
           <xsl:if test="normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Parmi les exemples de phrases complètes qui comprennent des verbes au négatif on cite:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/verbAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/verbAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/verbAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/verbAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.34.1</xsl:text>
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
           
           <xsl:if test="normalize-space(//neg/negVerbalOther/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Parmi les exemples de phrases complètes qui comprennent les autres éléments verbaux au négatif en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> on cite:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//neg/negVerbalOther/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.38">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negVerbalOtherSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negVerbalOtherSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negVerbalOtherSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negVerbalOtherSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.38</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.38.1</xsl:text>
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
           <xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes' or normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text> Comme montrent ces exemples, </xsl:text>
<xsl:choose>
                 <xsl:when test="//neg/@auxVerbRequired='yes'">un auxiliaire négatif n’est pas permis sans un verbe au négatif.</xsl:when>
                 <xsl:when test="//neg/@auxVerbRequired='no'">il n’est pas nécessaire que le verbe soit au négatif lorsqu’il y a un auxiliaire au négatif.</xsl:when>
              </xsl:choose>
</p>
</xsl:if>
           
    
        </section2>
        <section2 id="sNegAdverb">
           <secTitle>Les adverbes négatifs</secTitle>
          
           <p>
<xsl:text>L’adverbe temporel négatif </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ne...jamais</langData>
<xsl:text> s’exprime en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ainsi:</xsl:text>
</p>
           
           <xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes'">
<p>
<xsl:text>Il y a au moins un mot ou syntagme indépendent qui est sans rapport aux adverbes temporels positifs. Ces adverbes ou syntagmes temporels négatifs sont:</xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes'">
<example num="xNeg.NegAdverb.8">
<table border="1">
                 <tr>
                    <th>Adverbes ou syntagmes temporels négatifs</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negTemporalExample),'.','')" />
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
           
           <xsl:if test="normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<p>
<xsl:text>Il y a </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes'">
<xsl:text>aussi </xsl:text>
</xsl:if>
<xsl:text> un affixe négatif qui peut être attaché à un syntagme temporel positif pour former un mot. L’affixe négatif est:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<example num="xNeg.NegAdverb.12">
<table border="1">
                 <tr>
                    <th>Affixe négatif</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negTemporalAdverbAffixExample),'.','')" />
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
           <xsl:if test="normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<p>
<xsl:text>Parmi les exemples d’adverbes temporels négatifs formés par l’attachement d’un affixe négatif aux adverbes temporels positifs on cite: </xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<example num="xNeg.NegAdverb.16">
<table border="1">
                 <tr>
                    <th>Adverbes temporels négatifs</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negTemporalAdverbExample),'.','')" />
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
                    
           <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<p>
<xsl:text>Il y a </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<xsl:text>aussi </xsl:text>
</xsl:if>
<xsl:text>un mot indépendent négatif qui se met  </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='no'">
<xsl:text>avant un</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='no'">
<xsl:text>après un</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes'">
<xsl:text>des deux côtés d’un</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='no'">
<xsl:text>d’un côté ou de autre côté d’un </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés d’un</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés d’un</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes'">
<xsl:text>d’un côté ou de autre côté ou des deux côtés d’un</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordOther/@checked)='no'">
<xsl:text> adverbe temporel positif pour former un syntagme temporel de négation.   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/negTemporalTypeAdverbWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordOther/@checked)='yes' or normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordOther/@checked)='yes' or normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordOther/@checked)='yes'">
<xsl:text> adverbe temporel positif pour former un syntagme temporel de négation et peut aussi se mettre ___</xsl:text> <xsl:value-of select="//neg/negTemporalTypeAdverbWordOther" /> <xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text> Le mot négatif qu’on rencontre avec les adverbes temporels positifs est: </xsl:text>
</p>
</xsl:if>
              <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<example num="xNeg.NegAdverb.20">
<table border="1">
                    <tr>
                       <th>Mot négatif</th>
                       <th>Glose</th>
                    </tr>
                    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negTemporalAdverbWordExample),'.','')" />
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
           <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<p>
<xsl:text>Parmi les exemples de syntagmes temporels négatifs formés par le mot négatif et les adverbes temporels positifs on cite:</xsl:text>
</p>
</xsl:if>   
              <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<example num="xNeg.NegAdverb.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negTemporalAdverbWordsExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negTemporalAdverbWordsExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negTemporalAdverbWordsExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negTemporalAdverbWordsExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.24.1</xsl:text>
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
           
           <xsl:if test="normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<p>
<xsl:text>Il y a </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<xsl:text>aussi </xsl:text>
</xsl:if>
<xsl:text>au moins un affixe verbal qui exprime le sens de l’adverbe temporel négatif. Les affixes adverbiaux temporels au négatif qui peuvent s’attacher aux verbes sont: </xsl:text>
</p>
</xsl:if>                     
           <xsl:if test="normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<example num="xNeg.NegAdverb.28">
<table border="1">
                 <tr>
                    <th>Affixes adverbiaux temporels au négatif</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negTemporalAffixExample),'.','')" />
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
           
           <xsl:if test="normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<p>
<xsl:text>Parmi les exemples des affixes adverbiaux temporels au négatif attachés aux verbes on cite:</xsl:text>
</p>
</xsl:if>                     
           <xsl:if test="normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<example num="xNeg.NegAdverb.32">
<table border="1">
                 <tr>
                    <th>Verbes aux affixes adverbiaux temporels au négatif</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negTemporalAffixVerbExample),'.','')" />
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
               
           <xsl:if test="normalize-space(//neg/negTemporalTypeVerb/@checked)='yes'">
<p>
<xsl:text>Il y a </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<xsl:text>aussi  </xsl:text>
</xsl:if>
<xsl:text>un affixe verbal négatif, et un verbe au négatif peut exister avec des adverbes temporels positifs pour donner un sens temporel négatif. Parmi des exemples d’adverbes temporels positifs accompagnés d’un verbe au négatif on cite:</xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negTemporalTypeVerb/@checked)='yes'">
<example num="xNeg.NegAdverb.36">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negTemporalVerbExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negTemporalVerbExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negTemporalVerbExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negTemporalVerbExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.36</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.36.1</xsl:text>
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
           <xsl:if test="normalize-space(//neg/negTemporalTypeOther/@checked)='yes'">
<p>
<xsl:text>Le temporel négatif peut </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAffix/@checked)='yes' or normalize-space(//neg/negTemporalTypeVerb/@checked)='yes'">
<xsl:text>aussi  </xsl:text>
</xsl:if>
<xsl:text>être exprimé par ___</xsl:text>
<xsl:value-of select="//neg/negTemporalTypeOther" />
<xsl:text> comme pas exemple:</xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negTemporalTypeOther/@checked)='yes'">
<example num="xNeg.NegAdverb.40">
<table border="1">
                 <tr>
                    <th>Temporel négatif</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negTemporalOtherExample),'.','')" />
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
<xsl:text>Parmi des phrases complètes qui contiennent un temporel négatif on cite:</xsl:text>
</p>
            <example num="xNeg.NegAdverb.44">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/advTemporalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/advTemporalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/advTemporalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/advTemporalExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.44</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.44.1</xsl:text>
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
<xsl:text>L’adverbe locatif négatif </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nulle part</langData>
<xsl:text> s’exprime en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> des façons suivantes:</xsl:text>
</p>
           
           <xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes'">
<p>
<xsl:text>Il y a au moins un mot ou syntagme indépendent qui est sans rapport aux adverbes locatifs positifs. Ces adverbes ou syntagmes locatifs au négatif sont:</xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes'">
<example num="xNeg.NegAdverb.50">
<table border="1">
                 <tr>
                    <th>Adverbes ou syntagmes locatifs au négatif</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negLocativeExample),'.','')" />
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
           
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<p>
<xsl:text>Il y a </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes'">
<xsl:text>aussi </xsl:text>
</xsl:if>
<xsl:text>un affixe négatif qui peut s’attacher à un adverbe locatif positif pour former un mot adverbial locatif au négatif. L’affixe négatif est:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<example num="xNeg.NegAdverb.54">
<table border="1">
                 <tr>
                    <th>L’affixe négatif</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negLocativeAdverbAffixExample),'.','')" />
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
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<p>
<xsl:text>Parmi les exemples des adverbes locatifs négatifs qu’on forme en attachant l’affixe négatif aux adverbes locatifs positifs on cite:</xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<example num="xNeg.NegAdverb.58">
<table border="1">
                 <tr>
                    <th>Adverbes locatifs négatifs</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negLocativeAdverbExample),'.','')" />
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
           
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes'">
<p>
<xsl:text>Il y a </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<xsl:text>aussi </xsl:text>
</xsl:if>
<xsl:text>un mot indépendent négatif qui se met </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='no'">
<xsl:text>avant un</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='no'">
<xsl:text>après un</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes'">
<xsl:text>des deux côtés d’un</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='no'">
<xsl:text>d’un côté ou de autre côté d’un</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés d’un</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés d’un</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes'">
<xsl:text>d’un côté ou de autre côté ou des deux côtés d’un</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordOther/@checked)='no'">
<xsl:text> adverbe locatif positif pour former un syntagme locatif de négation.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/negLocativeTypeAdverbWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordOther/@checked)='yes' or normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordOther/@checked)='yes' or normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordOther/@checked)='yes'">
<xsl:text> adverbe locatif positif pour former un syntagme locatif de négation et puet aussi se mettre ___</xsl:text> <xsl:value-of select="//neg/negLocativeTypeAdverbWordOther" /> <xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text> The mot négatif qu’on rencontre avec les adverbes locatifs positifs est:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes'">
<example num="xNeg.NegAdverb.62">
<table border="1">
                 <tr>
                    <th>Mot négatif</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negLocativeAdverbWordExample),'.','')" />
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
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes'">
<p>
<xsl:text>Parmi les exemples de syntagmes adverbiaux locatifs au négatif qu’on forme avec le mot négatif et les adverbes locatifs positifs on cite:</xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes'">
<example num="xNeg.NegAdverb.66">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negLocativeAdverbWordsExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negLocativeAdverbWordsExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negLocativeAdverbWordsExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negLocativeAdverbWordsExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.66</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.66.1</xsl:text>
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
           
           <xsl:if test="normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<p>
<xsl:text>Il y a </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes'">
<xsl:text>aussi </xsl:text>
</xsl:if>
<xsl:text>au moins un affixe verbal qui exprime le sens de l’adverbe locatif négatif. Ces affixes adverbiaux locatifs au négatif qui peuvent s’attacher aux verbes sont:</xsl:text>
</p>
</xsl:if>                     
           <xsl:if test="normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<example num="xNeg.NegAdverb.70">
<table border="1">
                 <tr>
                    <th>Affixes adverbiaux locatifs au négatif</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negLocativeAffixExample),'.','')" />
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
           
           <xsl:if test="normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<p>
<xsl:text>Parmi des exemples d’affixes adverbiaux locatifs au négatif qui s’attachent aux verbes on cite:</xsl:text>
</p>
</xsl:if>                     
           <xsl:if test="normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<example num="xNeg.NegAdverb.74">
<table border="1">
                 <tr>
                    <th>Verbes aux affixes adverbiaux locatifs au négatif</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negLocativeAffixVerbExample),'.','')" />
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
           
           <xsl:if test="normalize-space(//neg/negLocativeTypeVerb/@checked)='yes'">
<p>
<xsl:text>Il y a </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<xsl:text>aussi  </xsl:text>
</xsl:if>
<xsl:text>un affixe verbal négatif, et un verbe négatif peut exister avec les adverbes locatifs positifs pour donner un sens négatif au locatif. Parmi des exemples d’adverbes locatifs positifs avec un verbe négatif on cite:</xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negLocativeTypeVerb/@checked)='yes'">
<example num="xNeg.NegAdverb.78">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negLocativeVerbExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negLocativeVerbExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negLocativeVerbExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negLocativeVerbExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.78</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.78.1</xsl:text>
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
           <xsl:if test="normalize-space(//neg/negLocativeTypeOther/@checked)='yes'">
<p>
<xsl:text>Le locatif négatif peut s’exprimer </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAffix/@checked)='yes' or normalize-space(//neg/negLocativeTypeVerb/@checked)='yes'">
<xsl:text>aussi  </xsl:text>
</xsl:if>
<xsl:text>par ___</xsl:text>
<xsl:value-of select="//neg/negLocativeTypeOther" />
<xsl:text> comme suit:</xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negLocativeTypeOther/@checked)='yes'">
<example num="xNeg.NegAdverb.82">
<table border="1">
                 <tr>
                    <th>Locatif négatif</th>
                    <th>Glose</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negLocativeOtherExample),'.','')" />
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
<xsl:text>Parmi les phrases complètes qui contiennent un locatif négatif on cite: </xsl:text>
</p>
           <example num="xNeg.NegAdverb.86">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/advLocativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/advLocativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/advLocativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/advLocativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.86</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.86.1</xsl:text>
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
           
           <xsl:if test="normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negLocativeTypeWord/@checked)='yes'">
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
<xsl:choose>
                   <xsl:when test="//neg/@advVerbRequired='yes'"> un adverbe négatif écrit comme un mot indépendent n’est pas permis sans que le verbe ou l’auxiliaire soit au négatif aussi.</xsl:when>
                   <xsl:when test="//neg/@advVerbRequired='no'"> un verbe négatif ou un auxiliaire négatif n’est pas nécessaire lorsqu’il y a un adverbe négatif écrit comme un mot indépendent.</xsl:when>
                </xsl:choose>
</p>
</xsl:if>
        </section2>
 
 <section2 id="sNegPron">
    <secTitle>Pronoms indéfinis négatifs</secTitle>
    <p contentType="ctComparativeIntro">
<xsl:text> Il y a aussi des versions négatives des pronoms indéfinis, tels que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>personne...ne</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>rien...ne</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>aucun</langData>
<xsl:text>.  Notez que ces pronoms se forment d’un négatif et d’un numéro générique ou d’un nom. Quelquefois ces indéfinis négatifs ne se fusionnent pas en un seul mot. </xsl:text>
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
<xsl:if test="normalize-space(//neg/@negIndef)!='some'">
<xsl:text> les </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@negIndef)='some'">
<xsl:text> certains </xsl:text>
</xsl:if>
<xsl:text>pronoms indéfinis au négatif </xsl:text>
<xsl:choose>
       <xsl:when test="//neg/@negIndef='yes'">sont tous des pronoms à un seul mot. </xsl:when>
       <xsl:when test="//neg/@negIndef='no'">sont tous des syntagmes nominaux au lieu de pronoms à un seul mot. </xsl:when>
       <xsl:when test="//neg/@negIndef='some'">sont des pronoms à un seul mot, mais d’autres sont des syntagmes nominaux. </xsl:when>
    </xsl:choose>
<xsl:text> Ces formes indéfinies sont:</xsl:text>
</p>
    
    <example num="xNeg.NegPron.8">
<table border="1">
          <caption>
<xsl:text>Formes négatives indéfinies</xsl:text>
</caption>
          <tr>
             <th>Type</th>
             <th>Morphèmes</th>
             <th>Glose</th>
          </tr>				
          <xsl:if test="normalize-space(//neg/@negIndef)='yes' or normalize-space(//neg/@negIndef)='some'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//neg/negIndefExample),'.','')" />
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
<xsl:text>Pronoms</xsl:text>
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
<xsl:text>Pronoms</xsl:text>
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
          <xsl:if test="normalize-space(//neg/@negIndef)='no' or normalize-space(//neg/@negIndef)='some'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//neg/negIndefNPExample),'.','')" />
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
<xsl:text>Syntagmes</xsl:text>
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
<xsl:text>Syntagmes</xsl:text>
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
    <p>
<xsl:text>Parmi les </xsl:text>
<xsl:if test="normalize-space(//neg/@negIndef)='yes'">
<xsl:text>pronoms indéfinis au négatif </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@negIndef)='no'">
<xsl:text>syntagmes nominaux négatifs</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@negIndef)='some'">
<xsl:text>pronoms et/ou syntagmes nominaux négatifs</xsl:text>
</xsl:if>
<xsl:text>utilisés comme le sujet d’une phrase on cite:</xsl:text>
</p>
    <example num="xNeg.NegPron.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negIndefSubjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negIndefSubjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negIndefSubjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negIndefSubjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegPron.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegPron.12.1</xsl:text>
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
    
    <xsl:if test="normalize-space(//neg/@negVerbal)='yes'">
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
<xsl:choose>
          <xsl:when test="//neg/@subjVerbRequired='yes'"> un sujet négatif n’est pas permis sans que le verbe ou l’auxiliaire soit au négatif, lui aussi.</xsl:when>
          <xsl:when test="//neg/@subjVerbRequired='no'"> le verbe ou l’auxiliaire n’est pas permis au négatif lorsque le sujet est au négatif.</xsl:when>
       </xsl:choose>
</p>
</xsl:if>
    
 </section2>
       
       <section2 id="sNegNominal">
          <secTitle>Négation des syntagmes nominaux</secTitle>
            <p contentType="ctComparativeIntro">
<xsl:text> Les négatifs </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pas</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nul</langData>
<xsl:text> peut nier un syntagme nominal.   Notez que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pas</langData>
<xsl:text> peut se mettre à la place des quantificateurs ou des autres mots de degré à large portée (ou bien avant eux), comme dans les exemples en français: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pas les enfants</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pas tous les enfants</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pas seulement les cinq enfants de Suzanne</langData>
<xsl:text>.  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Nul</langData>
<xsl:text> aussi se met à la première place dans le syntagme nominal, comme dans l’exemple </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nuls petits enfants</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nuls grands garçons</langData>
<xsl:text>. La négation d’un syntagme nominal se trouve normalement en tête ou en fin de syntagme, ayant la plus grande portée de tous les modificateurs nominaux du syntagme</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text> Les négatifs </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pas</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nul</langData>
<xsl:text> peut nier un syntagme nominal.  La négation d’un syntagme nominal se trouve normalement en tête ou en fin de syntagme, ayant la plus grande portée de tous les modificateurs nominaux du syntagme</xsl:text>
</p>
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='none'">
<p>
<xsl:text>Il n’y a pas, semble-t-il, de moyen de nier un syntagme nominal en </xsl:text>
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

          <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none'">
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
<xsl:if test="normalize-space(//neg/@npDegreeNeg)!='some'">
<xsl:text>les </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@npDegreeNeg)='some'">
<xsl:text>certains </xsl:text>
</xsl:if>
<xsl:text>éléments qui peuvent nier un syntagme nominal </xsl:text>
<xsl:choose>
   <xsl:when test="//neg/@npDegreeNeg='yes'">sont tous des mots indépendents. </xsl:when>
   <xsl:when test="//neg/@npDegreeNeg='some'">sont des mots indépendents, mais d’autres s’attachent </xsl:when>
   <xsl:when test="//neg/@npDegreeNeg='no'">s’attachent </xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' or normalize-space(//neg/@npDegreeNeg)='some'">
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no'">
<xsl:text>au début du mot – quel qu’il soit – qui commence le syntagme nominal en tant que proclitiques.  </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no'">
<xsl:text>à la fin du mot qui termine le syntagme nominal en tant qu’enclitiques.    </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no'">
<xsl:text>ou bien au début du mot qui commence le syntagme nominal ou bien à la fin du mot qui termine le syntagme nominal en tant que clitiques.   </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no'">
<xsl:text>au nom principal du syntagme nominal en tant que préfixes.  </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes'">
<xsl:text>au nom principal du syntagme nominal en tant que suffixes.   </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes'">
<xsl:text>au nom principal du syntagme nominal, quelques-uns comme préfixes d’autres comment suffixes.   </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no' or normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes'">
<xsl:text>à la tête du syntagme ou à la fin comme clitiques, ou bien au nom principal dans le syntagme nominal comme affixes.  </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/npDegreeNegOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes' or normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes' or normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes' or normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes'">
<xsl:text>  D’autres s’attachent ___</xsl:text>
<xsl:value-of select="//neg/npDegreeNegOther" />  <xsl:text>.</xsl:text>
</xsl:if>              
   </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>   

          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de syntagmes nominaux au négatif auxquels les clitiques négatifs s’attachent:</xsl:text>
</p>
</xsl:if>   
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes'">
<example num="xNeg.NegNominal.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negCliticExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negCliticExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negCliticExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negCliticExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.14.1</xsl:text>
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
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de syntagmes nominaux au négatifs auxquels les clitiques négatifs s’attachent:</xsl:text>
</p>
</xsl:if>   
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes'">
<example num="xNeg.NegNominal.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.18.1</xsl:text>
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
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegOther/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegOther/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de syntagmes nominaux négatifs auxquels les éléments négatifs permis en </xsl:text>
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
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegOther/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegOther/@checked)='yes'">
<example num="xNeg.NegNominal.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.22.1</xsl:text>
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
          
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='yes' or normalize-space(//neg/@npDegreeNeg)='some'">
<p>
<xsl:text>Les mots indépendents négatifs qui se mettent </xsl:text>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='no' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='no' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='no' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='no' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='no'">
<xsl:text>d’un côté ou de autre côté du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='no' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='no' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes'">
<xsl:text>d’un côté ou de autre côté ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordOther/@checked)='no'">
<xsl:text> reste du syntagme nominal. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='no' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='no' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='no' and normalize-space(//neg/npDegreeNegWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/npDegreeNegWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordOther/@checked)='yes' or normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordOther/@checked)='yes' or normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes' and normalize-space(//neg/npDegreeNegWordOther/@checked)='yes'">
<xsl:text> reste du syntagme nominal et peuvent aussi se mettre ___</xsl:text> <xsl:value-of select="//neg/npDegreeNegWordOther" /> <xsl:text>. </xsl:text>
</xsl:if>
<xsl:text> Des exemples de syntagmes nominaux négatifs sans quantificateurs positifs à large portée ni éléments de degré sont: </xsl:text>
</p>
</xsl:if>          
                 <xsl:if test="normalize-space(//neg/@npDegreeNeg)='yes' or normalize-space(//neg/@npDegreeNeg)='some'">
<example num="xNeg.NegNominal.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.26.1</xsl:text>
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
                   
               <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none' and normalize-space(//neg/@npDegreeNegCooccur)='no'">
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
<xsl:text> les éléments négatifs ne peuvent pas coexister avec les quantificateurs positifs à large portée, ni avec les éléments de degré, dans un seul syntagme nominal.</xsl:text>
</p>
</xsl:if>
               <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none' and normalize-space(//neg/@npDegreeNegCooccur)='yes'">
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
<xsl:text> les éléments négatifs peuvent coexister avec les quantificateurs positifs à large portée, ou bien avec les éléments de degré, dans un seul syntagme nominal, comme suit:</xsl:text>
</p>
</xsl:if>
               <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none' and normalize-space(//neg/@npDegreeNegCooccur)='yes'">
<example num="xNeg.NegNominal.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negCooccurExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negCooccurExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negCooccurExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negCooccurExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.32.1</xsl:text>
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
                <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none'">
<p>
<xsl:text>Les syntagmes nominaux négatifs qui suivent peuvent servir comme sujets de phrases complètes; en voici quelques exemples: </xsl:text>
</p>
</xsl:if>
                <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none'">
<example num="xNeg.NegNominal.36">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/npDegreeSubjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/npDegreeSubjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/npDegreeSubjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/npDegreeSubjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.36</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.36.1</xsl:text>
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
               
                <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Les exemples ci-dessus montrent qu’</xsl:text>
<xsl:choose>
                       <xsl:when test="//neg/@subjVerbRequired='yes'">un subjet négatif n’est pas permis sans être accompagné par un verbe au négatif ou un auxiliaire au négatif. </xsl:when>
                       <xsl:when test="//neg/@subjVerbRequired='no'">un verbe au négatif ou un auxiliaire au négatif  n’est pas nécessaire lorsque le sujet est négatif.</xsl:when>
                    </xsl:choose>
</p>
</xsl:if>
        
        </section2>
       <section2 id="sNegType">
          <secTitle>Type de système de négation</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Quant à la négation les langues se groupent selon deux classifications majeures: les langues qui changent de polarité, et les langues à concordance négative, une différence exemplifiée par l’anglais contre le français. </xsl:text>
</p>
          <p contentType="ctComparativeIntro">
<xsl:text>Les langues qui changent de polarité admettent d’habitude un seul élément négatif dans la phrase pour exprimer la négation (du point de vue technique n’importe quel nombre impair de négatifs exprime la polarité négative), parce que la présence de deux élements (ou un nombre pair d’éléments) change la polarité et la remet au positif. 
                Par exemple, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John saw nothing</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jean n’a rien vu »</xsl:text>
</gloss>
<xsl:text> est négatif, mais </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn’t see nothing</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> (Jean n’a rien vu)</xsl:text>
</gloss>
<xsl:text> est positif parce la phrase veut dire la même chose que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John saw something</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jean a vu quelque chose »</xsl:text>
</gloss>
<xsl:text>.  La version à auxiliaire négatif s’exprime </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn’t see anything</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jean n’a vu n’importe quoi »</xsl:text>
</gloss>
<xsl:text>, celle-ci utilise dans la position de l’objet ce qu’on appelle un élément de polarité negative.  Ces éléments de polarité peuvent être des sujets dans certains contextes sans autre négation (exemple: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Anyone may come</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « N’importe qui peut venir »</xsl:text>
</gloss>
<xsl:text>), pourtant, ils doivent se mettre dans la position de l’objet lorsqu’un élément qui précède est au négatif. Par exemple, on peut dire </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Nobody saw anyone</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Personne n’a vu personne »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Nowhere will they find anyone</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Ils ne trouveront personne nulle part »</xsl:text>
</gloss>
<xsl:text>.  Cependant, en l’absence du sujet négatif ou d’un adverbe négatif en tête de phrase on doit utiliser l’auxiliaire négatif, par exemple: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>We did not see anyone</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Nous n’avons vu personne »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>They will not find anyone anywhere</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Ils ne trouveront pas personne n’importe où »</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
          <p contentType="ctComparativeIntro">
<xsl:text>Dans les langues à concordance négative n’importe quel nombre d’éléments négatifs exprime la polarité négative; ce qui veut dire qu’en français - une langue à concordance negative - </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jean n’a rien vu</langData>
<xsl:text> est la façon correcte d’exprimer une phrase négative à objet négatif. Dans ces langues, tout comme la restriction sur les éléments de polarité négative, un élément négatif se met d’habitude dans la position du sujet, ou bien une position en tête de phrase sans qu’il y ait un autre élément; mais un objet au négatif doit exister seulement quand un autre élément qui précède est au négatif. 
                Dans certaines langues à concordance négative on exige que l’argument négatif coexiste avec la négation du verbe; dans d’autres c’est l’argument au négatif qui précède, tout comme les mots ou syntagmes interrogatifs doivent être à la tête dans les questions de contenu.</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Quant à la négation, les deux classements majeurs sont les langues qui changent de polarité contre les langues à concordance négative. Celles-là permettent généralement un seul élément négatif dans une phrase où se trouvent des éléments spéciaux de polarité négative au lieu d’un deuxième élément négatif. Par contre, dans les langues à concordance négative n’importe quel nombre d’éléments expriment la polarité négative, puisque les éléments négatifs visent un accord de polarité. </xsl:text>
</p>
          <p>
<xsl:text>Le </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> est une langue </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@type='changing'">qui change de polarité</xsl:when>
                <xsl:when test="//neg/@type='concord'">à concordance négative</xsl:when>
             </xsl:choose>
<xsl:text>, puisque </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@type='changing'">la polarité change entre positive et  négative avec chaque exemple de négation. </xsl:when>
                <xsl:when test="//neg/@type='concord'">n’importe quel nombre d’éléments négatifs visent à rendre la polarité négative. </xsl:when>
             </xsl:choose>
<xsl:text></xsl:text>
</p>
          <xsl:if test="normalize-space(//neg/@type)='changing'">
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
                <xsl:when test="//neg/@polarityItems='yes'"> il y a </xsl:when>
                <xsl:when test="//neg/@polarityItems='no'">  il n’y a pas </xsl:when>
             </xsl:choose>
<xsl:text>d’éléments de polarité négatifs.  </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@polarityItems='yes'">Les pronoms, déterminateurs et adverbes suivants  prennent la position de l’objet ou bien la position normale de l’adverbe au lieu de l’élément négatif équivalent lorsqu’un autre élément négatif est présent dans la phrase.</xsl:when>
                <xsl:when test="//neg/@polarityItems='no'">Les pronoms, déterminateurs et adverbes (tous au négatif) prennent la position de l’objet ou la position adverbiale normale, même quand il y a un autre élément dans la phrase.</xsl:when>
             </xsl:choose>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
<example num="xNeg.NegType.16">
<table border="1">
                <tr>
                   <th>Type</th>
                   <th>Eléments de polarité négatifs</th>
                   <th>Glose</th>
                </tr>
                <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//neg/npiPronounExample),'.','')" />
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
                      <xsl:text>Pronoms</xsl:text>
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
<td align="left" rowspan="1">
                      <xsl:text>Pronoms</xsl:text>
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
<xsl:value-of select="translate(string(//neg/npiDeterminerExample),'.','')" />
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
                      <xsl:text>Determinateurs</xsl:text>
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
<td align="left" rowspan="1">
                      <xsl:text>Determinateurs</xsl:text>
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
<xsl:value-of select="translate(string(//neg/npiTemporalExample),'.','')" />
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
<td align="left" rowspan="">
                      <xsl:text>Adverbes temporels</xsl:text>
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
<td align="left" rowspan="">
                      <xsl:text>Adverbes temporels</xsl:text>
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
                <xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//neg/npiLocativeExample),'.','')" />
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
<td align="left" rowspan="">
                      <xsl:text>Adverbes locatifs</xsl:text>
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
<td align="left" rowspan="">
                      <xsl:text>Adverbes locatifs</xsl:text>
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
          
          <p>
<xsl:text>Parmi les exemples ayant un sujet positif et un </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
                <xsl:text>élément de polarité négatif dans le </xsl:text>
             </xsl:if>
<xsl:text>syntagme nominal de l’objet </xsl:text>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='no'">
<xsl:text>négatif </xsl:text>
</xsl:if>
<xsl:text>on cite: </xsl:text>
</p>
          <example num="xNeg.NegType.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/objectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/objectExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/objectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/objectExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegType.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegType.20.1</xsl:text>
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
<xsl:text>Parmi les exemples ayant un sujet positif et un </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
                <xsl:text>élément de polarité négatif dans le </xsl:text>
             </xsl:if>
<xsl:text>syntagme nominal de l’objet indirect </xsl:text>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='no'">
<xsl:text>négatif </xsl:text>
</xsl:if>
<xsl:text>on cite: </xsl:text>
</p>
         
          <example num="xNeg.NegType.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/indirectObjectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/indirectObjectExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/indirectObjectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/indirectObjectExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegType.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegType.24.1</xsl:text>
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
          <xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
<p>
<xsl:text>Ces exemples montrent qu’un élément de polarité négatif </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
                <xsl:text>ne peut pas</xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//neg/@objVerbRequired)='no'">
                <xsl:text>peut</xsl:text>
             </xsl:if>
<xsl:text> exister dans la position de l’objet ou de l’objet indirect </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@objVerbRequired='yes'">sauf si le verbe ou l’auxiliaire est négatif.</xsl:when>
                <xsl:when test="//neg/@objVerbRequired='other'">sauf si le verbe ou l’auxiliaire ou un autre élément est négatif.</xsl:when>
                <xsl:when test="//neg/@objVerbRequired='no'">sans restriction d’autres éléments négatifs dans la phrase.</xsl:when>
             </xsl:choose>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='no'">
<p>
<xsl:text>Ces exemples montrent qu’un syntagme nominal négatif </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
                <xsl:text>ne peut pas</xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//neg/@objVerbRequired)='no'">
                <xsl:text>peut</xsl:text>
             </xsl:if>
<xsl:text> exister dans la position de l’objet ou de l’objet indirect </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@objVerbRequired='yes'">sauf si le verbe ou l’auxiliaire est négatif.</xsl:when>
                <xsl:when test="//neg/@objVerbRequired='other'">sauf si le verbe ou l’auxiliaire ou un autre élément est négatif.</xsl:when>
                <xsl:when test="//neg/@objVerbRequired='no'">sans restriction d’autres éléments négatifs dans la phrase.</xsl:when>
             </xsl:choose>
</p>
</xsl:if>
          
          <xsl:if test="normalize-space(//neg/@type)='concord'">
<p>
<xsl:text>Ces exemples montrent qu’un syntagme nominal négatif </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
                <xsl:text>ne peut pas</xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//neg/@objVerbRequired)='no'">
                <xsl:text>peut</xsl:text>
             </xsl:if>
<xsl:text> exister dans la position de l’objet ou de l’objet indirect </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@objVerbRequired='yes'">sauf si le verbe ou l’auxiliaire est négatif.</xsl:when>
                <xsl:when test="//neg/@objVerbRequired='other'">sauf si le verbe ou l’auxiliaire ou un autre élément est négatif.</xsl:when>
                <xsl:when test="//neg/@objVerbRequired='no'">sans restriction d’autres éléments négatifs dans la phrase.</xsl:when>
             </xsl:choose>
<xsl:choose>
                <xsl:when test="//neg/@negFront='yes'">  Un objet négatif doit se mettre en tête de la phrase, tout comme les syntagmes interrogatifs. </xsl:when>
                <xsl:when test="//neg/@negFront='optional'">  Un objet négatif peut se mettre en position initiale, ou il peut garder sa position habituelle. </xsl:when>
                <xsl:when test="//neg/@negFront='beforeVerb'">  Un élément négatif peut se mettre directement avant le verbe, ou bien il peut garder sa position habituelle. </xsl:when>
                <xsl:when test="//neg/@negFront='no'">  Un objet negative paraît simplement dans sa position habituelle, sans aucun mouvement. </xsl:when>
             </xsl:choose>
</p>
</xsl:if>
          
          
          <xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@negTwoAllowed)='yes'">
<p>
<xsl:text>Finalement, parmi les exemples où se trouvent un sujet négatif et un </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
                <xsl:text>élément de polarité négatif dans le </xsl:text>
             </xsl:if>
<xsl:text>syntagme nominal de l’objet </xsl:text>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='no'">
<xsl:text>négatif </xsl:text>
</xsl:if>
<xsl:text>on cite: </xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@negTwoAllowed)='oneOnly'">
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
<xsl:text>on ne permet pas d’exemples où figurent un sujet négatif et un </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
                <xsl:text>élément de polarité négatif dans le </xsl:text>
             </xsl:if>
<xsl:text>syntagme nominal de l’objet </xsl:text>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='no'">
<xsl:text>négatif </xsl:text>
</xsl:if>
<xsl:text>.  On cite ci-dessous quelques exemples qui montrent comment ces messages se transmettent en utilisant un indéfini ou en séparant la phrase en deux: :</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@type)='concord' and normalize-space(//neg/@negFrontTwo)!='oneOnly'">
<p>
<xsl:text>Finalement, parmi les exemples où se trouvent un sujet négatif et un syntagme nominal négatif comme objet on cite:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@type)='concord' and normalize-space(//neg/@negFrontTwo)='oneOnly' or normalize-space(//neg/@type)='concord' and normalize-space(//neg/@negTwoAllowed)='oneOnly' and normalize-space(//neg/@negFront)='no'">
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
<xsl:text> on ne permet pas d’exemples où figurent un sujet négatif et un syntagme nominal négatif comme objet. On cite ci-dessous quelques exemples qui montrent comment ces messages se transmettent en utilisant un indéfini ou en séparant la phrase en deux:</xsl:text>
</p>
</xsl:if>
          <example num="xNeg.NegType.40">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/subjectObjectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/subjectObjectExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/subjectObjectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/subjectObjectExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegType.40</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegType.40.1</xsl:text>
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
          
             
          <xsl:if test="normalize-space(//neg/@type)='concord'">
<p>
<xsl:if test="normalize-space(//neg/@type)='concord' and normalize-space(//neg/@negFront)!='no' and normalize-space(//neg/@negFrontTwo)!='oneOnly'">
                <xsl:text> Si le sujet et l’objet sont tous deux au négatif, </xsl:text>
                   <xsl:choose>
                      <xsl:when test="//neg/@negFrontTwo='yes'">les deux éléments négatifs doivent être en tête de phrase.</xsl:when>
                      <xsl:when test="//neg/@negFrontTwo='optional'">les deux éléments peuvent être en tête, ou bien l’objet négatif peut retenir sa position habituelle.</xsl:when>
                      <xsl:when test="//neg/@negFrontTwo='beforeVerb'">les deux éléments peuvent se mettre immédiatement avant le verbe, ou bien l’objet négatif peut retenir sa position habituelle.</xsl:when>
                      <xsl:when test="//neg/@negFrontTwo='no'">seul le sujet négatif vient en tête, l’objet négatif paraît simplement dans sa position habituelle dans la phrase.</xsl:when>
                   </xsl:choose>
                </xsl:if>
</p>
</xsl:if>
          
       </section2>
       
    </section1>
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
      
         
         
         
         
         
         
         
         
         
         
         
      
   
      
      
      
      
      
      
      
      
      
      
      
   
   

   

   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   


    
        
    
   
      
      
      
   
   
        
        
        


    
    
    
   
   

   
      
      
      
   
   
      
      
      
   
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
    
        
    
   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
   
   
      
   
   
      
      
      
   
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
      
      
      
      
      
      
      
      
   
   
      
      
      
   

   
   
        
   
   
      
   
   
      
   
  
     
   
   
      
    
   
      
    
   
      
    
   
      
      
      
    
   
      
      
      
    
   
   
</xsl:template>
</xsl:stylesheet>
