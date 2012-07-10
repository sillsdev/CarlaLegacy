<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="ip">
	<section1 id="sIP">
		<secTitle>Las oraciones básicas</secTitle>
		<p>
<xsl:text>Esta sección se considera las oraciones copulativas, intransitivas, transitivas, ditransitivas y pasivas en su orden de las palabras básico (es decir no cambiado por el foco, el tópico, el interrogativo, o las construcciones de la negación).
				De acuerdo con lo observado en la sección </xsl:text>
<sectionRef sec="sIntro" />
<xsl:text>,  la tipología de </xsl:text>
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
				<xsl:when test="//typology/@wordOrder='SVO'">SVO, así que el orden de las palabras básico es el sujeto, después cualquier elemento auxiliar, después la frase de verbo que consiste en el verbo en la posición inicial y cualquiera complementos que la siguen.</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">SOV, así que el orden de las palabras básico es el sujeto, después la frase de verbo que consiste en el verbo en la posición final con cualquier complemento que la precede, y finalmente cualquiera elementos auxiliares.</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">VSO, así que el orden de las palabras básico es el verbo en la posición inicial, después el sujeto, y finalmente cualquier complemento de verbo.</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">VOS, así que el orden de las palabras básico es la frase de verbo que consiste en el verbo en la posición inicial y cualquier complemento que la sigue, después cualquiera elementos auxiliares, y finalmente el sujeto.</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">OVS, así que el orden de las palabras básico es la frase de verbo que consiste en el verbo en la posición final con cualquier complemento que la precede, después cualquiera elementos auxiliares, y finalmente el sujeto.</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">OSV, así que el orden de las palabras básico es cualquier complemento de verbo primero, después el sujeto, y finalmente el verbo.</xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' or normalize-space(//typology/@wordOrder)='OSV'">
				<xsl:text>  Los cambios en el orden de las palabras cuando un auxiliar está presente fueron analizados en la sección </xsl:text>
				<sectionRef sec="sIPAux" />
				<xsl:text>.</xsl:text>
			</xsl:if>
<xsl:text></xsl:text>
</p>
		<p>
<xsl:text>Cada uno de los tipos de la oración será considerado en su orden correspondiente aquí. </xsl:text>
</p>

		<section2 id="sIPCop">
			<secTitle>Construcciones copulativas</secTitle>
		   <p>
<xsl:text>Los construcciones copulativas incluyen las oraciones con un verbo copulativo, si se requiere, o un verbo de percepción, y comparativos y existentiales también.  Cada tipo será discuitido en orden.</xsl:text>
</p>
		   <p>
<xsl:text>Las oraciones copulativas pueden tener un adjetivo, frase </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
</xsl:choose>
<xsl:text>, o frase nominal como complemento del verbo copulativo.  Algunas lenguas no requieren un verbo ni un auxiliar copulativo estar presente. Algunos ejemplos en español son: </xsl:text>
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
<xsl:text>En </xsl:text>
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
					<xsl:when test="//ip/@copular='yes'"> se requiere un verbo copulativo en las oraciones copulativas. </xsl:when>
					<xsl:when test="//ip/@copular='yesOptional'"> un verbo copulativo es opcional, y no se requiere a ningún auxiliar tampoco en las oraciones copulativas. </xsl:when>
					<xsl:when test="//ip/@copular='yesAux'"> un verbo copulativo es opcional, pero requiere un auxiliar si el verbo copulativo no está presente en las oraciones copulativas. </xsl:when>
					<xsl:when test="//ip/@copular='noAux'"> no hay verbo copulativo, pero requiere un auxiliar en las oraciones copulativas. </xsl:when>
					<xsl:when test="//ip/@copular='noNeither'"> no utilizan un verbo copulativo ni un auxiliar en las oraciones copulativas. </xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@copular)='noNeither' or normalize-space(//ip/@copular)='yesOptional'">
					<xsl:text></xsl:text>
					<xsl:choose>
					   <xsl:when test="//ip/@copularAffix='no'">No hay ningún afijo copulativo en el nominal predicativo o adjetivo predicativo tampoco</xsl:when>
					   <xsl:when test="//ip/@copularAffix='yesPrefix'">Sin embargo, hay un prefijo copulativo en el nominal predicativo o adjetivo predicativo</xsl:when>
					   <xsl:when test="//ip/@copularAffix='yesSuffix'">Sin embargo, hay un sufijo copulativo en el nominal predicativo o adjetivo predicativo</xsl:when>
					   <xsl:when test="//ip/@copularAffix='yesEither'">Sin embargo, hay un prefijo o sufijo copulativo en el nominal predicativo o adjetivo predicativo</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@copular)='noNeither'">
					<xsl:text>.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@copular)='yesOptional'">
					<xsl:text> que se presenta cuando no hay presente un verbo copulativo.</xsl:text>
				</xsl:if>
</p>
			<p>
<xsl:text>Algunos ejemplos de oraciones copulativas en </xsl:text>
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
			<example num="xIP.IPCop.12">
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
<xsl:with-param name="sExNumber">xIP.IPCop.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.12.1</xsl:text>
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
<xsl:text>En contraste a los verbos copulativos, los verbos de percepción permiten generalmente solamente una frase adjetival como su complemento, excepto en las construcciones superlativas en donde una frase nominal sigue un verbo de percepción, como se muestra en la sección siguiente.   Algunos ejemplos son: </xsl:text>
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
<xsl:text>Algunos ejemplos de oraciones con verbos de percepción en </xsl:text>
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
		   <example num="xIP.IPCop.18">
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
<xsl:with-param name="sExNumber">xIP.IPCop.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.18.1</xsl:text>
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
<xsl:text>Los verbos copulativos y de percepción pueden también presentarse con un complemento de la cláusula adjetival, donde una oración o una cláusula de complemento sigue el adjetivo. Estas construcciones las veremos en la sección </xsl:text>
<sectionRef sec="sCompRaising" />
<xsl:text>.
		   </xsl:text>
</p>

		   <section3 id="sIPComparatives">
			  <secTitle>Comparativos y Superlativos</secTitle>
			  <p>
<xsl:text>Los comparativos son un subtipo de oraciones copulativas. Consideraremos dos tipos que clasifiquen dos entidades (objetos o personas) como igual, después los comparativos donde una entidad (objeto o persona) está mejor que la otra, entonces superlativos. Todos estos tipos pueden utilizar normalmente un verbo copulativo o un verbo de percepción. </xsl:text>
</p>
			  <p>
<xsl:text>La comparación de iguales puede utilizar un sustantivo o un adjetivo para la comparación.  La construcción de la igualdad del sustantivo utiliza una fórmula que significa ‘el mismo </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>Sustantivo</xsl:text>
</gloss>
<xsl:text> que’ entre dos frases nominales. Algunos ejemplos en español son: </xsl:text>
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
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
				 <xsl:when test="//ip/@same='yes'"> hay una palabra de grado independiente que significa ‘mismo’ usada en este tipo de comparativo entre dos entidades (objetos o personas) iguales, como se muestra en el cuadro siguiente.</xsl:when>
				 <xsl:when test="//ip/@same='attaches'"> hay un clítico o un afijo de grado que se une con el sustantivo de la comparación que significa ‘mismo’, en vez de una palabra independiente, como se muestra en el cuadro siguiente.</xsl:when>
				 <xsl:when test="//ip/@same='no'"> no hay una palabra independiente de grado que significa ‘mismo’ usada en este tipo de comparativo entre dos entidades (objetos o personas) iguales.  Solamente la presencia de las dos frases nominales y el sustantivo con el predicado copulativo señalan un comparativo de igualdad de este tipo.</xsl:when>
			  </xsl:choose>
</p>

			  <xsl:if test="normalize-space(//ip/@same)='yes'">
<example num="xIP.IPCop.IPComparatives.10">
<table border="1">
					<tr>
					   <th>Palabra de grado comparativa para sustantivos entre entidades iguales</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/sameWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<example num="xIP.IPCop.IPComparatives.12">
<table border="1">
					<tr>
					   <th>Afijo o clítico comparativo para sustantivos entre entidades iguales</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/sameAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
				 <xsl:when test="//ip/@compareN='yes'"> se usa la conjunción comparativa siguiente que significa ‘que’ antes de la segunda frase nominal en este tipo de comparativo entre dos entidades (objetos o personas) iguales:</xsl:when>
				 <xsl:when test="//ip/@compareN='no'"> no hay una conjunción comparativa  que significa ‘que’ antes de la segunda frase nominal en este tipo de comparativo entre dos entidades (objetos o personas) iguales.</xsl:when>
			  </xsl:choose>
</p>

			  <xsl:if test="normalize-space(//ip/@compareN)='yes'">
<example num="xIP.IPCop.IPComparatives.16">
<table border="1">
					<tr>
					   <th>Conjunción comparativa para sustantivos entre entidades iguales</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/compareNExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<xsl:text>Algunos ejemplos de oraciones comparativas para sustantivos entre dos entidades (objetos o personas) iguales en </xsl:text>
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
			  <example num="xIP.IPCop.IPComparatives.20">
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
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.20.1</xsl:text>
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
<xsl:text>El segundo tipo de comparación de iguales utiliza un adjetivo para la comparación. Esta construcción utiliza una fórmula que significa ‘es tan </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>Adjetivo</xsl:text>
</gloss>
<xsl:text> como’ entre dos frases nominales. Algunos ejemplos en español son: </xsl:text>
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
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
				 <xsl:when test="//ip/@as='yes'"> hay una palabra de grado independiente que significa ‘tan’ utilizada en los comparativos para adjetivos entre dos entidades (objetos o personas) iguales, como se muestra en el cuadro siguiente.</xsl:when>
				 <xsl:when test="//ip/@as='no'"> no hay una palabra de grado independiente que significa ‘tan’ utilizada en los comparativos para adjetivos entre dos entidades (objetos o personas) iguales.  El significado ‘tan’ está implícito.</xsl:when>
			  </xsl:choose>
</p>

			  <xsl:if test="normalize-space(//ip/@as)='yes'">
<example num="xIP.IPCop.IPComparatives.26">
<table border="1">
					<tr>
					   <th>Palabra de grado comparativa para adjetivos entre entidades iguales</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/asWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
				 <xsl:when test="//ip/@compareAdj='yes'"> se usa la siguiente conjunción comparativa que significa ‘como’ antes de la segunda frase nominal en los comparativos para adjetivos entre dos entidades (objetos o personas) iguales:</xsl:when>
				 <xsl:when test="//ip/@compareAdj='no'"> no hay una palabra independiente que significa ‘como’ utilizada antes de la segunda frase nominal en los comparativos para adjetivos entre dos entidades (objetos o personas) iguales.</xsl:when>
			  </xsl:choose>
</p>

			  <xsl:if test="normalize-space(//ip/@compareAdj)='yes'">
<example num="xIP.IPCop.IPComparatives.30">
<table border="1">
					<tr>
					   <th>Conjunción comparativa para adjetivos entre dos entidades iguales</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/compareAdjExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<xsl:text>Algunos ejemplos de oraciones comparativas para adjetivos entre dos entidades (objetos o personas) iguales en </xsl:text>
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
			  <example num="xIP.IPCop.IPComparatives.34">
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
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.34.1</xsl:text>
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
<xsl:text>Los comparativos donde una entidad (objeto o persona) está mejor que la otra comparan dos frases nominales utilizando una palabra comparativa que significa </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘que’</xsl:text>
</gloss>
<xsl:text>, e incluya cualquier cópula que la lengua utiliza o un verbo de percepción, junto con un indicador de grado en el adjetivo predicativo o la frase nominal.  En algunas lenguas, el indicador de grado puede ser una palabra independiente o un afijo en el adjetivo predicativo, como se muestra en los ejemplos en inglés: </xsl:text>
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
			  <p>
<xsl:text>Observe que existe una cópula implicada que sigue a la frase nominal final en los ejemplos. Un tipo más complejo de comparativo tiene una oración en el lugar de la segunda frase nominal. Estos serán cubiertos en la sección </xsl:text>
<sectionRef sec="sCoordComparative" />
<xsl:text>.</xsl:text>
</p>
			  <p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
				 <xsl:when test="//ip/@comparative='yes'"> hay una conjunción comparativa que significa ‘que’ usada en los comparativos donde una entidad (objeto o persona) está mejor que la otra, como se muestra en el cuadro siguiente.</xsl:when>
				 <xsl:when test="//ip/@comparative='no'"> no hay una conjunción comparativa que significa ‘que’ usada en los comparativos donde una entidad (objeto o persona) está mejor que la otra.  Solamente la presencia de las dos frases nominales y la palabra de grado con el predicado copulativo señalan un comparativo.</xsl:when>
			  </xsl:choose>
</p>

			  <xsl:if test="normalize-space(//ip/@comparative)='yes'">
<example num="xIP.IPCop.IPComparatives.42">
<table border="1">
					<tr>
					   <th>Conjunción comparativa</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/comparativeWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<xsl:text>En </xsl:text>
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
				 <xsl:when test="//ip/@comparativeAdj='no'">no hay un afijo que pueda expresar el grado de comparación en adjetivos predicativos.  Solamente una palabra independiente de grado se utiliza con adjetivos predicativos y frases nominales.</xsl:when>
				 <xsl:when test="//ip/@comparativeAdj='yes'">hay uno o más prefijos o sufijos que puedan expresar el grado de comparación en adjetivos predicativos y se utiliza uno siempre con adjetivos predicativos en oraciones comparativas.  </xsl:when>
				 <xsl:when test="//ip/@comparativeAdj='both'">hay uno o más prefijos o sufijos que puedan expresar el grado de comparación en adjetivos predicativos.  Sin embargo, algunos adjetivos predicativos utilizan los afijos y otros utilizan la palabra independiente de grado en oraciones comparativas.</xsl:when>
			  </xsl:choose>
</p>
				 <xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<p>
<xsl:text>Los afijos de grado comparativos usados con adjetivos predicativos son:</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<example num="xIP.IPCop.IPComparatives.48">
<table border="1">
					<tr>
					   <th>Afijos comparativos</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/comparativeAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<xsl:text>Las palabras de grado comparativas usados con adjetivos predicativos y frases nominales son:</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//ip/@comparativeAdj)='yes'">
<p>
<xsl:text>Las palabras de grado comparativas usados con frases nominales predicativos son:</xsl:text>
</p>
</xsl:if>
			  <example num="xIP.IPCop.IPComparatives.54">
<table border="1">
					<tr>
					   <th>Palabras de grado comparativas</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/comparativeDegExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<xsl:text>Algunos ejemplos de los comparativos donde una entidad (objeto o persona) está mejor que la otra en </xsl:text>
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
			  <example num="xIP.IPCop.IPComparatives.58">
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
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.58</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.58.1</xsl:text>
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
<xsl:text>Los superlativos son otro subtipo de oraciones copulativas, directamente relacionados a los comparativos. Comparan una frase nominal con algo plural, que puede ser expresado como frase preposicional o posposicional o simplemente estar implícito. Como los comparativos, los superlativos incluyen cualquier cópula que utiliza la lengua o un verbo de percepción, junto con el indicador de grado en el adjetivo predicativo o la frase nominal.  En algunas lenguas, el indicador de grado superlativo puede ser una palabra independiente o un afijo en el adjetivo predicativo.  Esto se muestra en los ejemplos en inglés: </xsl:text>
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
</xsl:attribute>Sue is the best runner (in the class</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Susana es la mejor corredora (en la clase)’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mary looks prettiest</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘María parece que es la más bonita’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>

			  <p>
<xsl:text>Como los comparativos en </xsl:text>
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
				 <xsl:when test="//ip/@comparativeAdj='no'">no hay un afijo que pueda expresar el grado superlativo en adjetivos.  Solamente una palabra independiente de grado superlativa se utiliza con adjetivos predicativos y frases nominales.</xsl:when>
				 <xsl:when test="//ip/@comparativeAdj='yes'">hay uno o más prefijos o sufijos que puedan expresar el grado superlativo en adjetivos predicativos y se utiliza uno siempre con adjetivos predicativos en oraciones superlativas.  </xsl:when>
				 <xsl:when test="//ip/@comparativeAdj='both'">hay uno o más prefijos o sufijos que puedan expresar el grado superlativo en adjetivos predicativos.  Sin embargo, algunos adjetivos predicativos utilizan los afijos y otros utilizan la palabra independiente de grado en oraciones superlativas.</xsl:when>
			  </xsl:choose>
</p>
				 <xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<p>
<xsl:text>Los afijos superlativos que se unen con adjetivos predicativos son:</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<example num="xIP.IPCop.IPComparatives.66">
<table border="1">
					<tr>
					   <th>Afijos superlativos</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/superlativeAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<xsl:text>Las palabras de grado superlativas usados con adjetivos predicativos y frases nominales son:</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//ip/@comparativeAdj)='yes'">
<p>
<xsl:text>Las palabras de grado superlativas usados con frases nominales predicativos son:</xsl:text>
</p>
</xsl:if>
			  <example num="xIP.IPCop.IPComparatives.72">
<table border="1">
					<tr>
					   <th>Palabras de grado superlativas</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/superlativeDegExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<xsl:text>Algunos ejemplos de oraciones superlativas en </xsl:text>
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
			  <example num="xIP.IPCop.IPComparatives.76">
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
		   </section3>

		   <section3 id="sIPExistentials">
			  <secTitle>Existenciales</secTitle>

			  <p>
<xsl:text>Las oraciones existenciales son similares a las oraciones copulativas, salvo que utilizan una palabra o palabras que significan </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘hay’</xsl:text>
</gloss>
<xsl:text> o </xsl:text>
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
			  <p>
<xsl:text>En vez de esta palabra existencial, algunas lenguas tiene un verbo existencial, como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>hay</langData>
<xsl:text> en español.  Otras lenguas tienen un sistema entero de los verbos existenciales que expresan la posición del objeto que es descrito.</xsl:text>
</p>

			  <p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
				 <xsl:when test="//ip/@existVerb='yes'"> hay o más verbos utilizados especialmente en oraciones existenciales, y existe también una palabra existencial independiente, como ‘there’ en inglés.</xsl:when>
				 <xsl:when test="//ip/@existVerb='yesOnly'"> hay o más verbos utilizados especialmente en oraciones existenciales, y estos verbos expresan el existencial en sí mismos, como ‘existe’ o ‘hay’ en español.</xsl:when>
				 <xsl:when test="//ip/@existVerb='noCop'"> no hay un verbo utilizado especialmente en oraciones existenciales.  La cópula normal se utiliza, junto con una palabra existencial independiente, como ‘there’ en inglés.</xsl:when>
				 <xsl:when test="//ip/@existVerb='no'"> no utiliza un verbo en oraciones existenciales, sólo una palabra existencial independiente, como ‘there’ en inglés.</xsl:when>
			  </xsl:choose>
<xsl:text>  </xsl:text>
</p>
			  <xsl:if test="normalize-space(//ip/@existVerb)='yes' or normalize-space(//ip/@existVerb)='yesOnly'">
<p>
<xsl:text>Los verbos utilizados especialmente en oraciones existenciales en </xsl:text>
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
			  <xsl:if test="normalize-space(//ip/@existVerb)='yes' or normalize-space(//ip/@existVerb)='yesOnly'">
<example num="xIP.IPCop.IPExistentials.12">
<table border="1">
					<tr>
					   <th>Verbos existenciales</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/existVerbExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
			  <xsl:if test="normalize-space(//ip/@existVerb)!='yesOnly'">
<p>
<xsl:text>Las palabras que significan </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘there’ (existe)</xsl:text>
</gloss>
<xsl:text> utilizadas en oraciones existenciales en  </xsl:text>
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
			  <xsl:if test="normalize-space(//ip/@existVerb)!='yesOnly'">
<example num="xIP.IPCop.IPExistentials.16">
<table border="1">
					<tr>
					   <th>Palabras existenciales</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/existWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<xsl:text>Algunos ejemplos de oraciones existenciales en </xsl:text>
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
			  <example num="xIP.IPCop.IPExistentials.20">
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
<xsl:with-param name="sExNumber">xIP.IPCop.IPExistentials.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPExistentials.20.1</xsl:text>
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
		  <secTitle>Intransitivos y construcciones de movimiento</secTitle>
		  <p>
<xsl:text>Los intransitivos simples no tienen ningún complemento después del verbo, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>La muchacha flota</langData>
<xsl:text>.  Los verbos de movimiento incluyen un lugar en la forma de una frase </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
				<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
				<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
</xsl:choose>
<xsl:text> o adverbio. Algunos ejemplos en español con los verbos de movimiento son </xsl:text>
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
		  <p>
<xsl:text>Algunos ejemplos de oraciones intransitivas simples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con una frase nominal o un nombre como el sujeto-agente son:</xsl:text>
</p>
		  <example num="xIP.IPMotion.8">
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
<xsl:with-param name="sExNumber">xIP.IPMotion.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.8.1</xsl:text>
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
<xsl:text>Algunos ejemplos de oraciones intransitivas simples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con un pronombre como el sujeto-agente son:</xsl:text>
</p>
		  <example num="xIP.IPMotion.12">
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
<xsl:with-param name="sExNumber">xIP.IPMotion.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.12.1</xsl:text>
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
<xsl:text>Algunos ejemplos de oraciones intransitivas simples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con una frase nominal o un nombre como el sujeto-experimentador son:</xsl:text>
</p>
		  <example num="xIP.IPMotion.16">
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
<xsl:with-param name="sExNumber">xIP.IPMotion.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.16.1</xsl:text>
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
<xsl:text>Algunos ejemplos de oraciones intransitivas simples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con un pronombre como el sujeto-experimentador son:</xsl:text>
</p>
		  <example num="xIP.IPMotion.20">
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
<xsl:with-param name="sExNumber">xIP.IPMotion.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.20.1</xsl:text>
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
		  <xsl:if test="normalize-space(//typology/@case)='none'">
<p>
<xsl:text>No hay distinción entre las frases nominales ni los pronombres que se utilizan para los sujetos-agentes y los sujetos-experimentadores en los ejemplos arriba, porque en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no hay un sistema de caso.</xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)='nominative' or normalize-space(//typology/@case)='split'">
<p>
<xsl:text>Los ejemplos arriba muestran que </xsl:text>
<xsl:choose>
			 <xsl:when test="//typology/@case='split'">en la mayoría de construcciones </xsl:when>
		  </xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='no'">ambos sujetos-agentes y sujetos-experimentadores utilizan los mismos </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesObj'">los sujetos-agentes son de caso nominativo mientras que los sujetos-experimentadores utilizan los </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesDat'">los sujetos-agentes son de caso nominativo mientras que los sujetos-experimentadores utilizan los </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//np/@caseN='no'">pronombres </xsl:when>
				<xsl:when test="//np/@caseN='yes'">indicadores de caso y los pronombres </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='no'">nominativos </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesObj'">acusativos </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesDat'">dativos </xsl:when>
			 </xsl:choose>
<xsl:text>para verbos intransitivos. </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='yesObj'"> (No hay caso dativo distinto.)</xsl:when>
</xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@case='split'"> Bajo ciertas condiciones gramaticales, el sistema de caso cambia a ergativo-absolutivo, en que el caso normal para sujetos de verbos intransitivos es absolutivo. </xsl:when>
			 </xsl:choose>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)='ergative'">
<p>
<xsl:text>Los ejemplos arriba muestran que </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='no'">ambos sujetos-agentes y sujetos-experimentadores utilizan los mismos </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesObj'">ambos sujetos-agentes y sujetos-experimentadores utilizan los mismos </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesDat'">los sujetos-agentes son de caso absolutivo mientras que los sujetos-experimentadores utilizan los </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//np/@caseN='no'">pronombres </xsl:when>
				<xsl:when test="//np/@caseN='yes'">indicadores de caso y los pronombres </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='no'">absolutivos </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesObj'">absolutivos </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesDat'">dativos </xsl:when>
			 </xsl:choose>
<xsl:text>para verbos intransitivos. </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='yesObj'"> (No hay caso dativo distinto.)</xsl:when>
</xsl:choose>
</p>
</xsl:if>


		  <p>
<xsl:text>Algunos ejemplos con verbos de movimiento en </xsl:text>
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
		  <example num="xIP.IPMotion.30">
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
<xsl:with-param name="sExNumber">xIP.IPMotion.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.30.1</xsl:text>
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
			<secTitle>Transitivos y ditransitivos</secTitle>
			<p>
<xsl:text>Algunos ejemplos de las oraciones transitivas en español son </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El bateador golpearán el béisbol</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mi bebé quiere ese juguete</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El perro pudo haber enterrado su hueso</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>Algunos ejemplos de oraciones transitivas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con un sujeto-agente y frases nominales o nombres como sujeto y objeto son:</xsl:text>
</p>
			<example num="xIP.IPTrans.8">
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
<xsl:with-param name="sExNumber">xIP.IPTrans.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.8.1</xsl:text>
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
<xsl:text>Algunos ejemplos de oraciones transitivas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con un sujeto-agente y pronombres como sujeto y objeto son:</xsl:text>
</p>
		  <example num="xIP.IPTrans.12">
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
<xsl:with-param name="sExNumber">xIP.IPTrans.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.12.1</xsl:text>
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
<xsl:text>Algunos ejemplos de oraciones transitivas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con un sujeto-experimentador y frases nominales o nombres como sujeto y objeto son:</xsl:text>
</p>
		  <example num="xIP.IPTrans.16">
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
<xsl:with-param name="sExNumber">xIP.IPTrans.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.16.1</xsl:text>
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
<xsl:text>Algunos ejemplos de oraciones transitivas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con un sujeto-experimentador y pronombres como sujeto y objeto son:</xsl:text>
</p>
		  <example num="xIP.IPTrans.20">
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
<xsl:with-param name="sExNumber">xIP.IPTrans.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.20.1</xsl:text>
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
		  <xsl:if test="normalize-space(//typology/@case)='none'">
<p>
<xsl:text>No hay distinción entre las frases nominales ni los pronombres que se utilizan para los sujetos-agentes y los sujetos-experimentadores en los ejemplos arriba, porque en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no hay un sistema de caso.</xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)='nominative' or normalize-space(//typology/@case)='split'">
<p>
<xsl:text>Los ejemplos arriba muestran que </xsl:text>
<xsl:choose>
			 <xsl:when test="//typology/@case='split'">en la mayoría de construcciones </xsl:when>
		  </xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='no'">ambos sujetos-agentes y sujetos-experimentadores utilizan los mismos </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesObj'">los sujetos-agentes son de caso nominativo mientras que los sujetos-experimentadores utilizan los </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesDat'">los sujetos-agentes son de caso nominativo mientras que los sujetos-experimentadores utilizan los </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//np/@caseN='no'">pronombres </xsl:when>
				<xsl:when test="//np/@caseN='yes'">indicadores de caso y los pronombres </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='no'">nominativos </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesObj'">acusativos </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesDat'">dativos </xsl:when>
			 </xsl:choose>
<xsl:text>para verbos transitivos. </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='yesObj'"> (No hay caso dativo distinto.)</xsl:when>
</xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@case='split'"> Bajo ciertas condiciones gramaticales, el sistema de caso cambia a ergativo-absolutivo, en que el caso normal para sujetos de verbos transitivos es ergativo. </xsl:when>
			 </xsl:choose>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)='ergative'">
<p>
<xsl:text>Los ejemplos arriba muestran que </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='no'">ambos sujetos-agentes y sujetos-experimentadores utilizan los mismos </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesObj'">los sujetos-agentes son de caso ergativo mientras que los sujetos-experimentadores utilizan los </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesDat'">los sujetos-agentes son de caso ergativo mientras que los sujetos-experimentadores utilizan los </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//np/@caseN='no'">pronombres </xsl:when>
				<xsl:when test="//np/@caseN='yes'">indicadores de caso y los pronombres </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='no'">ergativos </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesObj'">absolutivos </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesDat'">dativos </xsl:when>
			 </xsl:choose>
<xsl:text>para verbos transitivos. </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='yesObj'"> (No hay caso dativo distinto.)</xsl:when>
</xsl:choose>
</p>
</xsl:if>

		  <p>
<xsl:text>Los ditransitivos pueden tener el segundo objeto expresado como frase </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
</xsl:choose>
<xsl:text> o como frase nominal. Algunas lenguas, como español, permiten ambos tipos via el movimiento del dativo, como en </xsl:text>
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
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, el segundo objeto en un ditransitivo </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@diCat='pp'">es siempre una frase
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional.</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional.</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional.</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional.</xsl:when>
</xsl:choose>
						</xsl:when>
					<xsl:when test="//ip/@diCat='dp'">es siempre una frase nominal.  El </xsl:when>
					<xsl:when test="//ip/@diCat='both'">puede ser una frase
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
</xsl:choose>
						o una frase nominal.  Cuando ambos objetos son frases nominales, el </xsl:when>
				</xsl:choose>
<xsl:if test="normalize-space(//ip/@diCat)!='pp'">
					<xsl:choose>
						<xsl:when test="//ip/@diOrder='direct'">objeto directo</xsl:when>
						<xsl:when test="//ip/@diOrder='indirect'">objeto indirecto</xsl:when>
					</xsl:choose>
					<xsl:text> se presenta lo más cerca al verbo.</xsl:text>
				</xsl:if>
</p>
			<p>
<xsl:text>  Algunos ejemplos de oraciones ditransitivas en </xsl:text>
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
			<example num="xIP.IPTrans.34">
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
<xsl:with-param name="sExNumber">xIP.IPTrans.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.34.1</xsl:text>
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
		<section2 id="sIPPassive">
			<secTitle>Pasivos</secTitle>
			<p>
<xsl:text>La mayoría de las lenguas también tienen oraciones pasivas, donde el tema o el paciente ocupa la posición del sujeto. El agente se puede expresar opcionalmente en algunas lenguas, pero no se permite en otras. Si está expresado, puede tomar la forma de una frase </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
</xsl:choose>
<xsl:text> (como en español con la preposición particular </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>por</langData>
<xsl:text>) o de una frase nominal, dependiendo de la lengua.  Además, un auxiliar particular puede ser requerido en pasivos (una forma de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>estar</langData>
<xsl:text> en español).  Algunos ejemplos en español con y sin una frase del agente son: </xsl:text>
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
			<p>
<xsl:text>En </xsl:text>
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
					<xsl:when test="//ip/@passive='no'"> no hay pasivos.</xsl:when>
					<xsl:when test="//ip/@passive='yes'"> hay pasivos</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@passive)='yes'">
					<xsl:text> en cuál el agente </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@passiveAgent='no'">no puede ser expresado.</xsl:when>
						<xsl:when test="//ip/@passiveAgent='yes'">puede ser expresado</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//ip/@passiveAgent)='yes'">
						<xsl:text> como una frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@passiveAgentCat='pp'">
								<xsl:choose>
									<xsl:when test="//pp/@pPos='before'">preposicional.</xsl:when>
									<xsl:when test="//pp/@pPos='after'">posposicional.</xsl:when>
									<xsl:when test="//pp/@pPos='both'">preposicional o posposicional.</xsl:when>
									<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional.</xsl:when>
</xsl:choose>
</xsl:when>
							<xsl:when test="//ip/@passiveAgentCat='dp'">nominal.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text>  Un auxiliar particular </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@passiveAux='no'">no es</xsl:when>
						<xsl:when test="//ip/@passiveAux='yes'">es</xsl:when>
					</xsl:choose>
					<xsl:text> requerido en oraciones pasivas.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
		   <xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp'">
<p>
<xsl:text>La </xsl:text>
<xsl:choose>
				 <xsl:when test="//pp/@pPos='before'">preposición</xsl:when>
				 <xsl:when test="//pp/@pPos='after'">posposición</xsl:when>
				 <xsl:when test="//pp/@pPos='both'">preposición o posposición</xsl:when>
				 <xsl:when test="//pp/@pPos='unknown'">preposición o posposición</xsl:when>
</xsl:choose>
<xsl:text> se utiliza para indicar la frase del agente en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> es:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp'">
<example num="xIP.IPPassive.10">
<table border="1">
				 <tr>
					<th>Indicador del agente</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/passiveAgentPExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<xsl:text>El auxiliar se utiliza en oraciones pasivas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> es:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes'">
<example num="xIP.IPPassive.14">
<table border="1">
				 <tr>
					<th>Auxiliar pasiva</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/passiveAuxExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
		   <xsl:if test="normalize-space(//ip/@passive)='yes'">
<p>
<xsl:text>Algunos ejemplos de oraciones pasivas en </xsl:text>
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
			<xsl:if test="normalize-space(//ip/@passive)='yes'">
<example num="xIP.IPPassive.18">
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
<xsl:with-param name="sExNumber">xIP.IPPassive.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPPassive.18.1</xsl:text>
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

	   <xsl:if test="normalize-space(//ip/@antipassive)!='no'">
<section2 id="sIPAntipassives">
		  <secTitle>Antipasivos</secTitle>
		  <p>
<xsl:text>En vez de cambiar el objeto al sujeto como voz pasiva hace, el antipasivo es una voz del verbo que suprime el objeto de verbos transitivos. Los antipasivos se encuentran principalmente en las lenguas con un sistema de caso ergativo-absolutivo, donde el sujeto cambia de caso ergativo al caso absolutivo cuando el objeto se suprime.
			 También se encuentran en algunas lenguas con un sistema de caso del nominativo-acusativo donde hay concordancia verbal con el sujeto y el objeto.
			 En estas lenguas, el antipasivo es formada generalmente por suprimiendo el afijo de la concordancia del objeto. La mayoría de las lenguas con voz antipasivo son lenguas aborígenes australianas o del nativo americano. </xsl:text>
</p>
		  <p>
<xsl:text>Semejantemente al sujeto o agente en pasivos, algunas lenguas permiten el objeto o paciente se expresan opcionalmente en una frase preposicional o posposicional.</xsl:text>
</p>
		  <p>
<xsl:text>En </xsl:text>
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
			 <xsl:when test="//ip/@antipassive='yesErg'">el sujeto de un verbo transitivo cambia al caso absolutivo cuando se suprime el objeto en las oraciones antipasivas.</xsl:when>
			 <xsl:when test="//ip/@antipassive='yesAgr'">el afijo de concordancia con el objeto en el verbo se suprime para indicar una oración antipasiva.</xsl:when>
			 <xsl:when test="//ip/@antipassive='yesAffix'">hay un afijo para antipasivo que se une con un verbo transitivo para indicar el cambio en relaciones gramaticales.  Este efijo es:</xsl:when>
		  </xsl:choose>
</p>
		  <xsl:if test="normalize-space(//ip/@antipassive)='yesAffix'">
<example num="xIP.IPAntipassives.10">
<table border="1">
				<tr>
				   <th>Afijo de antipasivo</th>
				   <th>Glosa</th>
				</tr>
				<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/antipassiveAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<xsl:text>Algunos ejemplos de oraciones antipasivas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, con algunos incluyendo el obeto o paciente opcional si permite, son:</xsl:text>
</p>
		  <example num="xIP.IPAntipassives.14">
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
<xsl:with-param name="sExNumber">xIP.IPAntipassives.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPAntipassives.14.1</xsl:text>
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
		  <secTitle>Otro indicador de voz</secTitle>
		  <p>
<xsl:text>Algunas lenguas, tales como Tagalog y otras lenguas del Austronesio, poseen afijos en el verbo que ayudan a definir las relaciones de las frases nominales en la oración.  Este es algo semejante a voz pasiva para dar énfasis a alguna de sus frases nominales.
			 Los afijos verbales indican cuál frase nominal es la prominente y pueden implicar un cambio en el orden de las palabras y/o la marca de caso.  Por ejemplo, en Tagalog el indicador de la voz refleja la relación gramatical del argumento nominativo. </xsl:text>
</p>
		  <p>
<xsl:text>In </xsl:text>
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
			 <xsl:when test="//ip/@voiceCase='no'">se indican la voz con un cambio en el orden de las palabras en vez de la marca de caso.</xsl:when>
			 <xsl:when test="//ip/@voiceCase='yesNom'">el indicador de voz refleja la relación gramatical del argumento nominativo.</xsl:when>
			 <xsl:when test="//ip/@voiceCase='yesAbs'">el indicador de voz refleja la relación gramatical del argumento absolutivo.</xsl:when>
		  </xsl:choose>
<xsl:text>  En el cuadro siguiente se muestra los afijos verbales utilizadas para indicar la voz de la oración:</xsl:text>
</p>
		  <example num="xIP.IPVoice.8">
<table border="1">
				<caption>
				   <xsl:text>Afijos verbales para la voz</xsl:text>
				</caption>
				<tr>
				   <th>Tipo de voz</th>
				   <th>
					  <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
				   </th>
				</tr>
				<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/actorVoiceExamplewho),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
					  <xsl:text>Actor o Activo</xsl:text>
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
					  <xsl:text>Actor o Activo</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//ip/objectVoiceExamplewho),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length(normalize-space($sExampleValue1))" />
<xsl:choose>
<xsl:when test="$iExampleLength1 != 0 and $sExampleValue1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
					  <xsl:text>Objeto, Paciente, Tema o Traspaso</xsl:text>
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
					  <xsl:text>Objeto, Paciente, Tema o Traspaso</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//ip/dativeVoiceExamplewho),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length(normalize-space($sExampleValue2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2 != 0 and $sExampleValue2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
					  <xsl:text>Dativo</xsl:text>
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
					  <xsl:text>Dativo</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//ip/locativeVoiceExamplewho),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3" select="string-length(normalize-space($sExampleValue3))" />
<xsl:choose>
<xsl:when test="$iExampleLength3 != 0 and $sExampleValue3 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
					  <xsl:text>Locativo</xsl:text>
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
					  <xsl:text>Locativo</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue4">
<xsl:value-of select="translate(string(//ip/instrumentalVoiceExamplewho),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4" select="string-length(normalize-space($sExampleValue4))" />
<xsl:choose>
<xsl:when test="$iExampleLength4 != 0 and $sExampleValue4 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
					  <xsl:text>Instrumento</xsl:text>
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
					  <xsl:text>Instrumento</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue5">
<xsl:value-of select="translate(string(//ip/goalVoiceExamplewho),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5" select="string-length(normalize-space($sExampleValue5))" />
<xsl:choose>
<xsl:when test="$iExampleLength5 != 0 and $sExampleValue5 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
					  <xsl:text>Meta</xsl:text>
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
					  <xsl:text>Meta</xsl:text>
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
<xsl:text>Algunos ejemplos que muestran cambios en este tipo de voz en </xsl:text>
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
		  <example num="xIP.IPVoice.12">
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
<xsl:with-param name="sExNumber">xIP.IPVoice.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPVoice.12.1</xsl:text>
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
		  <secTitle>Causativos</secTitle>
		  <p>
<xsl:text>Los causativos agregan un argumento adicional a la oración. Algunas lenguas tienen oraciones causativas de una sola cláusula, donde el verbo se marca con un afijo que introduce el argumento adicional. Ése es el tipo de construcción que se cubre en esta sección.</xsl:text>
</p>
		  <p>
<xsl:text>Inglés y español tienen solamente causativos sintácticos que consisten en dos cláusulas, por ejemplo: </xsl:text>
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
<xsl:text>.  Este segundo tipo de causativo será discutido más completamente en la sección  </xsl:text>
<sectionRef sec="sCompCausative" />
<xsl:text>.</xsl:text>
</p>
		  <p>
<xsl:text>En </xsl:text>
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
			 <xsl:when test="//ip/@causative='no'">las únicas oraciones causativas consisten en dos cláusulas con un verbo principal que significa ‘make (hacer)’ o ‘cause (causar)’.  Algunos ejemplos de causativos sintácticos son:</xsl:when>
			 <xsl:when test="//ip/@causative='yes'">hay un afijo verbal para causativo que introduce un argumento adicional y es el único tipo de causativo en la lengua.  Los afijos causativos son:</xsl:when>
			 <xsl:when test="//ip/@causative='yesBoth'">hay un afijo verbal para causativo que introduce un argumento adicional y los causativos sintácticos que consisten en dos cláusulas son también posibles.  Los afijos causativos son:</xsl:when>
		  </xsl:choose>
</p>
		  <xsl:if test="normalize-space(//ip/@causative)='yes' or normalize-space(//ip/@causative)='yesBoth'">
<example num="xIP.IPCausatives.10">
<table border="1">
				<tr>
				   <th>Afijos causativos</th>
				   <th>Glosa</th>
				</tr>
				<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/causativeAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
		  <xsl:if test="normalize-space(//ip/@causative)='yes' or normalize-space(//ip/@causative)='yesBoth'">
<p>
<xsl:text>Algunos ejemplos de oraciones causativas utilizando los afijos causativos </xsl:text>
<xsl:choose>
			 <xsl:when test="//ip/@causative='yesBoth'">y algunos ejemplos de causativos sintácticos </xsl:when>
		  </xsl:choose>
<xsl:text>son:</xsl:text>
</p>
</xsl:if>
		  <example num="xIP.IPCausatives.14">
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
<xsl:with-param name="sExNumber">xIP.IPCausatives.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCausatives.14.1</xsl:text>
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
