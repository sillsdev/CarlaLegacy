<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="ip">
	<section1 id="sIP">
		<secTitle>Las oraciones básicas</secTitle>
		<p>
<xsl:text>E esta sección se consideran las oraciones copulativas, las intransitivas, las transitivas, las ditransitivas, las imperativas, las pasivas y las causativas en su orden de palabras básico (es decir sin cambio del foco, tópico, por interrogación o en construcciones de negación).  
				De acuerdo con lo observado en la sección </xsl:text>
<sectionRef sec="sIntro" />
<xsl:text>,  la tipología del </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> es </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@wordOrder='SVO'">SVO, así que el orden de palabras básico es con el sujeto primero, después cualquier elemento auxiliar, después la frase verbal que consiste en el verbo en la posición inicial y cualquiera complementos que la siguen.</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">SOV, así que el orden de palabras básico es con el sujeto primero, después la frase verbal que consiste en el verbo en la posición final con cualquier complemento que la precede, y finalmente cualquiera elementos auxiliares.</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">VSO, así que el orden de palabras básico es con el verbo en la posición inicial, después el sujeto, y finalmente cualquier complemento verbal.</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">VOS, así que el orden de palabras básico es con la frase verbal que consiste en el verbo en la posición inicial y cualquier complemento que la sigue, después cualquiera elementos auxiliares, y finalmente el sujeto.</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">OVS, así que el orden de palabras básico es con la frase verbal que consiste en el verbo en la posición final con cualquier complemento que la precede, después cualquiera elementos auxiliares, y finalmente el sujeto.</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">OSV, así que el orden de palabras básico es con cualquier complemento verbal primero, después el sujeto, y finalmente el verbo.</xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' or normalize-space(//typology/@wordOrder)='OSV'">
				<xsl:text>  Los cambios en el orden de las palabras cuando un auxiliar está presente ya se presentaron en la sección </xsl:text>
				<sectionRef sec="sIPAux" />
				<xsl:text>.</xsl:text>
			</xsl:if>
<xsl:text></xsl:text>
</p>
		<p>
<xsl:text>Se analiza cada uno de los tipos de oraciones en el orden en que se presentaron. </xsl:text>
</p>

		<section2 id="sIPCop">
			<secTitle>Construcciones copulativas</secTitle>
		   <p>
<xsl:text>Las oraciones copulativas son las que tiene un verbo copulativo, si se requiere, o un verbo de percepción.</xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>Las oraciones copulativas pueden tener un adjetivo, una frase adposicional o una frase nominal como complemento del verbo copulativo.  Algunas lenguas no requieren un verbo ni un auxiliar copulativo estar presente. Algunos ejemplos en español son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>La muchacha es bonita</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Susana está enferma</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mi hermana está en el hospital</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Él es el líder</langData>
<xsl:text>.</xsl:text>
</p>
		   <p>
<xsl:text>Algunos ejemplos de oraciones copulativas en el </xsl:text>
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
		   <example num="xIP.IPCop.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/copularExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/copularExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/copularExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/copularExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.10.1</xsl:text>
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
		   <xsl:if test="normalize-space(//ip/@copular)='yes' or normalize-space(//ip/@copular)='optional'">
<p>
<xsl:text>Como se muestra en los ejemplos, </xsl:text>
<xsl:choose>
		         <xsl:when test="//ip/@copular='yes'"> se requiere un verbo copulativo </xsl:when>
		         <xsl:when test="//ip/@copular='optional'"> un verbo copulativo es opcional </xsl:when>
		      </xsl:choose>
<xsl:text>en las oraciones copulativas.  Los verbos copulativos son: </xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/@copular)='yes' or normalize-space(//ip/@copular)='optional'">
<example num="xIP.IPCop.14">
<table border="1">
		         <tr>
		            <th>Verbos copulativos</th>
		            <th>Glosa</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularVerb),'.','')" />
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
		   <xsl:if test="normalize-space(//ip/@copular)='no'">
<p>
<xsl:text>Como se muestra en los ejemplos, no hay verbo copulativo en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  </xsl:text>
<xsl:choose>
		         <xsl:when test="//ip/@copularAffix='no'">No hay ningún afijo copulativo en el nominal predicativo o adjetivo predicativo tampoco. </xsl:when>
		         <xsl:when test="//ip/@copularAffix='yesPrefix'">Sin embargo, hay un prefijo copulativo en el nominal predicativo o adjetivo predicativo.  Este prefijo es:</xsl:when>
		         <xsl:when test="//ip/@copularAffix='yesSuffix'">Sin embargo, hay un sufijo copulativo en el nominal predicativo o adjetivo predicativo.  Este prefijo es:</xsl:when>
		         <xsl:when test="//ip/@copularAffix='yesEither'">Sin embargo, hay un prefijo o sufijo copulativo en el nominal predicativo o adjetivo predicativo.  Estos afijos son:</xsl:when>
		      </xsl:choose>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/@copular)='no' and normalize-space(//ip/@copularAffix)='yesPrefix'">
<example num="xIP.IPCop.18">
<table border="1">
		         <tr>
		            <th>Prefijo copulativo</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/@copular)='no' and normalize-space(//ip/@copularAffix)='yesSuffix'">
<example num="xIP.IPCop.20">
<table border="1">
		         <tr>
		            <th>Sufijo copulativo</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/@copular)='no' and normalize-space(//ip/@copularAffix)='yesEither'">
<example num="xIP.IPCop.22">
<table border="1">
		         <tr>
		            <th>Afijos copulativos</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
</xsl:if>
		   
		   <xsl:if test="normalize-space(//ip/@copular)='optional'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
		         <xsl:when test="//ip/@copularAffix='no'">No hay ningún afijo copulativo en el nominal predicativo o adjetivo predicativo que se presenta cuando un verbo copulativo no se presenta.</xsl:when>
		         <xsl:when test="//ip/@copularAffix='yesPrefix'">Hay también un prefijo copulativo en el nominal predicativo o adjetivo predicativo que se presenta cuando un verbo copulativo no se presenta.  Este prefijo es:</xsl:when>
		         <xsl:when test="//ip/@copularAffix='yesSuffix'">Hay también un sufijo copulativo en el nominal predicativo o adjetivo predicativo que se presenta cuando un verbo copulativo no se presenta.  Este sufijo es:</xsl:when>
		         <xsl:when test="//ip/@copularAffix='yesEither'">Hay también un prefijo o sufijo copulativo en el nominal predicativo o adjetivo predicativo que se presenta cuando un verbo copulativo no se presenta.  Estos afijos son:</xsl:when>
		      </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/@copular)='optional' and normalize-space(//ip/@copularAffix)='yesPrefix'">
<example num="xIP.IPCop.26">
<table border="1">
		         <tr>
		            <th>Prefijo copulativo</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/@copular)='optional' and normalize-space(//ip/@copularAffix)='yesSuffix'">
<example num="xIP.IPCop.28">
<table border="1">
		         <tr>
		            <th>Sufijo copulativo</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/@copular)='optional' and normalize-space(//ip/@copularAffix)='yesEither'">
<example num="xIP.IPCop.30">
<table border="1">
		         <tr>
		            <th>Afijos copulativos</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
</xsl:if>
		   
		   <p contentType="ctComparativeIntro">
<xsl:text>En contraste con los verbos copulativos, los verbos de percepción usualmente permiten solamente una frase adjetival como complemento, excepto en las construcciones superlativas en que una frase nominal sigue un verbo de percepción, como se muestra en la sección siguiente.   Algunos ejemplos son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>La muchacha se ve bonita</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ella parece agradable</langData>
<xsl:text>.</xsl:text>
</p>
		   <p>
<xsl:text>Algunos ejemplos de oraciones con verbos de percepción en el </xsl:text>
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
		   <example num="xIP.IPCop.36">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/perceptionExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/perceptionExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/perceptionExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/perceptionExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.36</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.36.1</xsl:text>
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
<xsl:text>Los verbos copulativos y de percepción también pueden presentarse con una cláusula adjetival como complemento, en que una oración o una cláusula de complemento sigue al adjetivo. Estas construcciones se presentan en la sección </xsl:text>
<sectionRef sec="sCompRaising" />
<xsl:text>.
		   </xsl:text>
</p>
		   
		   <section3 id="sIPComparatives">
		      <secTitle>Comparativas y Superlativas</secTitle>
		      <p>
<xsl:text>Las oraciones comparativas son un subclase de oraciones copulativas. Consideraremos dos tipos que clasifican dos entidades (objetos o personas) como iguales, después las comparativas en que una entidad (objeto o persona) se considera mejor que la otra, y entonces las superlativas. Todos estos tipos normalmente pueden utilizar un verbo copulativo o un verbo de percepción. </xsl:text>
</p>
		      <p contentType="ctPracticalIntro">
<xsl:text>La comparación de iguales puede utilizar un sustantivo o un adjetivo para la comparación.  La construcción nominal de igualidad utiliza una fórmula que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘el mismo Sustantivo que’</langData>
<xsl:text> entre dos frases nominales.</xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>La comparación de iguales puede utilizar un sustantivo o un adjetivo para la comparación.  La construcción nominal de igualidad utiliza una fórmula que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘el mismo Sustantivo que’</langData>
<xsl:text> entre dos frases nominales. Algunos ejemplos en español son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Las cortinas se ven del mismo color que las paredes</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Su mochila es del mismo tamaño que la mía</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Susana tiene el mismo peinado que María</langData>
<xsl:text>. </xsl:text>
</p>
		      
		      <p>
<xsl:text>En la construcción nominal de igualdad en el </xsl:text>
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
		         <xsl:when test="//ip/@same='yes'"> se usa una palabra de grado independiente que significa ‘mismo’. Esto se muestra en el siguiente cuadro.</xsl:when>
		            <xsl:when test="//ip/@same='attaches'"> se usa un clítico o un afijo, no una palabra independiente, que significa ‘mismo’ y se une al sustantivo de comparación. Esto se muestra en el siguiente cuadro.</xsl:when>
		            <xsl:when test="//ip/@same='no'"> no hay una palabra de grado ni un clítico o afijo que significa ‘mismo’.  Solamente la presencia de las dos frases nominales y el sustantivo con el predicado copulativo señalan un comparativo de igualdad de este tipo.</xsl:when>
		      </xsl:choose>
</p>
		      
		      <xsl:if test="normalize-space(//ip/@same)='yes'">
<example num="xIP.IPCop.IPComparatives.12">
<table border="1">
		            <tr>
		               <th>Palabra de grado comparativa</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/sameWordExample),'.','')" />
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
<xsl:text>mismo</xsl:text>
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
<xsl:text>mismo</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		         </table>
</example>
</xsl:if>
		      
		      <xsl:if test="normalize-space(//ip/@same)='attaches'">
<example num="xIP.IPCop.IPComparatives.14">
<table border="1">
		            <tr>
		               <th>Afijo o clítico conparativo</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/sameAffixExample),'.','')" />
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
<xsl:text>mismo</xsl:text>
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
<xsl:text>mismo</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		         </table>
</example>
</xsl:if>
		      <p>
<xsl:text></xsl:text>
<xsl:choose>
		         <xsl:when test="//ip/@compareN='yes'">Se usa la suguiente conjunción comparativa que significa ‘que’ antes de la segunda frase nominal:</xsl:when>
		         <xsl:when test="//ip/@compareN='no'">No hay una conjunción comparativa  que significa ‘que’ antes de la segunda frase nominal en la construcción nominal de igualidad.</xsl:when>
		      </xsl:choose>
</p>
		      
		      <xsl:if test="normalize-space(//ip/@compareN)='yes'">
<example num="xIP.IPCop.IPComparatives.18">
<table border="1">
		            <tr>
		               <th>Conjunción comparativa</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/compareNExample),'.','')" />
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
<xsl:text>que</xsl:text>
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
<xsl:text>que</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		         </table>
</example>
</xsl:if>
		      <p>
<xsl:text>Algunos ejemplos de oraciones  con un sustantivo de comparación entre dos entidades iguales son:</xsl:text>
</p>
		      <example num="xIP.IPCop.IPComparatives.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/sameExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/sameExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/sameExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/sameExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.22.1</xsl:text>
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
<xsl:text>El segundo tipo de oración comparativa entre iguales utiliza un adjetivo para la comparación. Esta construcción usa una fórmula que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘es tan Adjetivo como’</langData>
<xsl:text> entre dos frases nominales.</xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>El segundo tipo de oración comparativa entre iguales utiliza un adjetivo para la comparación. Esta construcción usa una fórmula que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘es tan Adjetivo como’</langData>
<xsl:text> entre dos frases nominales. Algunos ejemplos en español son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juan es tan guapo como Guillermo</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Susana es tan veloz como María</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>David parece tan alto como Miguel</langData>
<xsl:text>.</xsl:text>
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
<xsl:choose>
		         <xsl:when test="//ip/@as='yes'"> hay una palabra de grado independiente que significa ‘tan’ y se usa con el adjetivo de comparación.  Esto se muestra en el siguiente cuadro.</xsl:when>
		         <xsl:when test="//ip/@as='no'"> no hay una palabra de grado independiente que significa ‘tan’ que se usa con el adjetivo de comparación. El significado ‘tan’ está implícito.</xsl:when>
		      </xsl:choose>
</p>
		      
		      <xsl:if test="normalize-space(//ip/@as)='yes'">
<example num="xIP.IPCop.IPComparatives.30">
<table border="1">
		            <tr>
		               <th>Palabra de grado comparativa</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/asWordExample),'.','')" />
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
<xsl:text>tan</xsl:text>
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
<xsl:text>tan</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		         </table>
</example>
</xsl:if>
		      <p>
<xsl:text></xsl:text>
<xsl:choose>
		         <xsl:when test="//ip/@compareAdj='yes'">Se usa la siguiente conjunción comparativa que significa ‘como’ antes de la segunda frase nominal:</xsl:when>
		         <xsl:when test="//ip/@compareAdj='no'">No hay una conjunción comparativa que significa ‘como’ utilizada antes de la segunda frase nominal.</xsl:when>
		      </xsl:choose>
</p>
		      
		      <xsl:if test="normalize-space(//ip/@compareAdj)='yes'">
<example num="xIP.IPCop.IPComparatives.34">
<table border="1">
		            <tr>
		               <th>Conjunción comparativa</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/compareAdjExample),'.','')" />
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
<xsl:text>como</xsl:text>
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
<xsl:text>como</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		         </table>
</example>
</xsl:if>	        
		      
		      <p>
<xsl:text>Algunos ejemplos de oraciones con un adjetivo de comparación entre dos entidades iguales son:</xsl:text>
</p>
		      <example num="xIP.IPCop.IPComparatives.38">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/asExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/asExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/asExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/asExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.38</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.38.1</xsl:text>
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
<xsl:text>Las oraciones comparativas en que una entidad (objeto o persona) se considera mejor que la otra comparan dos frases nominales utilizando una palabra comparativa que significa </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘que’</xsl:text>
</gloss>
<xsl:text>, e incluye cualquier cópula usada en la lengua o un verbo de percepción.  Un indicador de grado se presenta en el adjetivo predicativo o la frase nominal. </xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>Las oraciones comparativas en que una entidad (objeto o persona) se considera mejor que la otra comparan dos frases nominales utilizando una palabra comparativa que significa </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘que’</xsl:text>
</gloss>
<xsl:text>, e incluye cualquier cópula usada en la lengua o un verbo de percepción.  Un indicador de grado se presenta en el adjetivo predicativo o la frase nominal.  En algunas lenguas, el indicador de grado puede ser una palabra independiente o un afijo en el adjetivo predicativo, como se muestra en los ejemplos en inglés: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John is more handsome than Bill</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan es más guapo que Guillermo’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue is a better runner than Mary</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Susana es mejor corredora que Maria’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>David appears taller than Michael</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘David parece más alto que Miguel’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mary looks prettier than Julie</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘María parece más bonita que Julia’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>Observe que existe una cópula implicada que sigue a la frase nominal final en los ejemplos. Un tipo más complejo de comparativo tiene una oración en el lugar de la segunda frase nominal. Estos serán cubiertos abajo.</xsl:text>
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
<xsl:choose>
		         <xsl:when test="//ip/@comparative='yes'"> hay una conjunción comparativa que significa ‘que’ y se usa en las comparativas en que una entidad se considera mejor que la otra.  Se muestra en el siguiente cuadro:</xsl:when>
		         <xsl:when test="//ip/@comparative='no'"> no hay una conjunción comparativa que significa ‘que’ que se usa en los comparativos en que una entidad se considera mejor que la otra.  Solamente la presencia de las dos frases nominales y la palabra de grado con el predicado copulativo señalan un comparativo.</xsl:when>
		      </xsl:choose>
</p>
		      
		      <xsl:if test="normalize-space(//ip/@comparative)='yes'">
<example num="xComparativeConj">
<table border="1">
		            <tr>
		               <th>Conjunción comparativa</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/comparativeWordExample),'.','')" />
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
<xsl:text>que</xsl:text>
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
<xsl:text>que</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		         </table>
</example>
</xsl:if>	  
		      <p>
<xsl:text></xsl:text>
<xsl:choose>
		         <xsl:when test="//ip/@comparativeAdj='no'">No hay un afijo que pueda expresar el grado de comparación en adjetivos predicativos.  Solamente una palabra independiente de grado se utiliza con adjetivos predicativos y frases nominales.</xsl:when>
		         <xsl:when test="//ip/@comparativeAdj='yes'">Hay uno o más prefijos o sufijos que puedan expresar el grado de comparación en adjetivos predicativos y se utiliza uno siempre con adjetivos predicativos en oraciones comparativas.  </xsl:when>
		         <xsl:when test="//ip/@comparativeAdj='both'">Hay uno o más prefijos o sufijos que puedan expresar el grado de comparación en adjetivos predicativos.  Sin embargo, algunos adjetivos predicativos utilizan los afijos y otros utilizan la palabra independiente de grado en oraciones comparativas.</xsl:when>		         
		      </xsl:choose>
</p>
		         <xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<p>
<xsl:text>Los afijos de grado comparativos que se usan con adjetivos predicativos son:</xsl:text>
</p>
</xsl:if>    
		      <xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<example num="xIP.IPCop.IPComparatives.54">
<table border="1">
		            <tr>
		               <th>Afijos comparativos</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/comparativeAffixExample),'.','')" />
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
		      <xsl:if test="normalize-space(//ip/@comparativeAdj)='no' or normalize-space(//ip/@comparativeAdj)='both'">
<p>
<xsl:text>Las palabras de grado comparativas que se usan con adjetivos predicativos y frases nominales son:</xsl:text>
</p>
</xsl:if>    
		      <xsl:if test="normalize-space(//ip/@comparativeAdj)='yes'">
<p>
<xsl:text>Las palabras de grado comparativas que se usan con frases nominales predicativos son:</xsl:text>
</p>
</xsl:if>    
		      <example num="xIP.IPCop.IPComparatives.60">
<table border="1">
		            <tr>
		               <th>Palabras de grado comparativas</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/comparativeDegExample),'.','')" />
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
		      <p>
<xsl:text>Algunos ejemplos de las comparativas en que una entidad se considera mejor que la otra son:</xsl:text>
</p>
		      <example num="xIP.IPCop.IPComparatives.64">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/comparativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/comparativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/comparativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/comparativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.64</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.64.1</xsl:text>
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
<xsl:text>Ahora consideremos comparativas que consisten en dos oraciones alrededor la conjunción comparativa, aunque a la segunda frase le pueda faltar el adjetivo. Como las comparativas más cortas, estas comparan las calidades o las acciones de los sujetos de las oraciones y pueden tener un verbo copulativo o un verbo de percepción o un verbo de acción, junto con un adjetivo que sea modificado con una palabra o un afijo de grado. Algunos ejemplos en inglés son:
		      </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John is more handsome than Bill is</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan es más hermoso que Guillermo’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue runs much faster than Mary can run</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Susana corre mucho más rápido de lo que María puede correr’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>David appears lots shorter than Michael does</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘David parece mucho más corto que Miguel’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mary looks prettier than Julie looks</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘María se ve mucho más bonita que Julia’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John seems less certain of his answers than Sue seems</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan parece menos seguro de sus respuestas que Susana’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>Algunas lenguas no permiten que ninguna parte de la segunda oración sea omitida, más bien aparecen dos oraciones completas, las cuales van a ser comparadas. También, algunas lenguas que no tienen una conjunción comparativa independiente que significa </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘than (que)’</xsl:text>
</gloss>
<xsl:text> en las construcciones comparativas más cortas, simplemente tendrá las dos partes de la oración seguida una de la otra en esta construcción.
		      </xsl:text>
</p>
		      
		      <p contentType="ctPracticalIntro">
<xsl:text>Ahora consideremos comparativas que consisten en dos oraciones alrededor la conjunción comparativa, aunque a la segunda frase le pueda faltar el adjetivo.
		      </xsl:text>
</p>
		      <p>
<xsl:text>En estas construcciones comparativas más completas, el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
		         <xsl:when test="//ip/@gap='yes'"> permite que el adjetivo falte en la segunda parte. </xsl:when>
		         <xsl:when test="//ip/@gap='no'"> require que la oración completa se repite después del comparativo.   </xsl:when>
		      </xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
		            <xsl:when test="//ip/@comparative='yes'">Hay una conjunción comparativa que significa ‘que’ que utiliza en ambos las comparativas cortas y más completas, como muestra en el cuadro de arriba.</xsl:when>
		            <xsl:when test="//ip/@comparative='no'">No hay una conjunción comparativa que significa ‘que’, entonces este tipo de comparativa simplemente tendrá las dos partes de la oración seguida una de la otra.</xsl:when>
		         </xsl:choose>
</p>
		      <p>
<xsl:text>Algunos ejemplos de las construcciones comparativas más completas son:</xsl:text>
</p>
		      <example num="xIP.IPCop.IPComparatives.76">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/comparativeSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/comparativeSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/comparativeSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/comparativeSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.76</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.76.1</xsl:text>
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
<xsl:text>Las oraciones superlativas son otro subclase de oraciones copulativas, directamente relacionadas con las comparativas. Comparan una frase nominal con algo plural que puede expresarse como frase </xsl:text>
<xsl:choose>
		            <xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
		            <xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
		            <xsl:when test="//pp/@pPos='both'">adposicional</xsl:when>
		            <xsl:when test="//pp/@pPos='unknown'">adposicional</xsl:when>
		         </xsl:choose>
<xsl:text> o simplemente estar implícito. Como las comparativas, las superlativas incluyen cualquier cópula usada en la lengua o un verbo de percepción, junto con el indicador de grado en el adjetivo predicativo o la frase nominal.  En algunas lenguas, el indicador de grado superlativo puede ser una palabra independiente o un afijo en el adjetivo predicativo.  Esto se muestra en los ejemplos en inglés: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John is the most handsome of the boys</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan es el más guapo de los muchachos’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue is the worst runner (in the class</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Susana es la corredora peor (en la clase)’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mary looks prettiest</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘María parece que es la más bonita’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John seems the least certain of his answers of all my students</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan parece lo menos seguro de sus respuestas de todos los alumnos’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
		      <p contentType="ctPracticalIntro">
<xsl:text>Las oraciones superlativas son otro subclase de oraciones copulativas, directamente relacionadas con las comparativas. Comparan una frase nominal con algo plural que puede expresarse como frase </xsl:text>
<xsl:choose>
		            <xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
		            <xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
		            <xsl:when test="//pp/@pPos='both'">adposicional</xsl:when>
		            <xsl:when test="//pp/@pPos='unknown'">adposicional</xsl:when>
		         </xsl:choose>
<xsl:text> o simplemente estar implícito.</xsl:text>
</p>
		      
	      
		      <p>
<xsl:text>Como las comparativas en el </xsl:text>
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
		         <xsl:when test="//ip/@comparativeAdj='no'">no hay un afijo que pueda expresar el grado superlativo en adjetivos predicativos.  Solamente una palabra independiente de grado superlativa se utiliza con adjetivos predicativos y frases nominales.</xsl:when>
		         <xsl:when test="//ip/@comparativeAdj='yes'">hay uno o más prefijos o sufijos que puedan expresar el grado superlativo en adjetivos predicativos y se usa uno siempre con adjetivos predicativos en oraciones superlativas.  </xsl:when>
		         <xsl:when test="//ip/@comparativeAdj='both'">hay uno o más prefijos o sufijos que puedan expresar el grado superlativo en adjetivos predicativos.  Sin embargo, algunos adjetivos predicativos utilizan los afijos y otros utilizan la palabra independiente de grado en oraciones superlativas.</xsl:when>		         
		      </xsl:choose>
</p>
		         <xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<p>
<xsl:text>Los afijos superlativos que se unen con adjetivos predicativos son:</xsl:text>
</p>
</xsl:if>    
		      <xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<example num="xIP.IPCop.IPComparatives.86">
<table border="1">
		            <tr>
		               <th>Afijos superlativos</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/superlativeAffixExample),'.','')" />
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
		      <xsl:if test="normalize-space(//ip/@comparativeAdj)='no' or normalize-space(//ip/@comparativeAdj)='both'">
<p>
<xsl:text>Las palabras de grado superlativas que se usan con adjetivos predicativos y frases nominales son:</xsl:text>
</p>
</xsl:if>    
		      <xsl:if test="normalize-space(//ip/@comparativeAdj)='yes'">
<p>
<xsl:text>Las palabras de grado superlativas que se usan con frases nominales predicativos son:</xsl:text>
</p>
</xsl:if>    
		      <example num="xIP.IPCop.IPComparatives.92">
<table border="1">
		            <tr>
		               <th>Palabras de grado superlativas</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/superlativeDegExample),'.','')" />
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
		      <p>
<xsl:text>Algunos ejemplos de oraciones superlativas son:</xsl:text>
</p>
		      <example num="xIP.IPCop.IPComparatives.96">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/superlativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/superlativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/superlativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/superlativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.96</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.96.1</xsl:text>
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
		   </section3>
		   
		   <section3 id="sIPExistentials">
		      <secTitle>Existenciales</secTitle>
		      
		      <p contentType="ctComparativeIntro">
<xsl:text>Las oraciones existenciales son similares a las oraciones copulativas, salvo que utilizan una palabra o palabras que significan </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘hay’</xsl:text>
</gloss>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there exists</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘existe’</xsl:text>
</gloss>
<xsl:text> junto con una frase nominal y generalmente un lugar. Algunos ejemplos en inglés son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>There is a book on the table</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Hay un libro en la mesa’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>There are two men outside</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Hay dos hombres afuera</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>There is no more food</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘No hay más comida</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>En vez de esta palabra existencial, algunas lenguas tienen un verbo existencial, como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>hay</langData>
<xsl:text> en español.  Otras lenguas tienen un sistema entero de los verbos existenciales que expresan la posición del objeto que se describe.</xsl:text>
</p> 
		      <p contentType="ctPracticalIntro">
<xsl:text>Las oraciones existenciales se distinguen de las oracionea copiulativas por tienen verbos existenciales y/o palabras existenciales junto con una frase nominal y generalmente un lugar..</xsl:text>
</p>
		      
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
<xsl:if test="normalize-space(//ip/existNone/@checked)='yes'">
<xsl:text> no distingue las oraciones existenciales en absoluto. Son exactamente la misma que las oraciones copulativas ejemplificadas anteriormente en la sección </xsl:text>
<sectionRef sec="sIPCop" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existVerb/@checked)='no' and normalize-space(//ip/existPosition/@checked)='no'">
<xsl:text> tiene una palabra existencial independiente, como ‘there’ en inglés.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='no' and normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existPosition/@checked)='no'">
<xsl:text> tiene uno o más verbos que se utilizan especialmente en oraciones existenciales, y estos verbos expresan el existencial en sí mismos, como ‘existe’ o ‘hay’ en español.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existPosition/@checked)='no'">
<xsl:text> tiene uno o más verbos que se utilizan especialmente en oraciones existenciales, y hay también una palabra existencial independiente, como ‘there’ en inglés.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='no' and normalize-space(//ip/existVerb/@checked)='no' and normalize-space(//ip/existPosition/@checked)='yes'">
<xsl:text> tiene un sistema de verbos existenciales que expresan la posición del objeto.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existVerb/@checked)='no' and normalize-space(//ip/existPosition/@checked)='yes'">
<xsl:text> tiene una palabra existencial independiente, como ‘there’ en inglés, y también hay un sistema de verbos existenciales que expresan la posición del objeto.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='no' and normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existPosition/@checked)='yes'">
<xsl:text> tiene uno o más verbos que se utilizan especialmente en oraciones existenciales, y también hay un sistema de verbos existenciales que expresan la posición del objeto.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existPosition/@checked)='yes'">
<xsl:text> tiene o más verbos que se utilizan especialmente en oraciones existenciales, y existe también una palabra existencial independiente, como ‘there’ en inglés, apart de un sistema de verbos existenciales que expresan la posición del objeto.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='no' and normalize-space(//ip/existVerb/@checked)='no' and normalize-space(//ip/existPosition/@checked)='no' and normalize-space(//ip/existOther/@checked)='yes'">
<xsl:text> las oraciones existenciales se indican con ___</xsl:text>
<xsl:value-of select="//ip/existOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existOther/@checked)='yes' or normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existOther/@checked)='yes' or normalize-space(//ip/existPosition/@checked)='yes' and normalize-space(//ip/existOther/@checked)='yes'">
<xsl:text>  Además, las oraciones existenciales se indican con ___</xsl:text>
<xsl:value-of select="//ip/existOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
		      <xsl:if test="normalize-space(//ip/existVerb/@checked)='yes'">
<p>
<xsl:text>Los verbos utilizados especialmente en oraciones existenciales son:</xsl:text>
</p>
</xsl:if>  
		      <xsl:if test="normalize-space(//ip/existVerb/@checked)='yes'">
<example num="xIP.IPCop.IPExistentials.14">
<table border="1">
		            <tr>
		               <th>Verbos existenciales</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/existVerbExample),'.','')" />
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
		      <xsl:if test="normalize-space(//ip/existWord/@checked)='yes'">
<p>
<xsl:text>Las palabras que significan algo como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘existe’</xsl:text>
</gloss>
<xsl:text> que se utilizan en oraciones existenciales son:</xsl:text>
</p>
</xsl:if>         
		      <xsl:if test="normalize-space(//ip/existWord/@checked)='yes'">
<example num="xIP.IPCop.IPExistentials.18">
<table border="1">
		            <tr>
		               <th>Palabras existenciales</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/existWordExample),'.','')" />
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
		      <xsl:if test="normalize-space(//ip/existPosition/@checked)='yes'">
<p>
<xsl:text>Los verbos existenciales que indican la posición del objeto son:</xsl:text>
</p>
</xsl:if>
		      <xsl:if test="normalize-space(//ip/existPosition/@checked)='yes'">
<example num="xIP.IPCop.IPExistentials.22">
<table border="1">
		            <tr>
		               <th>Verbos de posición</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/existPositionExample),'.','')" />
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
		      <xsl:if test="normalize-space(//ip/existOther/@checked)='yes'">
<p>
<xsl:text>Los indicadores especiales para oraciones existenciales en el </xsl:text>
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
		      <xsl:if test="normalize-space(//ip/existOther/@checked)='yes'">
<example num="xIP.IPCop.IPExistentials.26">
<table border="1">
		            <tr>
		               <th>Indicadores existenciales</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/existOtherExample),'.','')" />
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
<xsl:text>Algunos ejemplos de oraciones existenciales son:</xsl:text>
</p>
		      <example num="xIP.IPCop.IPExistentials.30">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/existExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/existExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/existExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/existExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPExistentials.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPExistentials.30.1</xsl:text>
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
		      
		   </section3> 
		   
		</section2>
	   <section2 id="sIPMotion">
	      <secTitle>Intransitivas y construcciones de movimiento</secTitle>
	      <p contentType="ctComparativeIntro">
<xsl:text>Las oraciones intransitivas simples no tienen ningún complemento después del verbo, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>La muchacha flota</langData>
<xsl:text>.  Pueden tener sujetos-experimentadores en lugar de sujetos-agentes, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mi hermana se rió</langData>
<xsl:text>.  </xsl:text>
</p>  
	      <p contentType="ctPracticalIntro">
<xsl:text>Las oraciones intransitivas simples no tienen ningún complemento después del verbo.  Pueden tener sujetos-experimentadores en lugar de sujetos-agentes, dependiendo del verbo.</xsl:text>
</p>  
	      <p>
<xsl:text>Algunos ejemplos de oraciones intransitivas simples en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con un sujeto-agente se muestran en </xsl:text>
<exampleRef num="xIntranAgentNP" equal="no" letterOnly="no" />
<xsl:text>-</xsl:text>
<exampleRef num="xIntranAgentPron" equal="no" letterOnly="no" />
<xsl:text>.  En </xsl:text>
<exampleRef num="xIntranAgentNP" equal="no" letterOnly="no" />
<xsl:text> hay una frase nominal o un nombre en la posición del sujeto, mientras que en </xsl:text>
<exampleRef num="xIntranAgentPron" equal="no" letterOnly="no" />
<xsl:text> el sujeto es un pronombre.</xsl:text>
</p>
	      <example num="xIntranAgentNP">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/intExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/intExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/intExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/intExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIntranAgentNP</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIntranAgentNP.1</xsl:text>
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
	      <example num="xIntranAgentPron">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/pnIntExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/pnIntExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/pnIntExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/pnIntExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIntranAgentPron</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIntranAgentPron.1</xsl:text>
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
<xsl:text>Algunos ejemplos con un sujeto-experimentador se muestran en </xsl:text>
<exampleRef num="xIntranExperiencerNP" equal="no" letterOnly="no" />
<xsl:text>-</xsl:text>
<exampleRef num="xIntranExperiencerPron" equal="no" letterOnly="no" />
<xsl:text>.  En </xsl:text>
<exampleRef num="xIntranExperiencerNP" equal="no" letterOnly="no" />
<xsl:text> una frase nominal o un nombre en la posición del sujeto, mientras que en </xsl:text>
<exampleRef num="xIntranExperiencerPron" equal="no" letterOnly="no" />
<xsl:text> el sujeto es un pronombre.</xsl:text>
</p>
	      <example num="xIntranExperiencerNP">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerIntExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerIntExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerIntExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerIntExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIntranExperiencerNP</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIntranExperiencerNP.1</xsl:text>
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
	      <example num="xIntranExperiencerPron">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerPnIntExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerPnIntExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerPnIntExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerPnIntExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIntranExperiencerPron</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIntranExperiencerPron.1</xsl:text>
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
<xsl:text>Los verbos de movimiento incluyen un lugar en forma de frase </xsl:text>
<xsl:choose>
	            <xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
	            <xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
	            <xsl:when test="//pp/@pPos='both'">adposicional</xsl:when>
	            <xsl:when test="//pp/@pPos='unknown'">adposicional</xsl:when>
</xsl:choose>
<xsl:text> o adverbio. Algunos ejemplos en español de verbos de movimiento son </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>La muchacha corrió alrededor de la pista</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mi madre fue a la tienda</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mi profesor vino aquí</langData>
<xsl:text>.</xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>Los verbos de movimiento incluyen un lugar en forma de frase </xsl:text>
<xsl:choose>
	            <xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
	            <xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
	            <xsl:when test="//pp/@pPos='both'">adposicional</xsl:when>
	            <xsl:when test="//pp/@pPos='unknown'">adposicional</xsl:when>
</xsl:choose>
<xsl:text> o adverbio.</xsl:text>
</p>
	      <p>
<xsl:text>Algunos ejemplos de verbos de movimiento en el </xsl:text>
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
	      <example num="xIP.IPMotion.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/motionExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/motionExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/motionExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/motionExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPMotion.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.26.1</xsl:text>
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
	   <section2 id="sIPTrans">
			<secTitle>Transitivas y ditransitivas</secTitle>
	      <p contentType="ctComparativeIntro">
<xsl:text>Algunos ejemplos de oraciones transitivas con un sujeto-agente en español son </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El bateador golpearán el béisbol</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El perro pudo haber enterrado su hueso</langData>
<xsl:text>.  Algunos ejemplos de oraciones transitivas con un sujeto-experimentador son </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mi bebé quiere ese juguete</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mi hija le gusta su regalo</langData>
<xsl:text>.</xsl:text>
</p>
	      <p>
<xsl:text>Algunos ejemplos de oraciones transitivas con un sujeto-agente en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran en </xsl:text>
<exampleRef num="xTranAgentNP" equal="no" letterOnly="no" />
<xsl:text>-</xsl:text>
<exampleRef num="xTranAgentPron" equal="no" letterOnly="no" />
<xsl:text>.  En </xsl:text>
<exampleRef num="xTranAgentNP" equal="no" letterOnly="no" />
<xsl:text> hay frases nominales o nombres en las posiciones del sujeto y el objeto directo, mientras que en </xsl:text>
<exampleRef num="xTranAgentPron" equal="no" letterOnly="no" />
<xsl:text> el sujeto y el objeto directo son pronombres.</xsl:text>
</p>
	      
	      <example num="xTranAgentNP">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTranAgentNP</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTranAgentNP.1</xsl:text>
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
	      <example num="xTranAgentPron">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/pnExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/pnExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/pnExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/pnExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTranAgentPron</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTranAgentPron.1</xsl:text>
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
<xsl:text>Algunos ejemplos de oraciones transitivas con un sujeto-experimentador se muestran en </xsl:text>
<exampleRef num="xTranExperiencerNP" equal="no" letterOnly="no" />
<xsl:text>-</xsl:text>
<exampleRef num="xTranExperiencerPron" equal="no" letterOnly="no" />
<xsl:text>.  En </xsl:text>
<exampleRef num="xTranExperiencerNP" equal="no" letterOnly="no" />
<xsl:text> hay frases nominales o nombres en las posiciones del sujeto y el objeto directo, mientras que en </xsl:text>
<exampleRef num="xTranExperiencerPron" equal="no" letterOnly="no" />
<xsl:text> el sujeto y el objeto directo son pronombres.</xsl:text>
</p>
	      <example num="xTranExperiencerNP">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTranExperiencerNP</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTranExperiencerNP.1</xsl:text>
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
	      <example num="xTranExperiencerPron">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/pnExperiencerExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/pnExperiencerExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/pnExperiencerExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/pnExperiencerExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTranExperiencerPron</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTranExperiencerPron.1</xsl:text>
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
<xsl:text>Las oraciones ditransitivas pueden tener el segundo objeto expresado como frase </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">adposicional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adposicional</xsl:when>
</xsl:choose>
<xsl:text> o como frase nominal. Algunas lenguas, como español, permiten ambos tipos via el movimiento de dativo, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>La muchacha dio el regalo a su madre</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>La muchacha dio a su madre el regalo</langData>
<xsl:text>.</xsl:text>
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
<xsl:text>, el segundo objeto en una oración ditransitiva </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@diCat='pp'">es siempre una frase 
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional.</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional.</xsl:when>
							<xsl:when test="//pp/@pPos='both'">adposicional.</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">adposicional.</xsl:when>
</xsl:choose>
						</xsl:when>
					<xsl:when test="//ip/@diCat='dp'">es siempre una frase nominal.  El </xsl:when>
					<xsl:when test="//ip/@diCat='both'">puede ser una frase 
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">adposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">adposicional</xsl:when>
</xsl:choose>
						o una frase nominal.  Cuando ambos objetos son frases nominales, el </xsl:when>
				</xsl:choose>
<xsl:if test="normalize-space(//ip/@diCat)!='pp'">
					<xsl:choose>
						<xsl:when test="//ip/@diOrder='direct'">objeto directo</xsl:when>
						<xsl:when test="//ip/@diOrder='indirect'">objeto indirecto</xsl:when>
					</xsl:choose>
					<xsl:text> se presenta lo más cerca posible al verbo.</xsl:text>
				</xsl:if>
</p>
			<p>
<xsl:text>  Algunos ejemplos de oraciones ditransitivas son:</xsl:text>
</p>
			<example num="xIP.IPTrans.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/diExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/diExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/diExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/diExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPTrans.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.24.1</xsl:text>
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

	   <section2 id="sIPImp">
	      <secTitle>Imperativas</secTitle>
	      <p>
<xsl:text>Las oraciones imperativas son mandatos.  En el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, el sujeto </xsl:text>
<xsl:if test="normalize-space(//ip/proDropImp/@checked)='yes'">
<xsl:text>no tiene que estar explícito en imperativas, ya que se asume que es la segunda persona.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>tiene que estar explícito en las oraciones imperativas.</xsl:text>
</xsl:if>
<xsl:text>  Algunos ejemplos de las oraciones imperativas son:</xsl:text>
</p>
	      <example num="xIP.IPImp.6">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/impExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/impExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/impExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/impExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPImp.6</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPImp.6.1</xsl:text>
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
<xsl:text>El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
	         <xsl:when test="//ip/@impPolite='yes'"> también tiene una forma amable de imperativas. Ejemplos:</xsl:when>
	         <xsl:when test="//ip/@impPolite='no'"> no tiene una forma amable de imperativas.  </xsl:when>
	      </xsl:choose>
<xsl:text></xsl:text>
</p>
	      <xsl:if test="normalize-space(//ip/@impPolite)='yes'">
<example num="xIP.IPImp.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/impPoliteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/impPoliteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/impPoliteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/impPoliteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPImp.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPImp.10.1</xsl:text>
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
	   </section2>
	   
	   <section2 id="sIPConditional">
	      <secTitle>Condicionales</secTitle>
	      
	      <p contentType="ctComparativeIntro">
<xsl:text>Las oraciones condicionales tienen dos partes: una condición y una consecuencia.  La condición se introduce con una palabra condicional, como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>si</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cuando</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>después de</langData>
<xsl:text>, y se separa con una coma.  La consecuencia puede ser indicada con una palabra que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>entonces</langData>
<xsl:text> en ejemplos con la condición primera. Ejemplos en español: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Si ahorras dinero suficiente, entonces usted puede comprar eso</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Después de limpiar tu cuarto, entonces podrás jugar</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Cuando usted come tus vegetales, entonces tendrás postre</langData>
<xsl:text>.  La consecuencia también puede presentarse antes de la condición, en cuyo caso no hay no ningún indicador para la consecuencia, solamente para la condición. Ejemplos en español: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Puedes comprarlo si tienes suficiente dinero ahorrado</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Puedes jugar con tus amigos después de limpiar tu cuarto</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Tendrás postre cuando termines tus verduras</langData>
<xsl:text>.</xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>Las oraciones condicionales tienen dos partes: una condición y una consecuencia. Las dos pueden presentarse en cualquier orden.</xsl:text>
</p>
	      
	      <p>
<xsl:text>Algunos ejemplos de oraciones condicionales en el </xsl:text>
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
	      <example num="xIP.IPConditional.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/conditionalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/conditionalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/conditionalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/conditionalExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPConditional.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPConditional.10.1</xsl:text>
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
	      <xsl:if test="normalize-space(//ip/@conditionWord)='mood'">
<p>
<xsl:text>De acuerdo con los ejemplos, no hay ningún indicador para la condición en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, solamente se utiliza el modo condicional en el verbo.</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@conditionWord)='yes' or normalize-space(//ip/@conditionWord)='some'">
<p>
<xsl:text>De acuerdo con los ejemplos, la condición </xsl:text>
<xsl:choose>
	            <xsl:when test="//ip/@conditionWord='yes'">se indica con palabras independientes que se presentan </xsl:when>
	            <xsl:when test="//ip/@conditionWord='some'">a veces se indica con palabras independientes que se presentan </xsl:when>
	         </xsl:choose>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='no' and normalize-space(//ip/conditionWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='no' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='no' and normalize-space(//ip/conditionWordAfter/@checked)='no' and normalize-space(//ip/conditionWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='no' and normalize-space(//ip/conditionWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='no' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordOther/@checked)='no'">
<xsl:text> del resto de la frase condicional.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='no' and normalize-space(//ip/conditionWordAfter/@checked)='no' and normalize-space(//ip/conditionWordBoth/@checked)='no' and normalize-space(//ip/conditionWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//ip/conditionWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordOther/@checked)='yes' or normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordOther/@checked)='yes' or normalize-space(//ip/conditionWordBoth/@checked)='yes' and normalize-space(//ip/conditionWordOther/@checked)='yes'">
<xsl:text> del resto de la frase condicional y también pueden presentarse ___ </xsl:text>
<xsl:value-of select="//ip/conditionWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  Las palabras que pueden indicar la condición son:</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@conditionWord)='yes' or normalize-space(//ip/@conditionWord)='some'">
<example num="xIP.IPConditional.16">
<table border="1">
	            <tr>
	               <th>Palabras condicionales</th>
	               <th>Glosa</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/conditionWordExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' or normalize-space(//ip/@conditionWord)='some'">
<p>
<xsl:if test="normalize-space(//ip/@conditionWord)='no'">
<xsl:text>De acuerdo con los ejemplos, la condición se indica con </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/@conditionWord)='some'">
<xsl:text>La condición se puede ser indicar también con </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='no'">
<xsl:text>proclíticos que se unen al principio de la palabra inicial en la frase condicional.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='no'">
<xsl:text>enclíticos que se unen al final de la última palabra en la frase condicional.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='no'">
<xsl:text>clíticos que se unen al principio de la palabra inicial o al final de la última palabra en la frase condicional.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='no'">
<xsl:text>prefijos que se unen al verbo en la frase condicional.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<xsl:text>sufijos que se unen al verbo en la frase condicional.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<xsl:text>afijos que se unen al verbo en la frase condicional.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='no' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='no' or normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='no' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<xsl:text>clíticos que se unen al principio de la palabra inicial o al final de la última palabra en la frase condicional, o por afijos que se unen al verbo en la frase condicional.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='no' and normalize-space(//ip/conditionOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//ip/conditionOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/conditionSuffix/@checked)='yes' and normalize-space(//ip/conditionOther/@checked)='yes'">
<xsl:text>  Otros se unen ___</xsl:text>
<xsl:value-of select="//ip/conditionOther" />  <xsl:text>.</xsl:text>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>   
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionProclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionProclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionEnclitic/@checked)='yes'">
<p>
<xsl:text>Los clíticos que indican la condición son:</xsl:text>
</p>
</xsl:if>      
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionProclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionProclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionEnclitic/@checked)='yes'">
<example num="xIP.IPConditional.22">
<table border="1">
	            <tr>
	               <th>Clíticos condicionales</th>
	               <th>Glosa</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/conditionCliticExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' or normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionPrefix/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<p>
<xsl:text>Los afijos que indican la condición son:</xsl:text>
</p>
</xsl:if>      
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' or normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionPrefix/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<example num="xIP.IPConditional.26">
<table border="1">
	            <tr>
	               <th>Afijos condicionales</th>
	               <th>Glosa</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/conditionAffixExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionOther/@checked)='yes'">
<p>
<xsl:text>Los otros elementos que indican la condición en el </xsl:text>
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
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionOther/@checked)='yes'">
<example num="xIP.IPConditional.30">
<table border="1">
	            <tr>
	               <th>Indicadores condicionales</th>
	               <th>Glosa</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/conditionOtherExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@conditionWord)!='mood'">
<p>
<xsl:text>La consecuencia en el condicional </xsl:text>
<xsl:choose>
	            <xsl:when test="//ip/@consequence='yes'">se puede indicar con una palabra independiente, que es requerida cuando la frase condicional se presenta primera en la oración condicional.  </xsl:when>
	            <xsl:when test="//ip/@consequence='optional'">se puede indicar con una palabra independiente, pero es opcional en todas las oraciones condicionales.  </xsl:when>
	            <xsl:when test="//ip/@consequence='no'">nunca se indica con una palabra independiente.</xsl:when>
</xsl:choose>
<xsl:text>Esta palabra se presenta </xsl:text>
<xsl:choose>
	            <xsl:when test="//ip/@consequencePos='before'">antes</xsl:when>
	            <xsl:when test="//ip/@consequencePos='after'">después</xsl:when>
</xsl:choose>
<xsl:text> del resto de la consecuencia.</xsl:text>
</p>
</xsl:if>
	      
	   </section2>
	   
	   <section2 id="sIPSubjunctive">
	      <secTitle>Subjuntivas</secTitle>
	      <p contentType="ctComparativeIntro">
<xsl:text>El modo subjuntivo se utiliza para expresar ideas supuestas, dudadas, temidas o deseadas; actualmente no son realidad. En los ejemplos las construcciones subjuntivas se ve como parecen condicionales pero en primera persona, por ejemplo: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Si yo estuviera a cargo, lo arreglaría el problema</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Si yo fuera un hombre, sería un jugador de fútbol</langData>
<xsl:text>
	            En estos ejemplos, el verbo subjuntivo sigue la palabra condicional </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>si</langData>
<xsl:text>.  La consecuencia también puede presentarse antes de la condición de subjuntivo, como en: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Lo arreglaría el problema si yo estuviera a cargo</langData>
<xsl:text>y</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Me gustaría ser un jugador de fútbol si yo fuera un hombre</langData>
<xsl:text>.</xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>En muchas lenguas, las construcciones subjuntivas son más comunes como cláusulas subordinadas, como complementos de verbos principales como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>demandar</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>dudar</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>desear</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>temer</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>esperar</langData>
<xsl:text> con el complementador </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>que</langData>
<xsl:text>.  Los ejemplos en las cláusulas subordinadas se presentan en la sección </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>. </xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>El modo subjuntivo se utiliza para expresar ideas supuestas, dudadas, temidas o deseadas; actualmente no son realidad. En los ejemplos las construcciones subjuntivas se ve como parecen condicionales pero en primera persona. En muchas lenguas, las construcciones subjuntivas son más comunes como cláusulas subordinadas.  Los ejemplos en las cláusulas subordinadas se presentan en la sección </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>. </xsl:text>
</p>
	      <p>
<xsl:text>Algunos ejemplos de construcciones subjuntivas en la cláusula principal en el </xsl:text>
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
	      <example num="xIP.IPSubjunctive.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/subjunctiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/subjunctiveExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/subjunctiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/subjunctiveExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPSubjunctive.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPSubjunctive.12.1</xsl:text>
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
	      
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='mood'">
<p>
<xsl:text>Como se ve en los ejemplos, no hay ningún indicador para la condición en las construcciones subjuntivas, solamente se utiliza el modo subjuntivo en el verbo.</xsl:text>
</p>
</xsl:if>
	      
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some'">
<p>
<xsl:text>Como se ve en los ejemplos, la condición en las subjuntivas </xsl:text>
<xsl:choose>
	            <xsl:when test="//ip/@subjunctiveCondWord='yes'">se indica con palabras independientes que se presentan </xsl:when>
	            <xsl:when test="//ip/@subjunctiveCondWord='some'">a veces se indica con palabras independientes que se presentan </xsl:when>
	            </xsl:choose>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='no' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='no' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='no' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='no' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='no' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='no' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordOther/@checked)='no'">
<xsl:text> del resto de la frase condicional subjuntiva.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='no' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='no' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='no' and normalize-space(//ip/subjunctiveCondWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//ip/subjunctiveCondWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordOther/@checked)='yes'">
<xsl:text> del resto de la frase condicional subjuntiva y también pueden presentarse ___ </xsl:text>
<xsl:value-of select="//ip/subjunctiveCondWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  Las palabras que pueden indicar la condición en las construcciones subjuntivas son:</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some'">
<example num="xIP.IPSubjunctive.18">
<table border="1">
	            <tr>
	               <th>Palabras condicionales en subjuntivas</th>
	               <th>Glosa</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/subjunctiveCondWordExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' or normalize-space(//ip/@subjunctiveCondWord)='some'">
<p>
<xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no'">
<xsl:text>De acuerdo con los ejemplos, la condición en las construcciones subjuntivas se indica con </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='some'">
<xsl:text>La condición en las subjuntivas también se puede indicar con </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no'">
<xsl:text>proclíticos que se unen al principio de la palabra inicial en la frase condicional subjuntiva.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no'">
<xsl:text>enclíticos que se unen al final de la última palabra en la frase condicional subjuntiva.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no'">
<xsl:text>clíticos que se unen al principio de la palabra inicial o al final de la última palabra en la frase condicional subjuntiva.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no'">
<xsl:text>prefijos que se unen al sustantivo principal en la frase condicional subjuntiva.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<xsl:text>sufijos que se unen al sustantivo principal en la frase condicional subjuntiva.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<xsl:text>afijos que se unen al sustantivo principal en la frase condicional subjuntiva.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<xsl:text>clíticos que se unen al principio de la palabra inicial o al final de la última palabra en la frase condicional subjuntiva, o por afijos que se unen al sustantivo principal en la frase condicional subjuntiva.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//ip/subjunctiveCondOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes'">
<xsl:text>  Otros se unen ___</xsl:text>
<xsl:value-of select="//ip/subjunctiveCondOther" />  <xsl:text>.</xsl:text>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>   
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes'">
<p>
<xsl:text>Los clíticos que indican la condición en las subjuntivas son:</xsl:text>
</p>
</xsl:if>      
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes'">
<example num="xIP.IPSubjunctive.24">
<table border="1">
	            <tr>
	               <th>Clíticos condicionales para subjuntivas</th>
	               <th>Glosa</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/subjunctiveCondCliticExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<p>
<xsl:text>Los afijos que indican la condición en las subjuntivas son:</xsl:text>
</p>
</xsl:if>      
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<example num="xIP.IPSubjunctive.28">
<table border="1">
	            <tr>
	               <th>Afijos condicionales para subjuntivas</th>
	               <th>Glosa</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/subjunctiveCondAffixExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes'">
<p>
<xsl:text>Los otros elementos que indican la condición en las subjuntivas en el </xsl:text>
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
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes'">
<example num="xIP.IPSubjunctive.32">
<table border="1">
	            <tr>
	               <th>Indicadores condicionales para subjuntivas</th>
	               <th>Glosa</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/subjunctiveCondOtherExample),'.','')" />
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
	      
	   </section2>
	   <section2 id="sIPPassive">
			<secTitle>Pasivas</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>La mayoría de las lenguas también tienen oraciones pasivas, en que el tema o el paciente ocupa la posición del sujeto. El agente se puede expresar opcionalmente en algunas lenguas, pero no se permite en otras. Si está expresado, puede tomar la forma de una frase </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">adposicional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adposicional</xsl:when>
</xsl:choose>
<xsl:text> (como en español con la preposición específica </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>por</langData>
<xsl:text>) o de una frase nominal, dependiendo de la lengua.  Además, un auxiliar específico puede ser requerido en pasivas (una forma de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>estar</langData>
<xsl:text> en español).  Algunos ejemplos en español con y sin una frase de agente son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El vidrio estaba quebrado</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El vidrio estaba quebrado por el niño</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El béisbol se pudo haber golpeado</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El béisbol se pudo haber golpeado por el muchacho</langData>
<xsl:text>.</xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>En las oraciones pasivas, el tema o el paciente ocupa la posición del sujeto.</xsl:text>
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
					<xsl:when test="//ip/@passive='no'"> no hay pasivas.</xsl:when>
				   <xsl:when test="//ip/@passive='yes'"> hay pasivas, como se muestran aquí:</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
	      <xsl:if test="normalize-space(//ip/@passive)='yes'">
<example num="xIP.IPPassive.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/passiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/passiveExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/passiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/passiveExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPPassive.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPPassive.10.1</xsl:text>
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
	      <xsl:if test="normalize-space(//ip/@passive)='yes'">
<p>
<xsl:text> El agente </xsl:text>
<xsl:choose>
						<xsl:when test="//ip/@passiveAgent='no'">no se puede expresar.</xsl:when>
						<xsl:when test="//ip/@passiveAgent='yes'">se puede expresar</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@passiveAgent)='yes'">
						<xsl:text> como una frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@passiveAgentCat='pp'">						
								<xsl:choose>
									<xsl:when test="//pp/@pPos='before'">preposicional.</xsl:when>
									<xsl:when test="//pp/@pPos='after'">posposicional.</xsl:when>
									<xsl:when test="//pp/@pPos='both'">adposicional.</xsl:when>
									<xsl:when test="//pp/@pPos='unknown'">adposicional.</xsl:when>
</xsl:choose>
</xsl:when>
							<xsl:when test="//ip/@passiveAgentCat='dp'">nominal.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
<xsl:text>  En las oraciones pasivas </xsl:text>
<xsl:choose>
						<xsl:when test="//ip/@passiveAux='no'">no se</xsl:when>
						<xsl:when test="//ip/@passiveAux='yes'">se</xsl:when>
					</xsl:choose>
<xsl:text> un auxiliar específico.</xsl:text>
<xsl:text></xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp'">
<p>
<xsl:text>La </xsl:text>
<xsl:choose>
		         <xsl:when test="//pp/@pPos='before'">preposición</xsl:when>
		         <xsl:when test="//pp/@pPos='after'">posposición</xsl:when>
		         <xsl:when test="//pp/@pPos='both'">preposición o posposición</xsl:when>
		         <xsl:when test="//pp/@pPos='unknown'">adposición</xsl:when>
</xsl:choose>
<xsl:text> que se utiliza para indicar la frase del agente es:</xsl:text>
</p>
</xsl:if>         
		   <xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp'">
<example num="xIP.IPPassive.16">
<table border="1">
		         <tr>
		            <th>Indicador del agente</th>
		            <th>Glosa</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/passiveAgentPExample),'.','')" />
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
		   <xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes'">
<p>
<xsl:text>El auxiliar que se utiliza en oraciones pasivas es:</xsl:text>
</p>
</xsl:if>         
		   <xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes'">
<example num="xIP.IPPassive.20">
<table border="1">
		         <tr>
		            <th>Auxiliar en la pasiva</th>
		            <th>Glosa</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/passiveAuxExample),'.','')" />
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
		</section2>
	   
	   <xsl:if test="normalize-space(//ip/@antipassive)='yes'">
<section2 id="sIPAntipassives">
	      <secTitle>Antipasivas</secTitle>
	      <p contentType="ctComparativeIntro">
<xsl:text>En vez de convertir el objeto en sujeto como lo hace en voz pasiva, la antipasiva es una voz del verbo que suprime el objeto de verbos transitivos. Las oraciones antipasivas se encuentran principalmente en las lenguas con un sistema de caso ergativo-absolutivo, en que el sujeto cambia de caso ergativo al caso absolutivo cuando el objeto se suprime. 
	            También se encuentran en algunas lenguas con un sistema de caso nominativo-acusativo en que el sujeto y el objeto directo concuerden con el verbo.  
	         En estas lenguas, la antipasiva normalmente se forma por suprimiendo el afijo de la concordancia del objeto. La mayoría de las lenguas con voz antipasiva son lenguas aborígenes australianas o del nativo americano. </xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>Semejantemente al sujeto o agente en pasivas, algunas lenguas permiten el objeto o paciente se expresan opcionalmente en una frase adposicional.</xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>En vez de convertir el objeto en sujeto como lo hace en voz pasiva, la antipasiva es una voz del verbo que suprime el objeto de verbos transitivos. 
	         </xsl:text>
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
<xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='no' or normalize-space(//typology/@case)='split' and normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='no'">
<xsl:text> el sujeto de un verbo transitivo cambia al caso absolutivo cuando se suprime el objeto en las oraciones antipasivas. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='no' and normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveAffix/@checked)='no'">
<xsl:text> el afijo de concordancia con el objeto en el verbo se suprime para indicar una oración antipasiva. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='no' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<xsl:text> hay un afijo para antipasivo que se une con el verbo para indicar el cambio en relaciones gramaticales. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveAffix/@checked)='no'">
<xsl:text> el sujeto de un verbo transitivo cambia al caso absolutivo cuando se suprime el objeto en las oraciones antipasivas y el afijo de concordancia con el objeto en el verbo se suprime para indicar una oración antipasiva. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<xsl:text> el sujeto de un verbo transitivo cambia al caso absolutivo cuando se suprime el objeto en las oraciones antipasivas y hay un afijo para antipasivo que se une con el verbo para indicar el cambio en relaciones gramaticales. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<xsl:text> el sujeto de un verbo transitivo cambia al caso absolutivo cuando se suprime el objeto en las oraciones antipasivas, el afijo de concordancia con el objeto en el verbo se puede suprimir para indicar una oración antipasiva y también hay un afijo para antipasivo que se une con el verbo para indicar el cambio en relaciones gramaticales. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='no' and normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<xsl:text> el afijo de concordancia con el objeto en el verbo se suprime para indicar una oración antipasiva y hay un afijo para antipasivo que se une con el verbo para indicar el cambio en relaciones gramaticales. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='no' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='no' and normalize-space(//ip/antipassiveOther/@checked)='yes'">
<xsl:text> los antipasivos se expresan por ___</xsl:text>
<xsl:value-of select="//ip/antipassiveOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveOther/@checked)='yes' or normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveOther/@checked)='yes' or normalize-space(//ip/antipassiveAffix/@checked)='yes' and normalize-space(//ip/antipassiveOther/@checked)='yes'">
<xsl:text> Además, los antipasivos se expresan por ___</xsl:text>
<xsl:value-of select="//ip/antipassiveOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
	      <xsl:if test="normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<p>
<xsl:text>El afijo antipasivo es:</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<example num="xIP.IPAntipassives.14">
<table border="1">
	            <tr>
	               <th>Afijo de voz antipasiva</th>
	               <th>Glosa</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/antipassiveAffixExample),'.','')" />
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
<xsl:text>Algunos ejemplos de oraciones antipasivas en el </xsl:text>
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
	      <example num="xIP.IPAntipassives.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/antipassiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/antipassiveExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/antipassiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/antipassiveExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPAntipassives.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPAntipassives.18.1</xsl:text>
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
	   
	   
	   <xsl:if test="normalize-space(//ip/@voice)='yes'">
<section2 id="sIPVoice">
	      <secTitle>Otros indicadores de voz</secTitle>
	      <p contentType="ctComparativeIntro">
<xsl:text>Algunas lenguas, como Tagalog y otras lenguas del Austronesio, poseen afijos en el verbo que ayudan a definir las relaciones de las frases nominales en la oración.  Este es algo semejante a voz pasiva para dar énfasis a alguna de sus frases nominales.  Los afijos verbales indican cuál frase nominal es la prominente y pueden implicar un cambio en el orden de las palabras y/o la marca de caso.  Por ejemplo, en Tagalog el indicador de voz refleja la relación gramatical del argumento nominativo. </xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>Otros afijos en el verbo indican un cambio en voz que es algo semejante a voz pasiva para dar énfasis a alguna de sus frases nominales. Los afijos verbales indican cuál frase nominal es la prominente y pueden implicar un cambio en el orden de las palabras o en la marca de caso.</xsl:text>
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
	         <xsl:when test="//ip/@voiceCase='no'">los cambios de voz se indican con un cambio en el orden de las palabras en vez de marcar con el caso.</xsl:when>
	         <xsl:when test="//ip/@voiceCase='yesNom'">cuando un indicador de voz específico se marca en el verbo, la frase nominal correspondiente a esa voz se marca con el nominativo.</xsl:when>
	         <xsl:when test="//ip/@voiceCase='yesAbs'">cuando un indicador de voz específico se marca en el verbo, la frase nominal correspondiente a esa voz se marca con el absolutivo.</xsl:when>
	      </xsl:choose>
<xsl:text>  En el cuadro siguiente se muestran los afijos verbales que se utilizan para indicar la voz en la oración:</xsl:text>
</p>
	      <example num="xIP.IPVoice.10">
<table border="1">
	            <caption>
	               <xsl:text>Afijos verbales para la voz</xsl:text>
	            </caption>
	            <tr>
	               <th>Voz</th>
	               <th>
	                  Afijos
	               </th>
	            </tr>
	            <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//ip/actorVoiceExamplewho),'.','')" />
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
	                  <xsl:text>activa o del agente</xsl:text>
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
	                  <xsl:text>activa o del agente</xsl:text>
	               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	            <xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//ip/objectVoiceExamplewho),'.','')" />
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
	                  <xsl:text>del objeto, paciente, tema o traspaso</xsl:text>
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
	                  <xsl:text>del objeto, paciente, tema o traspaso</xsl:text>
	               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	            <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//ip/dativeVoiceExamplewho),'.','')" />
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
	                  <xsl:text>dativa</xsl:text>
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
	                  <xsl:text>dativa</xsl:text>
	               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	            <xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//ip/locativeVoiceExamplewho),'.','')" />
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
<td align="left">
	                  <xsl:text>locativa</xsl:text>
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
	                  <xsl:text>locativa</xsl:text>
	               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	            <xsl:variable name="sExampleValue4.1">
<xsl:value-of select="translate(string(//ip/instrumentalVoiceExamplewho),'.','')" />
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
	                  <xsl:text>de instrumento</xsl:text>
	               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>	            
	            <xsl:variable name="sExampleValue5.1">
<xsl:value-of select="translate(string(//ip/goalVoiceExamplewho),'.','')" />
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
	                  <xsl:text>de meta</xsl:text>
	               </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>	            
	         </table>
</example>
	      <p>
<xsl:text>Algunos ejemplos de oraciones que muestran cambios en voz son:</xsl:text>
</p>     
	      <example num="xIP.IPVoice.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/voiceExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/voiceExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/voiceExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/voiceExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPVoice.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPVoice.14.1</xsl:text>
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
	   
	   <section2 id="sIPCausatives">
	      <secTitle>Causativas</secTitle>
	      <p contentType="ctComparativeIntro">
<xsl:text>Las oraciones causativas agregan un argumento adicional a la oración. Algunas lenguas tienen oraciones causativas de una sola cláusula, en que el verbo se marca con un afijo que presenta el argumento adicional. Ese es el tipo de construcción que se cubre en esta sección.  El inglés y el español tienen solamente causativas sintácticas que consisten en dos cláusulas, por ejemplo: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My mother made me clean my room</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Mi madre me hizo limpiar mi dormitorio’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The other girl caused us to break up</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘La otra muchacha hizo que nos separáramos’</xsl:text>
</gloss>
<xsl:text>.  Este segundo tipo de oración causativa se detallan más en la sección </xsl:text>
<sectionRef sec="sCompCausative" />
<xsl:text>.</xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>Las oraciones causativas agregan un argumento adicional a la oración. Algunas lenguas tienen oraciones causativas de una sola cláusula, en que el verbo se marca con un afijo que presenta el argumento adicional. Ese es el tipo de construcción que se cubre en esta sección.  Ejemplos de las causativas sintácticas que consisten en dos cláusulas se detallan más en la sección </xsl:text>
<sectionRef sec="sCompCausative" />
<xsl:text>.</xsl:text>
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
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes' and normalize-space(//ip/causativeMake/@checked)='no'">
<xsl:text>hay un afijo verbal para causativo que presenta un argumento adicional. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='no' and normalize-space(//ip/causativeMake/@checked)='yes'">
<xsl:text>no hay un afijo verbal para causativo que presenta un argumento adicional.  Las únicas oraciones causativas consisten en dos cláusulas con un verbo principal que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>hacer</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>causar</langData>
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes' and normalize-space(//ip/causativeMake/@checked)='yes'">
<xsl:text>hay un afijo verbal para causativo que presenta un argumento adicional y las causativas sintácticas que consisten en dos cláusulas también son posibles. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='no' and normalize-space(//ip/causativeMake/@checked)='no' and normalize-space(//ip/causativeOther/@checked)='yes'">
<xsl:text>no hay un afijo verbal para causativo que presenta un argumento adicional.  Los causativos se expresan con  ___</xsl:text>
<xsl:value-of select="//ip/causativeOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes' and normalize-space(//ip/causativeOther/@checked)='yes' or normalize-space(//ip/causativeMake/@checked)='yes' and normalize-space(//ip/causativeOther/@checked)='yes'">
<xsl:text> Además, los causativos se expresan con ___</xsl:text>
<xsl:value-of select="//ip/causativeOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
	      <xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes'">
<p>
<xsl:text>Los afijos causativos son:</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes'">
<example num="xIP.IPCausatives.12">
<table border="1">
	            <tr>
	               <th>Afijos causativos</th>
	               <th>Glosa</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/causativeAffixExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de oraciones causativas que utilizan los afijos causativos son: </xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes'">
<example num="xIP.IPCausatives.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/causativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/causativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/causativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/causativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCausatives.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCausatives.16.1</xsl:text>
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
	      <xsl:if test="normalize-space(//ip/causativeMake/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de construcciones causativas sintácticas de dos cláusulas son: </xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/causativeMake/@checked)='yes'">
<example num="xIP.IPCausatives.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/causativeMakeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/causativeMakeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/causativeMakeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/causativeMakeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCausatives.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCausatives.20.1</xsl:text>
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
	      <xsl:if test="normalize-space(//ip/causativeOther/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de oraciones causativas como se permiten en el </xsl:text>
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
</xsl:if>
	      <xsl:if test="normalize-space(//ip/causativeOther/@checked)='yes'">
<example num="xIP.IPCausatives.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/causativeOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/causativeOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/causativeOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/causativeOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCausatives.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCausatives.24.1</xsl:text>
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
	   </section2>
	   
	</section1>
	
		
		
		
	
   
      
   
   
      
   
   
      
 
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
   
   
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
	  
	  
   
   
	  
   


   

   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
   
   
      
   
   
      
   
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
         
         
            
            
            
            
            
            
            
         
         
            
            
            
            
            
            
            
            
            
            
            
         
         
   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
         
         
            
            
            
            
            
            
            
         
         
            
            
            
            
            
            
            
            
            
            
            
         
   
   
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
         
         
         
         
         
      
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
       
	
		
	
	
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
   
	  
	  
	  
	  
	  
   
   
	  
	  
	  
   

   
      
      
      
      
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
   
      
   
   
      
   
   
      
	  
   
   
	  
	  
	  
   
   
	  
   
   
	  
   
</xsl:template>
</xsl:stylesheet>
