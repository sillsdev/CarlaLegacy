<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="v">
	<section1 id="sV">
		<secTitle>Los verbos</secTitle>
                  <p>
<xsl:text>Los verbos expresan acciones, estados o emociones. Primero se tratan la flexión verbal y la concordancia de los verbos, y luego se presentan los paradigmas de algunos verbos. 
			   Las condiciones de cuando un sujeto es tácito se analizan en la sección </xsl:text>
<sectionRef sec="sIPProDrop" />
<xsl:text>, y los auxiliares se tratan en la sección 
			</xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>, y finalmente los verbos compuestos.  Los ejemplos de los verbos usados en oraciones básicas se encuentran en la sección 
			</xsl:text>
<sectionRef sec="sIP" />
<xsl:text>.  Las construcciones más complejas que incluyen verbos se tratan en las secciones </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text> - </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>.</xsl:text>
</p>
		<section2 id="sIPInfl">
			<secTitle>Flexión verbal</secTitle>
			<p>
<xsl:text>Los verbos y los auxiliares generalmente tienen flexión, es decir,  experimentan cambios en su morfología para expresar tiempo, aspecto o modo. A estos cambios se les conoce como ‘accidentes’. En la mayoría de los casos, estos accidentes se agregan como afijos, pero también pueden ser parte de verbos irregulares.</xsl:text>
</p>
			<p>
<xsl:text>Los siguientes accidentes de flexión se indican en los verbos y/o los auxiliares en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
			<example num="xV.IPInfl.8">
<table border="1">
					<tr>
					   <th>Accidente</th>
					   <th>Significado</th>
					   <th>Morfemas</th>
					</tr>
					<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//ip/presentTense),'.','')" />
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
					      <xsl:text>tiempo</xsl:text>
					   </td>
<td align="left">
					      <xsl:text>presente</xsl:text>
					   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
					      <xsl:text>tiempo</xsl:text>
					   </td>
<td align="left">
					      <xsl:text>presente</xsl:text>
					   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//ip/pastTense),'.','')" />
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
							<xsl:text>tiempo</xsl:text>
						</td>
<td align="left">
							<xsl:text>pasado</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>tiempo</xsl:text>
						</td>
<td align="left">
							<xsl:text>pasado</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//ip/futureTense),'.','')" />
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
							<xsl:text>tiempo</xsl:text>
						</td>
<td align="left">
							<xsl:text>futuro</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>tiempo</xsl:text>
						</td>
<td align="left">
							<xsl:text>futuro</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//ip/nonPastTense),'.','')" />
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
				         <xsl:text>tiempo</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>no pasado</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>tiempo</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>no pasado</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//ip/nonFutureTense),'.','')" />
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
				         <xsl:text>tiempo</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>no futuro</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>tiempo</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>no futuro</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//ip/otherTense),'.','')" />
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
							<xsl:text>tiempo</xsl:text>
						</td>
<td align="left">
							<xsl:text>ESCRIBA LA GLOSA</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>tiempo</xsl:text>
						</td>
<td align="left">
							<xsl:text>ESCRIBA LA GLOSA</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<xsl:variable name="sExampleValue6.2">
<xsl:value-of select="translate(string(//ip/completiveAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.2" select="string-length(normalize-space($sExampleValue6.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.2 != 0 and $sExampleValue6.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>aspecto</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>completivo</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>aspecto</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>completivo</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<xsl:variable name="sExampleValue7.2">
<xsl:value-of select="translate(string(//ip/contemplativeAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.2" select="string-length(normalize-space($sExampleValue7.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.2 != 0 and $sExampleValue7.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>aspecto</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>contemplativo</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>aspecto</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>contemplativo</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<xsl:variable name="sExampleValue8.2">
<xsl:value-of select="translate(string(//ip/contrafactualAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.2" select="string-length(normalize-space($sExampleValue8.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.2 != 0 and $sExampleValue8.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>aspecto</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>contrariamente al hecho</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>aspecto</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>contrariamente al hecho</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<xsl:variable name="sExampleValue9.2">
<xsl:value-of select="translate(string(//ip/continuativeAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.2" select="string-length(normalize-space($sExampleValue9.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.2 != 0 and $sExampleValue9.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>continuativo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>continuativo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<xsl:variable name="sExampleValue10.2">
<xsl:value-of select="translate(string(//ip/habitualAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10.2" select="string-length(normalize-space($sExampleValue10.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength10.2 != 0 and $sExampleValue10.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>habitual</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>habitual</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<xsl:variable name="sExampleValue11.2">
<xsl:value-of select="translate(string(//ip/imperfectAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11.2" select="string-length(normalize-space($sExampleValue11.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength11.2 != 0 and $sExampleValue11.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>imperfecto</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>imperfecto</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<xsl:variable name="sExampleValue12.2">
<xsl:value-of select="translate(string(//ip/imperfectiveAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12.2" select="string-length(normalize-space($sExampleValue12.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength12.2 != 0 and $sExampleValue12.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>aspecto</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>imperfectivo</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>aspecto</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>imperfectivo</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<xsl:variable name="sExampleValue13.2">
<xsl:value-of select="translate(string(//ip/incompletiveAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13.2" select="string-length(normalize-space($sExampleValue13.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength13.2 != 0 and $sExampleValue13.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>incompletivo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>incompletivo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<xsl:variable name="sExampleValue14.2">
<xsl:value-of select="translate(string(//ip/perfectAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14.2" select="string-length(normalize-space($sExampleValue14.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength14.2 != 0 and $sExampleValue14.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>aspecto</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>perfecto</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>aspecto</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>perfecto</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<xsl:variable name="sExampleValue15.2">
<xsl:value-of select="translate(string(//ip/perfectiveAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength15.2" select="string-length(normalize-space($sExampleValue15.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength15.2 != 0 and $sExampleValue15.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength15.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>perfectivo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>perfectivo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<xsl:variable name="sExampleValue16.2">
<xsl:value-of select="translate(string(//ip/potentialAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength16.2" select="string-length(normalize-space($sExampleValue16.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength16.2 != 0 and $sExampleValue16.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength16.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>potencial</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>potencial</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<xsl:variable name="sExampleValue17.2">
<xsl:value-of select="translate(string(//ip/progressiveAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength17.2" select="string-length(normalize-space($sExampleValue17.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength17.2 != 0 and $sExampleValue17.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength17.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>progresivo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>progresivo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<xsl:variable name="sExampleValue18.2">
<xsl:value-of select="translate(string(//ip/purposiveAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength18.2" select="string-length(normalize-space($sExampleValue18.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength18.2 != 0 and $sExampleValue18.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength18.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>propósito</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>propósito</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<xsl:variable name="sExampleValue19.2">
<xsl:value-of select="translate(string(//ip/stativeAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength19.2" select="string-length(normalize-space($sExampleValue19.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength19.2 != 0 and $sExampleValue19.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength19.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>estativo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
<td align="left">
							<xsl:text>estativo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<xsl:variable name="sExampleValue20.2">
<xsl:value-of select="translate(string(//ip/unrealAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength20.2" select="string-length(normalize-space($sExampleValue20.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength20.2 != 0 and $sExampleValue20.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength20.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>aspecto</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>irreal, no realidad</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>aspecto</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>irreal, no realidad</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<xsl:variable name="sExampleValue21.2">
<xsl:value-of select="translate(string(//ip/otherAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength21.2" select="string-length(normalize-space($sExampleValue21.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength21.2 != 0 and $sExampleValue21.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength21.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				   			<xsl:text>aspecto</xsl:text>
				   		</td>
<td align="left">
				   			<xsl:text>ESCRIBA LA GLOSA</xsl:text>
				   		</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				   			<xsl:text>aspecto</xsl:text>
				   		</td>
<td align="left">
				   			<xsl:text>ESCRIBA LA GLOSA</xsl:text>
				   		</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatDeclarative/@checked)='yes'">
<xsl:variable name="sExampleValue22.2">
<xsl:value-of select="translate(string(//ip/declarativeMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength22.2" select="string-length(normalize-space($sExampleValue22.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength22.2 != 0 and $sExampleValue22.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength22.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
<td align="left">
							<xsl:text>declarativo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
<td align="left">
							<xsl:text>declarativo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatIndicative/@checked)='yes'">
<xsl:variable name="sExampleValue23.2">
<xsl:value-of select="translate(string(//ip/indicativeMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength23.2" select="string-length(normalize-space($sExampleValue23.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength23.2 != 0 and $sExampleValue23.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength23.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>modo</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>indicativo</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>modo</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>indicativo</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatRealis/@checked)='yes'">
<xsl:variable name="sExampleValue24.2">
<xsl:value-of select="translate(string(//ip/realisMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength24.2" select="string-length(normalize-space($sExampleValue24.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength24.2 != 0 and $sExampleValue24.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength24.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>modo</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>realis</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>modo</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>realis</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatImperative/@checked)='yes'">
<xsl:variable name="sExampleValue25.2">
<xsl:value-of select="translate(string(//ip/imperativeMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength25.2" select="string-length(normalize-space($sExampleValue25.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength25.2 != 0 and $sExampleValue25.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue25.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue25.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength25.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
<td align="left">
							<xsl:text>imperativo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
<td align="left">
							<xsl:text>imperativo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatInterrogative/@checked)='yes'">
<xsl:variable name="sExampleValue26.2">
<xsl:value-of select="translate(string(//ip/interrogativeMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength26.2" select="string-length(normalize-space($sExampleValue26.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength26.2 != 0 and $sExampleValue26.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue26.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue26.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength26.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
<td align="left">
							<xsl:text>interrogativo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
<td align="left">
							<xsl:text>interrogativo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipinflFeatConditional/@checked)='yes'">
<xsl:variable name="sExampleValue27.2">
<xsl:value-of select="translate(string(//ip/conditionalMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength27.2" select="string-length(normalize-space($sExampleValue27.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength27.2 != 0 and $sExampleValue27.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue27.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue27.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength27.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>modo</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>condicional</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>modo</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>condicional</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<xsl:variable name="sExampleValue28.2">
<xsl:value-of select="translate(string(//ip/subjunctiveMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength28.2" select="string-length(normalize-space($sExampleValue28.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength28.2 != 0 and $sExampleValue28.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue28.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue28.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength28.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>modo</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>subjuntivo</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>modo</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>subjuntivo</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatIrrealis/@checked)='yes'">
<xsl:variable name="sExampleValue29.2">
<xsl:value-of select="translate(string(//ip/irrealisMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength29.2" select="string-length(normalize-space($sExampleValue29.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength29.2 != 0 and $sExampleValue29.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue29.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue29.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength29.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
<td align="left">
							<xsl:text>irrealis</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
<td align="left">
							<xsl:text>irrealis</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatOtherMood/@checked)='yes'">
<xsl:variable name="sExampleValue30.2">
<xsl:value-of select="translate(string(//ip/otherMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength30.2" select="string-length(normalize-space($sExampleValue30.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength30.2 != 0 and $sExampleValue30.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue30.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue30.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength30.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
<td align="left">
							<xsl:text>ESCRIBA LA GLOSA</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
<td align="left">
							<xsl:text>ESCRIBA LA GLOSA</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:variable name="sExampleValue31.2">
<xsl:value-of select="translate(string(//ip/witnessEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength31.2" select="string-length(normalize-space($sExampleValue31.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength31.2 != 0 and $sExampleValue31.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue31.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue31.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength31.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>testigo</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>testigo</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue32.2">
<xsl:value-of select="translate(string(//ip/nonwitnessEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength32.2" select="string-length(normalize-space($sExampleValue32.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength32.2 != 0 and $sExampleValue32.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue32.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue32.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength32.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>no testigo</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>no testigo</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue33.2">
<xsl:value-of select="translate(string(//ip/firsthandEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength33.2" select="string-length(normalize-space($sExampleValue33.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength33.2 != 0 and $sExampleValue33.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue33.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue33.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength33.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>de primera mano</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>de primera mano</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue34.2">
<xsl:value-of select="translate(string(//ip/secondhandEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength34.2" select="string-length(normalize-space($sExampleValue34.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength34.2 != 0 and $sExampleValue34.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue34.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue34.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength34.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>de segunda mano</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>de segunda mano</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue35.2">
<xsl:value-of select="translate(string(//ip/thirdhandEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength35.2" select="string-length(normalize-space($sExampleValue35.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength35.2 != 0 and $sExampleValue35.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue35.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue35.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength35.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>de tercera mano</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>de tercera mano</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue36.2">
<xsl:value-of select="translate(string(//ip/visualEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength36.2" select="string-length(normalize-space($sExampleValue36.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength36.2 != 0 and $sExampleValue36.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue36.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue36.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength36.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>visible</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>visible</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue37.2">
<xsl:value-of select="translate(string(//ip/auditoryEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength37.2" select="string-length(normalize-space($sExampleValue37.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength37.2 != 0 and $sExampleValue37.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue37.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue37.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength37.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>auditivo</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>auditivo</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue38.2">
<xsl:value-of select="translate(string(//ip/olfactoryEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength38.2" select="string-length(normalize-space($sExampleValue38.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength38.2 != 0 and $sExampleValue38.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue38.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue38.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength38.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>olfativo</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>olfativo</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue39.2">
<xsl:value-of select="translate(string(//ip/inferentialEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength39.2" select="string-length(normalize-space($sExampleValue39.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength39.2 != 0 and $sExampleValue39.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue39.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue39.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength39.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>inferencial</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>inferencial</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue40.2">
<xsl:value-of select="translate(string(//ip/reportativeEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength40.2" select="string-length(normalize-space($sExampleValue40.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength40.2 != 0 and $sExampleValue40.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue40.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue40.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength40.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>reportativo</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>reportativo</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue41.2">
<xsl:value-of select="translate(string(//ip/hearsayEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength41.2" select="string-length(normalize-space($sExampleValue41.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength41.2 != 0 and $sExampleValue41.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue41.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue41.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength41.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>rumores</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>rumores</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue42.2">
<xsl:value-of select="translate(string(//ip/quotativeEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength42.2" select="string-length(normalize-space($sExampleValue42.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength42.2 != 0 and $sExampleValue42.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue42.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue42.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength42.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>cuotativo</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>cuotativo</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue43.2">
<xsl:value-of select="translate(string(//ip/assumedEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength43.2" select="string-length(normalize-space($sExampleValue43.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength43.2 != 0 and $sExampleValue43.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue43.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue43.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength43.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>asumido</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>asumido</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue44.2">
<xsl:value-of select="translate(string(//ip/otherEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength44.2" select="string-length(normalize-space($sExampleValue44.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength44.2 != 0 and $sExampleValue44.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue44.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue44.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength44.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidencialidad</xsl:text>
</td>
<td align="left">
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:if test="normalize-space(//ip/ipInflFeatFinite/@checked)='yes'">
<xsl:variable name="sExampleValue45.2">
<xsl:value-of select="translate(string(//ip/finiteOther),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength45.2" select="string-length(normalize-space($sExampleValue45.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength45.2 != 0 and $sExampleValue45.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue45.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue45.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength45.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>otro</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>finito</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>otro</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>finito</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatMinusFinite/@checked)='yes'">
<xsl:variable name="sExampleValue46.2">
<xsl:value-of select="translate(string(//ip/nonfiniteOther),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength46.2" select="string-length(normalize-space($sExampleValue46.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength46.2 != 0 and $sExampleValue46.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue46.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue46.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength46.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>otro</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>no finito</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>otro</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>no finito</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatGerund/@checked)='yes'">
<xsl:variable name="sExampleValue47.2">
<xsl:value-of select="translate(string(//ip/gerundOther),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength47.2" select="string-length(normalize-space($sExampleValue47.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength47.2 != 0 and $sExampleValue47.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue47.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue47.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength47.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>otro</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>gerundio</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>otro</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>gerundio</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatParticiple/@checked)='yes'">
<xsl:variable name="sExampleValue48.2">
<xsl:value-of select="translate(string(//ip/participleOther),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength48.2" select="string-length(normalize-space($sExampleValue48.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength48.2 != 0 and $sExampleValue48.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue48.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue48.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength48.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>otro</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>participio</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>otro</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>participio</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatAntipassive/@checked)='yes'">
<xsl:variable name="sExampleValue49.2">
<xsl:value-of select="translate(string(//ip/apiveVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength49.2" select="string-length(normalize-space($sExampleValue49.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength49.2 != 0 and $sExampleValue49.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue49.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue49.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength49.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>antipasiva</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>antipasiva</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatApplicative/@checked)='yes'">
<xsl:variable name="sExampleValue50.2">
<xsl:value-of select="translate(string(//ip/applicativeVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength50.2" select="string-length(normalize-space($sExampleValue50.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength50.2 != 0 and $sExampleValue50.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue50.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue50.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength50.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>voz</xsl:text>
						</td>
<td align="left">
							<xsl:text>aplicativa</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>voz</xsl:text>
						</td>
<td align="left">
							<xsl:text>aplicativa</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatCausative/@checked)='yes'">
<xsl:variable name="sExampleValue51.2">
<xsl:value-of select="translate(string(//ip/causativeVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength51.2" select="string-length(normalize-space($sExampleValue51.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength51.2 != 0 and $sExampleValue51.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue51.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue51.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength51.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>causativa</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>causativa</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>	
				   <xsl:if test="normalize-space(//ip/ipInflFeatPassive/@checked)='yes'">
<xsl:variable name="sExampleValue52.2">
<xsl:value-of select="translate(string(//ip/passiveVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength52.2" select="string-length(normalize-space($sExampleValue52.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength52.2 != 0 and $sExampleValue52.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue52.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue52.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength52.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>voz</xsl:text>
						</td>
<td align="left">
							<xsl:text>pasiva</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>voz</xsl:text>
						</td>
<td align="left">
							<xsl:text>pasiva</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatActorVoice/@checked)='yes'">
<xsl:variable name="sExampleValue53.2">
<xsl:value-of select="translate(string(//ip/actorVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength53.2" select="string-length(normalize-space($sExampleValue53.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength53.2 != 0 and $sExampleValue53.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue53.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue53.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength53.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>activa</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>activa</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatDativeVoice/@checked)='yes'">
<xsl:variable name="sExampleValue54.2">
<xsl:value-of select="translate(string(//ip/dativeVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength54.2" select="string-length(normalize-space($sExampleValue54.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength54.2 != 0 and $sExampleValue54.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue54.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue54.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength54.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>de dativo</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>de dativo</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatGoalVoice/@checked)='yes'">
<xsl:variable name="sExampleValue55.2">
<xsl:value-of select="translate(string(//ip/goalVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength55.2" select="string-length(normalize-space($sExampleValue55.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength55.2 != 0 and $sExampleValue55.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue55.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue55.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength55.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>de meta</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>de meta</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatInstrumentalVoice/@checked)='yes'">
<xsl:variable name="sExampleValue56.2">
<xsl:value-of select="translate(string(//ip/instrumentalVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength56.2" select="string-length(normalize-space($sExampleValue56.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength56.2 != 0 and $sExampleValue56.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue56.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue56.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength56.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>de instrumento</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>de instrumento</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatLocativeVoice/@checked)='yes'">
<xsl:variable name="sExampleValue57.2">
<xsl:value-of select="translate(string(//ip/locativeVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength57.2" select="string-length(normalize-space($sExampleValue57.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength57.2 != 0 and $sExampleValue57.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue57.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue57.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength57.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>de locativo</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>de locativo</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatObjectVoice/@checked)='yes'">
<xsl:variable name="sExampleValue58.2">
<xsl:value-of select="translate(string(//ip/objectVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength58.2" select="string-length(normalize-space($sExampleValue58.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength58.2 != 0 and $sExampleValue58.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue58.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue58.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength58.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>de objeto</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voz</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>de objeto</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatOtherVoice/@checked)='yes'">
<xsl:variable name="sExampleValue59.2">
<xsl:value-of select="translate(string(//ip/otherVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength59.2" select="string-length(normalize-space($sExampleValue59.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength59.2 != 0 and $sExampleValue59.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue59.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue59.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength59.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>voz</xsl:text>
						</td>
<td align="left">
							<xsl:text>ESCRIBA LA GLOSA</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>voz</xsl:text>
						</td>
<td align="left">
							<xsl:text>ESCRIBA LA GLOSA</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				</table>
</example>
		</section2>
		<section2 id="sIPAgr">
			<secTitle>Concordancia verbal</secTitle>
		   <p>
<xsl:text>Los verbos y los auxiliares también pueden sufrir cambios para expresar concordancia con el sujeto, y a veces también con el objeto directo. La mayoría de los cambios o accidentes se agregan como afijos o clíticos pronominales que pueden unirse con el verbo. </xsl:text>
<xsl:if test="normalize-space(//typology/@classifier)!='no'">
<xsl:text>La concordancia de clase se explica en la sección </xsl:text>
<sectionRef sec="sClassifiers" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
			<p>
<xsl:text>Las siguientes accidentes de concordancia se indican en verbos y/o auxiliares en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
			<example num="xV.IPAgr.8">
<table border="1">
					<tr>
					   <th>Accidente</th>
					   <th>Significado</th>
					   <th>Morfemas</th>
					</tr>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstSubject/@checked)='yes'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//ip/firstSubjectPerson),'.','')" />
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
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona sujeto</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona sujeto</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstObject/@checked)='yes'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//ip/firstObjectPerson),'.','')" />
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
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona objeto</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona objeto</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstErgative/@checked)='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//ip/firstErgativePerson),'.','')" />
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
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona ergativo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona ergativo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//ip/firstAbsolutivePerson),'.','')" />
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
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona absolutivo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona absolutivo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveSubject/@checked)='yes'">
<xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//ip/firstExclusiveSubjectPerson),'.','')" />
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
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona exclusivo sujeto</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona exclusivo sujeto</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveObject/@checked)='yes'">
<xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//ip/firstExclusiveObjectPerson),'.','')" />
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
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona exclusivo objeto</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona exclusivo objeto</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveErgative/@checked)='yes'">
<xsl:variable name="sExampleValue6.2">
<xsl:value-of select="translate(string(//ip/firstExclusiveErgativePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.2" select="string-length(normalize-space($sExampleValue6.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.2 != 0 and $sExampleValue6.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona exclusivo ergativo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona exclusivo ergativo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue7.2">
<xsl:value-of select="translate(string(//ip/firstExclusiveAbsolutivePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.2" select="string-length(normalize-space($sExampleValue7.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.2 != 0 and $sExampleValue7.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona exclusivo absolutivo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona exclusivo absolutivo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveSubject/@checked)='yes'">
<xsl:variable name="sExampleValue8.2">
<xsl:value-of select="translate(string(//ip/firstInclusiveSubjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.2" select="string-length(normalize-space($sExampleValue8.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.2 != 0 and $sExampleValue8.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona inclusivo sujeto</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona inclusivo sujeto</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveObject/@checked)='yes'">
<xsl:variable name="sExampleValue9.2">
<xsl:value-of select="translate(string(//ip/firstInclusiveObjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.2" select="string-length(normalize-space($sExampleValue9.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.2 != 0 and $sExampleValue9.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona inclusivo objeto</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona inclusivo objeto</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveErgative/@checked)='yes'">
<xsl:variable name="sExampleValue10.2">
<xsl:value-of select="translate(string(//ip/firstInclusiveErgativePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10.2" select="string-length(normalize-space($sExampleValue10.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength10.2 != 0 and $sExampleValue10.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona inclusivo ergativo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona inclusivo ergativo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue11.2">
<xsl:value-of select="translate(string(//ip/firstInclusiveAbsolutivePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11.2" select="string-length(normalize-space($sExampleValue11.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength11.2 != 0 and $sExampleValue11.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona inclusivo absolutivo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>primera persona inclusivo absolutivo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondSubject/@checked)='yes'">
<xsl:variable name="sExampleValue12.2">
<xsl:value-of select="translate(string(//ip/secondSubjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12.2" select="string-length(normalize-space($sExampleValue12.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength12.2 != 0 and $sExampleValue12.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>segunda persona sujeto</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>segunda persona sujeto</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondObject/@checked)='yes'">
<xsl:variable name="sExampleValue13.2">
<xsl:value-of select="translate(string(//ip/secondObjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13.2" select="string-length(normalize-space($sExampleValue13.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength13.2 != 0 and $sExampleValue13.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>segunda persona objeto</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>segunda persona objeto</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondErgative/@checked)='yes'">
<xsl:variable name="sExampleValue14.2">
<xsl:value-of select="translate(string(//ip/secondErgativePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14.2" select="string-length(normalize-space($sExampleValue14.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength14.2 != 0 and $sExampleValue14.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>segunda persona ergativo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>segunda persona ergativo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue15.2">
<xsl:value-of select="translate(string(//ip/secondAbsolutivePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength15.2" select="string-length(normalize-space($sExampleValue15.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength15.2 != 0 and $sExampleValue15.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength15.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>segunda persona absolutivo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>segunda persona absolutivo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdSubject/@checked)='yes'">
<xsl:variable name="sExampleValue16.2">
<xsl:value-of select="translate(string(//ip/thirdSubjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength16.2" select="string-length(normalize-space($sExampleValue16.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength16.2 != 0 and $sExampleValue16.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength16.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>tercera persona sujeto</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>tercera persona sujeto</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdObject/@checked)='yes'">
<xsl:variable name="sExampleValue17.2">
<xsl:value-of select="translate(string(//ip/thirdObjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength17.2" select="string-length(normalize-space($sExampleValue17.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength17.2 != 0 and $sExampleValue17.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength17.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>tercera persona objeto</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>tercera persona objeto</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdErgative/@checked)='yes'">
<xsl:variable name="sExampleValue18.2">
<xsl:value-of select="translate(string(//ip/thirdErgativePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength18.2" select="string-length(normalize-space($sExampleValue18.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength18.2 != 0 and $sExampleValue18.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength18.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>tercera persona ergativo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>tercera persona ergativo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue19.2">
<xsl:value-of select="translate(string(//ip/thirdAbsolutivePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength19.2" select="string-length(normalize-space($sExampleValue19.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength19.2 != 0 and $sExampleValue19.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength19.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>tercera persona absolutivo</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
<td align="left">
						   <xsl:text>tercera persona absolutivo</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularSubject/@checked)='yes'">
<xsl:variable name="sExampleValue20.2">
<xsl:value-of select="translate(string(//ip/singularSubjectNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength20.2" select="string-length(normalize-space($sExampleValue20.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength20.2 != 0 and $sExampleValue20.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength20.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto singular</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto singular</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularObject/@checked)='yes'">
<xsl:variable name="sExampleValue21.2">
<xsl:value-of select="translate(string(//ip/singularObjectNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength21.2" select="string-length(normalize-space($sExampleValue21.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength21.2 != 0 and $sExampleValue21.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength21.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto singular</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto singular</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularErgative/@checked)='yes'">
<xsl:variable name="sExampleValue22.2">
<xsl:value-of select="translate(string(//ip/singularErgativeNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength22.2" select="string-length(normalize-space($sExampleValue22.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength22.2 != 0 and $sExampleValue22.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength22.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo singular</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo singular</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue23.2">
<xsl:value-of select="translate(string(//ip/singularAbsolutiveNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength23.2" select="string-length(normalize-space($sExampleValue23.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength23.2 != 0 and $sExampleValue23.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength23.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo singular</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo singular</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualSubject/@checked)='yes'">
<xsl:variable name="sExampleValue24.2">
<xsl:value-of select="translate(string(//ip/dualSubjectNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength24.2" select="string-length(normalize-space($sExampleValue24.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength24.2 != 0 and $sExampleValue24.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength24.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto dual</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto dual</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualObject/@checked)='yes'">
<xsl:variable name="sExampleValue25.2">
<xsl:value-of select="translate(string(//ip/dualObjectNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength25.2" select="string-length(normalize-space($sExampleValue25.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength25.2 != 0 and $sExampleValue25.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue25.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue25.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength25.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto dual</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto dual</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualErgative/@checked)='yes'">
<xsl:variable name="sExampleValue26.2">
<xsl:value-of select="translate(string(//ip/dualErgativeNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength26.2" select="string-length(normalize-space($sExampleValue26.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength26.2 != 0 and $sExampleValue26.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue26.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue26.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength26.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo dual</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo dual</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue27.2">
<xsl:value-of select="translate(string(//ip/dualAbsolutiveNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength27.2" select="string-length(normalize-space($sExampleValue27.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength27.2 != 0 and $sExampleValue27.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue27.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue27.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength27.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo dual</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo dual</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralSubject/@checked)='yes'">
<xsl:variable name="sExampleValue28.2">
<xsl:value-of select="translate(string(//ip/pluralSubjectNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength28.2" select="string-length(normalize-space($sExampleValue28.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength28.2 != 0 and $sExampleValue28.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue28.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue28.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength28.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto plural</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto plural</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralObject/@checked)='yes'">
<xsl:variable name="sExampleValue29.2">
<xsl:value-of select="translate(string(//ip/pluralObjectNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength29.2" select="string-length(normalize-space($sExampleValue29.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength29.2 != 0 and $sExampleValue29.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue29.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue29.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength29.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto plural</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto plural</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralErgative/@checked)='yes'">
<xsl:variable name="sExampleValue30.2">
<xsl:value-of select="translate(string(//ip/pluralErgativeNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength30.2" select="string-length(normalize-space($sExampleValue30.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength30.2 != 0 and $sExampleValue30.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue30.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue30.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength30.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo plural</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo plural</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue31.2">
<xsl:value-of select="translate(string(//ip/pluralAbsolutiveNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength31.2" select="string-length(normalize-space($sExampleValue31.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength31.2 != 0 and $sExampleValue31.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue31.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue31.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength31.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo plural</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>número</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo plural</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineSubject/@checked)='yes'">
<xsl:variable name="sExampleValue32.2">
<xsl:value-of select="translate(string(//ip/masculineSubjectGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength32.2" select="string-length(normalize-space($sExampleValue32.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength32.2 != 0 and $sExampleValue32.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue32.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue32.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength32.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto masculino</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto masculino</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineObject/@checked)='yes'">
<xsl:variable name="sExampleValue33.2">
<xsl:value-of select="translate(string(//ip/masculineObjectGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength33.2" select="string-length(normalize-space($sExampleValue33.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength33.2 != 0 and $sExampleValue33.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue33.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue33.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength33.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto masculino</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto masculino</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineErgative/@checked)='yes'">
<xsl:variable name="sExampleValue34.2">
<xsl:value-of select="translate(string(//ip/masculineErgativeGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength34.2" select="string-length(normalize-space($sExampleValue34.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength34.2 != 0 and $sExampleValue34.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue34.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue34.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength34.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo masculino</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo masculino</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue35.2">
<xsl:value-of select="translate(string(//ip/masculineErgativeGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength35.2" select="string-length(normalize-space($sExampleValue35.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength35.2 != 0 and $sExampleValue35.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue35.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue35.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength35.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo masculino</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo masculino</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineSubject/@checked)='yes'">
<xsl:variable name="sExampleValue36.2">
<xsl:value-of select="translate(string(//ip/feminineSubjectGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength36.2" select="string-length(normalize-space($sExampleValue36.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength36.2 != 0 and $sExampleValue36.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue36.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue36.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength36.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto feminino</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto feminino</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineObject/@checked)='yes'">
<xsl:variable name="sExampleValue37.2">
<xsl:value-of select="translate(string(//ip/feminineObjectGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength37.2" select="string-length(normalize-space($sExampleValue37.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength37.2 != 0 and $sExampleValue37.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue37.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue37.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength37.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto feminino</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto feminino</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineErgative/@checked)='yes'">
<xsl:variable name="sExampleValue38.2">
<xsl:value-of select="translate(string(//ip/feminineErgativeGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength38.2" select="string-length(normalize-space($sExampleValue38.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength38.2 != 0 and $sExampleValue38.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue38.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue38.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength38.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo feminino</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo feminino</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue39.2">
<xsl:value-of select="translate(string(//ip/feminineAbsolutiveGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength39.2" select="string-length(normalize-space($sExampleValue39.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength39.2 != 0 and $sExampleValue39.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue39.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue39.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength39.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo feminino</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo feminino</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterSubject/@checked)='yes'">
<xsl:variable name="sExampleValue40.2">
<xsl:value-of select="translate(string(//ip/neuterSubjectGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength40.2" select="string-length(normalize-space($sExampleValue40.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength40.2 != 0 and $sExampleValue40.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue40.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue40.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength40.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto neutral</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto neutral</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterObject/@checked)='yes'">
<xsl:variable name="sExampleValue41.2">
<xsl:value-of select="translate(string(//ip/neuterObjectGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength41.2" select="string-length(normalize-space($sExampleValue41.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength41.2 != 0 and $sExampleValue41.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue41.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue41.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength41.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto neutral</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto neutral</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterErgative/@checked)='yes'">
<xsl:variable name="sExampleValue42.2">
<xsl:value-of select="translate(string(//ip/neuterErgativeGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength42.2" select="string-length(normalize-space($sExampleValue42.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength42.2 != 0 and $sExampleValue42.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue42.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue42.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength42.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo neutral</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo neutral</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue43.2">
<xsl:value-of select="translate(string(//ip/neuterAbsolutiveGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength43.2" select="string-length(normalize-space($sExampleValue43.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength43.2 != 0 and $sExampleValue43.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue43.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue43.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength43.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo neutral</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
						   <xsl:text>género</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo neutral</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateSubject/@checked)='yes'">
<xsl:variable name="sExampleValue44.2">
<xsl:value-of select="translate(string(//ip/animateSubjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength44.2" select="string-length(normalize-space($sExampleValue44.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength44.2 != 0 and $sExampleValue44.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue44.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue44.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength44.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto animado</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto animado</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateObject/@checked)='yes'">
<xsl:variable name="sExampleValue45.2">
<xsl:value-of select="translate(string(//ip/animateObjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength45.2" select="string-length(normalize-space($sExampleValue45.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength45.2 != 0 and $sExampleValue45.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue45.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue45.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength45.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto animado</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto animado</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateErgative/@checked)='yes'">
<xsl:variable name="sExampleValue46.2">
<xsl:value-of select="translate(string(//ip/animateErgativeAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength46.2" select="string-length(normalize-space($sExampleValue46.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength46.2 != 0 and $sExampleValue46.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue46.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue46.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength46.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo animado</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo animado</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue47.2">
<xsl:value-of select="translate(string(//ip/animateAbsolutiveAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength47.2" select="string-length(normalize-space($sExampleValue47.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength47.2 != 0 and $sExampleValue47.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue47.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue47.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength47.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo animado</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo animado</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateSubject/@checked)='yes'">
<xsl:variable name="sExampleValue48.2">
<xsl:value-of select="translate(string(//ip/inanimateSubjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength48.2" select="string-length(normalize-space($sExampleValue48.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength48.2 != 0 and $sExampleValue48.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue48.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue48.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength48.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto inanimado</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto inanimado</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateObject/@checked)='yes'">
<xsl:variable name="sExampleValue49.2">
<xsl:value-of select="translate(string(//ip/inanimateObjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength49.2" select="string-length(normalize-space($sExampleValue49.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength49.2 != 0 and $sExampleValue49.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue49.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue49.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength49.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto inanimado</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto inanimado</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateErgative/@checked)='yes'">
<xsl:variable name="sExampleValue50.2">
<xsl:value-of select="translate(string(//ip/inanimateErgativeAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength50.2" select="string-length(normalize-space($sExampleValue50.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength50.2 != 0 and $sExampleValue50.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue50.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue50.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength50.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo inanimado</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo inanimado</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue51.2">
<xsl:value-of select="translate(string(//ip/inanimateAbsolutiveAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength51.2" select="string-length(normalize-space($sExampleValue51.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength51.2 != 0 and $sExampleValue51.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue51.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue51.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength51.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo inanimado</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo inanimado</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanSubject/@checked)='yes'">
<xsl:variable name="sExampleValue52.2">
<xsl:value-of select="translate(string(//ip/humanSubjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength52.2" select="string-length(normalize-space($sExampleValue52.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength52.2 != 0 and $sExampleValue52.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue52.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue52.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength52.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto humano</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto humano</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanObject/@checked)='yes'">
<xsl:variable name="sExampleValue53.2">
<xsl:value-of select="translate(string(//ip/humanObjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength53.2" select="string-length(normalize-space($sExampleValue53.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength53.2 != 0 and $sExampleValue53.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue53.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue53.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength53.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto humano</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto humano</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanErgative/@checked)='yes'">
<xsl:variable name="sExampleValue54.2">
<xsl:value-of select="translate(string(//ip/humanErgativeAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength54.2" select="string-length(normalize-space($sExampleValue54.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength54.2 != 0 and $sExampleValue54.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue54.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue54.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength54.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo humano</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo humano</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue55.2">
<xsl:value-of select="translate(string(//ip/humanAbsolutiveAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength55.2" select="string-length(normalize-space($sExampleValue55.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength55.2 != 0 and $sExampleValue55.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue55.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue55.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength55.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo humano</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo humano</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanSubject/@checked)='yes'">
<xsl:variable name="sExampleValue56.2">
<xsl:value-of select="translate(string(//ip/nonhumanSubjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength56.2" select="string-length(normalize-space($sExampleValue56.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength56.2 != 0 and $sExampleValue56.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue56.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue56.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength56.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto no humano</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujeto no humano</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanObject/@checked)='yes'">
<xsl:variable name="sExampleValue57.2">
<xsl:value-of select="translate(string(//ip/nonhumanObjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength57.2" select="string-length(normalize-space($sExampleValue57.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength57.2 != 0 and $sExampleValue57.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue57.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue57.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength57.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto no humano</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>objeto no humano</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanErgative/@checked)='yes'">
<xsl:variable name="sExampleValue58.2">
<xsl:value-of select="translate(string(//ip/nonhumanErgativeAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength58.2" select="string-length(normalize-space($sExampleValue58.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength58.2 != 0 and $sExampleValue58.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue58.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue58.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength58.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo no humano</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>ergativo no humano</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue59.2">
<xsl:value-of select="translate(string(//ip/nonhumanAbsolutiveAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength59.2" select="string-length(normalize-space($sExampleValue59.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength59.2 != 0 and $sExampleValue59.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue59.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue59.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength59.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo no humano</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacidad</xsl:text>
						</td>
<td align="left">
							<xsl:text>absolutivo no humano</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				</table>
</example>
		</section2>
	   	   <section2 id="sVerbParadigms">
	      <secTitle>Paradigmas de verbos</secTitle>
	   	      <p>
<xsl:text>Los paradigmas muestran algunos de los cambios en algunos verbos específicos  cuando se añaden los morfemas para flexión y concordancia.  Algunos verbos son regulares y otros son irregulares.</xsl:text>
</p>
	  <section3 id="sVerbParadigmsRegular">
	     <secTitle>Paradigmas de algunos verbos regulares</secTitle>
	  	<p>
<xsl:text>Aquí se presentan los paradigmas de cuatro verbos regulares:   </xsl:text>
<object type="tComment"> Usted tiene que escibir la forma en cada celda aquí.  Puede cambiar uno o más de los verbos si estos que se incluyen no son regulares en su lengua.  
	  		<xsl:choose>
	  			<xsl:when test="//pron/@dependentPron='yes'"> Puede eliminar algunas columnas si el cuadro está muy grande en el documento exportado como pdf.</xsl:when>
	  			<xsl:when test="//pron/@dependentPron='no'"> Puesto que su lengua no hace cambios en el verbo para sujetos de diferentes personas, los paradigmas son muy simples. Quizá quiera añadir algunas columnas para los cambios que están marcados en los verbos, tales como los modos o sujetos plurales.</xsl:when>
	  		</xsl:choose>
</object>
</p>
	  	<xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.6">
<table border="1">
	  			<caption>
<xsl:text>Paradigma del verbo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘hablar’</langData>
</caption>
	  			<tr>
	  				<th>Tiempo / Aspecto</th>
	  				<th>Forma de verbo</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Otro aspecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  		</table>
</tablenumbered>
</xsl:if>
	  	
	  	<xsl:if test="normalize-space(//pron/@pronounNumber)='no' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.8">
<table border="1">
	           <caption>
<xsl:text>Paradigma del verbo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘hablar’</langData>
</caption>
	           <tr>
	              <th>Sujeto</th>
	              <th>Primera</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusiva</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusiva</th>
</xsl:if>
	              <th>Segunda</th>
	              <th>Tercera</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro aspecto</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
	     <xsl:if test="normalize-space(//pron/@pronounNumber)='yes' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.10">
<table border="1">
	           <caption>
<xsl:text>Paradigma del verbo que significa  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘hablar’</langData>
</caption>
	           <tr>
	              <th>Sujeto</th>
	              <th>Primera Sg</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Primera Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Primera Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>Primera Pl</th>
</xsl:if>
	              <th>Segunda Sg</th>
	              <th>Segunda Pl</th>
	              <th>Tercera Sg</th>
	              <th>Tercera Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>

	  	<xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.12">
<table border="1">
	  			<caption>
<xsl:text>Paradigma del verbo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘comer’</langData>
</caption>
	  			<tr>
	  				<th>Tiempo / Aspecto</th>
	  				<th>Forma de verbo</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Otro aspecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  		</table>
</tablenumbered>
</xsl:if>
	  	
	  	<xsl:if test="normalize-space(//pron/@pronounNumber)='no' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.14">
<table border="1">
	           <caption>
<xsl:text>Paradigma del verbo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘comer’</langData>
</caption>
	           <tr>
	              <th>Sujeto</th>
	              <th>Primera</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusiva</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusiva</th>
</xsl:if>
	              <th>Segunda</th>
	              <th>Tercera</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro aspecto</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
	     <xsl:if test="normalize-space(//pron/@pronounNumber)='yes' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.16">
<table border="1">
	           <caption>
<xsl:text>Paradigma del verbo que significa  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘comer’</langData>
</caption>
	           <tr>
	              <th>Sujeto</th>
	              <th>Primera Sg</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Primera Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Primera Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>Primera Pl</th>
</xsl:if>
	              <th>Segunda Sg</th>
	              <th>Segunda Pl</th>
	              <th>Tercera Sg</th>
	              <th>Tercera Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	  	<xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.18">
<table border="1">
	  			<caption>
<xsl:text>Paradigma del verbo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘vivir’</langData>
</caption>
	  			<tr>
	  				<th>Tiempo / Aspecto</th>
	  				<th>Forma de verbo</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Otro aspecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  		</table>
</tablenumbered>
</xsl:if>
	  	
	  	<xsl:if test="normalize-space(//pron/@pronounNumber)='no' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.20">
<table border="1">
	           <caption>
<xsl:text>Paradigma del verbo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘vivir’</langData>
</caption>
	           <tr>
	              <th>Sujeto</th>
	              <th>Primera</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusiva</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusiva</th>
</xsl:if>
	              <th>Segunda</th>
	              <th>Tercera</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro aspecto</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
	     <xsl:if test="normalize-space(//pron/@pronounNumber)='yes' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.22">
<table border="1">
	           <caption>
<xsl:text>Paradigma del verbo que significa  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘vivir’</langData>
</caption>
	           <tr>
	              <th>Sujeto</th>
	              <th>Primera Sg</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Primera Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Primera Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>Primera Pl</th>
</xsl:if>
	              <th>Segunda Sg</th>
	              <th>Segunda Pl</th>
	              <th>Tercera Sg</th>
	              <th>Tercera Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	  	<xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.24">
<table border="1">
	  			<caption>
<xsl:text>Paradigma del verbo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘ver’</langData>
</caption>
	  			<tr>
	  				<th>Tiempo / Aspecto</th>
	  				<th>Forma de verbo</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Otro aspecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  		</table>
</tablenumbered>
</xsl:if>
	  	
	  	<xsl:if test="normalize-space(//pron/@pronounNumber)='no' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.26">
<table border="1">
	           <caption>
<xsl:text>Paradigma del verbo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘ver’</langData>
</caption>
	           <tr>
	              <th>Sujeto</th>
	              <th>Primera</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusiva</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusiva</th>
</xsl:if>
	              <th>Segunda</th>
	              <th>Tercera</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro aspecto</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
	     <xsl:if test="normalize-space(//pron/@pronounNumber)='yes' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.28">
<table border="1">
	           <caption>
<xsl:text>Paradigma del verbo que significa  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘ver’</langData>
</caption>
	           <tr>
	              <th>Sujeto</th>
	              <th>Primera Sg</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Primera Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Primera Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>Primera Pl</th>
</xsl:if>
	              <th>Segunda Sg</th>
	              <th>Segunda Pl</th>
	              <th>Tercera Sg</th>
	              <th>Tercera Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>

	  </section3>
	   	      <section3 id="sVerbParadigmsIrregular">
	   	         <secTitle>Paradigmas de algunos verbos irregulares</secTitle>
	   	      	<p>
<xsl:text>A continuación los paradigmas de tres verbos irregulares:  </xsl:text>
<object type="tComment"> Usted tiene que escribir la forma en cada celda aquí.  Puede cambiar uno o más de los verbos si los estos no se usan o no son irregulares en su lengua. Nótese que ‘venir’ puede ser ‘ir a lugar conocido’ e ‘ir’ puede ser ‘ir a lugar no conocido’ o algo similar en su lengua.  
	   	      		<xsl:choose>
	   	      			<xsl:when test="//pron/@dependentPron='yes'"> Puede eliminar algunas columnas si el cuadro está muy grande en el documento exportado como pdf.</xsl:when>
	   	      			<xsl:when test="//pron/@dependentPron='no'"> Puesto que su lengua no hace cambios en el verbo para sujetos de diferentes personas, los paradigmas son muy simples. Quizá quiera añadir algunas columnas para los cambios que están marcados en los verbos, tales como los modos o sujetos plurales.</xsl:when>
	   	      		</xsl:choose>
</object>
</p>
	   	         
	  	<xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.6">
<table border="1">
	  			<caption>
<xsl:text>Paradigma del verbo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘ser/estar’</langData>
</caption>
	  			<tr>
	  				<th>Tiempo / Aspecto</th>
	  				<th>Forma de verbo</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Otro aspecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  		</table>
</tablenumbered>
</xsl:if>
	  	
	  	<xsl:if test="normalize-space(//pron/@pronounNumber)='no' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.8">
<table border="1">
	           <caption>
<xsl:text>Paradigma del verbo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘ser/estar’</langData>
</caption>
	           <tr>
	              <th>Sujeto</th>
	              <th>Primera</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusiva</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusiva</th>
</xsl:if>
	              <th>Segunda</th>
	              <th>Tercera</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro aspecto</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
	     <xsl:if test="normalize-space(//pron/@pronounNumber)='yes' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.10">
<table border="1">
	           <caption>
<xsl:text>Paradigma del verbo que significa  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘ser/estar’</langData>
</caption>
	           <tr>
	              <th>Sujeto</th>
	              <th>Primera Sg</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Primera Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Primera Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>Primera Pl</th>
</xsl:if>
	              <th>Segunda Sg</th>
	              <th>Segunda Pl</th>
	              <th>Tercera Sg</th>
	              <th>Tercera Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	  	<xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.12">
<table border="1">
	  			<caption>
<xsl:text>Paradigma del verbo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘venir’</langData>
</caption>
	  			<tr>
	  				<th>Tiempo / Aspecto</th>
	  				<th>Forma de verbo</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Otro aspecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  		</table>
</tablenumbered>
</xsl:if>
	  	
	  	<xsl:if test="normalize-space(//pron/@pronounNumber)='no' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.14">
<table border="1">
	           <caption>
<xsl:text>Paradigma del verbo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘venir’</langData>
</caption>
	           <tr>
	              <th>Sujeto</th>
	              <th>Primera</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusiva</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusiva</th>
</xsl:if>
	              <th>Segunda</th>
	              <th>Tercera</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro aspecto</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
	     <xsl:if test="normalize-space(//pron/@pronounNumber)='yes' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.16">
<table border="1">
	           <caption>
<xsl:text>Paradigma del verbo que significa  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘venir’</langData>
</caption>
	           <tr>
	              <th>Sujeto</th>
	              <th>Primera Sg</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Primera Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Primera Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>Primera Pl</th>
</xsl:if>
	              <th>Segunda Sg</th>
	              <th>Segunda Pl</th>
	              <th>Tercera Sg</th>
	              <th>Tercera Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	  	<xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.18">
<table border="1">
	  			<caption>
<xsl:text>Paradigma del verbo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘ir’</langData>
</caption>
	  			<tr>
	  				<th>Tiempo / Aspecto</th>
	  				<th>Forma de verbo</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Otro aspecto</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	  			</tr>
</xsl:if>
	  		</table>
</tablenumbered>
</xsl:if>
	  	
	  	<xsl:if test="normalize-space(//pron/@pronounNumber)='no' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.20">
<table border="1">
	           <caption>
<xsl:text>Paradigma del verbo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘ir’</langData>
</caption>
	           <tr>
	              <th>Sujeto</th>
	              <th>Primera</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusiva</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusiva</th>
</xsl:if>
	              <th>Segunda</th>
	              <th>Tercera</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro aspecto</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
	     <xsl:if test="normalize-space(//pron/@pronounNumber)='yes' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.22">
<table border="1">
	           <caption>
<xsl:text>Paradigma del verbo que significa  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘ir’</langData>
</caption>
	           <tr>
	              <th>Sujeto</th>
	              <th>Primera Sg</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Primera Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Primera Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>Primera Pl</th>
</xsl:if>
	              <th>Segunda Sg</th>
	              <th>Segunda Pl</th>
	              <th>Tercera Sg</th>
	              <th>Tercera Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Presente</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No pasado</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No futuro</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrario de hecho</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfecto</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potencial</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progresivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Propósito</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Estativo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>No realidad</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Otro tiempo</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjuntivo</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORMA</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>

	   	         </section3>
	   	      </section2>
	   
		<section2 id="sIPProDrop">
		   <secTitle>Los sujetos tácitos</secTitle>
		   <p contentType="ctPracticalIntro">
<xsl:text>
		         En algunas lenguas, un sujeto, o a veces un objeto directo, puede ser ‘tacito’, es decir, no tiene que estar explícito o presente en su posición sintáctica normal. En otras lenguas, por lo menos algunos de los pronombres son clíticos que se pueden unir al verbo. Cuando esto sucede, no hay pronombre o frase nominal en la posición del sujeto, por lo que la oración se ve igual que en una lengua que verdaderamente permite los sujetos tácitos.</xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>En algunas lenguas, un sujeto, o a veces un objeto directo, puede ser ‘tacito’, es decir, no tiene que estar explícito o presente en su posición  sintáctica normal.  Por ejemplo, en español la manera normal de decir el ejemplo en inglés </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I buy a book</langData>
<xsl:text> es </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Compro un libro</langData>
<xsl:text> en vez de algo con el pronombre sujeto independiente incluido: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Yo compro un libro</langData>
<xsl:text>.  Esto no se permite en inglés, con excepción de imperativos. (El sujeto en complementos subordinados no finitos se tratan en la sección </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>.) </xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>Algunas lenguas no en realidad son lenguas que permiten los sujetos tácitos, pero por lo menos algunos de los pronombres son clíticos que se pueden unir al verbo. Cuando esto sucede, no hay pronombre o frase nominal en la posición del sujeto, por lo que la oración se ve igual que en una lengua que verdaderamente permite los sujetos tácitos.</xsl:text>
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
<xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no'">
<xsl:text>se permite el sujeto tácito en cualquier tipo de oración. </xsl:text>
		         <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
		            <xsl:text>  Un objeto directo tácito </xsl:text>
		            <xsl:choose>
		               <xsl:when test="//ip/@proDropObject='no'">no</xsl:when>
		               <xsl:when test="//ip/@proDropObject='yes'">también</xsl:when>
		            </xsl:choose>
		            <xsl:text> se permite. </xsl:text>
		         </xsl:if>
		      </xsl:if>
<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>el sujeto puede parecer como que no está presente debido a los pronombres dependientes (clíticos pronominales) que se unen al verbo, pero en realidad no es una lengua que permite un sujeto tácito.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>se permite el sujeto tácito en cualquier tipo de oración y también hay pronombres dependientes (clíticos pronominales) que se unen al verbo.  </xsl:text>
		         <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
		            <xsl:text>  Un objeto directo tácito </xsl:text>
		            <xsl:choose>
		               <xsl:when test="//ip/@proDropObject='no'">no</xsl:when>
		               <xsl:when test="//ip/@proDropObject='yes'">también</xsl:when>
		            </xsl:choose>
		            <xsl:text> se permite. </xsl:text>
		         </xsl:if>
		      </xsl:if>
<xsl:if test="normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropOther/@checked)='no'">
<xsl:text>no se permite un sujeto tácito.  El sujeto debe ser explícito excepto en los imperativos.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//ip/proDropClitic/@checked)='no'">
<xsl:text>se permite el sujeto tácito en cualquier tipo de oración, incluyendo en los imperativos. </xsl:text>
		         <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
		            <xsl:text>  Un objeto directo tácito </xsl:text>
		            <xsl:choose>
		               <xsl:when test="//ip/@proDropObject='no'">no</xsl:when>
		               <xsl:when test="//ip/@proDropObject='yes'">también</xsl:when>
		            </xsl:choose>
		            <xsl:text> se permite. </xsl:text>
		         </xsl:if>
		      </xsl:if>
<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='yes'">
<xsl:text>el sujeto puede parecer como que no está presente debido a los pronombres dependientes (clíticos pronominales) que se unen al verbo, pero en realidad no es una lengua que permite un sujeto tácito.  El sujeto puede ser tácito en los imperativos.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='yes'">
<xsl:text>se permite el sujeto tácito en cualquier tipo de oración, incluyendo en los imperativos, y también hay pronombres dependientes (clíticos pronominales) que se unen al verbo.  </xsl:text>
		         <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
		            <xsl:text>  Un objeto directo tácito </xsl:text>
		            <xsl:choose>
		               <xsl:when test="//ip/@proDropObject='no'">no</xsl:when>
		               <xsl:when test="//ip/@proDropObject='yes'">también</xsl:when>
		            </xsl:choose>
		            <xsl:text> se permite. </xsl:text>
		         </xsl:if>
		      </xsl:if>
<xsl:if test="normalize-space(//ip/proDropNone/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropOther/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>no se permite un sujeto tácito.  El sujeto debe ser explícito aun en los imperativos.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>el sujeto tácito solamente se permite en ___</xsl:text>
<xsl:value-of select="//ip/proDropOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='yes'">
<xsl:text>el sujeto tácito se permite en  ___</xsl:text>
<xsl:value-of select="//ip/proDropOther" />
<xsl:text> y también en los imperativos.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='yes' or normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropClitic/@checked)='yes'">
<xsl:text>El sujeto tácito también se permite en ___</xsl:text>
<xsl:value-of select="//ip/proDropOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
		   <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
<p>
<xsl:text>  Algunos ejemplos que muestran el sujeto tácito son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
<example num="xV.IPProDrop.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/proDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/proDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/proDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/proDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPProDrop.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPProDrop.14.1</xsl:text>
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
		   <xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes'">
<p>
<xsl:text>  Algunos ejemplos en que parece como el sujeto es tácito porque hay pronombres clíticos unidos a los verbos son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes'">
<example num="xV.IPProDrop.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/cliticPnExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/cliticPnExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/cliticPnExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/cliticPnExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPProDrop.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPProDrop.18.1</xsl:text>
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
		   <xsl:if test="normalize-space(//ip/proDropOther/@checked)='yes'">
<p>
<xsl:text>  Algunos ejemplos de sujetos tácitos como se permite en el </xsl:text>
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
		   <xsl:if test="normalize-space(//ip/proDropOther/@checked)='yes'">
<example num="xV.IPProDrop.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/proDropOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/proDropOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/proDropOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/proDropOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPProDrop.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPProDrop.22.1</xsl:text>
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
		   
		   <p>
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sIPImp" />
<xsl:text> para ejemplos de los imperativos.</xsl:text>
</p>
		   
		</section2>
		<section2 id="sIPAux">
			<secTitle>Los auxiliares</secTitle>
		   <p>
<xsl:text>Hay varias clases de elementos auxiliares que incluyen palabras auxiliares, así como el indicador de no finito, de movimiento y otros tipos.</xsl:text>
</p>
		   
		   <section3 id="sIPAuxPositive">
		      <secTitle>Palabras auxiliares</secTitle>
		      <p contentType="ctPracticalIntro">
<xsl:text>
		         Los auxiliares que se escriben como palabras independientes expresan algunos tipos de flexión verbal.</xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>Algunas lenguas tienen elementos auxiliares que son palabras independientes, y algunos pueden tener más de un elemento auxiliar con el verbo principal. Algunos ejemplos de las oraciones transitivas en inglés son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy will hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El muchacho golpeará el beísbol’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might have hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El muchacho pudo haber golpeado el beísbol’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might have been hitting the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El muchacho pudo habiendo golpeado el beísbol’</xsl:text>
</gloss>
<xsl:text>.  En español, estos son expresados principalmente por los cambios del tiempo y del aspecto en el verbo.</xsl:text>
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
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@aux='no'"> no hay </xsl:when>
					<xsl:when test="//ip/@aux='yes'"> hay algunos </xsl:when>
				</xsl:choose>
<xsl:text>auxiliares que se escriben como palabras independientes.  </xsl:text>
<xsl:if test="normalize-space(//ip/@aux)='yes'">
					<xsl:text>Un auxiliar es </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxRequired='no'">opcional</xsl:when>
						<xsl:when test="//ip/@auxRequired='no'">requerido</xsl:when>
					</xsl:choose>
					<xsl:text> y  </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxMany='no'">solamente uno puede presentarse</xsl:when>
						<xsl:when test="//ip/@auxMany='yes'">se puede presentar más de uno</xsl:when>
					</xsl:choose>
					<xsl:text> en una sola cláusula. </xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> Después de un auxiliar, el orden normal VSO </xsl:text>
						<xsl:choose>
						   <xsl:when test="//ip/@auxOrder='yes'">se mantiene. El orden sería Aux V S O.</xsl:when>
						   <xsl:when test="//ip/@auxOrder='no'">puede cambiar así que el sujeto se presenta directamente después del auxiliar y antes del verbo. El orden en estas cláusulas sería Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Antes de un auxiliar, el orden normal OSV </xsl:text>
						<xsl:choose>
						   <xsl:when test="//ip/@auxOrder='yes'">se mantiene. El orden sería O S V Aux.</xsl:when>
						   <xsl:when test="//ip/@auxOrder='no'">puede cambiar así que el sujeto se presenta directamente después del verbo y antes del auxiliar. El orden en estas cláusulas sería O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<p>
<xsl:text>Los auxiliares en el </xsl:text>
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
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<example num="xV.IPAux.IPAuxPositive.12">
<table border="1">
					<tr>
						<th>Palabras auxiliares</th>
						<th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/auxiliaryExample),'.','')" />
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
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<p>
<xsl:text>Algunos ejemplos de oraciones que incluyen estos auxiliares son:</xsl:text>
</p>
</xsl:if>
			
				<xsl:if test="normalize-space(//ip/@aux)='yes'">
<example num="xV.IPAux.IPAuxPositive.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/auxExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/auxExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/auxExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/auxExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPAux.IPAuxPositive.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPAux.IPAuxPositive.16.1</xsl:text>
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
		   </section3>
		   <section3 id="sIPAuxNonfinite">
		      <secTitle>Auxiliar de no finito</secTitle>   
		         <p contentType="ctPracticalIntro">
<xsl:text>El indicador de no finito funciona igual que un auxiliar si se escribe como una palabra independiente. </xsl:text>
</p>
		         <p contentType="ctComparativeIntro">
<xsl:text>En inglés la palabra que indica no finito, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>to</langData>
<xsl:text>, que se usa en cláusulas subordinadas, también funciona igual que un auxiliar en que ocupa la misma posición y puede presentarse antes de otros auxiliares. Por ejemplo, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy would like to have hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El muchacho quisiera haber golpeado el beísbol’</xsl:text>
</gloss>
<xsl:text>.  Por el contrario, el español no tiene un indicador de no finito independiente para las cláusulas subordinadas, sino utiliza simplemente la forma infinitiva del verbo. </xsl:text>
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
<xsl:text>,</xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@auxNonfinite='none'"> no hay ningún indicador de no finito. </xsl:when>
				   <xsl:when test="//ip/@auxNonfinite='no'"> el indicador de no finito es parte del verbo. </xsl:when>
				   <xsl:when test="//ip/@auxNonfinite='yes'"> hay un (o más) indicador de no finito similar a un auxiliar que se escribe como una palabra independiente.  </xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
					<xsl:text>Un indicador auxiliar de no finito </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxNonfiniteRequired='no'">es opcional</xsl:when>
						<xsl:when test="//ip/@auxNonfiniteRequired='no'">se require</xsl:when>
					</xsl:choose>
					<xsl:text> en cláusulas subordinadas no finitas. </xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> Después de un indicador de no finito, el orden normal VSO </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxNonfiniteOrder='yes'">se mantiene. El orden es Aux V S O.</xsl:when>
						   <xsl:when test="//ip/@auxNonfiniteOrder='no'">puede cambiar así que el sujeto se presenta directamente después del auxiliar y antes del verbo. El orden en estas cláusulas sería Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Antes de un indicador de no finito, el orden normal OSV </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">se mantiene. El orden es O S V Aux.</xsl:when>
						   <xsl:when test="//ip/@auxOrder='no'">puede cambiar así que el sujeto se presenta directamente después del verbo y antes del auxiliar. El orden en estas cláusulas sería O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<p>
<xsl:text>El indicador de no finito es:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<example num="xV.IPAux.IPAuxNonfinite.12">
<table border="1">
					<tr>
						<th>Indicador de no finito</th>
						<th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/auxiliaryNonfiniteExample),'.','')" />
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
<xsl:text>no finito en cláusulas subordinadas</xsl:text>
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
<xsl:text>no finito en cláusulas subordinadas</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<p>
<xsl:text>Algunos ejemplos de oraciones con cláusulas subordinadas no finitas que incluyen el indicador no finito son:</xsl:text>
</p>
</xsl:if>
			
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<example num="xV.IPAux.IPAuxNonfinite.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/auxNonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/auxNonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/auxNonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/auxNonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPAux.IPAuxNonfinite.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPAux.IPAuxNonfinite.16.1</xsl:text>
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

		   </section3>
		   <section3 id="sIPAuxOther">
		      <secTitle>Otros auxiliares</secTitle>
		      <p contentType="ctPracticalIntro">
<xsl:text>Otras palabras pueden funcionar igual que auxiliares, por ejemplo, auxiliares de movimiento o indicadores de préstamos.</xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>En algunas lenguas hay otras palabras que funcionan igual que auxiliares, por ejemplo, auxiliares de movimiento o indicadores de préstamo, que comparten el mimso sujeto y complementos con el verbo principal.</xsl:text>
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
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@auxOther='no'"> no hay </xsl:when>
					<xsl:when test="//ip/@auxOther='yes'"> hay algunos</xsl:when>
				</xsl:choose>
<xsl:text> auxiliares de estos tipos que se escriben como palabras independientes.  </xsl:text>
<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> Después de uno de estos auxiliares, el orden normal VSO </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOtherOrder='yes'">se mantiene. El orden es Aux V S O.</xsl:when>
						   <xsl:when test="//ip/@auxOtherOrder='no'">puede cambiar así que el sujeto se presenta directamente después del auxiliar y antes del verbo. El orden en estas cláusulas sería Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Antes de uno de estos auxiliares, el orden normal OSV </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">se mantiene. El orden es  O S V Aux.</xsl:when>
						   <xsl:when test="//ip/@auxOrder='no'">puede cambiar así que el sujeto se presenta directamente después del verbo y antes del auxiliar. El orden en estas cláusulas sería O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<p>
<xsl:text>Estos otros auxiliares son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<example num="xV.IPAux.IPAuxOther.12">
<table border="1">
					<tr>
						<th>Otras palabras auxiliares</th>
						<th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/auxiliaryOtherExample),'.','')" />
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
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<p>
<xsl:text>Algunos ejemplos de oraciones con estos otros auxiliares son:</xsl:text>
</p>
</xsl:if>
			
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<example num="xV.IPAux.IPAuxOther.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/auxOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/auxOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/auxOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/auxOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPAux.IPAuxOther.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPAux.IPAuxOther.16.1</xsl:text>
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
		   </section3>	

		</section2>
	   <section2 id="sVCompounds">
	   <secTitle>Verbos compuestos</secTitle>
	      <p>
<xsl:text>Los verbos se pueden combinar con otros verbos, con sustantivos o palabras de otras categorías para formar verbos compuestos. Estos compuestos funcionan igual que verbos, pero su valencia puede cambiar, por ejemplo de un verbo transitivo a un verbo intransitivo.  Algunos ejemplos de los tipos más comunes se dan aquí.</xsl:text>
</p>
	   
	      <xsl:if test="normalize-space(//ip/@heartCompound)='yes'">
<p>
<xsl:text>Un sistema especial de verbos compuestos consiste en el que todos los verbos incluyen un sustantivo que expresa el centro de las emociones,  como el corazón.</xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//ip/@heartCompound)='yes'">
<example num="xV.VCompounds.8">
<table border="1">
	         <caption>
<xsl:text>Compuestos con ‘el centro de las emociones’</xsl:text>
</caption>
	         <tr>
	            <th>Compuesto</th>
	            <th>Glosa para cada raíz</th>
	            <th>Glosa para el compuesto</th>
	         </tr>
	         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/heartCompoundExample),'.','')" />
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
	   	<xsl:if test="normalize-space(//ip/@bodypartCompound)='yes'">
<p>
<xsl:if test="normalize-space(//ip/@heartCompound)='no'">
<xsl:text>Un </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/@heartCompound)='yes'">
<xsl:text>Otro</xsl:text>
</xsl:if>
<xsl:text> sistema especial de verbos compuestos consiste en el que todos los verbos incluyen un sustantivo de una parte del cuerpo</xsl:text>
<xsl:if test="normalize-space(//ip/@heartCompound)='yes'">
<xsl:text> menos el que expresa el centro de emociones</xsl:text>
</xsl:if>
<xsl:text>.</xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//ip/@bodypartCompound)='yes'">
<example num="xV.VCompounds.12">
<table border="1">
	         <caption>
<xsl:text>Compuestos con una parte del cuerpo</xsl:text>
</caption> 
	         <tr>
	            <th>Compuesto</th>
	            <th>Glosa para cada raíz</th>
	            <th>Glosa para el compuesto</th>
	         </tr>
	         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/bodypartCompoundExample),'.','')" />
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
	   <xsl:if test="normalize-space(//ip/@heartCompound)='yes' or normalize-space(//ip/@bodypartCompound)='yes'">
<example num="xV.VCompounds.14">
<table border="1">
	         <caption>
<xsl:text>Otros compuestos de verbos con sustantivos</xsl:text>
</caption> 
	         <tr>
	            <th>Compuesto</th>
	            <th>Glosa para cada raíz</th>
	            <th>Glosa para el compuesto</th>
	         </tr>
	         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/verbNCompoundExample),'.','')" />
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
	   <xsl:if test="normalize-space(//ip/@heartCompound)='no' and normalize-space(//ip/@bodypartCompound)='no'">
<example num="xV.VCompounds.16">
<table border="1">
	         <caption>
<xsl:text>Compuestos de verbos con sustantivos</xsl:text>
</caption> 
	         <tr>
	            <th>Compuesto</th>
	            <th>Glosa para cada raíz</th>
	            <th>Glosa para el compuesto</th>
	         </tr>
	         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/verbNCompoundExample),'.','')" />
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
<xsl:text>Algunos ejemplos de oraciones con estos compuestos que consisten en un verbo con un sustantivo son:</xsl:text>
</p>
	   <example num="xV.VCompounds.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/verbNCompoundSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/verbNCompoundSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/verbNCompoundSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/verbNCompoundSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.VCompounds.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.VCompounds.20.1</xsl:text>
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
<xsl:text>Algunos compuestos que consisten en un verbo con una palabra que no es un sustantivo son:</xsl:text>
</p>
	   <example num="xV.VCompounds.24">
<table border="1">
	         <caption>
<xsl:text>Compuestos de verbos con una palabra que no es un sustantivo</xsl:text>
</caption>
	         <tr>
	            <th>Compuesto</th>
	            <th>Glosa para cada raíz</th>
	            <th>Glosa para el compuesto</th>
	         </tr>
	         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/verbOtherCompoundExample),'.','')" />
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
	      <p>
<xsl:text>Algunos ejemplos de oraciones con estos compuestos que consisten en un verbo con una palabra que no es un sustantivo son:</xsl:text>
</p>
	   <example num="xV.VCompounds.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/verbOtherCompoundSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/verbOtherCompoundSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/verbOtherCompoundSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/verbOtherCompoundSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.VCompounds.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.VCompounds.28.1</xsl:text>
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
	      <p contentType="ctPracticalIntro">
<xsl:text>También hay expresiones idiomáticas que consisten en un verbo y otra palabra que juntas, como una unidad, expresan una idea que no es la misma que el significado cuando se combinan los de las dos palabras independientes. Algunos ejemplos de modismos en el </xsl:text>
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
	      <p contentType="ctComparativeIntro">
<xsl:text>Además de compuestos que se escriben como una palabra, también hay expresiones idiomáticas que consisten en un verbo y otra palabra que juntas, como una unidad, expresan una idea que no es la misma que el significado cuando se combinan los de las dos palabras independientes. Algunos ejemplos de modismos en el </xsl:text>
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
	   <example num="xV.VCompounds.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/verbIdiomExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/verbIdiomExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/verbIdiomExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/verbIdiomExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.VCompounds.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.VCompounds.34.1</xsl:text>
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
	</section1>
	
		
		
		
	
	
		
	
	
		
	
	
		
	
   
      
   
   
      
   
	
		
	
	
      
   
   
      
   
   
		
	
	
		
	
	
		
	
	
		
	
   
      
   
   
		
	
   
      
   
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
   
      
   
	
		
	
	
		
	
   
      
   
   
		
	
	
		
	
	
		
	
	
		
	
   
      
   
   
      
   
	
		
	
	
      
   
	
		
	
	
      
   
   
      
   
   
      
   
   
      
   
   
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
	
		
	
	

	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
   
   
      
   
   
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
   
      
   
   
   
		
	
	
		
	
	
		
	
   
	
		
	
	
		
	
   
      
   
   
      
      
      
      
      
   
   
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
	
		
	
	
      
   
   
      
      
      
   
   
      
      
      
   
	
		
		
		
	
	
		
		
		
	
	
		
	
	
</xsl:template>
</xsl:stylesheet>
