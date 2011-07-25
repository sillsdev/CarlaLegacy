<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="ip">
	<section1 id="sIP">
		<secTitle>Las oraciones básicas</secTitle>
		<p>
<xsl:text>Esta sección cubre oraciones intransitivas, copulativas, transitivas, ditransitivas y pasivas en su orden de las palabras básico (es decir no cambiado por el foco, el asunto, el interrogativo, o las construcciones de la negación).
				Según lo observado en la sección </xsl:text>
<sectionRef sec="sIntro" />
<xsl:text>,  a tipología de </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> es </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@wordOrder='SVO'">SVO, así que el orden de las palabras básico es el tema, después cualquier elemento auxiliar, después la frase de verbo que consiste en el verbo en la posición inicial y cualesquiera complementos que la siguen.</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">SOV, así que el orden de las palabras básico es el tema, después la frase de verbo que consiste en el verbo en la posición final con cualquier complemento que la precede, entonces cualesquiera elementos auxiliares.</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">VSO, así que el orden de las palabras básico es el verbo en la posición inicial, entonces el tema, entonces cualquier complemento.</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">VOS, así que el orden de las palabras básico es la frase de verbo que consiste en el verbo en la posición inicial y cualquier complemento que la sigue, entonces cualesquiera elementos auxiliares, entonces el tema.</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">OVS, así que el orden de las palabras básico es la frase de verbo que consiste en el verbo en la posición final con cualquier complemento que la precede, entonces cualesquiera elementos auxiliares, entonces el tema.</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">OSV, así que el orden de las palabras básico es cualquier complemento verbal primero, entonces el tema, entonces el verbo en la posición final.</xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' or normalize-space(//typology/@wordOrder)='OSV'">
				<xsl:text>  Los cambios del orden de las palabras con cualquier auxiliar presente fueron discutidos en la sección </xsl:text>
				<sectionRef sec="sIPAux" />
				<xsl:text>.</xsl:text>
			</xsl:if>
<xsl:text></xsl:text>
</p>
		<p>
<xsl:text>Cada uno de los tipos de la oración se cubre en turno aquí. </xsl:text>
</p>
		<section2 id="sIPMotion">
			<secTitle>Los intransitivos y las construcciones del movimiento</secTitle>
			<p>
<xsl:text>Los intransitivos simples no tienen ningunos complementos después del verbo, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>La muchacha flota</langData>
<xsl:text>.  Los verbos del movimiento incluyen una localidad en la forma de una frase </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
</xsl:choose>
<xsl:text> o adverbio. Los ejemplos españoles de los verbos del movimiento incluyen </xsl:text>
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
<xsl:text>Los ejemplos de oraciones intransitivas simples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluyen:</xsl:text>
</p>
			<example num="xIP.IPMotion.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/intransExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/intransExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/intransExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/intransExample))" />
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Los ejemplos con verbos del movimiento en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluyen: </xsl:text>
</p>
			<example num="xIP.IPMotion.12">
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
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
		<section2 id="sIPCop">
			<secTitle>Las construcciones copulativas</secTitle>
			<p>
<xsl:text>Las oraciones copulativas pueden tener un adjetivo, frase </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
</xsl:choose>
<xsl:text>, o frase nominal después del verbo copulativo.  Algunas idiomas no requieren un verbo o un auxiliar copulativo estar presente. Los ejemplos españoles incluyen </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>La muchacha es bonita</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ella parece agradable</langData>
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
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> oraciones copulativas, </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@copular='yes'">se requiere un verbo copulativo.</xsl:when>
					<xsl:when test="//ip/@copular='yesOptional'">un verbo copulativo es opcional, y no se requiere a ningún auxiliar tampoco.</xsl:when>
					<xsl:when test="//ip/@copular='yesAux'">un verbo copulativo es opcional, pero requiere un auxiliar si el verbo copulativo no está presente.</xsl:when>
					<xsl:when test="//ip/@copular='noAux'">no hay verbo copulativo, pero requiere un auxiliar.</xsl:when>
					<xsl:when test="//ip/@copular='noNeither'">ni utilizan un verbo copulativo ni un auxiliar.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@copular)='noNeither' or normalize-space(//ip/@copular)='yesOptional'">
					<xsl:text></xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@copularAffix='no'">No hay ningún afijo copulativo en el nominal del predicado o adjetivo predicativo</xsl:when>
						<xsl:when test="//ip/@copularAffix='yesPrefix'">Hay un prefijo copulativo en el nominal del predicado o el adjetivo predicativo, sin embargo,</xsl:when>
						<xsl:when test="//ip/@copularAffix='yesSuffix'">Hay un sufijo copulativo en el nominal del predicado o el adjetivo predicativo, sin embargo,</xsl:when>
						<xsl:when test="//ip/@copularAffix='yesEither'">Hay un prefijo o sufijo copulativo en el nominal del predicado o el adjetivo predicativo, sin embargo,</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@copular)='noNeither'">
					<xsl:text>.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@copular)='yesOptional'">
					<xsl:text> que ocurre cuando no hay presente un verbo copulativo.</xsl:text>
				</xsl:if>
</p>
			<p>
<xsl:text>Los ejemplos de oraciones copulativas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluyen:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
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
			<secTitle>Los transitivos and ditransitivos</secTitle>
			<p>
<xsl:text>Los ejemplos de las oraciones transitivas españolas incluyen </xsl:text>
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
<xsl:text>Los ejemplos de oraciones transitivas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluyen:</xsl:text>
</p>
			<example num="xIP.IPTrans.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/example))" />
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Los ditransitivos pueden tener el segundo objeto expresado como frase </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
</xsl:choose>
<xsl:text> o como frase nominal. Algunas idiomas, como español, permiten ambos tipos via el movimiento del dativo, como en </xsl:text>
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
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
					<xsl:when test="//ip/@diCat='dp'">es simepre una frase nominal.  El </xsl:when>
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
					<xsl:text> aparece lo más cerca al verbo.</xsl:text>
				</xsl:if>
</p>
			<p>
<xsl:text>  Los ejemplos de oraciones ditransitivas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluyen:</xsl:text>
</p>
			<example num="xIP.IPTrans.16">
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
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
			<secTitle>Los pasivos</secTitle>
			<p>
<xsl:text>La mayoría de los idiomas también tienen oraciones pasivas, donde el tema o el paciente llena la posición sujeta. El agente se puede expresar opcionalmente en algunos idiomas, pero no se permite en otros. Si está expresado, puede tomar la forma de una frase  </xsl:text>
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
<xsl:text>) o de una frase nominal, dependiendo del idioma. Además, un auxiliar particular puede ser requerido en pasivos (una forma de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>estar</langData>
<xsl:text> en español).  Los ejemplos españoles con y sin una frase del agente incluyen: </xsl:text>
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
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@passive='no'"> no tiene ningunos pasivos.</xsl:when>
					<xsl:when test="//ip/@passive='yes'"> tiene pasivos</xsl:when>
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
									<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
									<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
									<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
									<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
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
			<xsl:if test="normalize-space(//ip/@passive)='yes'">
<p>
<xsl:text>Los ejemplos de oraciones pasivas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluyen:</xsl:text>
</p>
</xsl:if>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
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
