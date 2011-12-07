<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="intro">
	<section1 id="sIntro">
		<secTitle>Introducción</secTitle>
		<p>
<xsl:text>Ésta es una descripción del sintaxis de </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> basada en las respuestas dadas al programa de PAWS. Esta gramática descriptiva está escrita como una gramática práctica que puede ser útil para la comunidad del idioma así como para documentar la mayor parte del idioma.</xsl:text>
</p>
		<p>
<object type="tComment">Una vez que se termina de ingresar los datos al programa de PAWS, este archivo puede servir como borrador para preparar una gramática más completa.</object>
</p>
		<p>
<object type="tComment">Parte de la información dada puede ser inexacta hasta que usted haya terminado de ingresar los datos de cada página del programa de PAWS, porque se basa en los datos predeterminados que se refieren a la posición de elementos, los cuales se muestran como ____ hasta que usted haya terminado la página correspondiente en el programa de PAWS.</object>
</p>
		<p>
<object type="tComment">¡NO MODIFIQUE ESTE ARCHIVO HASTA HABER TERMINADO DE INGRESAR TODOS LOS  DATOS EN EL PROGRAMA DE PAWS, porque si no su trabajo será sobrescrito por el programa! Después de terminar de  contestar  todas las preguntas de PAWS, le sugerimos que guarde este archivo con otro nombre antes de corregir su gramática.  También, le sugerimos que cheque especialmente la sección acerca de los pronombres a ver si es correcto.  Si no, puede cambiar sus respuestas en PAWS antes de empezar editando este documento.</object>
</p>
		<p>
<xsl:text>El idioma </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se habla en </xsl:text>
<object type="tComment">(ponga las localidades aquí)</object>
<xsl:text>. Hay aproximadamente </xsl:text>
<object type="tComment">(ponga el número aquí)</object>
<xsl:text> hablantes. El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> es miembro de la familia de idiomas </xsl:text>
<object type="tComment">(pone el nombre de familia del idioma aquí)</object>
<xsl:text>.</xsl:text>
</p>
		<section2 id="sOrtho">
			<secTitle>Ortografía</secTitle>
			<p>
<xsl:text>Las grafías que se usan para escribir el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> abarcan no solamente las letras que se usan en las palabras nativas, sino también otras que se usan en las palabras tomadas del español. En el cuadro </xsl:text>
<exampleRef num="xAlphabet" equal="no" letterOnly="no" />
<xsl:text> se presentan estas grafías en orden alfabético:</xsl:text>
</p>
			<example num="xAlphabet">
<table>
					<tr>
						<th>Grafía</th>
						<th>Ejemplo</th>
						<th>Glosa</th>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_LA_GRAFÍA</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ESCRIBA_UN_EJEMPLO</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA_LA_GLOSA</xsl:text>
</gloss>
						</td>
					</tr>
				</table>
</example>
			<p>
<xsl:text>Véanse  los cuadros de las consonantes y las vocales que comparan la ortografía práctica con el alfabeto fonético en el apéndice </xsl:text>
<appendixRef app="aAppdx" />
<xsl:text> .</xsl:text>
</p>
			<p>
<object type="tComment">Agregue las especificaciones para cualquier signo diacrítico u otros símbolos usados.</object>
</p>
		</section2>
		<section2 id="sExamples">
			<secTitle>Estructura usada en los ejemplos</secTitle>
			<p>
<xsl:text>Esta gramática contiene muchas frases y oraciones ilustrativas. La mayor parte de ellas se presentan con un formato interlinealizado que consiste en tres o cuatro líneas, como se muestra en </xsl:text>
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
							<xsl:text>[glosa literal de palabras]</xsl:text>
						</td>
						<td align="left">
							<xsl:text>glosa</xsl:text>
						</td>
						<td align="left">
							<xsl:text>glosa</xsl:text>
						</td>
						<td align="left">
							<xsl:text>glosa</xsl:text>
						</td>
					</tr>
					<tr>
						<td align="left">
							<xsl:text>[glosa por morfemas]</xsl:text>
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
<xsl:text>Las palabras en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> aprecen en la primera línea. En la segunda línea se presenta una traducción literal en español, palabra por palabra, dando la palabra de español que está el más cercano al significado de la palabra en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>. Si es necesario usar más de una palabra en español para expresar el significado de la palabra en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, estas palabras del español serán separadas por un punto. Siempre que una o más de las palabras en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tengan más de una parte con significado (morfema), así que la tercera línea indicará la glosa para cada una de las partes de la palabra, con los prefijos, la raíz, y los sufijos separados por un guión. Esta tercera línea puede ser la más útil para los lingüistas. En la línea final se proporciona la traducción libre del ejemplo completo</xsl:text>
</p>
			<p>
<object type="tComment">Mencione aquí cualquier diferencia que haya entre su idioma y español. Por ejemplo, si su idioma no distingue entre el número y/o el género en los sustantivos, como lo hace el español, usted debe eligir el uso de solamente las formas singulares y/o masculinas para las glosas.</object>
</p>
			<p>
<xsl:text>Después proveer la información sobre la tipología sintáctica del idioma, la gramática comienza describiendo las partes del discurso y las frases en las secciones </xsl:text>
<sectionRef sec="sN" />
<xsl:text>-</xsl:text>
<sectionRef sec="sExcl" />
<xsl:text>. Las oraciones básicas se analizan en la sección </xsl:text>
<sectionRef sec="sIP" />
<xsl:text>, seguido por las construcciones que implican cambios en el orden de las palabras (véanse las secciones </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text>-</xsl:text>
<sectionRef sec="sNeg" />
<xsl:text>). Las construcciones coordinativas se analizan en la sección </xsl:text>
<sectionRef sec="sCoord" />
<xsl:text>, seguido finalmente por los varios tipos de cláusulas subordinadas (véanse las secciones </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>-</xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>). Al final se incluyen algunos textos para mostrar cómo se forman las construcciones más grandes tales como párrafos, conversaciones e historias narrativas.</xsl:text>
</p>
		</section2>
	</section1>
	<section1 id="sTypology">
		<secTitle>La tipología del orden de las palabras</secTitle>
		<p>
<xsl:text>El orden básico de palabras en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> para las oraciones transitivas es </xsl:text>
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
		<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='unknown'">
<p>
<xsl:text>De acuerdo con la tipología núcleo inicial, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene preposiciones (véase la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='after'">
<p>
<xsl:text>Al contrario de la tipología núcleo inicial, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene posposiciones (véase la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//pp/@pPos)='both'">
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
<xsl:text> tiene ambas preposiciones y posposiciones (véase la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='unknown'">
<p>
<xsl:text>De acuerdo con la tipología núcleo final, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene posposiciones (véase la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='before'">
<p>
<xsl:text>Al contrario de la tipología núcleo final, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene preposiciones (véase la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<p>
<xsl:text>Los poseedores se presentan </xsl:text>
<xsl:choose>
				<xsl:when test="//np/@possNounPos='before'">delante</xsl:when>
				<xsl:when test="//np/@possNounPos='after'">después</xsl:when>
				<xsl:when test="//np/@possNounPos='either'">de cualquier lado</xsl:when>
				<xsl:when test="//np/@possNounPos='unknown'">_______</xsl:when>
			</xsl:choose>
<xsl:text> del sustantivo que es poseído (véase la sección </xsl:text>
<sectionRef sec="sNPPoss" />
<xsl:text>). Las frases adjetivales se encuentran </xsl:text>
<xsl:choose>
				<xsl:when test="//np/@adjpPos='before'">delante</xsl:when>
				<xsl:when test="//np/@adjpPos='after'">después</xsl:when>
				<xsl:when test="//np/@adjpPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
				<xsl:when test="//np/@adjpPos='beforeOrBoth'">delante de o en ambos lados</xsl:when>
				<xsl:when test="//np/@adjpPos='afterOrBoth'">después de o en ambos lados</xsl:when>
				<xsl:when test="//np/@adjpPos='both'">en ambos lados</xsl:when>
				<xsl:when test="//np/@adjpPos='unknown'">_______</xsl:when>
			</xsl:choose>
<xsl:text> del sustantivo al que se están modificando (véase la sección </xsl:text>
<sectionRef sec="sNPAdjP" />
<xsl:text>).</xsl:text>
<xsl:if test="normalize-space(//relcl/@exist)='no'">
				<xsl:text>El </xsl:text>
				<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
				<xsl:text> no tiene ningún tipo de cláusula relativa.</xsl:text>
			</xsl:if>
<xsl:if test="normalize-space(//relcl/@exist)='yes'">
				<xsl:text>Las cláusulas relativas aparecen </xsl:text>
				<xsl:choose>
					<xsl:when test="//relcl/@clausePos='before'">delante</xsl:when>
					<xsl:when test="//relcl/@clausePos='after'">después</xsl:when>
					<xsl:when test="//relcl/@clausePos='either'">de cualquier lado</xsl:when>
					<xsl:when test="//relcl/@clausePos='unknown'">_______</xsl:when>
				</xsl:choose>
				<xsl:text> del sustantivo principal (véase la sección </xsl:text>
				<sectionRef sec="sRelCl" />
				<xsl:text>).</xsl:text>
			</xsl:if>
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
				<xsl:when test="//ip/@proDrop='noImp'">no se permite la ausencia del sujeto. Éste siempre debe ser expresado, excepto cuando haya imperativos</xsl:when>
				<xsl:when test="//ip/@proDrop='no'">no se permite la ausencia del sujeto. Éste siempre debe ser expresado aun cuando haya imperativos</xsl:when>
				<xsl:when test="//ip/@proDrop='yes'">se permite la ausencia del sujeto en cualquier tipo de oración</xsl:when>
				<xsl:when test="//ip/@proDrop='yesClitic'">se puede ver la ausencia del sujeto  debido a los pronombres dependientes (clíticos pronominales) que se ligan al verbo, pero no es un idioma que en realidad permita la ausencia del sujeto</xsl:when>
			</xsl:choose>
<xsl:text> (véase la sección </xsl:text>
<sectionRef sec="sIPProDrop" />
<xsl:text>). </xsl:text>
<xsl:if test="normalize-space(//ip/@proDrop)='yes'">
				<xsl:text></xsl:text>
				<xsl:choose>
					<xsl:when test="//ip/@proDropObject='no'">No</xsl:when>
					<xsl:when test="//ip/@proDropObject='yes'">También</xsl:when>
				</xsl:choose>
				<xsl:text> se permite la ausencia del objeto.</xsl:text>
			</xsl:if>
</p>
		<xsl:if test="normalize-space(//ip/@aux)='no'">
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
<xsl:text> no tiene ningún auxiliar que se escriba como palabra independiente (véase la sección </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//ip/@aux)='yes'">
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
<xsl:text> tiene algunos auxiliares que se escriben como palabras independientes. Éstos se presentan </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@wordOrder='SVO'">antes</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">después</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">antes</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">antes</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">después</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">después</xsl:when>
			</xsl:choose>
<xsl:text> del verbo principal (véase la sección </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<p>
<xsl:if test="normalize-space(//q/@mainYNWord)='yes'">
				<xsl:text>En preguntas con respuestas sí/no, hay un indicador o un complementador de la pregunta que aparece </xsl:text>
				<xsl:choose>
					<xsl:when test="//q/@mainYNPos='before'">antes</xsl:when>
					<xsl:when test="//q/@mainYNPos='after'">después</xsl:when>
					<xsl:when test="//q/@mainYNPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
					<xsl:when test="//q/@mainYNPos='beforeOrBoth'">antes de o en ambos lados</xsl:when>
					<xsl:when test="//q/@mainYNPos='afterOrBoth'">después de o en ambos lados</xsl:when>
					<xsl:when test="//q/@mainYNPos='both'">en ambos lados</xsl:when>
				</xsl:choose>
				<xsl:text> del resto de la pregunta (véase la sección </xsl:text>
				<sectionRef sec="sQuesYN" />
				<xsl:text>).</xsl:text>
			</xsl:if>
<xsl:text>  En preguntas abiertas, una frase interrogativa </xsl:text>
<xsl:choose>
				<xsl:when test="//q/@contFront='no'">no se introduce al inicio de la cláusula; simplemente permanece en su lugar</xsl:when>
				<xsl:when test="//q/@contFront='after'">puede permanecer en su lugar o puede desplazarse a la posición inmediatamente antes que el verbo</xsl:when>
				<xsl:when test="//q/@contFront='before'">se desplaza al inicio de la cláusula</xsl:when>
				<xsl:when test="//q/@contFront='unknown'">_______</xsl:when>
			</xsl:choose>
<xsl:text> (véase la sección </xsl:text>
<sectionRef sec="sQuesContent" />
<xsl:text>).</xsl:text>
</p>
	</section1>

































































































</xsl:template>
</xsl:stylesheet>
