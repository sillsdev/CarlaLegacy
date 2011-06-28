<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="advcl">
	<section1 id="sAdvCl">
		<secTitle>Las cláusulas adverbiales</secTitle>
		<p>
<xsl:text>Esta sección considera los complementos que pueden seguir los adverbios temporales y de razón, que fueron introducidos en las secciones </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> y </xsl:text>
<sectionRef sec="sAdvPReason" />
<xsl:text>.  Todas de estas cláusulas (o frases) adverbiales actuan igual que los adverbios simples, así que ellos serán considerados frases adverbiales con el tipo apropiado de complemento. Las cláusulas adverbiales de estos tipos pueden ocurrir normalmente u oración-inicial u oración-final. </xsl:text>
</p>
		<section2 id="sAdvClTemporal">
			<secTitle>Los complementos de adverbios temporales</secTitle>
			<p>
<xsl:text>Los ejemplos españoles de adverbios temporales con los complementos usados en oraciones completas incluyen:</xsl:text>
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
<xsl:text>Estos ejemplos demuestran que los adverbios temporales particulares permiten ciertos tipos de complementos. En (1) </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>desde</langData>
<xsl:text> es seguido por otro adverbio temporal, y en (2) por una frase nominal temporal.  Los ejemplos (3) y (4) muestran que </xsl:text>
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
<xsl:text> toma una oración finito por su complemento.</xsl:text>
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
<xsl:text>, los complementos occuren </xsl:text>
<xsl:choose>
					<xsl:when test="//advcl/@advOrNPPos='before'">antes</xsl:when>
					<xsl:when test="//advcl/@advOrNPPos='after'">después</xsl:when>
					<xsl:when test="//advcl/@advOrNPPos='either'">de cualquier lado</xsl:when>
					<xsl:when test="//advcl/@advOrNPPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del adverbio.  Los ejemplos de cláusulas adverbiales temporales en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advcl/tempSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advcl/tempSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advcl/tempSentExample)" />
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
		<section2 id="sAdvClReason">
			<secTitle>Los complementos de adverbios de razón</secTitle>
			<p>
<xsl:text>Dando vuelta ahora a las frases adverbiales o a las cláusulas que expresan razón o propósito, encontramos los adverbios que se colocan solamente, por ejemplo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>por lo tanto</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pues</langData>
<xsl:text>(que a veces se consideran las conjunciones de oraciones), junto con los que toman varios tipos de cláusulas de complemento.
					Los ejemplos españoles de los adverbios de la razón o del propósito que toman complementos clausal incluyen:</xsl:text>
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
<xsl:text>En los ejemplos arriba, </xsl:text>
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
<xsl:text> toma ocaciones finitos por complementos.  En cambio, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>para</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en orden</langData>
<xsl:text> toma una oración infinitivo.  Éste es el grupo de complementos como se muestra para </xsl:text>
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
<xsl:text>Los ejemplos de las cláusulas adverbiales de la razón o del propósito en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/reasonExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/reasonExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/reasonExample)" />
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
	</section1>
</xsl:template>
</xsl:stylesheet>
