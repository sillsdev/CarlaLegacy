<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="relcl">
   <section1 id="sRelCl">
      <secTitle>Propositions relatives </secTitle>
      <p contentType="ctComparativeIntro">
<xsl:text>Les propositions relatives qualifient normalement un nom principal et elles ont une de ces quatre structures: comme en anglais, pareil à une proposition complétive avec un complémentiseur signifiant </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>that</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « que »</xsl:text>
</gloss>
<xsl:text>, comme dans </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the man that came to the party late</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « l’homme qui est venu en retard à la soirée »</xsl:text>
</gloss>
<xsl:text>; comme en anglais, pareil à une question de contenu avec </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>who</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « qui »</xsl:text>
</gloss>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>which</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « quel »</xsl:text>
</gloss>
<xsl:text> au commencement, comme dans </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the man who came to the party late</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « l’homme qui est venu en retard à la soirée »</xsl:text>
</gloss>
<xsl:text>; comme en français, pareil à une proposition complétive mais ayant un marqueur relatif spécial dans la position du complémentiseur: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>qui</langData>
<xsl:text>pour les sujets et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>que</langData>
<xsl:text> pour les objets directs, comme dans </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>l’homme qui est dans le magasin</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>le livre que je veux lire</langData>
<xsl:text> (ou pour quelques langues peut-être avec deux marqueurs qui se trouvent des deux côtés de la proposition relative); (ou pour quelques langues autres que le françaiset l’anglais) comme une phrase normale avec un marqueur relatif attaché au verbe.</xsl:text>
</p>
      <p contentType="ctPracticalIntro">
<xsl:text>Les propositions relatives qualifient normalement un nom principal et elles ont une de ces quatre structures: comme une proposition complétive avec un complémentiseur; comme une question de contenu avec « qui » au commencement, comme une proposition complétive mais ayant un marqueur relatif spécial dans la position du complémentiseur, ou comme une phrase normale avec un marqueur relatif attaché au verbe.</xsl:text>
</p>
      <xsl:if test="normalize-space(//relcl/@exist)='no'">
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
<xsl:text> il n’y a aucun type de proposition relative.</xsl:text>
</p>
</xsl:if>
      <xsl:if test="normalize-space(//relcl/@exist)='yes'">
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
<xsl:text> les propositions relatives se trouvent </xsl:text>
<xsl:choose>
               <xsl:when test="//relcl/@clausePos='before'">avant le</xsl:when>
               <xsl:when test="//relcl/@clausePos='after'">après le</xsl:when>
               <xsl:when test="//relcl/@clausePos='either'">des deux côtés du</xsl:when>
               <xsl:when test="//relcl/@clausePos='unknown'"> _______ </xsl:when>
            </xsl:choose>
<xsl:text> nom principal comme montré dans les exemples suivants:</xsl:text>
</p>
</xsl:if>
      <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<example num="xRelCl.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//relcl/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//relcl/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//relcl/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//relcl/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xRelCl.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xRelCl.12.1</xsl:text>
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
      
      <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//comp/@comp)!='no' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='yes'"> <xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='no' and normalize-space(//relcl/relTypeIP/@checked)='no' and normalize-space(//relcl/relTypeOther/@checked)='no'">
<xsl:text>Les </xsl:text>
</xsl:if>
              <xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<xsl:text>Certaines des </xsl:text>
</xsl:if>
<xsl:text>propositions relatives en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
              <xsl:text> sont comme une proposition complétive qui utilise le complementiseur verbal normal.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relTypeCPRel/@checked)='yes'">
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='no' and normalize-space(//relcl/relTypeIP/@checked)='no' and normalize-space(//relcl/relTypeOther/@checked)='no'">
<xsl:text>Les </xsl:text>
</xsl:if>
            <xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes'">
<xsl:text>D’autres </xsl:text>
</xsl:if>
            <xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<xsl:text>Certaines </xsl:text>
</xsl:if>
<xsl:text>propositions relatives en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
            <xsl:text> sont comme une proposition complétive avec des marqueurs relatifs spéciaux.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relTypeCPWh/@checked)='yes'">
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='no' and normalize-space(//relcl/relTypeIP/@checked)='no' and normalize-space(//relcl/relTypeOther/@checked)='no'">
<xsl:text>Les </xsl:text>
</xsl:if>
            <xsl:if test="normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes'">
<xsl:text>D’autres </xsl:text>
</xsl:if>
            <xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<xsl:text>Certaines </xsl:text>
</xsl:if>
<xsl:text>relative clauses in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
            <xsl:text> sont comme une question de contenu avec un mot interrogatif.  </xsl:text>
<xsl:choose>
               <xsl:when test="//relcl/@whAndComp='no'">Il n’y a que le mot interrogatif initial qui se trouve dans ce type de proposition relative, il n’y a pas de marqueur relatif.</xsl:when>  
               <xsl:when test="//relcl/@whAndComp='yes'">Un marqueur relatif et le mot interrogatif initial sont tous deux requis dans ce type de proposition relative. </xsl:when>
               <xsl:when test="//relcl/@whAndComp='optional'">Un marqueur relatif peut se trouver facultativement avec le mot interrogatif initial dans ce type de proposition relative. </xsl:when>
            </xsl:choose>
</xsl:if>
<xsl:if test="normalize-space(//relcl/@relWord)='some'">
<xsl:text>Certaines </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/@relWord)!='some'">
<xsl:text>Les </xsl:text>
</xsl:if>
<xsl:text>marqueurs relatifs ou complémentiseurs </xsl:text>
<xsl:choose>
            <xsl:when test="//relcl/@relWord='yes'">sont écrits comme mots indépendants.  </xsl:when>
            <xsl:when test="//relcl/@relWord='some'">sont écrits comme mots indépendants mais certains s’attachent </xsl:when>
            <xsl:when test="//relcl/@relWord='no'">s’atttachent </xsl:when>
         </xsl:choose>
<xsl:choose>
            <xsl:when test="//relcl/@relCliticPos='before'">au début du premier mot dans la partie phrastique de la proposition relative comme proclitique. Ces clitiques sont:</xsl:when>
            <xsl:when test="//relcl/@relCliticPos='after'">à la fin du dernier mot dans la partie phrastique de la proposition relative comme enclitique. Ces clitiques sont:</xsl:when>
            <xsl:when test="//relcl/@relCliticPos='both'">des deux côtés pour entourer la partie phrastique de la proposition relative comme clitique . Ces clitiques sont:</xsl:when>
            <xsl:when test="//relcl/@relCliticPos='unknown'">à ________ dans la partie phrastique de la proposition relative comme clitique. Ces clitiques sont:</xsl:when>
         </xsl:choose>
</p>
</xsl:if>     
      <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//comp/@comp)!='no' and normalize-space(//relcl/@relWord)!='yes' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='yes' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/@whAndComp)!='no' and normalize-space(//relcl/@relWord)!='yes'">
<example num="xRelCl.16">
<table border="1">
            <tr>
               <th>Clitiques de marqueur relatif </th>
               <th>Glose</th>
            </tr>
            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//relcl/relCliticExample),'.','')" />
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
      <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//comp/@comp)!='no' and normalize-space(//relcl/@relWord)!='no' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/@whAndComp)!='no' and normalize-space(//relcl/@relWord)!='no'">
<p>
<xsl:text>Les marqueurs relatifs se trouvent </xsl:text>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='yes' and normalize-space(//relcl/relWordAfter/@checked)='no' and normalize-space(//relcl/relWordBoth/@checked)='no'">
<xsl:text>avant</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='no' and normalize-space(//relcl/relWordAfter/@checked)='yes' and normalize-space(//relcl/relWordBoth/@checked)='no'">
<xsl:text>après</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='no' and normalize-space(//relcl/relWordAfter/@checked)='no' and normalize-space(//relcl/relWordBoth/@checked)='yes'">
<xsl:text>des deux côtés de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='yes' and normalize-space(//relcl/relWordAfter/@checked)='yes' and normalize-space(//relcl/relWordBoth/@checked)='no'">
<xsl:text>d’un côté ou de l’autre de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='yes' and normalize-space(//relcl/relWordAfter/@checked)='no' and normalize-space(//relcl/relWordBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='no' and normalize-space(//relcl/relWordAfter/@checked)='yes' and normalize-space(//relcl/relWordBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='yes' and normalize-space(//relcl/relWordAfter/@checked)='yes' and normalize-space(//relcl/relWordBoth/@checked)='yes'">
<xsl:text>des deux après ou d’un côté ou de l’autre de</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordOther/@checked)='no'">
<xsl:text> la partie phrastique de la proposition relative.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='no' and normalize-space(//relcl/relWordAfter/@checked)='no' and normalize-space(//relcl/relWordBoth/@checked)='no' and normalize-space(//relcl/relWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//relcl/relWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='yes' and normalize-space(//relcl/relWordOther/@checked)='yes' or normalize-space(//relcl/relWordAfter/@checked)='yes' and normalize-space(//relcl/relWordOther/@checked)='yes' or normalize-space(//relcl/relWordBoth/@checked)='yes' and normalize-space(//relcl/relWordOther/@checked)='yes'">
<xsl:text> la partie phrastique de la proposition relative et peut aussi se trouver ___</xsl:text>
<xsl:value-of select="//relcl/relWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>Les marqueurs relatifs sont: </xsl:text>
</p>
</xsl:if>
      <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//comp/@comp)!='no' and normalize-space(//relcl/@relWord)!='no' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/@whAndComp)!='no' and normalize-space(//relcl/@relWord)!='no'">
<example num="xRelCl.20">
<table border="1">
               <tr>
                  <th>Marqueurs relatifs </th>
                  <th>Glose</th>
               </tr>
               <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//relcl/relWordExample),'.','')" />
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
         
      <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='no' and normalize-space(//relcl/relTypeOther/@checked)='no'">
<xsl:text>Les </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' or normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' or normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes'">
<xsl:text>D’autres </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<xsl:text>Certaines </xsl:text>
</xsl:if>
<xsl:text>des propositions relatives en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont comme une phrase normale avec un marqueur relatif spécial attaché au verbe.  L’affixe relative est:</xsl:text>
</p>
</xsl:if>
         <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes'">
<example num="xRelCl.24">
<table border="1">
               <tr>
                  <th>Affixe relatif</th>
                  <th>Glose</th>
               </tr>
               <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//relcl/relAffixExample),'.','')" />
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
         
      <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='no' and normalize-space(//relcl/relTypeIP/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='no'">
<xsl:text>Les </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes' or normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes' or normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes' or normalize-space(//relcl/relTypeIPRel/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes'">
<xsl:text>D’autres </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='no' and normalize-space(//relcl/relTypeIP/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<xsl:text>Certaines </xsl:text>
</xsl:if>
<xsl:text>des propositions relatives en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ) sont comme une phrase normale qui modifie le nom principal sans marquage spécial.  </xsl:text>
</p>
</xsl:if>
      
      <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='no' and normalize-space(//relcl/relTypeIP/@checked)='no' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<xsl:text>Les propositions relatives en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
            <xsl:text> sont formés en ___</xsl:text>
<xsl:value-of select="//relcl/relTypeOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes' or normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes' or normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes' or normalize-space(//relcl/relTypeIPRel/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes' or normalize-space(//relcl/relTypeIP/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<xsl:text>Il y a aussi des propositions relatives qui sont formées en ___</xsl:text>
<xsl:value-of select="//relcl/relTypeOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
</xsl:if>    
      
      <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text>Des exemples de phrases entières des propositions relatives ci-dessus incluent:</xsl:text>
</p>
</xsl:if>
      <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<example num="xRelCl.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//relcl/sentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//relcl/sentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//relcl/sentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//relcl/sentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xRelCl.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xRelCl.32.1</xsl:text>
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
      <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>Il y a des langues où une des structures mentionnées ci-dessus peut se trouver comme syntagme nominale sans nom principal à modifier, ce qui s’appelle d’habitude les propositions relatives « sans tête ». Par exemple, en anglais la phrase  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Julie brought [the food that we ate today]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « Jeanne a apporté [la nourriture que nous avons mangée aujourd’hui] »</xsl:text>
</gloss>
<xsl:text> a une pleine proposition relative dans la position de l’objet, alors que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Julie brought [what we ate today]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « Jeanne a apporté [ce que nous avons mangé aujourd’hui] »</xsl:text>
</gloss>
<xsl:text> a comme complément d’objet une proposition relative “sans tête”.</xsl:text>
</p>
</xsl:if>
      <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<p contentType="ctPracticalIntro">
<xsl:text>Dans les propositions relatives « sans tête » une proposition relative se trouve par elle-même comme syntagme nominal sans un nom principal pour le modifier.</xsl:text>
</p>
</xsl:if>
      
      <xsl:if test="normalize-space(//relcl/@exist)='yes'">
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
            <xsl:when test="//relcl/@headless='no'"> il est exigé qu’un nom principal soit présent dans toutes les propositions relatives; aucune proposition relative sans tête n’est donc pas permise.</xsl:when>
            <xsl:when test="//relcl/@headless='yes'"> il est permis que le nom principal manque dans les propositions relatives; les propositions relatives sans tête sont donc permises.</xsl:when>
         </xsl:choose>
<xsl:text> </xsl:text>
</p>
</xsl:if>
      <xsl:if test="normalize-space(//relcl/@headless)='yes' and normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text>Voici des exemples de propositions relatives dans des phrases completes:</xsl:text>
</p>
</xsl:if>
      <xsl:if test="normalize-space(//relcl/@headless)='yes' and normalize-space(//relcl/@exist)='yes'">
<example num="xRelCl.42">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//relcl/headlessExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//relcl/headlessExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//relcl/headlessExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//relcl/headlessExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xRelCl.42</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xRelCl.42.1</xsl:text>
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
   </section1>
   
   
   
    
        
    
    
        
    
   
      
   
   
      
   
   
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
   
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
   
      
      
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
   
   
   
   
      
      
      
      
   
      
      
      
         
   
         
         
         
         
         
         
         
         
         
         
         
       
      
         
         
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
    
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
     
   
      
      
      
      
      
      
      
      
      
      
      
    
   
      
         
         
         
         
         
         
         
         
         
         
         
       
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
   
        
        
        
    
</xsl:template>
</xsl:stylesheet>
