<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="relcl">
    <section1 id="sRelCl">
        <secTitle>Las cláusulas relativas</secTitle>
       <p contentType="ctComparativeIntro">
<xsl:text>Las cláusulas relativas modifican a un sustantivo principal y normalmente tienen una de cuatro estructuras: como una cláusula de complemento con el complementador ‘que’ , como en  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el hombre que vino a la reunión tarde</langData>
<xsl:text>; como una pregunta abierta con ‘quien’ o ‘que’ desplazado hacia la izquierda, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el hombre quien vino a la reunión tarde</langData>
<xsl:text>; (o para algunas lenguas con excepción del español) como una cláusula de complemento pero con un indicador relativo especial que se presenta en la posición del complementador, o posiblemente con dos indicadores que se presentan en cada lado de la cláusula relativa; (o para algunas lenguas con excepción del español) como una oración regular con un indicador relativo unido al verbo.</xsl:text>
</p>
       <p contentType="ctPracticalIntro">
<xsl:text>Las cláusulas relativas modifican a un sustantivo principal y normalmente tienen una de cuatro estructuras: como una cláusula de complemento con el complementador que se usa con verbos; como una pregunta abierta con una palabra interrogativa desplazado hacia la izquierda; como una cláusula de complemento pero con un indicador relativo especial; o como una oración regular con un indicador relativo unido al verbo.</xsl:text>
</p>
        <p>
<xsl:if test="normalize-space(//relcl/@exist)='no'">
                <xsl:text>En el </xsl:text>
                <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
                <xsl:text> no hay ningún tipo de cláusula relativa.</xsl:text>
            </xsl:if>
<xsl:if test="normalize-space(//relcl/@exist)='yes'">
                <xsl:text>En el </xsl:text>
                <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
                <xsl:text>, las cláusulas relativas se presentan </xsl:text>
                <xsl:choose>
                    <xsl:when test="//relcl/@clausePos='before'">antes</xsl:when>
                    <xsl:when test="//relcl/@clausePos='after'">después</xsl:when>
                    <xsl:when test="//relcl/@clausePos='either'">de cualquier lado</xsl:when>
                    <xsl:when test="//relcl/@clausePos='unknown'"> _______ </xsl:when>
                </xsl:choose>
               <xsl:text> del sustantivo principal como se muestra en los ejemplos:</xsl:text>
</xsl:if>
</p>
       <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<example num="xRelCl.10">
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
<xsl:with-param name="sExNumber">xRelCl.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xRelCl.10.1</xsl:text>
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
</xsl:if>
       
       <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//comp/@comp)!='no' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='yes'"> <xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='no' and normalize-space(//relcl/relTypeIP/@checked)='no' and normalize-space(//relcl/relTypeOther/@checked)='no'">
<xsl:text>Las </xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<xsl:text>Algunas de las </xsl:text>
</xsl:if>
<xsl:text>cláusulas relativas en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
             <xsl:text> son iguales que una cláusula de complemento con el complementador que se usa con verbos.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relTypeCPRel/@checked)='yes'">
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='no' and normalize-space(//relcl/relTypeIP/@checked)='no' and normalize-space(//relcl/relTypeOther/@checked)='no'">
<xsl:text>Las </xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes'">
<xsl:text>Otras </xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<xsl:text>Algunas de las </xsl:text>
</xsl:if>
<xsl:text>cláusulas relativas en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
             <xsl:text> son iguales que una cláusula de complemento con un indicador relativo especial.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relTypeCPWh/@checked)='yes'">
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='no' and normalize-space(//relcl/relTypeIP/@checked)='no' and normalize-space(//relcl/relTypeOther/@checked)='no'">
<xsl:text>Las </xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes'">
<xsl:text>Otras </xsl:text>
</xsl:if>
             <xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<xsl:text>Algunas de las </xsl:text>
</xsl:if>
<xsl:text>cláusulas relativas en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
             <xsl:text> son iguales que una pregunta abierta con una palabra interrogativa desplazado hacia la izquierda.  </xsl:text>
<xsl:choose>
                <xsl:when test="//relcl/@whAndComp='no'">En este tipo de cláusula relativa, solamente la palabra interrogativa se presenta sin ningún indicador relativo. </xsl:when>  
                <xsl:when test="//relcl/@whAndComp='yes'">Este tipo de cláusula relativa tiene que tener tanto la palabra interrogativa como el indicador relativo.. </xsl:when>
                <xsl:when test="//relcl/@whAndComp='optional'">Un indicador relativo puede presentarse opcionalmente junto con la palabra interrogativa. </xsl:when>
             </xsl:choose>
</xsl:if>
<xsl:if test="normalize-space(//relcl/@relWord)='some'">
<xsl:text>Algunos de los </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/@relWord)!='some'">
<xsl:text>Los </xsl:text>
</xsl:if>
<xsl:text>indicadores relativos o complementadores </xsl:text>
<xsl:choose>
             <xsl:when test="//relcl/@relWord='yes'">se escriben como palabras independientes.  </xsl:when>
             <xsl:when test="//relcl/@relWord='some'">se escriben como palabras independientes, pero otros se unen </xsl:when>
             <xsl:when test="//relcl/@relWord='no'">se unen </xsl:when>
          </xsl:choose>
<xsl:choose>
             <xsl:when test="//relcl/@relCliticPos='before'">al inicio de cualquier palabra que comienza la parte de la cláusula relativa que es una oración como proclíticos.  Estos clíticos son:</xsl:when>
             <xsl:when test="//relcl/@relCliticPos='after'">al final de cualquier palabra que termina la parte de la cláusula relativa que es una oración como enclíticos.  Estos clíticos son:</xsl:when>
             <xsl:when test="//relcl/@relCliticPos='both'">en ambos lados de la parte de la cláusula relativa que es una oración como clíticos.  Estos clíticos son:</xsl:when>
             <xsl:when test="//relcl/@relCliticPos='unknown'"> ________ a la parte de la cláusula relativa que es una oración como proclíticos.  Estos clíticos son:</xsl:when>
          </xsl:choose>
</p>
</xsl:if>     
       <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//comp/@comp)!='no' and normalize-space(//relcl/@relWord)!='yes' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='yes' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/@whAndComp)!='no' and normalize-space(//relcl/@relWord)!='yes'">
<example num="xRelCl.14">
<table border="1">
             <tr>
                <th>Clíticos relativos</th>
                <th>Glosa</th>
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
       
       <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//comp/@comp)!='no' and normalize-space(//relcl/@relWord)!='no' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/@whAndComp)!='no' and normalize-space(//relcl/@relWord)!='no'">
<p>
<xsl:text>Los indicadores relativos se presentan </xsl:text>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='yes' and normalize-space(//relcl/relWordAfter/@checked)='no' and normalize-space(//relcl/relWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='no' and normalize-space(//relcl/relWordAfter/@checked)='yes' and normalize-space(//relcl/relWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='no' and normalize-space(//relcl/relWordAfter/@checked)='no' and normalize-space(//relcl/relWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='yes' and normalize-space(//relcl/relWordAfter/@checked)='yes' and normalize-space(//relcl/relWordBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='yes' and normalize-space(//relcl/relWordAfter/@checked)='no' and normalize-space(//relcl/relWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='no' and normalize-space(//relcl/relWordAfter/@checked)='yes' and normalize-space(//relcl/relWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='yes' and normalize-space(//relcl/relWordAfter/@checked)='yes' and normalize-space(//relcl/relWordBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordOther/@checked)='no'">
<xsl:text> de la parte de la cláusula relativa que es una oración.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='no' and normalize-space(//relcl/relWordAfter/@checked)='no' and normalize-space(//relcl/relWordBoth/@checked)='no' and normalize-space(//relcl/relWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//relcl/relWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relWordBefore/@checked)='yes' and normalize-space(//relcl/relWordOther/@checked)='yes' or normalize-space(//relcl/relWordAfter/@checked)='yes' and normalize-space(//relcl/relWordOther/@checked)='yes' or normalize-space(//relcl/relWordBoth/@checked)='yes' and normalize-space(//relcl/relWordOther/@checked)='yes'">
<xsl:text> de la parte de la cláusula relativa que es una oración y también pueden presentarse ___</xsl:text>
<xsl:value-of select="//relcl/relWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>Estos indicadores relativos son: </xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//comp/@comp)!='no' and normalize-space(//relcl/@relWord)!='no' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/@whAndComp)!='no' and normalize-space(//relcl/@relWord)!='no'">
<example num="xRelCl.18">
<table border="1">
             <tr>
                <th>Indicadores relativos</th>
                <th>Glosa</th>
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
                   
       <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='no' and normalize-space(//relcl/relTypeOther/@checked)='no'">
<xsl:text>Las </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' or normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' or normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes'">
<xsl:text>Otras </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<xsl:text>Algunas de las </xsl:text>
</xsl:if>
<xsl:text>cláusulas relativas en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son como una oración regular con un indicador relativo unido al verbo como un afijo.  Este afijo relativo es:</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes'">
<example num="xRelCl.22">
<table border="1">
             <tr>
                <th>Afijo relativo</th>
                <th>Glosa</th>
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
       
       <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='no' and normalize-space(//relcl/relTypeIP/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='no'">
<xsl:text>Las </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes' or normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes' or normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes' or normalize-space(//relcl/relTypeIPRel/@checked)='yes' and normalize-space(//relcl/relTypeIP/@checked)='yes'">
<xsl:text>Otras </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='no' and normalize-space(//relcl/relTypeIP/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<xsl:text>Algunas de las </xsl:text>
</xsl:if>
<xsl:text>cláusulas relativas en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son como una oración regular que modifica al sustantivo principal, sin ningún indicador especial.  </xsl:text>
</p>
</xsl:if>
       
       <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='no' and normalize-space(//relcl/relTypeCPWh/@checked)='no' and normalize-space(//relcl/relTypeCPRel/@checked)='no' and normalize-space(//relcl/relTypeIPRel/@checked)='no' and normalize-space(//relcl/relTypeIP/@checked)='no' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<xsl:text>Las cláusulas relativas en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
             <xsl:text> se forman con ___</xsl:text>
<xsl:value-of select="//relcl/relTypeOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes' or normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes' or normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes' or normalize-space(//relcl/relTypeIPRel/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes' or normalize-space(//relcl/relTypeIP/@checked)='yes' and normalize-space(//relcl/relTypeOther/@checked)='yes'">
<xsl:text>Además, hay cláusulas relativas que se forman con ___</xsl:text>
<xsl:value-of select="//relcl/relTypeOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
</xsl:if>
             
       <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text>Algunos ejemplos de las cláusulas relativas anteriores en oraciones completas son:</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<example num="xRelCl.30">
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
<xsl:with-param name="sExNumber">xRelCl.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xRelCl.30.1</xsl:text>
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
</xsl:if>
       
       <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>Algunas lenguas también permiten que una cláusula relativa se presenta sola como frase nominal sin un sustantivo principal que la modifique.  Por ejemplo, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Julie brought [the food that we ate today]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Julia trajo [el alimento que comimos hoy]’</xsl:text>
</gloss>
<xsl:text> tiene una cláusula relativa completa en la posición del objeto, mientras que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Julie brought [what we ate today]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Julia trajo [lo que comimos hoy]’</xsl:text>
</gloss>
<xsl:text>  tiene una cláusula relativa sin un sustantivo principal que la modifique como el objeto.</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<p contentType="ctPracticalIntro">
<xsl:text>Algunas lenguas también permiten que una cláusula relativa se presenta sola como frase nominal sin un sustantivo principal que la modifique..</xsl:text>
</p>
</xsl:if>
       
       <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text>En el</xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
             <xsl:when test="//relcl/@headless='no'">, en todas las cláusulas relativas se requiere un sustantivo principal que la modifique.</xsl:when>
             <xsl:when test="//relcl/@headless='yes'">, se permite las cláusulas relativas sin un sustantivo principal que la modifique.</xsl:when>
          </xsl:choose>
<xsl:text> </xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//relcl/@headless)='yes' and normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text>Algunos ejemplos de las cláusulas relativas sin un sustantivo principal que la modifique en oraciones completas son:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//relcl/@headless)='yes' and normalize-space(//relcl/@exist)='yes'">
<example num="xRelCl.40">
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
<xsl:with-param name="sExNumber">xRelCl.40</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xRelCl.40.1</xsl:text>
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
</xsl:if>
    </section1>
   
    <section1 id="sTexts">
        <secTitle>Los textos</secTitle>
        <p>
<object type="tComment">Incluya varios textos aquí para mostrar cómo se forman las construcciones más complejas como párrafos, conversaciones e historias narrativas. Incluya los ejemplos de varios tipos literarios.</object>
</p>
        <p>
<object type="tComment">  Un formato sugerido para presentar los textos es presente el texto completo en la lengua vernáculo primero, así los hablantes pueden apreciarla. Después presente la forma interlineal, como en los ejemplos a través de la gramática. Finalmente, dé una traducción libre completa, así el hablante extranjero puede apreciar más sobre la cultura.</object>
</p>
    </section1>
    
    
        
    
    
        
    
   
      
   
   
      
   
   
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
   
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
   
      
      
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
   
   
   
   
      
      
      
      
   
      
      
      
         
   
         
         
         
         
         
         
         
         
         
         
         
       
      
         
         
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
    
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
     
   
      
      
      
      
      
      
      
      
      
      
      
    
   
      
         
         
         
         
         
         
         
         
         
         
         
       
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
   
        
        
        
    
</xsl:template>
</xsl:stylesheet>
