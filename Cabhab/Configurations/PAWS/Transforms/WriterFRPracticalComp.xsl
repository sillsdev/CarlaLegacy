<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="comp">
    <section1 id="sComp">
       <secTitle>Propositions complétives</secTitle>
        <p>
<xsl:text>Les différents types de propositions subordonnées qui sont les compléments des verbes principaux ou des adjectifs qui fonctionnent comme les prédicats dans les phrases seront présentés, après avoir traité les complétiviseurs et leur position dans les propositions déclaratives subordonnées.</xsl:text>
</p>
       
          <p contentType="ctComparativeIntro">
<xsl:text>L’anglais a deux complétiviseurs qui marquent les propositions déclaratives subordonnées: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>that</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « que »</xsl:text>
</gloss>
<xsl:text> pour les propositions finies et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>for</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « pour »</xsl:text>
</gloss>
<xsl:text> pour les propositions non finies. Dans d’autres langues les complétiviseurs pour les propositions déclaratives subordonnées peuvent être manifestes et dans certaines langues ce sont des clitiques qui sont écrits, attachés à un autre mot.</xsl:text>
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
<xsl:text> il </xsl:text>
<xsl:choose>
                <xsl:when test="//comp/@comp='no'">n’y a pas de complétiviseur ni de clitique ni d’affixe pour des propositions déclaratives dépentantes. Toutes les propositions subordonnées ont donc la même structure que des phrases normales.  <xsl:choose>
                   <xsl:when test="//ip/@auxNonfinite='yes'">Il y a toujours une distinction entre les propositions subordonnées finies et non-finies puisqu’il y a un auxilliaire non-fini. </xsl:when>
                   <xsl:when test="//ip/@auxNonfinite='no'">Il y a toujours une distinction entre des propositions subordonnées finies et non-finies puisqu’il y a un marqueur non-fini sur le verbe. </xsl:when>
                   <xsl:when test="//ip/@auxNonfinite='none'">Il n’y a pas non plus de distinction entre des propositions finies et non finies subordonnées puisqu’il n’y a pas de forme non finie dans la langue. </xsl:when>
                </xsl:choose>
</xsl:when>
                <xsl:when test="//comp/@comp='yes'">au moins un complétiviseur pour les propositions déclaratives subordonnées.  </xsl:when>
             </xsl:choose>
<xsl:if test="normalize-space(//comp/@comp)='yes'">
<xsl:text>Il </xsl:text>
             <xsl:choose>
                <xsl:when test="//comp/@compNonfinite='yes'">y a un complétiviseur distinct pour les propositions non-finies. </xsl:when>   
                <xsl:when test="//comp/@compNonfinite='no'">n’y a pas de complétiviseur distinct pour les propositions non-finies.  <xsl:choose>
                   <xsl:when test="//ip/@auxNonfinite='yes'">Il y a toujours une distinction entre des propositions subordonnées finies et non-finies puisqu’il y a un auxilliaire non-fini. </xsl:when>
                   <xsl:when test="//ip/@auxNonfinite='no'">Il y a toujours une distinction entre les propositions subordonnées finies et non-finies puisqu’il y a un marqueur non-fini sur le verbe. </xsl:when>
                   <xsl:when test="//ip/@auxNonfinite='none'">Il n’y a pas non plus de distinction entre des propositions finies et non finies subordonnées puisqu’il n’y a pas de forme non finie dans la langue. </xsl:when>
                </xsl:choose>
</xsl:when>
          </xsl:choose>
             <xsl:if test="normalize-space(//comp/@compWord)='some' and normalize-space(//comp/@comp)='yes'">
<xsl:text> Certains</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/@compWord)!='some' and normalize-space(//comp/@comp)='yes'">
<xsl:text> Les</xsl:text>
</xsl:if>
<xsl:text> complétiviseurs </xsl:text>
                <xsl:choose>
                   <xsl:when test="//comp/@compWord='yes'">sont écrits comme mot indépendant. </xsl:when>
                   <xsl:when test="//comp/@compWord='some'">sont écrits comme mot indépendant, mais quelques-uns s’attachent </xsl:when>
                   <xsl:when test="//comp/@compWord='no'">s’attachent </xsl:when>
                </xsl:choose>
                <xsl:text></xsl:text>
                <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/@comp)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/@comp)='yes'">
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='no'">
<xsl:text>au début du mots qui commence la proposition complétive comme proclitique.  </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='no'">
<xsl:text>à la fin d’un mot qui termine la proposition complétive comme enclitique.    </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='no'">
<xsl:text>ou au début du mots qui commence la proposition complétive ou à la fin d’un mot qui termine la proposition complétive comme clitique.   </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='no'">
<xsl:text> au verbe dans la proposition complétive comme un préfixe.  </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='yes'">
<xsl:text> au verbe dans la proposition complétive comme un suffixe.   </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes'">
<xsl:text>au verbe dans la proposition complétive,  certains comme préfixe et d’autres comme suffixe.   </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='no' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='no' or normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='no' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes'">
<xsl:text>ou  au début ou à la fin de la proposition complétive comme clitique, ou au verbe dans la proposition complétive comme affixe.  </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='no' and normalize-space(//comp/compAttachesOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//comp/attachesOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compAttachesOther/@checked)='yes' or normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compAttachesOther/@checked)='yes' or normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compAttachesOther/@checked)='yes' or normalize-space(//comp/compSuffix/@checked)='yes' and normalize-space(//comp/compAttachesOther/@checked)='yes'">
<xsl:text>  Certains aussi s’attachent ___</xsl:text>
<xsl:value-of select="//comp/attachesOther" />  <xsl:text>.</xsl:text>
</xsl:if>              
                </xsl:if>  </xsl:if>
</p>   
       
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compProclitic/@checked)='yes' or normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compProclitic/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compEnclitic/@checked)='yes'">
<p>
<xsl:text>Ces clitiques de complétiviseur sont:</xsl:text>
</p>
</xsl:if>   
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compProclitic/@checked)='yes' or normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compProclitic/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compEnclitic/@checked)='yes'">
<example num="xComp.12">
<table border="1">
             <tr>
                <th>Clitiqies de complétiviseur</th>
                <th>Glose</th>
             </tr>
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//comp/cliticExample),'.','')" />
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
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compPrefix/@checked)='yes' or normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compPrefix/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compSuffix/@checked)='yes'">
<p>
<xsl:text>Ces affixes de complétiviseur sont:</xsl:text>
</p>
</xsl:if>   
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compPrefix/@checked)='yes' or normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compPrefix/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compSuffix/@checked)='yes'">
<example num="xComp.16">
<table border="1">
             <tr>
                <th>Affixes de complétiviseur</th>
                <th>Glose</th>
             </tr>
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//comp/affixExample),'.','')" />
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
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compAttachesOther/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compAttachesOther/@checked)='yes'">
<p>
<xsl:text>Les autres complétiviseurs qui s’attachent comme permis en </xsl:text>
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
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compAttachesOther/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compAttachesOther/@checked)='yes'">
<example num="xComp.20">
<table border="1">
             <tr>
                <th>Autres complétiviseurs qui s’attachent</th>
                <th>Glose</th>
             </tr>
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//comp/attachesOtherExample),'.','')" />
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
       
       <xsl:if test="normalize-space(//comp/@compWord)='yes' and normalize-space(//comp/@comp)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/@comp)='yes'">
<p>
<xsl:text> Les complétiviseurs qui sont des mots indépendants se trouvent </xsl:text>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compAfter/@checked)='no' and normalize-space(//comp/compBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='no' and normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='no' and normalize-space(//comp/compAfter/@checked)='no' and normalize-space(//comp/compBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compBoth/@checked)='no'">
<xsl:text>de chaque côté du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compAfter/@checked)='no' and normalize-space(//comp/compBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='no' and normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compBoth/@checked)='yes'">
<xsl:text>de chaque côté ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compOther/@checked)='no'">
<xsl:text> reste de la proposition complétive. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='no' and normalize-space(//comp/compAfter/@checked)='no' and normalize-space(//comp/compBoth/@checked)='no' and normalize-space(//comp/compOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//comp/compOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compOther/@checked)='yes' or normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compOther/@checked)='yes' or normalize-space(//comp/compBoth/@checked)='yes' and normalize-space(//comp/compOther/@checked)='yes'">
<xsl:text> reste de la proposition complétive et peuvent aussi se trouver ___</xsl:text> <xsl:value-of select="//comp/compOther" /> <xsl:text>. </xsl:text>
</xsl:if>
<xsl:text> Ces complétiviseurs sont:</xsl:text>
</p>
</xsl:if>          
       <xsl:if test="normalize-space(//comp/@compWord)='yes' and normalize-space(//comp/@comp)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/@comp)='yes'">
<example num="xComp.24">
<table border="1">
             <tr>
                <th>Complétiviseurs</th>
                <th>Glose</th>
             </tr>
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//comp/compExample),'.','')" />
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
<xsl:text>Voir la section </xsl:text>
<sectionRef sec="sQues" />
<xsl:text> pour un discussion similaire sur les complétiviseurs pour des questions et la section </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text> pour des propositions relatives.</xsl:text>
</p>
       <p>
<xsl:text>Chacune des sous-sections suivantes typifie un type particulier de complément pour un verbe ou autre prédicat. Voir la section </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text> pour des exemples de propositions adverbiales. Certains adverbes peuvent aussi prendre des compléments prépositionnels semblables à ceux-ci, mais les propositions adverbiales ne sont pas des compléments du verbe principal.  </xsl:text>
<object type="tComment">Vous devrez peut-être enlever certaines parties du texte et combiner des exemples si votre langue ne fait pas les mêmes distinctions.</object>
</p>
       <xsl:if test="normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compNonfinite)='yes' or normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compNonfinite)='no' and normalize-space(//ip/@auxNonfinite)!='none'">
<section2 id="sCompTypeFiniteAndNonfiniteCP">
          <secTitle>Propositions complétives finis et non-finis</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>Verbes qui prennent seulement une proposition complétive finie, avec ou sans complétiviseur, comprennent les exemples suivants en anglais et en français: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I believe (that) Jill is my friend</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je crois que Jeanne est mon amie »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jill insists (that) she is my friend</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jeanne insiste qu’elle est mon amie »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I know (that) he likes me</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je sais qu’il m’aime »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Certains verbes ont seulement une proposition complétive finie avec ou sans complétiviseur. Des exemples de ce type en </xsl:text>
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
                <example num="xComp.CompTypeFiniteAndNonfiniteCP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteCP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteCP.8.1</xsl:text>
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
                <p contentType="ctComparativeIntro">
<xsl:text>Des verbes qui prennent ou un complément fini, avec ou sans un  complétiviseur, ou un complément non-fini sans un  complétiviseur comprennent les exemples suivants: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect that Joe will come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je m’attends que Jacques va venir à la soirée »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je m’attends à Jacques à venir à la soirée »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Certains verbes peuvent avoir ou un complément fini, avec ou sans un complétiviseur ou un complément non-fini sans complétiseur. Des exemples de ce type en </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteCP.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteCP.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteCP.14.1</xsl:text>
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
                <p contentType="ctComparativeIntro">
<xsl:text>Certains verbes qui ne prennent qu’un  complément non-fini sans un complétiviseur et permettent soit un sujet différent que la proposition principale ou un sujet nul lorsque cela se réfère au sujet de la proposition principale. Voici des exemples: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je veux venir à la soirée »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je veux que Jacques vienne à la soirée »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Certains verbes ont seulement un complément non-fini sans un complétiviseur et permettent soit un différent sujet que la proposition principale soit un sujet nul lorsque cela se réfère au sujet de la proposition principale. Des exemples de ce type en </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteCP.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteCP.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteCP.20.1</xsl:text>
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
                <p contentType="ctComparativeIntro">
<xsl:text>Des verbes qui prennent seulement un  complément non-fini sans un complétiviseur, mais exigent que le sujet se réfère au sujet de la proposition principale comprennent les exemples suivants: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe tried to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jacques a essayé de venir à la soirée »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I tried to think of more examples</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « J’ai essayé de penser à d’autres exemples »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Certains verbes ont seulement un complément non-fini sans un complétiviseur mais exigent que le sujet se réfère au sujet de la proposition principale et nul.  Des exemples de ce type en </xsl:text>
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
                <example num="xComp.CompTypeFiniteAndNonfiniteCP.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteCP.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteCP.26.1</xsl:text>
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
                <p contentType="ctComparativeIntro">
<xsl:text>Des verbes qui prennent seulement un complément non-fini, mais le complétiviseur en anglais </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>for</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « pour »</xsl:text>
</gloss>
<xsl:text> est présent quand le sujet dépendant ne se réfère pas au sujet de la proposition principale comprennent les exemples suivants: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe would hate for Sue to be at the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jacques n’aimerait pas que Suzanne soit à la soirée »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe hates to dance</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jacques déteste danser »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be appreciated</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je voudrais être apprécié »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Certains verbes ont seulement un complément non-fini, mais le complétiviseur est présent lorsque le sujet dépendant ne se réfère pas au sujet de la proposition principale.  Des exemples de ce type en </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteCP.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteCP.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteCP.32.1</xsl:text>
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
                <p contentType="ctComparativeIntro">
<xsl:text>Des verbes qui prennent un object direct de même qu’ou bien une proposition complétive finie ou non-finie comprennent les exemples suivants: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe that he should come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je vais persuader Jacques qu’il devrait venir à la soirée »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je vais persuader Jacques de venir à la soirée »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>D’autres verbes ont un objet direct de même qu’une proposition complétive finie et non-finie.   Des exemples de ce type en </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteCP.38">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/DPCPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/DPCPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteCP.38</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteCP.38.1</xsl:text>
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
</xsl:if>
           
       <xsl:if test="normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compNonfinite)='no' and normalize-space(//ip/@auxNonfinite)='none'">
<section2 id="sCompTypeFiniteCP">
          <secTitle>Propositions comme compléments</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Les verbes qui prennent une proposition complétive, avec ou sans complétiviseur incluent les exemples suivants en anglais et français: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I believe (that) Jill is my friend</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je crois que Jeanne est mon amie »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jill insists (that) she is my friend</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jeanne insiste qu’elle est mon amie »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I know (that) he likes me</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je sais qu’il m’aime »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect that Joe will come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je m’attends que Jacques va venir à la soirée »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je m’attends à Jacques à venir à la soirée »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je veux aller à la soirée »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je veux que Jacques vienne à la soirée »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe tried to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jacques a essayé de venir à la soirée »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe would hate for Sue to be at the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jacques n’aimerait pas que Suzanne soit à la soirée »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe hates to dance</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jacques déteste danser »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be appreciated</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « J’aimerais être apprécié »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Certains verbes ont seulement une proposition complétive avec ou sans complétiviseur Des exemples de ce type en </xsl:text>
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
          <example num="xComp.CompTypeFiniteCP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteCP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteCP.8.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteCP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteCP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteCP.10.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteCP.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteCP.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteCP.12.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteCP.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteCP.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteCP.14.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteCP.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteCP.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteCP.16.1</xsl:text>
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
          <p contentType="ctComparativeIntro">
<xsl:text>Des verbes qui prennent un objet direct aussi bien qu’une proposition complétive incluent les exemples suivants: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe that he should come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je vais persuader Jacques qu’il devrait venir à la soirée »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je vais persuader Jacques de venir à la soirée »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>D’autres verbes ont un objet direct de même qu’une proposition complétive finie ou non-finie.  Des exemples de ce type en </xsl:text>
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
          <example num="xComp.CompTypeFiniteCP.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/DPCPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/DPCPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteCP.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteCP.22.1</xsl:text>
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
</xsl:if>
       
       <xsl:if test="normalize-space(//comp/@comp)='no' and normalize-space(//ip/@auxNonfinite)!='none'">
<section2 id="sCompTypeFiniteAndNonfiniteIP">
          <secTitle>Compléments phrastiques finis et non-finis</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Des verbes qui prennent seulement un complément phrastique fini incluent les exemples suivants: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I believe Jill is my friend</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je crois que Jeanne est mon amie »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jill insists she is my friend</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jeanne insiste qu’elle est mon amie »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I know he likes me</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je sais qu’il m’aime »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Certains verbes ont seulement un complément phrastique fini. Des exemples de ce type en </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteIP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteIP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteIP.8.1</xsl:text>
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
          <p contentType="ctComparativeIntro">
<xsl:text>Des verbes qui prennent soit un complément phrastique fini ou non-fini incluent les exemples suivants: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe will come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je m’attends que Jacques va venir à la soirée »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je m’attends à Jacques à venir à la soirée »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Certains verbes peuvent avoir un complément phrastique fini ou non-fini.  Des exemples de ce type en </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteIP.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteIP.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteIP.14.1</xsl:text>
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
          <p contentType="ctComparativeIntro">
<xsl:text>Certains verbes qui prennent seulement un complément phrastique non-fini permettent soit un sujet différent que la proposition principale soit un sujet nul lorsqu’il se réfère au sujet de la proposition principale. Des exemples comprennent: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je veux aller à la soirée »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je veux que Jacques vienne à la soirée »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Certains verbes ont seulement un complément phrastique non-fini et permettent soit un sujet différent que la proposition principale soit un sujet nul lorsqu’il se réfère au sujet de la proposition principale.  Des exemples de ce type en </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteIP.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteIP.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteIP.20.1</xsl:text>
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
          <p contentType="ctComparativeIntro">
<xsl:text>Des verbes qui prennent seulement un complément phrastique non-fini mais exigent que le sujet se réfère au sujet de la proposition principale et nul comprennent les exemples suivants : </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe tried to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jacques a essayé de venir à la soirée »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe hates to dance</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jacques déteste danser »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be appreciated</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « J’aimerais être apprécié »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>D’autres verbes ont seulement un complément phrastique non-fini  mais exigent que le sujet se réfère au sujet de la proposition principale et nul.  Des exemples de ce type en </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteIP.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteIP.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteIP.26.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteIP.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteIP.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteIP.28.1</xsl:text>
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
          <p contentType="ctComparativeIntro">
<xsl:text>Des verbes qui prennent un objet direct aussi bien qu’un complément phrastique fini ou non-fini incluent les exemples  suivants: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe he should come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je vais persuader Jacques qu’il devrait venir à la soirée »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je vais persuader Jacques de venir à la soirée »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>D’autres verbes ont un objet direct de même qu’un complément phrastique fini ou non-fini.  Des exemples de ce type en </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteIP.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/DPCPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/DPCPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteIP.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteIP.34.1</xsl:text>
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
</xsl:if>
       
       <xsl:if test="normalize-space(//comp/@comp)='no' and normalize-space(//ip/@auxNonfinite)='none'">
<section2 id="sCompTypeFiniteIP">
          <secTitle>Compléments phrastiques</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Certains verbes qui prennent un complément phrastique incluent les exemples suivants en anglais et français: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I believe Jill is my friend</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je crois que Jeanne est mon amie »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jill insists she is my friend</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jeanne insiste qu’elle est mon amie »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I know he likes me</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je sais qu’il m’aime »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe will come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je m’attends que Jacques va venir à la soirée »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je m’attends à Jacques à venir à la soirée »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je veux aller à la soirée »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je veux que Jacques vienne à la soirée »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe tried to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jacques a essayé de venir à la soirée »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe hates to dance</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jacques déteste danser »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be appreciated</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « J’aimerais être apprécié »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Certains verbes ont seulement un complément phrastique. Des exemples de ce type en </xsl:text>
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
          <example num="xComp.CompTypeFiniteIP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteIP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteIP.8.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteIP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteIP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteIP.10.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteIP.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteIP.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteIP.12.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteIP.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteIP.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteIP.14.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteIP.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteIP.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteIP.16.1</xsl:text>
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
          <p contentType="ctComparativeIntro">
<xsl:text>Des verbes qui prennent un objet direct de même qu’un complément phrastique incluent les exemples suivants: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe he should come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je vais persuader Jacques qu’il devrait venir à la soirée »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Je vais persuader Jacques de venir à la soirée »</xsl:text>
</gloss>
<xsl:text>.  Des exemples de ce type en </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>D’autres verbes ont un objet direct de même qu’une complément phrastique.  Des exemples de ce type en </xsl:text>
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
          <example num="xComp.CompTypeFiniteIP.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/DPCPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/DPCPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteIP.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteIP.22.1</xsl:text>
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
</xsl:if>
       
       <section2 id="sCompRaising">
          <secTitle>Constructions « de montée »</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Les verbes « de montée » semblent inclure tous les verbes de perception et verbes copulatifs. Ces verbes ont soit un complément non-fini ou un complément adjectival qui lui-même a soit un complément fini avec un complétiviseur ou un complément non-fini. Le verbe principal n’a pas son propre sujet, alors la position du sujet est remplie par le sujet du complément non-fini comme dans: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John seemed to like the tortillas</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jean semblait aimer les tortillas »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe is likely to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jacques est probable de venir à la soirée »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The weather is certain to change soon</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Le temps est certain à changer bientôt »</xsl:text>
</gloss>
<xsl:text>.  Lorsque la proposition complétive est finie, le sujet ne peut pas être « monté », ainsi un pronom sans caractéristique </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>it</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « il »</xsl:text>
</gloss>
<xsl:text> remplit la position du sujet de la proposition principale en anglais et français comme dans: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>It seems likely that Joe will come</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Il semble probable que Jacques viendra »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>It is certain that the weather will change soon</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Il est certain que le temps va changer bientôt »</xsl:text>
</gloss>
<xsl:text>.  Certaines langues ont simplement le verbe sans un sujet, suivi d’une proposition complétive, alors aucune « montée » ne se passe: les deux propositions partagent simplement le même sujet. </xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Les verbes « de montée » semblent inclure tous les verbes de perception et verbes copulatifs. Le verbe principal n’a pas son propre sujet, ainsi la position du sujet est remplie par le sujet du complément non-fini ou par un pronom sans caractéristique.   Certaines langues ont simplement le verbe sans un sujet, suivi d’une proposition complétive, alors aucune « montée » ne se passe: les deux propositions partagent simplement le même sujet. </xsl:text>
</p>
              <p>
<xsl:text>Des exemples de ce type en </xsl:text>
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
              <example num="xComp.CompRaising.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/raisingExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/raisingExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/raisingExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/raisingExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompRaising.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompRaising.10.1</xsl:text>
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
           
           <section2 id="sCompCausative">
              <secTitle>Compléments causatifs</secTitle>
              <p contentType="ctComparativeIntro">
<xsl:text>Les causatif syntactiques  sont faits de deux propositions et ont un objet qui agit comme le sujet de la proposition complétive. Cette proposition complétive est toujours non-finie mais n’a pas besoin du marqueur non-fini avec certains verbes en anglais et français comme dans: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My mother made me clean my room</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Ma mère m’a fait nettoyer ma chambre »</xsl:text>
</gloss>
<xsl:text>, alors que cela est demandé dans d’autres comme dans: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The other girl forced us to leave the group</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « L’autre fille nous a forcé de quitter le groupe »</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
              
              <p contentType="ctPracticalIntro">
<xsl:text>Les causatifs syntactiques  sont faits de deux propositions et ont un objet qui agit comme le sujet de la proposition complétive. </xsl:text>
</p>
              <xsl:if test="normalize-space(//ip/causativeMake/@checked)='no'">
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
<xsl:text> il n’y a pas de causatifs syntactiques.</xsl:text>
</p>
</xsl:if>
                 <xsl:if test="normalize-space(//ip/causativeMake/@checked)='yes'">
<p>
<xsl:text>Des exemples de ce type en </xsl:text>
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
              <example num="xComp.CompCausative.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/causeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/causeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/causeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/causeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompCausative.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompCausative.12.1</xsl:text>
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
              <xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes'">
<p>
<xsl:text>Voir section </xsl:text>
<sectionRef sec="sIPCausatives" />
<xsl:text> pour des exemples de casuatifs dans des propositions uniques, dans laquelle le verbe est marqué avec un affixe qui introduit un argument supplémentaire.</xsl:text>
</p>
</xsl:if>
           </section2>
      
           <section2 id="sCompSpeech">
              <secTitle>Citations direct et indirect comme compléments</secTitle>
              
              <p contentType="ctComparativeIntro">
<xsl:text>Les verbes de parole peuvent avoir des compléments de citations direct ou indirect. Les citations directes peuvent être juste une phrase ou une interjection ou une salutation comme:  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue said, “I will come to your house tomorrow”</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Suzannee a dit: « Je viendrai demain chez toi » »</xsl:text>
</gloss>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe said, “Bye!”</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jacques a dit: « Au revoir! » »</xsl:text>
</gloss>
</p>
              <p contentType="ctComparativeIntro">
<xsl:text>Les citations indirectes comme compléments sont plus limitées. En anglais certains verbes d’expression prennent un complément de phrase finie avec ou sans complétiviseur, et une phrase prépositionnelle facultative pour exprimer celui qui écoute comme dans:  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue said (to me) that she would come here tomorrow</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Suzanne (m’)a dit qu’elle viendrait ici demain »</xsl:text>
</gloss>
<xsl:text>.  Others require the hearer to be expressed as an object plus either a finite sentential complement, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue told me that she would come here tomorrow</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Suzanne m’a dit qu’elle viendrait ici demain »</xsl:text>
</gloss>
<xsl:text>, or a nonfinite sentential complement in which the subject must be coreferent with the main clause subject and dropped, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue told me to come here tomorrow</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Suzanne m’a dit de venir ici demain »</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
              <p contentType="ctPracticalIntro">
<xsl:text>Les verbes de parole peuvent avoir des compléments de citations direct ou indirect. Les citations directes peuvent être seulement une phrase ou une interjection ou une salutation, mais les citations indirectes sont plus limitées et dépendent du verbe principal.</xsl:text>
</p>
              <p>
<xsl:text>Des exemples de compléments de verbes de parole en </xsl:text>
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
              <example num="xComp.CompSpeech.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/quotationExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/quotationExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/quotationExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/quotationExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompSpeech.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompSpeech.12.1</xsl:text>
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
           
            <xsl:if test="normalize-space(//comp/@compTypeOther)='yes'">
<section2 id="sCompTypeOther">
               <secTitle>Autres limitations sur des propositions complétives</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>Certaines langues ont aussi des verbes qui ont d’autres limitations sur les propositions subordonnées comme quand le verbe dépendant doit être au subjonctif ou à l’aspect perfectif. </xsl:text>
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
<xsl:text>  il y a aussi la limitation avec certains verbes que __</xsl:text>
<xsl:value-of select="//comp/otherRestrictions" />
<xsl:text>.  Des exemples sont montrés ici:</xsl:text>
</p>
                <example num="xComp.CompTypeOther.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/otherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/otherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/otherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/otherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeOther.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeOther.8.1</xsl:text>
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
</xsl:if>

    </section1>
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
        
    
    
        
        
        
    
    
        
        
        
    
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
      
      
   
   
      
   
   
      
   
</xsl:template>
</xsl:stylesheet>
