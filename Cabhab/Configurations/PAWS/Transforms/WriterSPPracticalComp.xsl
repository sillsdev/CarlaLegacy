<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="comp">
	<section1 id="sComp">
		<secTitle>Las cláusulas de complemento</secTitle>
		<p>
<xsl:text>Hay varios tipos de cláusulas subordinadas que sean complementos de verbos principales o de adjetivos que actúan como el predicado de la oración.
				Los ejemplos de cada tipo de complemento clausal serán dados en la sección siguiente, seguida por una discusión de los complementizadoras y su posición en cláusulas subordinadas declarativas. Véase la sección </xsl:text>
<sectionRef sec="sQues" />
<xsl:text> para la discusión similar para las preguntas y la sección </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text> para las cláusulas relativas.</xsl:text>
</p>
		<section2 id="sCompType">
			<secTitle>Tipos de cláusulas de complemento</secTitle>
			<p>
<xsl:text>Cada uno de las subsecciones siguientes ejemplifica un tipo particular de complemento para el verbo o el otro predicado.  Véase la sección </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text> para ejemplos de cláusulas adverbiales. Algunos adverbios pueden también tomar complementos clausal de la mayor parte de estos tipos, aunque las cláusulas adverbiales no son complementos del verbo principal. </xsl:text>
</p>
			<section3 id="sCompTypeFinite">
				<secTitle>Un complemento finito</secTitle>
				<p>
<xsl:text>Los verbos que toman solamente un complemento finito clausal incluyen los ejemplos siguientes en español: </xsl:text>
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
</xsl:attribute>Yo sé que él tiene gusto de mí</langData>
<xsl:text>.  Observe que en estos mismos ejemplos en inglés, el complementizador es opcional.</xsl:text>
</p>
				<p>
<xsl:text>Los ejemplos con este tipo de complemento en </xsl:text>
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
				<example num="xComp.CompType.CompTypeFinite.8">
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
<xsl:with-param name="sExNumber">xComp.CompType.CompTypeFinite.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompType.CompTypeFinite.8.1</xsl:text>
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
			</section3>
			<section3 id="sCompFiniteOrNonfiniteIP">
				<secTitle>Un complemento finito o infinitivo</secTitle>
				<p>
<xsl:text>Los verbos que toman un complemento finito, con o sin un complementizador, o un complemento infinitivo sin un complementizador, incluyen los ejemplos siguientes en inglés: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect that Joe will come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Cuento con que José venga a la fiesta'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Espero que José venga a la fiesta'</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text>Los ejemplos con este tipo de complemento en </xsl:text>
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
				<example num="xComp.CompType.CompFiniteOrNonfiniteIP.8">
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
<xsl:with-param name="sExNumber">xComp.CompType.CompFiniteOrNonfiniteIP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompType.CompFiniteOrNonfiniteIP.8.1</xsl:text>
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
			</section3>
			<section3 id="sCompTypeNonfiniteIP">
				<secTitle>Un complemento infinitivo</secTitle>
				<p>
<xsl:text>Algunos verbos que toman solamente un complemento infinitivo sin un complementizador permiten un diverso tema que la cláusula principal o un tema no expresado cuando es coreferente con el tema de la cláusula principal. Los ejemplos ingleses incluyen: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Quisiera que José viniera a la fiesta'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Quiero que venir a la fiesta'</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text>Los ejemplos con este tipo de complemento en </xsl:text>
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
				<example num="xComp.CompType.CompTypeNonfiniteIP.8">
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
<xsl:with-param name="sExNumber">xComp.CompType.CompTypeNonfiniteIP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompType.CompTypeNonfiniteIP.8.1</xsl:text>
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
			</section3>
			<section3 id="sCompTypeNonfiniteIPPRO">
				<secTitle>Un complemento infinitivo con un tema coreferente</secTitle>
				<p>
<xsl:text>Los verbos que toman solamente un complemento infinitivo sin un complementizador, pero requieren un tema no expresado porque es coreferente con el tema de la cláusula principal, incluya los ejemplos siguientes en inglés: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe tried to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'José intentó venir a la fiesta'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I tried to think of more examples</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Intenté pensar en más ejemplos'</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text>Los ejemplos con este tipo de complemento en </xsl:text>
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
				<example num="xComp.CompType.CompTypeNonfiniteIPPRO.8">
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
<xsl:with-param name="sExNumber">xComp.CompType.CompTypeNonfiniteIPPRO.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompType.CompTypeNonfiniteIPPRO.8.1</xsl:text>
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
			</section3>
			<section3 id="sCompTypeNonfiniteCP">
				<secTitle>Un complemento infinitivo con un complementizador</secTitle>
				<p>
<xsl:text>Los verbos que toman solamente un complemento infinitivo, pero el complementizador </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>for</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'para'</xsl:text>
</gloss>
<xsl:text> es presente cuando el tema no es coreferente con el tema de la cláusula principal, incluye los ejemplos siguientes en inglés: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe would hate for Sue to be at the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'José odiaría para que Susana esté en la fiesta'</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe hates to dance</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'José odia a bailar'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be appreciated</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Quisiera ser apreciado'</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text>Los ejemplos con este tipo de complemento en </xsl:text>
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
				<example num="xComp.CompType.CompTypeNonfiniteCP.8">
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
<xsl:with-param name="sExNumber">xComp.CompType.CompTypeNonfiniteCP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompType.CompTypeNonfiniteCP.8.1</xsl:text>
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
			</section3>
			<section3 id="sCompTypeObject">
				<secTitle>Un objeto más una cláusula de complemento</secTitle>
				<p>
<xsl:text>Los verbos que toman un objeto directo así como un complemento finito o infinitivo clausal incluyen los ejemplos siguientes en inglés: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe that he should come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Persuadiré a José que él debe venir a la fiesta'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe to come to the party</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Persuadiré a José de  venir a la fiesta'</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text>Los ejemplos con este tipo de complemento en </xsl:text>
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
				<example num="xComp.CompType.CompTypeObject.8">
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
<xsl:with-param name="sExNumber">xComp.CompType.CompTypeObject.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompType.CompTypeObject.8.1</xsl:text>
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
			</section3>
			<section3 id="sCompTypeOther">
				<secTitle>Otras restricciones en cláusulas de complemento</secTitle>
				<p>
<xsl:text>Algunos idiomas también tienen verbos que tengan otras restricciones en cláusulas subordinadas, tales como eso que el verbo subordinado debe estar en el modo subjuntivo o en el aspecto de perfectivo. Cualesquiera ejemplos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se demuestran aquí:</xsl:text>
</p>
				<example num="xComp.CompType.CompTypeOther.6">
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
<xsl:with-param name="sExNumber">xComp.CompType.CompTypeOther.6</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompType.CompTypeOther.6.1</xsl:text>
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
			</section3>
		</section2>
		<section2 id="sCompPos">
			<secTitle>La posición de complementizador</secTitle>
			<p>
<xsl:text>El inglés tiene dos complementizadores que marquen cláusulas subordinadas declarativas, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>that</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'que'</xsl:text>
</gloss>
<xsl:text>  para las cláusulas finitas y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>for</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'para'</xsl:text>
</gloss>
<xsl:text> para las cláusulas infinitivas. El español utiliza el </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>que</langData>
<xsl:text>como el complementizador en ambos tipos de cláusulas subordinadas declarativas.
					En otros idiomas los complementizadores para las cláusulas declarativas subordinadas pueden o no pueden ser presentes, y en algunos idiomas son clíticos que se escriben juntos con otra palabra.</xsl:text>
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
<xsl:text>, </xsl:text>
<xsl:choose>
					<xsl:when test="//comp/@comp='no'">no hay ninguna palabra del complementizador ni un clítico para las cláusulas subordinadas declarativas.</xsl:when>
					<xsl:when test="//comp/@comp='yes'">hay por lo menos un complementizador para las cláusulas subordinadas declarativas.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//comp/@comp)='yes'">
					<xsl:text>  El complementizador es </xsl:text>
					<xsl:choose>
						<xsl:when test="//comp/@compWord='yes'">escrito como una palabra separada.</xsl:when>
						<xsl:when test="//comp/@compWord='no'">un clitico que junta</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/@comp)='yes'">
						<xsl:text></xsl:text>
						<xsl:choose>
							<xsl:when test="//comp/@compCliticAttaches='edge'">en el borde de la cláusula subordinada. </xsl:when>
							<xsl:when test="//comp/@compCliticAttaches='head'">al verbo en la cláusula subordinada. </xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="//comp/@compCliticPos='before'">Éstos clíticos son procliticos.</xsl:when>
							<xsl:when test="//comp/@compCliticPos='after'">Éstos clíticos son encliticos.</xsl:when>
							<xsl:when test="//comp/@compCliticPos='both'">Hay algunos clíticos del complementizador que son procliticos y algunos que son encliticos.</xsl:when>
							<xsl:when test="//comp/@compCliticPos='unknown'">_______</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//comp/@compWord)='yes' and normalize-space(//comp/@comp)='yes'">
					<xsl:text> El complementizador occure </xsl:text>
					<xsl:choose>
						<xsl:when test="//comp/@compPos='before'">antes</xsl:when>
						<xsl:when test="//comp/@compPos='after'">después</xsl:when>
						<xsl:when test="//comp/@compPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
						<xsl:when test="//comp/@compPos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
						<xsl:when test="//comp/@compPos='beforeOrBoth'">antes on en ambos lados</xsl:when>
						<xsl:when test="//comp/@compPos='afterOrBoth'">después o en ambos lados</xsl:when>
						<xsl:when test="//comp/@compPos='both'">en ambos lados</xsl:when>
						<xsl:when test="//comp/@compPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text> de la  cláusula subordinada.  </xsl:text>
					<xsl:if test="normalize-space(//comp/@compPos)!='before' and normalize-space(//comp/@compPos)!='after' and normalize-space(//comp/@compEitherRestricted)='unrestricted' and normalize-space(//comp/@comp)='yes'">
						<xsl:text>Todos los complementizadores pueden ocurrir de cualquier lado de la cláusula subordinada.</xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//comp/@compPos)!='before' and normalize-space(//comp/@compPos)!='after' and normalize-space(//comp/@compEitherRestricted)='restricted' and normalize-space(//comp/@comp)='yes'">
						<xsl:text>Hay las restricciones en cuanto a las cuales de los complementizers puede ocurrir en cada lado de la cláusula subordinada.</xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
		</section2>
	</section1>































</xsl:template>
</xsl:stylesheet>
