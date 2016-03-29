<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="comp">
    <section1 id="sComp">
        <secTitle>Las cláusulas de complemento</secTitle>
       <p>
<xsl:text>Hay varios tipos de cláusulas subordinadas que son complementos de verbos principales o de adjetivos que funcionan igual que el predicado de la oración. 
             Algunos ejemplos de cada tipo de complemento se presentan en las secciones siguientes, después de un análisis de los complementadores y su posición en cláusulas subordinadas declarativas.</xsl:text>
</p>
       
       <p contentType="ctComparativeIntro">
<xsl:text>En inglés hay dos complementadores que marcan cláusulas subordinadas declarativas, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>that</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘que’</xsl:text>
</gloss>
<xsl:text>  para las cláusulas finitas y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>for</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘para’</xsl:text>
</gloss>
<xsl:text> para las cláusulas no finitas. El español utiliza </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>que</langData>
<xsl:text> como el complementador en ambos tipos de cláusulas subordinadas declarativas.  
             En otras lenguas los complementadores para las cláusulas declarativas subordinadas pueden o no pueden ser explícitos, y en algunas lenguas son clíticos que se escriben unidos con otra palabra.</xsl:text>
</p>
       <p>
<xsl:text>En el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
             <xsl:when test="//comp/@comp='no'">no hay ninguna palabra del complementador ni un clítico para las cláusulas subordinadas declarativas. Por lo tanto, todas las cláusulas subordinadas tienen la misma estructura que las oraciones regulares.  <xsl:choose>
                <xsl:when test="//ip/@auxNonfinite='yes'">Todavía hay una distinción entre cláusulas subordinadas finitas y no infinitas, puesto que hay un auxiliar de no finito. </xsl:when>
                <xsl:when test="//ip/@auxNonfinite='no'">Todavía hay una distinción entre cláusulas subordinadas finitas y no finitas, puesto que hay un marcador de no finito en el verbo.  </xsl:when>
                <xsl:when test="//ip/@auxNonfinite='none'">Tampoca hay distinción entre cláusulas subordinadas finitas y no finitas, puesto que no hay ninguna forma de no finita en la lengua.  </xsl:when>
             </xsl:choose>
</xsl:when>
             <xsl:when test="//comp/@comp='yes'">hay por lo menos un complementador para las cláusulas subordinadas declarativas.  </xsl:when>
          </xsl:choose>
<xsl:if test="normalize-space(//comp/@comp)='yes'">
<xsl:text></xsl:text>
             <xsl:choose>
                <xsl:when test="//comp/@compNonfinite='yes'">Hay un complementador distinta para las cláusulas subordinadas no finitas. </xsl:when>   
                <xsl:when test="//comp/@compNonfinite='no'">No hay un complementador distinto para las cláusulas subordinadas no finitas.  <xsl:choose>
                   <xsl:when test="//ip/@auxNonfinite='yes'">Todavía hay una distinción entre cláusulas subordinadas finitas y no finitas, puesto que hay un auxiliar de no finito. </xsl:when>
                   <xsl:when test="//ip/@auxNonfinite='no'">Todavía hay una distinción entre cláusulas subordinadas finitas y no finitas, puesto que hay un marcador de no finito en el verbo.  </xsl:when>
                   <xsl:when test="//ip/@auxNonfinite='none'">Tampoca hay distinción entre cláusulas subordinadas finitas y no finitas, puesto que no hay ninguna forma de no finita en la lengua.  </xsl:when>
                </xsl:choose>
</xsl:when>
             </xsl:choose>
             <xsl:if test="normalize-space(//comp/@compWord)='some' and normalize-space(//comp/@comp)='yes'">
<xsl:text> Algunos de los</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/@compWord)!='some' and normalize-space(//comp/@comp)='yes'">
<xsl:text> Los</xsl:text>
</xsl:if>
<xsl:text> complementadores </xsl:text>
             <xsl:choose>
                <xsl:when test="//comp/@compWord='yes'">se escriben como palabras independientes. </xsl:when>
                <xsl:when test="//comp/@compWord='some'">se escriben como palabras independientes, pero otros se unen, </xsl:when>
                <xsl:when test="//comp/@compWord='no'">se unen, </xsl:when>
             </xsl:choose>
             <xsl:text></xsl:text>
             <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/@comp)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/@comp)='yes'">
                <xsl:if test="normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='no'">
<xsl:text>como proclíticos, al principio de la palabra inicial en la cláusula de complemento.  </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='no'">
<xsl:text>como enclíticos, al final de la última palabra en la cláusula de complemento.  </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='no'">
<xsl:text>como clíticos, al principio de la palabra inicial en la cláusula de complemento o al final de la última palabra en la cláusula de complemento.  </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='no'">
<xsl:text>como prefijos, al verbo en la cláusula de complemento.  </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='yes'">
<xsl:text>como sufijos, al verbo en la cláusula de complemento.   </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes'">
<xsl:text>como afijos, al verbo en la cláusula de complemento.  </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='no' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='no' or normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='no' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes'">
<xsl:text>como clíticos, al principio o final de la cláusula de complemento, o al verbo en la cláusula de complemento como afijos.  </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='no' and normalize-space(//comp/compAttachesOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//comp/attachesOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compAttachesOther/@checked)='yes' or normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compAttachesOther/@checked)='yes' or normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compAttachesOther/@checked)='yes' or normalize-space(//comp/compSuffix/@checked)='yes' and normalize-space(//comp/compAttachesOther/@checked)='yes'">
<xsl:text>  Otros se unen ___</xsl:text>
<xsl:value-of select="//comp/attachesOther" />  <xsl:text>.</xsl:text>
</xsl:if>              
             </xsl:if>  </xsl:if>
</p>   
       
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compProclitic/@checked)='yes' or normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compProclitic/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compEnclitic/@checked)='yes'">
<p>
<xsl:text>Estos clíticos complementadores son:</xsl:text>
</p>
</xsl:if>   
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compProclitic/@checked)='yes' or normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compProclitic/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compEnclitic/@checked)='yes'">
<example num="xComp.12">
<table border="1">
             <tr>
                <th>Clíticos complementadores </th>
                <th>Glosa</th>
             </tr>
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//comp/compCliticExample),'.','')" />
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
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>Estos afijos complementadores son:</xsl:text>
</p>
</xsl:if>   
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compPrefix/@checked)='yes' or normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compPrefix/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compSuffix/@checked)='yes'">
<example num="xComp.16">
<table border="1">
             <tr>
                <th>Afijos complementadores</th>
                <th>Glosa</th>
             </tr>
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//comp/compAffixExample),'.','')" />
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
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>Los otros complementadores que se unen como se permiten en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
</xsl:if>   
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compAttachesOther/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compAttachesOther/@checked)='yes'">
<example num="xComp.20">
<table border="1">
             <tr>
                <th>Otros complementadores que se unen</th>
                <th>Glosa</th>
             </tr>
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//comp/compAttachesOtherExample),'.','')" />
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
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text> Los complementadores que son palabras independientes se presentan </xsl:text>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compAfter/@checked)='no' and normalize-space(//comp/compBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='no' and normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='no' and normalize-space(//comp/compAfter/@checked)='no' and normalize-space(//comp/compBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compAfter/@checked)='no' and normalize-space(//comp/compBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='no' and normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compOther/@checked)='no'">
<xsl:text> del resto de la cláusula de complemento. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='no' and normalize-space(//comp/compAfter/@checked)='no' and normalize-space(//comp/compBoth/@checked)='no' and normalize-space(//comp/compOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//comp/compOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compOther/@checked)='yes' or normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compOther/@checked)='yes' or normalize-space(//comp/compBoth/@checked)='yes' and normalize-space(//comp/compOther/@checked)='yes'">
<xsl:text> del resto de la cláusula de complemento y también pueden presentarse ___</xsl:text> <xsl:value-of select="//comp/compOther" /> <xsl:text>. </xsl:text>
</xsl:if>
<xsl:text> Estos complementadores son:</xsl:text>
</p>
</xsl:if>          
       <xsl:if test="normalize-space(//comp/@compWord)='yes' and normalize-space(//comp/@comp)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/@comp)='yes'">
<example num="xComp.24">
<table border="1">
                <tr>
                   <th>Complementadores</th>
                   <th>Glosa</th>
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
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
             </table>
</example>
</xsl:if>     
       
       
       <p>
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sQues" />
<xsl:text> para un análisis semejante sobre complementadores de preguntas y la sección </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text> para las cláusulas relativas.</xsl:text>
</p>
       <p>
<xsl:text>Cada una de las subsecciones siguientes ejemplifica un tipo específico de complemento para un verbo u otro predicado.  Véase la sección </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text> para ejemplos de cláusulas adverbiales. Algunos adverbios también pueden tener complementos similares a los que presentan aquí para verbos, aunque las cláusulas adverbiales no son complementos del verbo principal. </xsl:text>
<object type="tComment">Si es necesario, se puede eliminar algo de la prosa y combinar ejemplos si su lengua no tiene las mismas o todas las distinciones.</object>
</p>
       <xsl:if test="normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compNonfinite)='yes' or normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compNonfinite)='no' and normalize-space(//ip/@auxNonfinite)!='none'">
<section2 id="sCompTypeFiniteAndNonfiniteCP">
          <secTitle>Cláusulas de complemento finitas y no finitas</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Algunos ejemplos de los verbos que solamente pueden tener un complemento finito en español son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Creo que Juliana es mi amiga</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juliana insisto que ella sea mi amiga</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Yo sé que le gusto a él</langData>
<xsl:text>.  Observe que en estos mismos ejemplos en inglés, el complementador es opcional. Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Algunos verbos solamente pueden tener un complemento finito, con o sin un complementador.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos ejemplos de los verbos que pueden tener un complemento finito, con o sin un complementador, o un complemento no finito sin un complementador en inglés son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect that Joe will come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Cuento con que José venga a la fiesta’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Espero que José venga a la fiesta’</xsl:text>
</gloss>
<xsl:text>.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Algunos verbos pueden tener un complemento finito, con o sin un complementador, o un complemento no finito sin un complementador.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos verbos que solamente pueden tener un complemento no finito sin un complementador permiten un sujeto diverso que la cláusula principal o un sujeto no expresado cuando es coreferente con el sujeto de la cláusula principal. Algunos ejemplos en inglés son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Quisiera que José viniera a la fiesta’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Quiero que venir a la fiesta’</xsl:text>
</gloss>
<xsl:text>.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Algunos verbos que solamente pueden tener un complemento no finito sin un complementador permiten un diverso sujeto que la cláusula principal o un sujeto tácito cuando es coreferente con el sujeto de la cláusula principal.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos ejemplos en inglés de los verbos que solamente pueden tener un complemento no finito sin un complementador, pero requieren un sujeto tácito porque es coreferente con el sujeto de la cláusula principal son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe tried to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘José intentó venir a la fiesta’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I tried to think of more examples</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Intenté pensar en más ejemplos’</xsl:text>
</gloss>
<xsl:text>.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Algunos verbos solamente pueden tener un complemento no finito sin un complemenzador, pero requieren un sujeto tácito porque es coreferente con el sujeto de la cláusula principal.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos ejemplos en inglés de los verbos que solamente pueden tener un complemento no finitio, pero el complementador </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>for</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘para’</xsl:text>
</gloss>
<xsl:text> es presente cuando el sujeto no es coreferente con el sujeto de la cláusula principal son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe would hate for Sue to be at the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘José odiaría que Susana esté en la fiesta’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe hates to dance</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘José odia a bailar’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be appreciated</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Quisiera ser apreciado’</xsl:text>
</gloss>
<xsl:text>.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Algunos verbos solamente pueden tener un complemento no finito, pero el complementador es presente cuando el sujeto no es coreferente con el sujeto de la cláusula principal.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos ejemplos en inglés de los verbos que pueden tener un objeto directo así como un complemento finito o no finito son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe that he should come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Persuadiré a José que él debe venir a la fiesta’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Persuadiré a José de venir a la fiesta’</xsl:text>
</gloss>
<xsl:text>..  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Otros verbos pueden tener un objeto directo así como un complemento finito o no finito.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
          <secTitle>Cláusulas de complemento</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Algunos ejemplos de los verbos que pueden tener una cláusula de complemento, con o sin un complementador, en español o inglés son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Creo que Juliana es mi amiga</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juliana insisto que ella sea mi amiga</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Yo sé que le gusto a él</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect that Joe will come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Cuento con que José venga a la fiesta’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Espero que José venga a la fiesta’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Quisiera que José viniera a la fiesta’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Quiero que venir a la fiesta’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe tried to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘José intentó venir a la fiesta’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I tried to think of more examples</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Intenté pensar en más ejemplos’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe hates to dance</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘José odia a bailar’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be appreciated</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Quisiera ser apreciado’</xsl:text>
</gloss>
<xsl:text>.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Algunos verbos solo tienen una cláusula de complemento, con o sin un complementador.  Algunos ejemplos de este tipo en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos ejemplos en inglés de los verbos que pueden tener un objeto directo así como un complemento finito o no finito son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe that he should come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Persuadiré a José que él debe venir a la fiesta’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Persuadiré a José de venir a la fiesta’</xsl:text>
</gloss>
<xsl:text>..  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Otros verbos tienen un objeto directo así como un complemento finito o no finito.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
          <secTitle>Oraciones finitas y no finitas como complementos</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Algunos ejemplos de los verbos que solamente pueden tener un complemento finito en español son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Creo que Juliana es mi amiga</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juliana insisto que ella sea mi amiga</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Yo sé que le gusto a él</langData>
<xsl:text>.  Observe que en estos mismos ejemplos en inglés, el complementador es opcional. En el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no hay ningún complementador independiente, entonces se expresa este tipo de complemento como se muesta aquí:</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Algunos verbos solamente pueden tener un complemento finito.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos ejemplos de los verbos que pueden tener un complemento finito o no finito en inglés son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe will come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Cuento con que José venga a la fiesta’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Espero que José venga a la fiesta’</xsl:text>
</gloss>
<xsl:text>.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Algunos verbos pueden tener un complemento finito o un complemento no finito.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos verbos que solamente pueden tener un complemento no finito permiten un sujeto diverso que la cláusula principal o un sujeto tácito cuando es coreferente con el sujeto de la cláusula principal. Algunos ejemplos en inglés son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Quisiera que José viniera a la fiesta’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Quiero que venir a la fiesta’</xsl:text>
</gloss>
<xsl:text>.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Algunos verbos que solamente pueden tener un complemento no finito permiten un sujeto diverso que la cláusula principal o un sujeto tácito cuando es coreferente con el sujeto de la cláusula principal.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos ejemplos en inglés de los verbos que solamente pueden tener un complemento no finito sin un complementador, pero requieren un sujeto tácito porque es coreferente con el sujeto de la cláusula principal son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe tried to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘José intentó venir a la fiesta’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe hates to dance</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘José odia a bailar’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be appreciated</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Quisiera ser apreciado’</xsl:text>
</gloss>
<xsl:text>.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Algunos verbos solamente pueden tener un complemento no finito sin un complementador, pero requieren un sujeto tácito porque es coreferente con el sujeto de la cláusula principal.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos ejemplos en inglés de los verbos que pueden tener un objeto directo así como un complemento finito o no finito son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe that he should come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Persuadiré a José que él debe venir a la fiesta’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Persuadiré a José de venir a la fiesta’</xsl:text>
</gloss>
<xsl:text>..  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Otros verbos pueden tener un objeto directo así como un complemento finito o no finito.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
          <secTitle>Oraciones como complementos</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Algunos ejemplos de los verbos que pueden tener una oración como complemento en español o inglés son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Creo que Juliana es mi amiga</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juliana insisto que ella sea mi amiga</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Yo sé que le gusto a él</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect that Joe will come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Cuento con que José venga a la fiesta’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Espero que José venga a la fiesta’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Quisiera que José viniera a la fiesta’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Quiero que venir a la fiesta’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe tried to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘José intentó venir a la fiesta’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe hates to dance</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘José odia a bailar’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be appreciated</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Quisiera ser apreciado’</xsl:text>
</gloss>
<xsl:text>.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>        <p contentType="ctPracticalIntro">
<xsl:text>Algunos verbos pueden tener una oración como complemento  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos ejemplos en inglés de los verbos que pueden tener un objeto directo así como un complemento finito o ino finito son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe that he should come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Persuadiré a José que él debe venir a la fiesta’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Persuadiré a José de venir a la fiesta’</xsl:text>
</gloss>
<xsl:text>..  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
             <p contentType="ctPracticalIntro">
<xsl:text>Otros verbos pueden tener un objeto directo así como una oración como complemento.  Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
              <secTitle>Complementos de verbos de ‘ascenso’</secTitle>
              <p contentType="ctComparativeIntro">
<xsl:text>Parece que los verbos de ‘ascenso’ incluyen todos los verbos de percepción y los verbos copulativos. Estos verbos pueden tener un complemento no finito o un complemento del adjetivo que sí mismo tiene un complemento finito con un complementador o un complemento no finito. El verbo principal no tiene su propio sujeto, así que la posición de sujeto es ocupada por el sujeto del complemento no finito, como en: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John seemed to like the tortillas</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan parecía tener gusto de las tortillas’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe is likely to come</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘José es probable venir’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The weather is certain to change soon</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El tiempo cambia seguramente pronto’</xsl:text>
</gloss>
<xsl:text>.  Cuando la cláusula de complemento es finita, el sujeto no puede ser ‘ascensado’ , así que un pronombre sin cambios de concordancia </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>it</langData>
<xsl:text> ocupa la posición del sujeto de la cláusula principal en inglés, como en:  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>It seems likely that Joe will come</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Parece probablemente que vendrá José’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>It is certain that the weather will change soon</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Es cierto que el tiempo cambiará pronto’</xsl:text>
</gloss>
<xsl:text>.  Algunas lenguas simplemente tienen el verbo sin un sujeto, seguido de una cláusula de complemento, así que no hay ‘ascenso’; las dos cláusulas comparten el mismo sujeto.</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Parece que los verbos de ‘ascenso’ incluyen todos los verbos de percepción y los verbos copulativos. El verbo principal no tiene su propio sujeto, así que la posición de sujeto es ocupada por el sujeto del complemento no finito o por un pronombre sin cambios de concordancia.  Algunas lenguas simplemente tienen el verbo sin un sujeto, seguido de una cláusula de complemento, así que no hay ‘ascenso’; las dos cláusulas comparten el mismo sujeto.</xsl:text>
</p>
          <p>
<xsl:text>Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
              <secTitle>Complementos de verbos causativos</secTitle>
              <p contentType="ctComparativeIntro">
<xsl:text>Los causativos sintácticos consisten en dos cláusulas y tienen un objeto que también funciona como el sujeto de la cláusula de complemento. Esta cláusula de complemento es siempre no finita, pero no necesita el indicador de no finito con algunos verbos en inglés, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My mother made me clean my room</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Mi madre me hizo limpiar mi dormitorio’</xsl:text>
</gloss>
<xsl:text>, mientras que se requiere con otros verbos, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The other girl caused us to break up</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘La otra muchacha hizo que nos separáramos’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
              <p contentType="ctPracticalIntro">
<xsl:text>Los causativos sintácticos consisten en dos cláusulas y tienen un objeto que también funciona como el sujeto de la cláusula de complemento. </xsl:text>
</p>
              <xsl:if test="normalize-space(//ip/causativeMake/@checked)='no'">
<p>
<xsl:text>El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene los causativos sintácticos que consisten en dos cláusulas .</xsl:text>
</p>
</xsl:if>
              <xsl:if test="normalize-space(//ip/causativeMake/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de este tipo de complemento en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sIPCausatives" />
<xsl:text> para ejemplos de oraciones causativas de una sola cláusula, en que el verbo se marca con un afijo que introduce el argumento adicional en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
</xsl:if>
           </section2>
           
           <section2 id="sCompSpeech">
              <secTitle>Discurso directo e indirecto como complementos</secTitle>
              <p contentType="ctComparativeIntro">
<xsl:text>Los verbos de habla pueden tener complementos directos o indirectos. Las citas directas pueden consistir en cualquier oración, interjección o saludo, por ejemplo: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue said, “I will come to your house tomorrow”</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Susana dijo, “Vendré a su casa mañana”’</xsl:text>
</gloss>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe said, “Bye!”</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘José dijo, “¡Adiós!”’</xsl:text>
</gloss>
</p>
              <p contentType="ctComparativeIntro">
<xsl:text>Las citas indirectas como complementos están más limitadas. En inglés, algunos verbos de habla pueden tener un complemento finito, con o sin un complementador, y una frase preposicional opcional para expresar al oyente, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue said (to me) that she would come here tomorrow</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Susana dijo (a mí) que ella vendría aquí mañana’</xsl:text>
</gloss>
<xsl:text>.  Otros verbos pueden tener el oyente expresado como el objeto directo más un complemento finito, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue told me that she would come here tomorrow</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Susana me dijo que ella vendría aquí mañana’</xsl:text>
</gloss>
<xsl:text>, o un complemento no finito sin un complementador con sujeto tácito porque es coreferente con el sujeto de la cláusula principal, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue told me to come here tomorrow</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Susana me dijo venir aquí mañana’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
              <p contentType="ctPracticalIntro">
<xsl:text>Los verbos de habla pueden tener complementos directos o indirectos. Las citas directas pueden consistir en cualquier oración, interjección o saludo, pero las citas indirectas como complementos están más limitadas y la forma depende del verbo principal. </xsl:text>
</p>
              <p>
<xsl:text>Algunos ejemplos de complementos de verbos de habla en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
          <secTitle>Otras restricciones en cláusulas de complemento</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>Algunas lenguas también tienen verbos que tengan otras restricciones en cláusulas subordinadas, por ejemplo que el verbo subordinado debe estar en el modo subjuntivo o en el aspecto de perfectivo.</xsl:text>
</p>
               
          <p>
<xsl:text>En el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> también hay una restricción en algunos verbos que __</xsl:text>
<xsl:value-of select="//comp/otherRestrictions" />
<xsl:text>.  A continuación algunos ejemplos:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
