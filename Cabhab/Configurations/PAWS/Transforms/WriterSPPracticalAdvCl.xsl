<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="advcl">
	<section1 id="sAdvCl">
		<secTitle>Las cláusulas adverbiales</secTitle>
		<p>
<xsl:text>En esta sección se analizan los complementos que pueden seguir los adverbios de tiempo y de razón, que fueron introducidos en las secciones </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> y </xsl:text>
<sectionRef sec="sAdvPReason" />
<xsl:text>.  Todas de estas cláusulas (o frases) adverbiales funcionan al igual que los adverbios simples, así que ellos serán considerados frases adverbiales con el tipo apropiado de complemento. Las cláusulas adverbiales de estos tipos normalmente pueden presentarse o inicial o final de la oración. </xsl:text>
</p>
		<section2 id="sAdvClTemporal">
			<secTitle>Complementos de adverbios de tiempo</secTitle>
			<p>
<xsl:text>Algunos ejemplos en español de adverbios de tiempo con los complementos usados en oraciones completas son:</xsl:text>
</p>
			<ol>
				<li>
					<xsl:text>[Desde entonces], Juan ha sido cambiante.</xsl:text>
				</li>
				<li>
					<xsl:text>Juan ha sido en casa [desde la semana pasada].</xsl:text>
				</li>
				<li>
					<xsl:text>[Puesto que Juan vuelto a casa del hospital] él está haciendo mejor.</xsl:text>
				</li>
				<li>
					<xsl:text>Juan está sintiendo fino [ahora que él vuelto a casa del hospital].</xsl:text>
				</li>
				<li>
					<xsl:text>El perro siguió a Susana por todas partes [cuando ella volvió de universidad].</xsl:text>
				</li>
				<li>
					<xsl:text>[Cuando ella volvió de universidad], el perro siguió a Susana por todas partes.</xsl:text>
				</li>
			</ol>
			<p>
<xsl:text>Estos ejemplos muestran que los adverbios de tiempo particulares permiten ciertos tipos de complementos. En (1) </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>desde</langData>
<xsl:text> es seguido por otro adverbio de tiempo, y en (2) por una frase nominal de tiempo.  Los ejemplos (3) y (4) muestran que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>puesto</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ahora</langData>
<xsl:text> pueden tener un complemento clausal finito con un complementizador, mientras que los ejemplos (5) y (6) muestran que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cuando</langData>
<xsl:text> tiene una oración finito por su complemento.</xsl:text>
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
<xsl:text>, los complementos occuren </xsl:text>
<xsl:choose>
					<xsl:when test="//advcl/@advOrNPPos='before'">antes</xsl:when>
					<xsl:when test="//advcl/@advOrNPPos='after'">después</xsl:when>
					<xsl:when test="//advcl/@advOrNPPos='either'">de cualquier lado</xsl:when>
					<xsl:when test="//advcl/@advOrNPPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del adverbio.  Algunos ejemplos de cláusulas adverbiales de tiempo en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, incluidos en oraciones completas son: </xsl:text>
</p>
			<example num="xAdvCl.AdvClTemporal.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advcl/tempSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advcl/tempSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advcl/tempSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advcl/tempSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvCl.AdvClTemporal.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvCl.AdvClTemporal.12.1</xsl:text>
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
		<section2 id="sAdvClReason">
			<secTitle>Complementos de adverbios de razón</secTitle>
			<p>
<xsl:text>En las frases adverbiales o a las cláusulas que expresan razón o propósito, encontramos los adverbios que se colocan solamente, por ejemplo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>por lo tanto</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pues</langData>
<xsl:text>(que a veces se consideran las conjunciones de oraciones), junto con los adverbios que tiene varios tipos de cláusulas de complemento.
					Algunos ejemplos en español de los adverbios de la razón o del propósito que tienen complementos clausal son:</xsl:text>
</p>
			<ol>
				<li>
					<xsl:text>Juan fue de prisa al hospital [porque Susana estaba en un accidente].</xsl:text>
				</li>
				<li>
					<xsl:text>[Puesto que Juliana dijo que ella tiene gusto de él], José sonríe todo el tiempo.</xsl:text>
				</li>
				<li>
					<xsl:text>David fue de prisa al aeropuerto [de modo que él pudiera ver a María antes de que ella se fuera].</xsl:text>
				</li>
				<li>
					<xsl:text>Las tropas lanzaron las granadas en el enemigo [para escaparse].</xsl:text>
				</li>
				<li>
					<xsl:text>Las tropas lanzaron las granadas en el enemigo [para que los presos se escapen].</xsl:text>
				</li>
			</ol>
			<p>
<xsl:text>En los ejemplos anteriores, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>porque</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>puesto que</langData>
<xsl:text>  y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>de modo que</langData>
<xsl:text> tienen oraciones finitos por complementos.  En cambio, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>para</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en orden</langData>
<xsl:text> tiene una oración infinitivo.  Éste es el grupo de complementos como se muestra para </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>gustar</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>odiar</langData>
<xsl:text> en la sección </xsl:text>
<sectionRef sec="sCompTypeNonfiniteCP" />
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>Algunos ejemplos de las cláusulas adverbiales de la razón o del propósito en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, incluidos en oraciones completas son: </xsl:text>
</p>
			<example num="xAdvCl.AdvClReason.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/reasonExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/reasonExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/reasonExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/reasonExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvCl.AdvClReason.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvCl.AdvClReason.12.1</xsl:text>
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
