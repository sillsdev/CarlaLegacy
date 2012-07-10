<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="comp">
	<section1 id="sComp">
		<secTitle>Las cláusulas de complemento</secTitle>
		<p>
<xsl:text>Hay varios tipos de cláusulas subordinadas que son complementos de verbos principales o de adjetivos que funcionan al igual que el predicado de la oración.
				Algunos ejemplos de cada tipo de complemento clausal serán dados en la sección siguiente, seguida por un análisis de los complementizadoras y su posición en cláusulas subordinadas declarativas. Véase la sección </xsl:text>
<sectionRef sec="sQues" />
<xsl:text> para un análisis semejante para las preguntas subordinadas y la sección </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text> para las cláusulas relativas.</xsl:text>
</p>
		<section2 id="sCompType">
			<secTitle>Tipos de cláusulas de complemento</secTitle>
			<p>
<xsl:text>Cada uno de las subsecciones siguientes ejemplifica un tipo particular de complemento para un verbo o otro predicado.  Véase la sección </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text> para considerar ejemplos de cláusulas adverbiales. Algunos adverbios también pueden tener complementos clausal de la mayor parte de estos tipos, aunque las cláusulas adverbiales no son complementos del verbo principal. </xsl:text>
</p>
			<section3 id="sCompTypeFinite">
				<secTitle>Un complemento finito</secTitle>
				<p>
<xsl:text>Algunos ejemplos de los verbos que solamente pueden tener un complemento finito clausal en español son: </xsl:text>
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
<xsl:text>.  Observe que en estos mismos ejemplos en inglés, el complementizador es opcional.</xsl:text>
</p>
				<p>
<xsl:text>Algunos ejemplos con este tipo de complemento en </xsl:text>
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
			<section3 id="sCompFiniteOrNonfiniteIP">
				<secTitle>Un complemento finito o infinitivo</secTitle>
				<p>
<xsl:text>Algunos ejemplos de los verbos que pueden tener un complemento finito, con o sin un complementizador, o un complemento infinitivo sin un complementizador en inglés son: </xsl:text>
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
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text>Algunos ejemplos con este tipo de complemento en </xsl:text>
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
			<section3 id="sCompTypeNonfiniteIP">
				<secTitle>Un complemento infinitivo</secTitle>
				<p>
<xsl:text>Algunos verbos que solamente pueden tener un complemento infinitivo sin un complementizador permiten un diverso sujeto que la cláusula principal o un sujeto no expresado cuando es coreferente con el sujeto de la cláusula principal. Algunos ejemplos en inglés son: </xsl:text>
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
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text>Algunos ejemplos con este tipo de complemento en </xsl:text>
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
			<section3 id="sCompTypeNonfiniteIPPRO">
				<secTitle>Un complemento infinitivo con un sujeto coreferente</secTitle>
				<p>
<xsl:text>Algunos ejemplos en inglés de los verbos que solamente pueden tener un complemento infinitivo sin un complementizador, pero requieren un sujeto no expresado porque es coreferente con el sujeto de la cláusula principal son: </xsl:text>
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
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text>Algunos ejemplos con este tipo de complemento en </xsl:text>
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
			<section3 id="sCompTypeNonfiniteCP">
				<secTitle>Un complemento infinitivo con un complementizador</secTitle>
				<p>
<xsl:text>Algunos ejemplos en inglés de los verbos que solamente pueden tener un complemento infinitivo, pero el complementizador </xsl:text>
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
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text>Algunos ejemplos con este tipo de complemento en </xsl:text>
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
			<section3 id="sCompTypeObject">
				<secTitle>Un objeto más una cláusula de complemento</secTitle>
				<p>
<xsl:text>Algunos ejemplos en inglés de los verbos que pueden tener un objeto directo así como un complemento finito o infinitivo clausal son: </xsl:text>
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
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text>Algunos ejemplos con este tipo de complemento en </xsl:text>
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

		   <section3 id="sCompRaising">
			  <secTitle>Complementos de verbos de ‘ascenso’</secTitle>
			  <p>
<xsl:text>Parece que los verbos de ‘ascenso’ incluyen todos los verbos de percepción y los verbos copulativos. Estos verbos pueden tener un complemento infinitivo o un complemento del adjetivo que sí mismo tiene un complemento finito con un complementizador o un complemento infinitivo. El verbo principal no tiene su propio sujeto, así que la posición sujeta es llenada por el sujeto del complemento infinitivo, como en: </xsl:text>
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
<xsl:text>.  Cuando la cláusula de complemento es finita, el sujeto no puede ser ‘ascensado’ , así que una palabra sin significado </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>it</langData>
<xsl:text> llena la posición del sujeto de la cláusula principal en inglés, como en:  </xsl:text>
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
<xsl:text>.</xsl:text>
</p>
			  <p>
<xsl:text>Algunos ejemplos con este tipo de complemento en </xsl:text>
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
			  <example num="xComp.CompType.CompRaising.8">
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
<xsl:with-param name="sExNumber">xComp.CompType.CompRaising.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompType.CompRaising.8.1</xsl:text>
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

		   <section3 id="sCompCausative">
			  <secTitle>Complementos de verbos causativos</secTitle>
			  <p>
<xsl:text>Los causativos sintácticos consisten en dos cláusulas y tienen un objeto que también actúa como el sujeto de la cláusula de complemento. Esta cláusula de complemento es siempre infinitiva, pero no necesita el indicador infinitivo con algunos verbos en inglés, como en </xsl:text>
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
			  <p>
<xsl:text>Algunos ejemplos con este tipo de complemento en </xsl:text>
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
			  <example num="xComp.CompType.CompCausative.8">
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
<xsl:with-param name="sExNumber">xComp.CompType.CompCausative.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompType.CompCausative.8.1</xsl:text>
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
			  <xsl:if test="normalize-space(//ip/@causative)!='no'">
<p>
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sIPCausatives" />
<xsl:text> para ejemplos de causativos oraciones causativas de una sola cláusula, donde el verbo se marca con un afijo que introduce el argumento adicional en </xsl:text>
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
		   </section3>

		   <section3 id="sCompSpeech">
			  <secTitle>Discurso directo e indirecto como complementos</secTitle>
			  <p>
<xsl:text>Los verbos del discurso pueden tener complementos directos o indirectos. Las citas directas pueden consistir de cualquiera oración o interjección o saludo, por ejemplo: </xsl:text>
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
			  <p>
<xsl:text>Las citas indirectas como complementos son más restrictas. En inglés, algunos verbos del discurso pueden tener un complemento finito, con o sin un complementizador, y una frase preposicional opcional para expresar al oyente, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue said (to me) that she would come here tomorrow</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Susana dijo (a mí) que ella vendría aquí mañana’</xsl:text>
</gloss>
<xsl:text>.  Otros verbos pueden tener al oyente ser expresado como objeto más un complemento finito, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue told me that she would come here tomorrow</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Susana me dijo que ella vendría aquí mañana’</xsl:text>
</gloss>
<xsl:text>, o un complemento infinitivo sin un complementizador con sujeto no expresado porque es coreferente con el sujeto de la cláusula principal, como en </xsl:text>
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
			  <p>
<xsl:text>Algunos ejemplos con este tipo de complemento en </xsl:text>
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
			  <example num="xComp.CompType.CompSpeech.10">
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
<xsl:with-param name="sExNumber">xComp.CompType.CompSpeech.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompType.CompSpeech.10.1</xsl:text>
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


			<section3 id="sCompTypeOther">
				<secTitle>Otras restricciones en cláusulas de complemento</secTitle>
				<p>
<xsl:text>Algunas lenguas también tienen verbos que tengan otras restricciones en cláusulas subordinadas, tales como eso que el verbo subordinado debe estar en el modo subjuntivo o en el aspecto de perfectivo. Cualquiera ejemplos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí:</xsl:text>
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
		<section2 id="sCompPos">
			<secTitle>Posición de complementizador</secTitle>
			<p>
<xsl:text>En inglés hay dos complementizadores que indican cláusulas subordinadas declarativas, </xsl:text>
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
<xsl:text> para las cláusulas infinitivas. El español utiliza </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>que</langData>
<xsl:text> como el complementizador en ambos tipos de cláusulas subordinadas declarativas.
					En otras lenguas los complementizadores para las cláusulas declarativas subordinadas pueden o no pueden ser presentes, y en algunas lenguas son clíticos que se escriben unidos con otra palabra.</xsl:text>
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
					<xsl:when test="//comp/@comp='no'">no hay ninguna palabra del complementizador ni un clítico para las cláusulas subordinadas declarativas.</xsl:when>
					<xsl:when test="//comp/@comp='yes'">hay por lo menos un complementizador para las cláusulas subordinadas declarativas.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//comp/@comp)='yes'">
					<xsl:text>  El complementizador es </xsl:text>
					<xsl:choose>
						<xsl:when test="//comp/@compWord='yes'">escrito como una palabra independiente.</xsl:when>
						<xsl:when test="//comp/@compWord='no'">un clítico que se une</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/@comp)='yes'">
						<xsl:text></xsl:text>
						<xsl:choose>
							<xsl:when test="//comp/@compCliticAttaches='edge'">en el extremo de la cláusula subordinada. </xsl:when>
							<xsl:when test="//comp/@compCliticAttaches='head'">al verbo en la cláusula subordinada. </xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="//comp/@compCliticPos='before'">Éstos clíticos son proclíticos.</xsl:when>
							<xsl:when test="//comp/@compCliticPos='after'">Éstos clíticos son enclíticos.</xsl:when>
							<xsl:when test="//comp/@compCliticPos='both'">Hay algunos clíticos que son proclíticos y algunos que son enclíticos.</xsl:when>
							<xsl:when test="//comp/@compCliticPos='unknown'">_______</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//comp/@compWord)='yes' and normalize-space(//comp/@comp)='yes'">
					<xsl:text> El complementizador se presenta </xsl:text>
					<xsl:choose>
						<xsl:when test="//comp/@compPos='before'">antes</xsl:when>
						<xsl:when test="//comp/@compPos='after'">después</xsl:when>
						<xsl:when test="//comp/@compPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
						<xsl:when test="//comp/@compPos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
						<xsl:when test="//comp/@compPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
						<xsl:when test="//comp/@compPos='afterOrBoth'">después o en ambos lados</xsl:when>
						<xsl:when test="//comp/@compPos='both'">en ambos lados</xsl:when>
						<xsl:when test="//comp/@compPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text> de la  cláusula subordinada.  </xsl:text>
					<xsl:if test="normalize-space(//comp/@compPos)!='before' and normalize-space(//comp/@compPos)!='after' and normalize-space(//comp/@compEitherRestricted)='unrestricted' and normalize-space(//comp/@comp)='yes'">
						<xsl:text>Todos los complementizadores pueden presentarse de cualquier lado de la cláusula subordinada.</xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//comp/@compPos)!='before' and normalize-space(//comp/@compPos)!='after' and normalize-space(//comp/@compEitherRestricted)='restricted' and normalize-space(//comp/@comp)='yes'">
						<xsl:text>Hay restricciones en cuanto a cuáles de los complementizadores pueden presentarse en cada lado de la cláusula subordinada.</xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
		</section2>
	</section1>



































</xsl:template>
</xsl:stylesheet>
