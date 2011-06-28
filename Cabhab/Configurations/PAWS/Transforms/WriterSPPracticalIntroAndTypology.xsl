<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="intro">
	<section1 id="sIntro">
		<secTitle>Introducción</secTitle>
		<p>
<xsl:text>Ésta es una descripción del sintaxis de </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> basado en las respuestas dadas al kit del arrancador de PAWS. Esta gramática descriptiva se escribe como gramática práctica que deba ser útil para la comunidad del idioma así como para la documentación de mucha del idioma.</xsl:text>
</p>
		<p>
<object type="tComment">Una vez que se termina el kit del arrancador, este archivo puede servir como bosquejo para preparar una gramática más completa.</object>
</p>
		<p>
<object type="tComment">Hasta que usted haya terminado cada página del kit del arrancador, algo de la información dada puede ser inexacta porque se basa solamente en las respuestas del "default". Las respuestas del "default" referentes a la posición de elementos se demuestran aquí como ____ hasta que usted haya terminado la página apropiada en el programa.</object>
</p>
		<p>
<object type="tComment">¡NO MODIFIQUE ESTE ARCHIVO HASTA QUE SE TERMINE PAWS, porque su trabajo será sobreescrito por el programa de PAWS!</object>
</p>
		<p>
<xsl:text>El idioma del </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se habla en </xsl:text>
<object type="tComment">(pone las localidades aquí)</object>
<xsl:text>. Hay aproximadamente </xsl:text>
<object type="tComment">(pone el número aquí)</object>
<xsl:text> hablantes. El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> es un miembro del </xsl:text>
<object type="tComment">(pone el nombre de familia del idioma aquí)</object>
<xsl:text> familia del idiomas.</xsl:text>
</p>
		<section2 id="sOrtho">
			<secTitle>La ortografía</secTitle>
			<p>
<xsl:text>Las grafías que se usan para escribir el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> abarcan no solamente las letras que se usan en las palabras nativas, sino también otras que se usan en las palabras tomadas del español. En </xsl:text>
<exampleRef num="xAlphabet" equal="no" letterOnly="no" />
<xsl:text> se presentan estas grafías en orden alfabético:</xsl:text>
</p>
			<example num="xAlphabet">
<table>
					<tr>
						<th>Grafía</th>
						<th>Ejemplo</th>
						<th>Significado</th>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
				</table>
</example>
			<p>
<xsl:text>Véase el apéndice </xsl:text>
<appendixRef app="aAppdx" />
<xsl:text> para cuadros de las consonantes y las vocales que comparan la ortografía práctica con el alfabeto fonético.</xsl:text>
</p>
		</section2>
		<section2 id="sExamples">
			<secTitle>Convenciones usadas en los ejemplos</secTitle>
			<p>
<xsl:text>Esta gramática contiene muchas frases y oraciones ilustrativas. La mayor parte de éstos se presentan en líneas interlineales del formato que consisten en tres o cuatro líneas, como se muestra en </xsl:text>
<exampleRef num="xEx" equal="no" letterOnly="no" />
<xsl:text>:</xsl:text>
</p>
			<example num="xEx">
<table>
					<tr>
						<td align="left">
							<xsl:text>[palabras vernáculas]</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>palabra</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>palabra</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>palabra</langData>
						</td>
					</tr>
					<tr>
						<td align="left">
							<xsl:text>[significado literal de palabras]</xsl:text>
						</td>
						<td align="left">
							<xsl:text>significado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>significado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>significado</xsl:text>
						</td>
					</tr>
					<tr>
						<td align="left">
							<xsl:text>[significado por morfemas]</xsl:text>
						</td>
						<td align="left">
							<xsl:text>PRE-raíz-SUF</xsl:text>
						</td>
						<td align="left">
							<xsl:text>PRE-raíz-SUF</xsl:text>
						</td>
						<td align="left">
							<xsl:text>PRE-raíz-SUF</xsl:text>
						</td>
					</tr>
					<tr>
						<td align="left">
							<xsl:text>[traducción libre]</xsl:text>
						</td>
						<td align="left" colspan="3">
							<xsl:text>traducción libre de frase u oración</xsl:text>
						</td>
					</tr>
				</table>
</example>
			<p>
<xsl:text>Las palabras del </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se dan en la primera línea. La segunda línea presenta una traducción literal en español, palabra por palabra, dando la palabra de español que está el más cercano de significar a la palabra del </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>. Si más de una palabra española es necesaria expresar el significado de la palabra del </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, estas palabras españolas serán separadas por puntos. Siempre que uno o más de las palabras del </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tengan más de una porción (morfema), la tercera línea demuestra los significados para las partes de la palabra, con los prefijos, la raíz, y los sufijos separados por guiones. Esta tercera línea puede ser la más útil a los lingüistas. La línea final da la traducción libre por el ejemplo entero.</xsl:text>
</p>
			<p>
<object type="tComment">Diga más aquí sobre cualquier diferencia entre su lengua y español. Por ejemplo, si su lengua no distingue entre el número y/o el género en sustantivos, como español hace, usted elige utilizar solamente las formas singulares y/o masculinas para los significados.</object>
</p>
			<p>
<xsl:text>Después de dar la información sobre la tipología sintáctica del idioma, la gramática comienza describiendo las partes del discurso y las frases que dirigen en las secciones </xsl:text>
<sectionRef sec="sN" />
<xsl:text>-</xsl:text>
<sectionRef sec="sExcl" />
<xsl:text>. Las oraciones de la cláusula básicas, principales entonces se cubren en la sección </xsl:text>
<sectionRef sec="sIP" />
<xsl:text>, seguido por las construcciones que implican cambios en el orden de las palabras (las secciones </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text>-</xsl:text>
<sectionRef sec="sNeg" />
<xsl:text>). Las construcciones de la coordinación entonces se cubren en la sección </xsl:text>
<sectionRef sec="sCoord" />
<xsl:text>, seguido finalmente por los varios tipos de cláusulas encajadas (las secciones </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>-</xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>). Algunos textos son incluidos en el extremo demostrar cómo construcciones más grandes tales como párrafos, conversaciones, e historias narrativas se forman.</xsl:text>
</p>
		</section2>
	</section1>
	<section1 id="sTypology">
		<secTitle>La tipología del orden de las palabras</secTitle>
		<p>
<xsl:text>El orden de las palabras básico de </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> en oraciones transitivas es </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@wordOrder='SVO'">Sujeto-Verbo-Objeto</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">Sujeto-Objeto-Verbo</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">Verbo-Sujeto-Objeto</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">Verbo-Objeto-Sujeto</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">Objeto-Verbo-Sujeto</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">Objeto-Sujeto-Verbo</xsl:when>
			</xsl:choose>
<xsl:text>, como se muestra en los ejemplos siguientes:</xsl:text>
</p>
		<example num="xTypology.6">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//typology/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//typology/example)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTypology.6</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTypology.6.1</xsl:text>
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
		<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='unknown'">
<p>
<xsl:text>En armonía con la tipología cabeza-inicial, el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene preposiciones (la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='after'">
<p>
<xsl:text>Al contrario de la tipología cabeza-inicial, el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene posposiciones (la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//pp/@pPos)='both'">
<p>
<xsl:text>El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene ambos preposiciones y posposiciones (la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='unknown'">
<p>
<xsl:text>En armonía con la tipología cabeza-final, el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene posposiciones (la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='before'">
<p>
<xsl:text>Al contrario de la tipología cabeza-final, el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene preposiciones (la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<p>
<xsl:text>Los poseedores ocurren </xsl:text>
<xsl:choose>
				<xsl:when test="//np/@possNounPos='before'">delante</xsl:when>
				<xsl:when test="//np/@possNounPos='after'">después</xsl:when>
				<xsl:when test="//np/@possNounPos='either'">de cualquier lado</xsl:when>
				<xsl:when test="//np/@possNounPos='unknown'">_______</xsl:when>
			</xsl:choose>
<xsl:text> del sustantivo que es poseído (la sección </xsl:text>
<sectionRef sec="sNPPoss" />
<xsl:text>). Las frases del adjetivo ocurren </xsl:text>
<xsl:choose>
				<xsl:when test="//np/@adjpPos='before'">delante</xsl:when>
				<xsl:when test="//np/@adjpPos='after'">después</xsl:when>
				<xsl:when test="//np/@adjpPos='either'">de cualquier lado (pero no ambos lados)</xsl:when>
				<xsl:when test="//np/@adjpPos='beforeOrBoth'">delante de o en ambos lados</xsl:when>
				<xsl:when test="//np/@adjpPos='afterOrBoth'">después de o en ambos lados</xsl:when>
				<xsl:when test="//np/@adjpPos='both'">en ambos lados</xsl:when>
				<xsl:when test="//np/@adjpPos='unknown'">_______</xsl:when>
			</xsl:choose>
<xsl:text> del sustantivo que se están modificando (la sección </xsl:text>
<sectionRef sec="sNPAdjP" />
<xsl:text>).</xsl:text>
<xsl:if test="normalize-space(//relcl/@exist)='no'">
				<xsl:text>El </xsl:text>
				<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
				<xsl:text> no tiene ningún tipo de cláusula relativa.</xsl:text>
			</xsl:if>
<xsl:if test="normalize-space(//relcl/@exist)='yes'">
				<xsl:text>Las cláusulas relativas ocurren </xsl:text>
				<xsl:choose>
					<xsl:when test="//relcl/@clausePos='before'">delante</xsl:when>
					<xsl:when test="//relcl/@clausePos='after'">después</xsl:when>
					<xsl:when test="//relcl/@clausePos='either'">de cualquier lado</xsl:when>
					<xsl:when test="//relcl/@clausePos='unknown'">_______</xsl:when>
				</xsl:choose>
				<xsl:text> del sustantivo principal (la sección </xsl:text>
				<sectionRef sec="sRelCl" />
				<xsl:text>).</xsl:text>
			</xsl:if>
</p>
		<p>
<xsl:text>En el </xsl:text>
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
				<xsl:when test="//ip/@proDrop='noImp'">un tema que falta no se permite. El tema debe ser expresado a menos que en los imperativos</xsl:when>
				<xsl:when test="//ip/@proDrop='no'">un tema que falta no se permite. El tema debe ser expresado aun cuando en los imperativos</xsl:when>
				<xsl:when test="//ip/@proDrop='yes'">un tema que falta se permite en cualquier tipo de oración</xsl:when>
				<xsl:when test="//ip/@proDrop='yesClitic'">el tema puede mirar como él es falta debido a los pronombres dependientes (clitics pronominal) que juntan al verbo, pero no es una lengua verdadera que permite un tema que falta</xsl:when>
			</xsl:choose>
<xsl:text> (la sección </xsl:text>
<sectionRef sec="sIPProDrop" />
<xsl:text>). </xsl:text>
<xsl:if test="normalize-space(//ip/@proDrop)='yes'">
				<xsl:text> Un objeto que falta </xsl:text>
				<xsl:choose>
					<xsl:when test="//ip/@proDropObject='no'">no</xsl:when>
					<xsl:when test="//ip/@proDropObject='yes'">también</xsl:when>
				</xsl:choose>
				<xsl:text> se permite.</xsl:text>
			</xsl:if>
</p>
		<xsl:if test="normalize-space(//ip/@aux)='no'">
<p>
<xsl:text>El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene ninguna auxiliares que se escriban como palabras separadas (la sección </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//ip/@aux)='yes'">
<p>
<xsl:text>El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene algunos auxiliares que se escriban como palabras separadas. Éstos ocurren </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@wordOrder='SVO'">delante</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">después</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">delante</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">delante</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">después</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">después</xsl:when>
			</xsl:choose>
<xsl:text> del verbo principal (la sección </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<p>
<xsl:if test="normalize-space(//q/@mainYNWord)='yes'">
				<xsl:text>En preguntas sí/no, hay un marcador o un complementizer de la pregunta que ocurren </xsl:text>
				<xsl:choose>
					<xsl:when test="//q/@mainYNPos='before'">delante</xsl:when>
					<xsl:when test="//q/@mainYNPos='after'">después</xsl:when>
					<xsl:when test="//q/@mainYNPos='either'">de cualquier lado (pero no ambos lados)</xsl:when>
					<xsl:when test="//q/@mainYNPos='beforeOrBoth'">delante de o en ambos lados</xsl:when>
					<xsl:when test="//q/@mainYNPos='afterOrBoth'">después de o en ambos lados</xsl:when>
					<xsl:when test="//q/@mainYNPos='both'">en ambos lados</xsl:when>
				</xsl:choose>
				<xsl:text> del resto de la pregunta (la sección </xsl:text>
				<sectionRef sec="sQuesYN" />
				<xsl:text>).</xsl:text>
			</xsl:if>
<xsl:text>  En preguntas contentas, una frase del interrogativo </xsl:text>
<xsl:choose>
				<xsl:when test="//q/@contFront='no'">no se mueve al frente de la cláusula; permanece simplemente en el lugar</xsl:when>
				<xsl:when test="//q/@contFront='after'">puede permanecer en el lugar o puede moverse a la posición inmediatamente antes que el verbo</xsl:when>
				<xsl:when test="//q/@contFront='before'">se mueve al frente de la cláusula</xsl:when>
				<xsl:when test="//q/@contFront='unknown'">_______</xsl:when>
			</xsl:choose>
<xsl:text> (la sección </xsl:text>
<sectionRef sec="sQuesContent" />
<xsl:text>).</xsl:text>
</p>
	</section1>

































































































</xsl:template>
</xsl:stylesheet>
