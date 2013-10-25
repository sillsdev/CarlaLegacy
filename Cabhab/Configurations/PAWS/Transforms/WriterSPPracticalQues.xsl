<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="ques">
    <section1 id="sQues">
        <secTitle>Las preguntas</secTitle>
        <p>
<xsl:text>Hay dos tipos de preguntas: las que requieren una respuesta afirmativa o negativa y las que se contestan con información. En esta sección se consideran las preguntas como cláusula principal y las variedades de cláusulas subordinadas de ambos tipos de preguntas.</xsl:text>
</p>
        <section2 id="sQuesYN">
           <secTitle>Preguntas de respuesta sí/no</secTitle>
           <p contentType="ctPracticalIntro">
<xsl:text>Las preguntas de respuesta sí/no como cláusula principal o subordinada pueden formarse de una manera diferente en los indicadores o complementadores de pregunta y/o cambios especiales del orden de las palabras.</xsl:text>
</p>
           <p contentType="ctComparativeIntro">
<xsl:text>El español no tiene ningún indicador especial ni ningún cambio del orden de las palabras para las preguntas de respuesta sí/no como cláusula principal. 
                    Hay simplemente un cambio en la entonación. Otras lenguas pueden utilizar indicadores y/o cambios especiales del orden de las palabras. 
                    En las preguntas de respuesta sí/no como cláusula principal en inglés, un verbo auxiliar desplaza hacia la izquierda delante del sujeto. Otras lenguas utilizan un indicador o un complementador especial en vez de movimiento del auxiliar. Este es el caso en preguntas de respuesta sí/no como cláusulas subordinadas en inglés; no se permite el desplazamiento del auxiliar pero </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>whether</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘sea que’</xsl:text>
</gloss>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>if</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘si’</xsl:text>
</gloss>
<xsl:text> ocupa la posición del complementador. Puesto que las preguntas de respuesta sí/no como cláusula principal o subordinada cláusulas se pueden formar en una manera distinta, cada uno se analiza por separado.</xsl:text>
</p>
            <section3 id="sQuesYNMain">
               <secTitle>Preguntas de respuesta sí/no como cláusula principal</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>Mientras que en español simplemente hay un cambio en la entonación para señalar una pregunta de respuesta sí/no como cláusula principal, otras lenguas utilizan indicadores y/o cambios especiales del orden de las palabras. Algunos ejemplos en inglés de las preguntas de respuesta sí/no como cláusula principal que muestran el desplazamiento que se requiere a un auxiliar son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Are you going to the store?</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘¿Usted va al almacén?’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Will Sue buy the present for her mother?</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘¿Compra Susana el regalo para su madre?’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Could the boy have hit the ball?</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘¿Habría podido el muchacho golpear el beísbol?’</xsl:text>
</gloss>
<xsl:text></xsl:text>
</p>
               <p>
<xsl:text> Algunos ejemplos de las preguntas de respuesta sí/no como cláusula principal en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son: </xsl:text>
</p>
               <example num="xQues.QuesYN.QuesYNMain.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//q/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//q/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQues.QuesYN.QuesYNMain.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQues.QuesYN.QuesYNMain.8.1</xsl:text>
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
               <p>
<xsl:text>De acuerdo con los ejemplos, </xsl:text>
<xsl:choose>
                       <xsl:when test="//q/@mainYN='no'"> no hay ni indicador ni cambio del orden de las palabras, solamente un cambio en la entonación o el tono u otra indicación que no es sintáctica.</xsl:when>
                       <xsl:when test="//q/@mainYN='noAux'">se requiere el movimiento de un auxiliar</xsl:when>
                       <xsl:when test="//q/@mainYN='yes'">hay por lo menos un indicador o complementador de pregunta en las preguntas de respuesta sí/no.</xsl:when>
                    </xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainYN)='noAux'">
                        <xsl:text> al </xsl:text>
                        <xsl:choose>
                            <xsl:when test="//q/@mainYNAuxPos='before'">inicio</xsl:when>
                            <xsl:when test="//q/@mainYNAuxPos='after'">final</xsl:when>
                            <xsl:when test="//q/@mainYNAuxPos='unknown'">_______</xsl:when>
                        </xsl:choose>
                        <xsl:text> de la pregunta.</xsl:text>
                    </xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainYN)='yes'">
                        <xsl:text></xsl:text>
                        <xsl:choose>
                            <xsl:when test="//q/@mainYNWord='yes'">Se escriben como palabras independientes.</xsl:when>
                           <xsl:when test="//q/@mainYNWord='some'">Algunos se escriben como palabras independientes pero otros se unen </xsl:when>
                           <xsl:when test="//q/@mainYNWord='no'">Se unen </xsl:when>
                        </xsl:choose>
                       <xsl:if test="normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/@mainYN)='yes'">
                          <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>como proclíticos al principio de la palabra inicial en la pregunta.  </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>como enclíticos al final de la última palabra en la pregunta.    </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>al principio de la palabra inicial en la pregunta o al final de la última palabra en la pregunta como clíticos.   </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>al verbo en la pregunta como prefijos.  </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>al verbo en la pregunta como sufijos.   </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>al verbo en la pregunta, algunos como prefijos y otros como sufijos.   </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>al principio o final de la pregunta como clíticos, o al verbo en la pregunta como afijos.  </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/mainYNCliticOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/mainYNCliticOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNCliticOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNCliticOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNCliticOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/mainYNCliticOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>  Otros se unen ___</xsl:text>
<xsl:value-of select="//q/mainYNCliticOther" />  <xsl:text>.</xsl:text>
</xsl:if>              
                       </xsl:if>  <xsl:text></xsl:text>
                    </xsl:if>
</p>   
               <xsl:if test="normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<p>
<xsl:text>Los clíticos que se marcan las preguntas de respuesta sí/no como cláusula principal son:</xsl:text>
</p>
</xsl:if>      
               <xsl:if test="normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<example num="xQues.QuesYN.QuesYNMain.14">
<table border="1">
                     <tr>
                        <th>Clíticos de respuesta sí/no </th>
                        <th>Glosa</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/mainYNCliticExample),'.','')" />
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
               <xsl:if test="normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<p>
<xsl:text>Los afijos que se marcan las preguntas de respuesta sí/no como cláusula principal son:</xsl:text>
</p>
</xsl:if>      
               <xsl:if test="normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<example num="xQues.QuesYN.QuesYNMain.18">
<table border="1">
                     <tr>
                        <th>Afijos de respuesta sí/no </th>
                        <th>Glosa</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/mainYNAffixExample),'.','')" />
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
               <xsl:if test="normalize-space(//q/@mainYNWord)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/@mainYN)='yes'">
<p>
<xsl:text> Los indicadores o complementadores que se escriben como palabras independientes se presentan </xsl:text>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordOther/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text> del resto de la pregunta.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='no' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/mainYNWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNWordBoth/@checked)='yes' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>del resto de la pregunta y también pueden presentarse ___</xsl:text> <xsl:value-of select="//q/mainYNWordOther" /> <xsl:text>. </xsl:text>
</xsl:if>
<xsl:text> Estos indicadores son:</xsl:text>
</p>
</xsl:if>
               <xsl:if test="normalize-space(//q/@mainYNWord)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/@mainYN)='yes'">
<example num="xQues.QuesYN.QuesYNMain.22">
<table border="1">
                     <tr>
                        <th>Indicadores de respuesta sí/no </th>
                        <th>Glosa</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/mainYNWordExample),'.','')" />
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
            </section3>
            <section3 id="sQuesYNEmb">
               <secTitle>Preguntas de respuesta sí/no como cláusula subordinada</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>Algunos ejemplos en español de preguntas de respuesta sí/no como cláusulas subordinadas que muestran la presencia de los indicadores o complementadores de la pregunta son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Me pregunto si ella vendrá</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Yo sabré si ella va</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Susana se pregunta si el muchacho habría podido golpear el beísbol.</langData>
<xsl:text>.</xsl:text>
</p>
               <p>
<xsl:text> Algunos ejemplos de preguntas de respuesta sí/no como cláusula subordinada en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son: </xsl:text>
</p>
               <example num="xQues.QuesYN.QuesYNEmb.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/embYNExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//q/embYNExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/embYNExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//q/embYNExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQues.QuesYN.QuesYNEmb.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQues.QuesYN.QuesYNEmb.8.1</xsl:text>
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
               <p>
<xsl:text>De acuerdo con los ejemplos, </xsl:text>
<xsl:choose>
                       <xsl:when test="//q/@embYN='no'">no hay indicador ni cambio del orden de las palabras, solamente un cambio en la entonación o el tono u otra indicación que no es sintáctica.</xsl:when>
                       <xsl:when test="//q/@embYN='noAux'">se requiere el desplazamiento de un auxiliar</xsl:when>
                       <xsl:when test="//q/@embYN='yes'">hay por lo menos un indicador o complementador de pregunta en las preguntas de respuesta sí/no. </xsl:when>
                    </xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embYN)='noAux'">
                        <xsl:text> al </xsl:text>
                        <xsl:choose>
                            <xsl:when test="//q/@embYNAuxPos='before'">inicio</xsl:when>
                            <xsl:when test="//q/@embYNAuxPos='after'">final</xsl:when>
                            <xsl:when test="//q/@embYNAuxPos='unknown'">_______</xsl:when>
                       </xsl:choose>
                        <xsl:text> de la pregunta subordinada.</xsl:text>
                    </xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embYN)='yes'">
                       <xsl:text></xsl:text>
                        <xsl:choose>
                           <xsl:when test="//q/@embYNWord='yes'">Se escriben como palabras independientes.</xsl:when>
                           <xsl:when test="//q/@embYNWord='some'">Algunos se escriben como palabras independientes pero otros se unen </xsl:when>
                           <xsl:when test="//q/@embYNWord='no'">Se unen </xsl:when>
                        </xsl:choose>
                       <xsl:if test="normalize-space(//q/@embYNWord)='no' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/@embYN)='yes'">
                          <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text>como proclíticos al principio de la palabra inicial en la pregunta subordinada.  </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text>como enclíticos al final de la última palabra en la pregunta subordinada.    </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text>al principio de la palabra inicial en la pregunta subordinada o al final de la última palabra en la pregunta como clíticos.   </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text>al verbo en la pregunta subordinada como prefijos.  </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>al verbo en la pregunta subordinada como sufijos.   </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>al verbo en la pregunta subordinada, algunos como prefijos y otros como sufijos.   </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>al principio o final de la pregunta subordinada como clíticos, o al verbo en la pregunta como afijos.  </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/embYNCliticOther/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/embYNCliticOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                          <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNCliticOther/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNCliticOther/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNCliticOther/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/embYNCliticOther/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>  Otros se unen ___</xsl:text>
<xsl:value-of select="//q/embYNCliticOther" />  <xsl:text>.</xsl:text>
</xsl:if>              
                       </xsl:if>  <xsl:text></xsl:text>
                    </xsl:if>
</p>   
               <xsl:if test="normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<p>
<xsl:text>Los clíticos que se indican las preguntas de respuesta sí/no como cláusula subordinada son:</xsl:text>
</p>
</xsl:if>      
               <xsl:if test="normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<example num="xQues.QuesYN.QuesYNEmb.14">
<table border="1">
                     <tr>
                        <th>Clíticos de respuesta sí/no </th>
                        <th>Glosa</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/embYNCliticExample),'.','')" />
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
               <xsl:if test="normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<p>
<xsl:text>Los afijos que se indican las preguntas de respuesta sí/no como cláusula subordinada son:</xsl:text>
</p>
</xsl:if>      
               <xsl:if test="normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<example num="xQues.QuesYN.QuesYNEmb.18">
<table border="1">
                     <tr>
                        <th>Afijos de respuesta sí/no </th>
                        <th>Glosa</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/embYNAffixExample),'.','')" />
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
               <xsl:if test="normalize-space(//q/@embYNWord)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/@embYN)='yes'">
<p>
<xsl:text> Los indicadores o complementadores que se escriben como palabras independientes se presentan </xsl:text>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='yes' and normalize-space(//q/embYNWordAfter/@checked)='no' and normalize-space(//q/embYNWordBoth/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='no' and normalize-space(//q/embYNWordAfter/@checked)='yes' and normalize-space(//q/embYNWordBoth/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='no' and normalize-space(//q/embYNWordAfter/@checked)='no' and normalize-space(//q/embYNWordBoth/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='yes' and normalize-space(//q/embYNWordAfter/@checked)='yes' and normalize-space(//q/embYNWordBoth/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='yes' and normalize-space(//q/embYNWordAfter/@checked)='no' and normalize-space(//q/embYNWordBoth/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='no' and normalize-space(//q/embYNWordAfter/@checked)='yes' and normalize-space(//q/embYNWordBoth/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='yes' and normalize-space(//q/embYNWordAfter/@checked)='yes' and normalize-space(//q/embYNWordBoth/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordOther/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text> del resto de la pregunta subordinada.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='no' and normalize-space(//q/embYNWordAfter/@checked)='no' and normalize-space(//q/embYNWordBoth/@checked)='no' and normalize-space(//q/embYNWordOther/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/embYNWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='yes' and normalize-space(//q/embYNWordOther/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNWordAfter/@checked)='yes' and normalize-space(//q/embYNWordOther/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNWordBoth/@checked)='yes' and normalize-space(//q/embYNWordOther/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>del resto de la pregunta subordinada y también pueden presentarse ___</xsl:text> <xsl:value-of select="//q/embYNWordOther" /> <xsl:text>. </xsl:text>
</xsl:if>
<xsl:text> Estos indicadores son:</xsl:text>
</p>
</xsl:if>
               <xsl:if test="normalize-space(//q/@embYNWord)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/@embYN)='yes'">
<example num="xQues.QuesYN.QuesYNEmb.22">
<table border="1">
                     <tr>
                        <th>Indicadores de respuesta sí/no </th>
                        <th>Glosa</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/embYNWordExample),'.','')" />
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
               
            </section3>
        </section2>
        <section2 id="sQuesContent">
           <secTitle>Preguntas de respuesta abierta</secTitle>
           <p contentType="ctComparativeIntro">
<xsl:text>Las preguntas de respuesta abierta se diferencian de las de respuesta sí/no en que aquellas contienen una palabra o una frase interrogativa.  En algunas lenguas, algunos o todos estos interrogativos se expresan como afijos.  Las palabras, las frases o los afijos interrogativos en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran en </xsl:text>
<exampleRef num="xWh" equal="no" letterOnly="no" />
<xsl:text>.</xsl:text>
</p>
           <p contentType="ctPracticalIntro">
<xsl:text>Las preguntas de respuesta abierta se diferencian de las de respuesta sí/no en que aquellas contienen una palabra o una frase interrogativa.  Las palabras, las frases o los afijos interrogativos en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran en </xsl:text>
<exampleRef num="xWh" equal="no" letterOnly="no" />
<xsl:text>.</xsl:text>
</p>
            <example num="xWh">
<table border="1">
                    <caption>
                       <xsl:text>Interrogativos usados en preguntas de respuesta abierta </xsl:text>
                    </caption>
                    <tr>
                        <th>Morfemas</th>
                        <th>Glosa</th>
                    </tr>
                    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/who),'.','')" />
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
                            <xsl:text>quién</xsl:text>
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
                            <xsl:text>quién</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//q/what),'.','')" />
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
                            <xsl:text>qué</xsl:text>
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
                            <xsl:text>qué</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//q/why),'.','')" />
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
                            <xsl:text>por qué</xsl:text>
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
                            <xsl:text>por qué</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue3.0">
<xsl:value-of select="translate(string(//q/where),'.','')" />
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
                            <xsl:text>dónde</xsl:text>
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
                            <xsl:text>dónde</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue4.0">
<xsl:value-of select="translate(string(//q/when),'.','')" />
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
                            <xsl:text>cuándo</xsl:text>
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
                            <xsl:text>cuándo</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue5.0">
<xsl:value-of select="translate(string(//q/how),'.','')" />
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
                           <xsl:text>cómo o cuán</xsl:text>
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
                           <xsl:text>cómo o cuán</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                   <xsl:variable name="sExampleValue6.0">
<xsl:value-of select="translate(string(//q/howMany),'.','')" />
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
                         <xsl:text>cuánto o cuántos</xsl:text>
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
                         <xsl:text>cuánto o cuántos</xsl:text>
                      </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                   <xsl:variable name="sExampleValue7.0">
<xsl:value-of select="translate(string(//q/which),'.','')" />
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
                            <xsl:text>cuál</xsl:text>
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
                            <xsl:text>cuál</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue8.0">
<xsl:value-of select="translate(string(//q/whose),'.','')" />
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
                           <xsl:text>de quién o cuyo(s)</xsl:text>
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
                           <xsl:text>de quién o cuyo(s)</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue9.0">
<xsl:value-of select="translate(string(//q/other),'.','')" />
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
                            <xsl:text>otros interrogativos</xsl:text>
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
                            <xsl:text>otros interrogativos</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                </table>
</example>
           <p contentType="ctComparativeIntro">
<xsl:text>Dependiendo del orden de las palabras básico de la lengua, las preguntas de respuesta abierta pueden ser formadas con o sin el desplazamiento hacia la izquierda de una frase interrogativa.  
               Las lenguas con núcleo final (SOV, OVS, y OSV) no tienen generalmente el desplazamiento de una frase interrogativa en preguntas, mientras que las lenguas con núcleo inicial (SVO, VOS, y VSO) generalmente requieren el desplazamiento hacia la izquierda de una frase interrogativa. </xsl:text>
</p> 
           <p contentType="ctComparativeIntro">
<xsl:text>En lenguas sin el desplazamiento hacia la izquierda para los interrogativos, la estructura de una pregunta de respuesta abierta es igual que una pregunta de respuesta sí/no con un indicador de la pregunta o un auxiliar en la posición del complementador o apenas igual que una oración normal. 
                    En cualquier caso, la frase interrogativa se presenta en su posición normal.  Muchas lenguas del orden SOV permiten opcionalmente el desplazamiento de una frase interrogativa a la posición inmediatamente antes del verbo.
</xsl:text>
</p>
            <p>
<xsl:text>Ya sea como cláusulas principales o como subordinadas, en las preguntas de respuesta abierta en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, una frase interrogativa </xsl:text>
<xsl:choose>
                    <xsl:when test="//q/@contFront='no'">no desplaza hacia la izquierda; permanece simplemente en su posición normal.</xsl:when>
                    <xsl:when test="//q/@contFront='after'">puede permanecer en su posición normal o puede desplazarse hacia la posición inmediatamente antes del verbo.</xsl:when>
                    <xsl:when test="//q/@contFront='before'">se desplaza hacia la izquierda hacia al inicio de la cláusula.</xsl:when>
                    <xsl:when test="//q/@contFront='unknown'">_______.</xsl:when>
                </xsl:choose>
<xsl:text> </xsl:text>
</p>
            <section3 id="sQuesContentMain">
               <secTitle>Preguntas de respuesta abierta como cláusula principal</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>Algunos ejemplos en español de preguntas de respuesta abierta como cláusula principal que se muestran el desplazamiento hacia la izquierda a una frase interrogativa son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¿Cuál muchacho golpeó el beísbol?</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¿Quién pudo haber golpeado el beísbol?</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¿Qué golpeó el muchacho?</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¿Cuándo viene ella?</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¿Dónde está el líder?</langData>
<xsl:text> </xsl:text>
</p>
               <p>
<xsl:text> Algunos ejemplos de preguntas de respuesta abierta como cláusula principal en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son: </xsl:text>
</p>
               <example num="xQues.QuesContent.QuesContentMain.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/contentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//q/contentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/contentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//q/contentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQues.QuesContent.QuesContentMain.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQues.QuesContent.QuesContentMain.8.1</xsl:text>
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
               
                <p>
<xsl:text>De acuerdo con los ejemplos, </xsl:text>
<xsl:choose>
                        <xsl:when test="//q/@mainCont='no'">no hay ni indicador ni auxiliar que desplaza hacia la izquierda,</xsl:when>
                       <xsl:when test="//q/@mainCont='noAux'">el movimiento de un auxiliar</xsl:when>
                        <xsl:when test="//q/@mainCont='yes'">hay por lo menos un indicador o complementador de pregunta en las preguntas de respuesta abierta.</xsl:when>
                    </xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainCont)='no'">
                        <xsl:text> solamente </xsl:text>
                        <xsl:choose>
                            <xsl:when test="//q/@contFront='no'">una diferencia de</xsl:when>
                            <xsl:when test="//q/@contFront='after'">el desplazamiento opcional de una frase interrogativa y posiblemente un cambio en</xsl:when>
                            <xsl:when test="//q/@contFront='before'">el desplazamiento hacia la izquierda de una frase interrogativa y posiblemente un cambio en</xsl:when>
                            <xsl:when test="//q/@contFront='unknown'">_______ de una frase interrogativa y posiblemente un cambio en</xsl:when>
                        </xsl:choose>
                        <xsl:text> la entonación o el tono u otra indicación que no es sintáctica.</xsl:text>
                    </xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainCont)='noAux'">
                        <xsl:text> al </xsl:text>
                        <xsl:choose>
                            <xsl:when test="//q/@mainContAuxPos='before'">inicio</xsl:when>
                            <xsl:when test="//q/@mainContAuxPos='after'">final</xsl:when>
                            <xsl:when test="//q/@mainContAuxPos='unknown'">_______</xsl:when>
                        </xsl:choose>
                        <xsl:text> de la pregunta </xsl:text>
                        <xsl:choose>
                            <xsl:when test="//q/@mainContAuxRequired='no'">es opcional</xsl:when>
                            <xsl:when test="//q/@mainContAuxRequired='yes'">se requiere</xsl:when>
                           <xsl:when test="//q/@mainContAuxRequired='object'"> se requiere excepto cuando se cuestiona el sujeto</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="//q/@contFront='no'">.</xsl:when>
                            <xsl:when test="//q/@contFront='after'">.</xsl:when>
                           <xsl:when test="//q/@contFront='before'"> además del desplazamiento hacia la izquierda de una frase interrogativa. </xsl:when>
                        </xsl:choose>
                        <xsl:text> </xsl:text>
                    </xsl:if>
<xsl:if test="normalize-space(//q/@mainCont)='yes'">
                      <xsl:if test="normalize-space(//q/@mainContWord)='some' and normalize-space(//q/@mainCont)='yes'">
<xsl:text> Algunos se escriben como palabras independientes pero otros se unen, </xsl:text>
</xsl:if>
                      <xsl:if test="normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text> Se escriben como palabras independientes. </xsl:text>
</xsl:if>
                      <xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text> Se unen, </xsl:text>
</xsl:if>
                      <xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/@mainCont)='yes'">
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como proclíticos, a la palabra inicial en la pregunta.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como proclíticos, a la palabra inicial en la pregunta, o a la palabra inicial del resto de la pregunta y después de la frase interrogativa desplazada.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como proclíticos, a la palabra inicial en la pregunta, o  como enclíticos, a la última palabra en la frase interrogativa y antes del resto de la pregunta.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como proclíticos, a la palabra inicial en la pregunta, o a la palabra inicial del resto de la pregunta y después de la frase interrogativa desplazada, o  como enclíticos, a la última palabra en la frase interrogativa y antes del resto de la pregunta.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como proclíticos, a la palabra inicial del resto de la pregunta y después de la frase interrogativa desplazada.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como enclíticos, a la última palabra en la pregunta.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como enclíticos, a la última palabra en la pregunta, o como proclíticos, a la palabra inicial del resto de la pregunta y después de la frase interrogativa desplazada.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como enclíticos, a la última palabra en la pregunta o a la última palabra en la frase interrogativa y antes del resto de la pregunta.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como enclíticos, a la última palabra en la pregunta o a la última palabra en la frase interrogativa y antes del resto de la pregunta, o como proclíticos, a la palabra inicial del resto de la pregunta y después de la frase interrogativa desplazada.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como enclíticos, a la última palabra en la frase interrogativa y antes del resto de la pregunta.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como proclíticos, a la palabra inicial del resto de la pregunta y después de la frase interrogativa desplazada, o como enclíticos, a la última palabra en la frase interrogativa y antes del resto de la pregunta.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como clíticos, al principio de la palabra inicial en la pregunta o al final de la última palabra en la pregunta.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como clíticos, al principio de la palabra inicial en la pregunta o al final de la última palabra en la pregunta, o a la palabra inicial del resto de la pregunta y después de la frase interrogativa desplazada.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como clíticos, al principio de la palabra inicial en la pregunta o al final de la última palabra en la pregunta, o al final de la última palabra en la frase interrogativa y antes del resto de la pregunta.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>como clíticos, al principio de la palabra inicial en la pregunta o al final de la última palabra en la pregunta, o a la palabra inicial del resto de la pregunta y después de la frase interrogativa desplazada, o al final de la última palabra en la frase interrogativa y antes del resto de la pregunta.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>al verbo en la pregunta como prefijos.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>al verbo en la pregunta como sufijos.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>al verbo en la pregunta, algunos como prefijos y otros como sufijos.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>al principio o final de la pregunta como clíticos, o al verbo en la pregunta como afijos.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/mainContCliticOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/mainYNCliticOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContCliticOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContCliticOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContCliticOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/mainContCliticOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContCliticOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContCliticOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>  Otros se unen ___</xsl:text>
<xsl:value-of select="//q/mainYNCliticOther" />  <xsl:text>.</xsl:text>
</xsl:if>                            </xsl:if>
                   </xsl:if>
</p>
 
               <xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<p>
<xsl:text>Los clíticos que marcan preguntas abiertas como cláusula principal son:</xsl:text>
</p>
</xsl:if>      
               <xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<example num="xQues.QuesContent.QuesContentMain.14">
<table border="1">
                     <tr>
                        <th>Clíticos de pregunta</th>
                        <th>Glosa</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/mainContCliticExample),'.','')" />
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
               <xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<p>
<xsl:text>Los afijoos que marcan preguntas abiertas como cláusula principal son:</xsl:text>
</p>
</xsl:if>      
               <xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<example num="xQues.QuesContent.QuesContentMain.18">
<table border="1">
                     <tr>
                        <th>Afijos de pregunta</th>
                        <th>Glosa</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/mainContAffixExample),'.','')" />
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
               
               <xsl:if test="normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/@mainCont)='yes'">
<p>
<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO'">
                     <xsl:text> Los indicadores o complementadores de pregunta </xsl:text>
<xsl:if test="normalize-space(//q/@mainContWord)='some' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>que se escriben como palabras independientes </xsl:text>
</xsl:if>
                     <xsl:text>se presentan </xsl:text>
                     <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='yes' and normalize-space(//q/mainContWordAfter/@checked)='no' and normalize-space(//q/mainContWordBoth/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>antes</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='no' and normalize-space(//q/mainContWordAfter/@checked)='yes' and normalize-space(//q/mainContWordBoth/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>después</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='no' and normalize-space(//q/mainContWordAfter/@checked)='no' and normalize-space(//q/mainContWordBoth/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='yes' and normalize-space(//q/mainContWordAfter/@checked)='yes' and normalize-space(//q/mainContWordBoth/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='yes' and normalize-space(//q/mainContWordAfter/@checked)='no' and normalize-space(//q/mainContWordBoth/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='no' and normalize-space(//q/mainContWordAfter/@checked)='yes' and normalize-space(//q/mainContWordBoth/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='yes' and normalize-space(//q/mainContWordAfter/@checked)='yes' and normalize-space(//q/mainContWordBoth/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContWordOther/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text> del resto de la pregunta.  </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='no' and normalize-space(//q/mainContWordAfter/@checked)='no' and normalize-space(//q/mainContWordBoth/@checked)='no' and normalize-space(//q/mainContWordOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/mainContWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='yes' and normalize-space(//q/mainContWordOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContWordAfter/@checked)='yes' and normalize-space(//q/mainContWordOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContWordBoth/@checked)='yes' and normalize-space(//q/mainContWordOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text> del resto de la pregunta y también pueden presentarse ___</xsl:text> <xsl:value-of select="//q/mainContWordOther" /> <xsl:text>. </xsl:text>
</xsl:if>
                  </xsl:if>
<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
                     <xsl:text> Los indicadores o complementadores de pregunta </xsl:text>
<xsl:if test="normalize-space(//q/@mainContWord)='some' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>que se escriben como palabras independientes </xsl:text>
</xsl:if>
                     <xsl:text>se presentan </xsl:text>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='yes' and normalize-space(//q/mainContVSOAfterWh/@checked)='no' and normalize-space(//q/mainContVSOEnd/@checked)='no'">
<xsl:text>antes de la frase interrogativa desplazada.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='no' and normalize-space(//q/mainContVSOAfterWh/@checked)='yes' and normalize-space(//q/mainContVSOEnd/@checked)='no'">
<xsl:text>inmediatamente después de la frase interrogativa desplazada.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='no' and normalize-space(//q/mainContVSOAfterWh/@checked)='no' and normalize-space(//q/mainContVSOEnd/@checked)='yes'">
<xsl:text>al final de la pregunta.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='yes' and normalize-space(//q/mainContVSOAfterWh/@checked)='yes' and normalize-space(//q/mainContVSOEnd/@checked)='no'">
<xsl:text>o antes o inmediatamente después de la frase interrogativa desplazada.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='yes' and normalize-space(//q/mainContVSOAfterWh/@checked)='no' and normalize-space(//q/mainContVSOEnd/@checked)='yes'">
<xsl:text>o antes de la frase interrogativa desplazada o al final de la pregunta.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='no' and normalize-space(//q/mainContVSOAfterWh/@checked)='yes' and normalize-space(//q/mainContVSOEnd/@checked)='yes'">
<xsl:text>o inmediatamente después de la frase interrogativa desplazada o al final de la pregunta.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='yes' and normalize-space(//q/mainContVSOAfterWh/@checked)='yes' and normalize-space(//q/mainContVSOEnd/@checked)='yes'">
<xsl:text>o antes o inmediatamente después de la frase interrogativa desplazada o al final de la pregunta.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='no' and normalize-space(//q/mainContVSOAfterWh/@checked)='no' and normalize-space(//q/mainContVSOEnd/@checked)='no' and normalize-space(//q/mainContVSOOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/mainContVSOOther" />
<xsl:text>.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='yes' and normalize-space(//q/mainContVSOOther/@checked)='yes' or normalize-space(//q/mainContVSOAfterWh/@checked)='yes' and normalize-space(//q/mainContVSOOther/@checked)='yes' or normalize-space(//q/mainContVSOEnd/@checked)='yes' and normalize-space(//q/mainContVSOOther/@checked)='yes'">
<xsl:text>  Otros se presentan  ___</xsl:text>
<xsl:value-of select="//q/mainContVSOOther" />
<xsl:text>.</xsl:text>
</xsl:if>
                  </xsl:if>
<xsl:text>Un indicador o complementador de pregunta </xsl:text>
<xsl:choose>
                     <xsl:when test="//q/@mainContRequired='yes'">es requerido en cada pregunta de respuesta abierta.</xsl:when>
                     <xsl:when test="//q/@mainContRequired='no'">es opcional en preguntas de respuesta abierta.</xsl:when>
                  </xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//q/@mainContRequired)='special'">
<xsl:text>no se usa cuando ___</xsl:text>
<xsl:value-of select="//q/mainContSpecialConditions" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:text> Estos indicadores o complementadores de pregunta son:</xsl:text>
</p>
</xsl:if>
               
               <xsl:if test="normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/@mainCont)='yes'">
<example num="xQues.QuesContent.QuesContentMain.22">
<table border="1">
                     <tr>
                        <th>Indicadores de pregunta</th>
                        <th>Glosa</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/mainContWordExample),'.','')" />
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
            </section3>
            <section3 id="sQuesContentEmb">
               <secTitle>Preguntas de respuesta abierta como cláusula subordinada</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>Algunos ejemplos en español de preguntas subordinadas que se muestran el desplazamiento hacia la izquierda que se requiere a una frase interrogativa son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sé quién golpeó el beísbol</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Me pregunto cuándo ella vendrá</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Preguntaré qué quiere el muchacho</langData>
<xsl:text>.</xsl:text>
</p>
               <p>
<xsl:text> Algunos ejemplos de preguntas de respuesta abierta como cláusula subordinada en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son: </xsl:text>
</p>
               <example num="xQues.QuesContent.QuesContentEmb.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/embContentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//q/embContentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/embContentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//q/embContentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQues.QuesContent.QuesContentEmb.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQues.QuesContent.QuesContentEmb.8.1</xsl:text>
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
                            
               <p>
<xsl:text>De acuerdo con los ejemplos, </xsl:text>
<xsl:choose>
                        <xsl:when test="//q/@embCont='no'">no hay indicador ni auxiliar que desplaza hacia la izquierda,</xsl:when>
                        <xsl:when test="//q/@embCont='noAux'">el movimiento de un auxiliar</xsl:when>
                       <xsl:when test="//q/@embCont='yes'">hay por lo menos un indicador o complementador de pregunta en las preguntas de respuesta abierta como cláusula subordinada.</xsl:when>
                    </xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embCont)='no'">
                        <xsl:text> solamente </xsl:text>
                        <xsl:choose>
                            <xsl:when test="//q/@contFront='no'">una diferencia en</xsl:when>
                            <xsl:when test="//q/@contFront='after'">el desplazamiento opcional de una frase interrogativa y posiblemente un cambio en</xsl:when>
                            <xsl:when test="//q/@contFront='before'">el desplazamiento hacia la izquierda de una frase interrogativa y posiblemente un cambio en</xsl:when>
                            <xsl:when test="//q/@contFront='unknown'">_______ de una frase interrogativa y posiblemente un cambio en</xsl:when>
                        </xsl:choose>
                        <xsl:text> la entonación o el tono u otra indicación que no es sintáctica.</xsl:text>
                    </xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embCont)='noAux'">
                        <xsl:text> al </xsl:text>
                        <xsl:choose>
                            <xsl:when test="//q/@embContAuxPos='before'">inicio</xsl:when>
                            <xsl:when test="//q/@embContAuxPos='after'">final</xsl:when>
                            <xsl:when test="//q/@embContAuxPos='unknown'">_______</xsl:when>
                       </xsl:choose>
                        <xsl:text> de la pregunta </xsl:text>
                        <xsl:choose>
                            <xsl:when test="//q/@embContAuxRequired='no'">es opcional</xsl:when>
                            <xsl:when test="//q/@embContAuxRequired='yes'">se requiere</xsl:when>
                           <xsl:when test="//q/@embContAuxRequired='object'">se requiere excepto cuando se cuestiona el sujeto</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="//q/@contFront='no'">.</xsl:when>
                            <xsl:when test="//q/@contFront='after'">.</xsl:when>
                            <xsl:when test="//q/@contFront='before'"> además del desplazamiento hacia la izquierda de una frase interrogativa.</xsl:when>
                        </xsl:choose>
                        <xsl:text> </xsl:text>
                    </xsl:if>
<xsl:if test="normalize-space(//q/@embCont)='yes'">
                     <xsl:if test="normalize-space(//q/@embContWord)='some' and normalize-space(//q/@embCont)='yes'">
<xsl:text> Algunos se escriben como palabras independientes pero otros se unen, </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text> Se escriben como palabras independientes. </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/@embContWord)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text> Se unen, </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/@embContWord)='no' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/@embCont)='yes'">
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como proclíticos, a la palabra inicial en la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como proclíticos, a la palabra inicial en la pregunta subordinada, o después de la frase interrogativa, a la palabra inicial en el resto de la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como proclíticos, a la palabra inicial en la pregunta subordinada, o  como enclíticos, a la última palabra en la frase interrogativa, antes del resto de la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como proclíticos, a la palabra inicial en la pregunta subordinada, o después de la frase interrogativa, a la palabra inicial en el resto de la pregunta subordinada, o  como enclíticos, a la última palabra en la frase interrogativa, antes del resto de la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como proclíticos, después de la frase interrogativa, a la palabra inicial en el resto de la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como enclíticos, a la última palabra en la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como enclíticos, a la última palabra en la pregunta subordinada, o como proclíticos, después de la frase interrogativa, a la palabra inicial en el resto de la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como enclíticos, a la última palabra en la pregunta subordinada o a la última palabra en la frase interrogativa, antes del resto de la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como enclíticos, a la última palabra en la pregunta subordinada o a la última palabra en la frase interrogativa, antes del resto de la pregunta subordinada, o como proclíticos, después de la frase interrogativa, a la palabra inicial en el resto de la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como enclíticos, a la última palabra en la frase interrogativa, antes del resto de la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como proclíticos, después de la frase interrogativa, a la palabra inicial en el resto de la pregunta subordinada, o como enclíticos, a la última palabra en la frase interrogativa, antes del resto de la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como clíticos, al principio de la palabra inicial en la pregunta subordinada o al final de la última palabra en la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como clíticos, al principio de la palabra inicial en la pregunta subordinada o al final de la última palabra en la pregunta subordinada, o después de la frase interrogativa, al principio de la palabra inicial en el resto de la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como clíticos, al principio de la palabra inicial en la pregunta subordinada o al final de la última palabra en la pregunta subordinada, o al final de la última palabra en la frase interrogativa, antes del resto de la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>como clíticos, al principio de la palabra inicial en la pregunta subordinada o al final de la última palabra en la pregunta subordinada, o después de la frase interrogativa, al principio de la palabra inicial en el resto de la pregunta subordinada, o al final de la última palabra en la frase interrogativa, antes del resto de la pregunta subordinada.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>al verbo en la pregunta subordinada como prefijos.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>al verbo en la pregunta subordinada como sufijos.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>al verbo en la pregunta, algunos como prefijos y otros como sufijos.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>al principio o final de la pregunta subordinada como clíticos, o al verbo en la pregunta subordinada como afijos.</xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/embContCliticOther/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/embYNCliticOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContCliticOther/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContCliticOther/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContCliticOther/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/embContCliticOther/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContCliticOther/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContCliticOther/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>  Otros se unen ___</xsl:text>
<xsl:value-of select="//q/embYNCliticOther" />  <xsl:text>.</xsl:text>
</xsl:if>                            </xsl:if>
                  </xsl:if>
</p>
               <xsl:if test="normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<p>
<xsl:text>Los clíticos que marcan preguntas como cláusula subordinada son:</xsl:text>
</p>
</xsl:if>      
               <xsl:if test="normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<example num="xQues.QuesContent.QuesContentEmb.14">
<table border="1">
                     <tr>
                        <th>Clíticos de pregunta</th>
                        <th>Glosa</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/embContCliticExample),'.','')" />
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
               <xsl:if test="normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<p>
<xsl:text>Los afijoos que marcan preguntas como cláusula subordinada son:</xsl:text>
</p>
</xsl:if>      
               <xsl:if test="normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<example num="xQues.QuesContent.QuesContentEmb.18">
<table border="1">
                     <tr>
                        <th>Afijos de pregunta</th>
                        <th>Glosa</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/embContAffixExample),'.','')" />
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
               
               <xsl:if test="normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/@embCont)='yes'">
<p>
<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO'">
                     <xsl:text> Los indicadores o complementizadores de pregunta subordinada </xsl:text>
<xsl:if test="normalize-space(//q/@embContWord)='some' and normalize-space(//q/@embCont)='yes'">
<xsl:text>que se escriben como palabras independientes </xsl:text>
</xsl:if>
                     <xsl:text>se presentan </xsl:text>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='yes' and normalize-space(//q/embContWordAfter/@checked)='no' and normalize-space(//q/embContWordBoth/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>antes</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='no' and normalize-space(//q/embContWordAfter/@checked)='yes' and normalize-space(//q/embContWordBoth/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>después</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='no' and normalize-space(//q/embContWordAfter/@checked)='no' and normalize-space(//q/embContWordBoth/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='yes' and normalize-space(//q/embContWordAfter/@checked)='yes' and normalize-space(//q/embContWordBoth/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='yes' and normalize-space(//q/embContWordAfter/@checked)='no' and normalize-space(//q/embContWordBoth/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='no' and normalize-space(//q/embContWordAfter/@checked)='yes' and normalize-space(//q/embContWordBoth/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='yes' and normalize-space(//q/embContWordAfter/@checked)='yes' and normalize-space(//q/embContWordBoth/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordOther/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text> del resto de la pregunta.  </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='no' and normalize-space(//q/embContWordAfter/@checked)='no' and normalize-space(//q/embContWordBoth/@checked)='no' and normalize-space(//q/embContWordOther/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/embContWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='yes' and normalize-space(//q/embContWordOther/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContWordAfter/@checked)='yes' and normalize-space(//q/embContWordOther/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContWordBoth/@checked)='yes' and normalize-space(//q/embContWordOther/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text> del resto de la pregunta subordinada y también pueden presentarse ___</xsl:text> <xsl:value-of select="//q/embContWordOther" /> <xsl:text>. </xsl:text>
</xsl:if>
                  </xsl:if>
<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
                     <xsl:text> Los indicadores o complementadores de pregunta subordinada </xsl:text>
<xsl:if test="normalize-space(//q/@embContWord)='some' and normalize-space(//q/@embCont)='yes'">
<xsl:text>que se escriben como palabras independientes </xsl:text>
</xsl:if>
                     <xsl:text>se presentan </xsl:text>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='yes' and normalize-space(//q/embContVSOAfterWh/@checked)='no' and normalize-space(//q/embContVSOEnd/@checked)='no'">
<xsl:text>antes de la frase interrogativa desplazada.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='no' and normalize-space(//q/embContVSOAfterWh/@checked)='yes' and normalize-space(//q/embContVSOEnd/@checked)='no'">
<xsl:text>inmediatamente después de la frase interrogativa desplazada.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='no' and normalize-space(//q/embContVSOAfterWh/@checked)='no' and normalize-space(//q/embContVSOEnd/@checked)='yes'">
<xsl:text>al final de la pregunta.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='yes' and normalize-space(//q/embContVSOAfterWh/@checked)='yes' and normalize-space(//q/embContVSOEnd/@checked)='no'">
<xsl:text>o antes o inmediatamente después de la frase interrogativa desplazada.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='yes' and normalize-space(//q/embContVSOAfterWh/@checked)='no' and normalize-space(//q/embContVSOEnd/@checked)='yes'">
<xsl:text>o antes de la frase interrogativa desplazada o al final de la pregunta.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='no' and normalize-space(//q/embContVSOAfterWh/@checked)='yes' and normalize-space(//q/embContVSOEnd/@checked)='yes'">
<xsl:text>o inmediatamente después de la frase interrogativa desplazada o al final de la pregunta.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='yes' and normalize-space(//q/embContVSOAfterWh/@checked)='yes' and normalize-space(//q/embContVSOEnd/@checked)='yes'">
<xsl:text>o antes o inmediatamente después de la frase interrogativa desplazada o al final de la pregunta.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='no' and normalize-space(//q/embContVSOAfterWh/@checked)='no' and normalize-space(//q/embContVSOEnd/@checked)='no' and normalize-space(//q/embContVSOOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/embContVSOOther" />
<xsl:text>.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='yes' and normalize-space(//q/embContVSOOther/@checked)='yes' or normalize-space(//q/embContVSOAfterWh/@checked)='yes' and normalize-space(//q/embContVSOOther/@checked)='yes' or normalize-space(//q/embContVSOEnd/@checked)='yes' and normalize-space(//q/embContVSOOther/@checked)='yes'">
<xsl:text>  Otros se presentan  ___</xsl:text>
<xsl:value-of select="//q/embContVSOOther" />
<xsl:text>.</xsl:text>
</xsl:if>
                  </xsl:if>
<xsl:text>Un indicador o complementador de pregunta subordinada </xsl:text>
<xsl:choose>
                     <xsl:when test="//q/@embContRequired='yes'">es requerido en cada pregunta subordinada de respuesta abierta.</xsl:when>
                     <xsl:when test="//q/@embContRequired='no'">es opcional en preguntas subordinadas de respuesta abierta.</xsl:when>
                  </xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//q/@embContRequired)='special'">
<xsl:text>no se usa cuando ___</xsl:text>
<xsl:value-of select="//q/embContSpecialConditions" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:text> Estos indicadores o complementadores son:</xsl:text>
</p>
</xsl:if>
               
               <xsl:if test="normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/@embCont)='yes'">
<example num="xQues.QuesContent.QuesContentEmb.22">
<table border="1">
                     <tr>
                        <th>Indicadores de pregunta</th>
                        <th>Glosa</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/embContWordExample),'.','')" />
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
            </section3>
        </section2>
    </section1>
    
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
   
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
   
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
  
   
      
      
      
      
      
   
      
         
         
         
         
         
      
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
   
   
      
   
   
      
   

   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
  
   
      
      
      
      
      
   
      
         
         
         
         
         
      
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
   

</xsl:template>
</xsl:stylesheet>
