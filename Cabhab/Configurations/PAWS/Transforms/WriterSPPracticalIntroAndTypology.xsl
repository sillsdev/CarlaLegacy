<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="intro">
	<section1 id="sIntro">
		<secTitle>Introducción</secTitle>
		<p>
<xsl:text>Esta gramática descriptiva</xsl:text>
<endnote id="nPATAS">
				<p>
<xsl:text>La primera versión de esta gramática estaba creada por el programa de PATAS </xsl:text>
<citation paren="initial" ref="rPAWS" author="yes" />
<xsl:text>, </xsl:text>
<citation author="no" paren="final" ref="rGrammaticography" />
<xsl:text>.</xsl:text>
</p>
			</endnote>
<xsl:text> del sintaxis de </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> está escrita como una gramática práctica que puede ser útil para la comunidad de la lengua así como para documentar la mayor parte de la lengua.</xsl:text>
</p>
		<p>
<object type="tComment">Una vez que se termina de ingresar los datos al programa de PATAS, este archivo puede servir como borrador para preparar una gramática más completa.</object>
</p>
		<p>
<object type="tComment">Parte de la información dada puede ser inexacta hasta que usted haya terminado de ingresar los datos de cada página del programa de PATAS, porque se basa en los datos predeterminados que se refieren a la posición de elementos, los cuales se muestran como ____ hasta que usted haya terminado la página correspondiente en el programa de PATAS.</object>
</p>
		<p>
<object type="tComment">¡NO MODIFIQUE ESTE ARCHIVO HASTA HABER TERMINADO DE INGRESAR TODOS LOS  DATOS EN EL PROGRAMA DE PATAS, porque si no su trabajo será sobrescrito por el programa! Después de terminar de  contestar  todas las preguntas de PATAS, le sugerimos que guarde este archivo con otro nombre antes de corregir su gramática.  También, le sugerimos que cheque especialmente la sección acerca de los pronombres a ver si es correcto.  Si no, puede cambiar sus respuestas en PATAS antes de empezar editando este documento.</object>
</p>
		<p>
<xsl:text>La lengua </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se habla en LOCALIDADES. Hay aproximadamente NÚMERO hablantes. El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> es miembro de la familia de lenguas NOMBRE_DE_FAMILIA.</xsl:text>
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
<object type="tComment">Mencione aquí cualquier diferencia que haya entre su lengua y español. Por ejemplo, si su lengua no distingue entre el número y/o el género en los sustantivos, como lo hace el español, usted debe eligir el uso de solamente las formas singulares y/o masculinas para las glosas.</object>
</p>
			<p>
<xsl:text>Después proveer la información sobre la tipología sintáctica de la lengua, la gramática comienza describiendo las partes del discurso y las frases en las secciones </xsl:text>
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
		<secTitle>La tipología</secTitle>
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
				<xsl:text> Las cláusulas relativas aparecen </xsl:text>
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
				<xsl:when test="//ip/@proDrop='yesClitic'">se puede ver la ausencia del sujeto  debido a los pronombres dependientes (clíticos pronominales) que se ligan al verbo, pero no es una lengua que en realidad permita la ausencia del sujeto</xsl:when>
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
				<xsl:text>En preguntas de respuesta sí/no, hay un indicador o un complementador de la pregunta que aparece </xsl:text>
				<xsl:choose>
					<xsl:when test="//q/@mainYNPos='before'">antes</xsl:when>
					<xsl:when test="//q/@mainYNPos='after'">después</xsl:when>
					<xsl:when test="//q/@mainYNPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
					<xsl:when test="//q/@mainYNPos='beforeOrBoth'">antes de o en ambos lados</xsl:when>
					<xsl:when test="//q/@mainYNPos='afterOrBoth'">después de o en ambos lados</xsl:when>
					<xsl:when test="//q/@mainYNPos='both'">en ambos lados</xsl:when>
				   <xsl:when test="//q/@mainYNPos='unknown'">________</xsl:when>
				</xsl:choose>
				<xsl:text> del resto de la pregunta (véase la sección </xsl:text>
				<sectionRef sec="sQuesYN" />
				<xsl:text>).</xsl:text>
			</xsl:if>
<xsl:text>  En preguntas de respuesta abierta, una frase interrogativa </xsl:text>
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
				<xsl:when test="//typology/@case='none'"> no hay ningún sistema de caso. El mismo sistema de pronombres se puede utilizar en cualquier posición de la oración y no hay un indicador en los sustantivos o en ningún modificador del sustantivo basado en su posición de la oración.</xsl:when>
				<xsl:when test="//typology/@case='nominative'"> tiene un sistema de caso del nominativo-acusativo. Los sujetos de los verbos intransitivos y transitivos se indican de la misma manera y utilizan el mismo sistema de pronombres, pero los objetos de los verbos transitivos se indican de una manera diferente.</xsl:when>
				<xsl:when test="//typology/@case='ergative'"> tiene un sistema de caso ergativo-absolutivo. Los sujetos de los verbos intransitivos y los objetos de los verbos transitivos se indican de la misma manera y utilizan el mismo sistema de pronombres, pero los sujetos de los verbos transitivos se indican de una manera diferente.</xsl:when>
				<xsl:when test="//typology/@case='split'"> tiene un sistema de caso de ergatividad escindida. La lengua sigue normalmente el sistema de caso del nominativo-acusativo, pero el sistema ergativo-absolutivo se utiliza bajo ciertas condiciones gramaticales.</xsl:when>
			 </xsl:choose>
<xsl:if test="normalize-space(//typology/@case)!='none'">
<xsl:text>  En </xsl:text>
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
				<xsl:when test="//np/@caseN='yes'">los sustantivos y posiblements sus modificadores se indican el caso así como los pronombres.</xsl:when>
				<xsl:when test="//np/@caseN='no'">los sustantivos no se indican el caso.  Solamente los pronombres indican el caso, como en español.</xsl:when>
			 </xsl:choose>
</xsl:if>
<xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseDefault)='nominative' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseDefault)='nominative'">
				<xsl:text>  El caso nominativo es un caso predeterminado (no indicado).</xsl:text>
			 </xsl:if>
<xsl:text> (Véase la sección </xsl:text>
<sectionRef sec="sNPCase" />
<xsl:text>.)</xsl:text>
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
		  <xsl:when test="//typology/@classifier='no'"> no hay ningún sistema de clasificadores para sustantivos.</xsl:when>
		  <xsl:when test="//typology/@classifier='yesAgr'"> hay un sistema de clasificadores para sustantivos, como detallado en la sección siguiente.</xsl:when>
		  <xsl:when test="//typology/@classifier='yesType'"> hay un sistema de clasificadores para sustantivos, como detallado en la sección siguiente.</xsl:when>
	   </xsl:choose>
</p>
	</section1>
   <xsl:if test="normalize-space(//typology/@classifier)!='no'">
<section1 id="sClassifiers">
	  <secTitle>Clasificadores</secTitle>
	  <p>
<xsl:text>
		 Algunas lenguas tiene un sistema de clasificadores para sustantivos que indican su forma, posición u otras características.  En muchos de estas lenguas, el clasificador es un tipo de concordancia que es requerido entre todos los modificadores en la frase nominal y también con el verbo.  Por eso, los quantificadores, artículos, demostrativs, adjetivos y verbos posiblemente necesitan ser marcado con un clasificador appropriado.</xsl:text>
</p>
	  <p>
<xsl:text>Las lenguas Bantu que se habla en Africa tienen el sistema de clasificadores para sustantivos más conocido en el mundo.  Estas lenguas tienen hasta 22 clases distintas, que son representadas por números.  Aproximadamente la mitad está para los sustantivos singulares solamente y un número igual para los nombres en plural solamente. Otros están para los sustantivos  totales o abstractos o para los lugares.</xsl:text>
</p>
	  <p>
<xsl:text>Hay también un sistema de clasificadores más simple donde hay clasificador afijos que son derivados de un sustantivo genérico o de un pronombre y estos debe aparecer con muchos de los sustantivos que refiere a animales, insectos, líquidos, árboles, objetos de madera u objetos que están básicamente redondos. En este sistema simple, normalmente no hay concordancia de clasificador en la frase nominal ni en la oración, entonces estos prefijos solamente marcan los sustantivos y tal vez son más derivativo.  Este tipo de sistema típicamente utiliza tipos en vez de números para identificar los clasificadores.</xsl:text>
</p>

	  <xsl:if test="normalize-space(//typology/@classifier)='yesType'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene un sistema de clasificadores simple en que los tipos de sustantivos son distinguidos, pero no hay concordancia en la frase nominal o la oración.</xsl:text>
</p>
</xsl:if>
	  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene un sistema de clasificadores con la concordancia en todas partes de la frase nominal y en el verbo.  En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los clasificadores son identificaos por </xsl:text>
<xsl:choose>
		 <xsl:when test="//typology/@classifierNum='number'">números de clase. </xsl:when>
		 <xsl:when test="//typology/@classifierNum='type'">los tipos.  <xsl:choose>
			<xsl:when test="//typology/@classifierTypeNumAgr='no'">Los clasificadores no son separados entre singular y plural, entonces hay solamente un clasificador para cada tipo de sustantivo.</xsl:when>
			<xsl:when test="//typology/@classifierTypeNumAgr='yes'">Hay clasificadores separados para singular y plural para cada tipo de sustantivo.</xsl:when>
		 </xsl:choose>
</xsl:when>
	  </xsl:choose>
</p>
</xsl:if>
	  <p>
<xsl:text>Los clasificadores en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran en el cuadro siguiente:</xsl:text>
</p>
	  <xsl:if test="normalize-space(//typology/@classifier)='yesType' or normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//typology/@classifierNum)='type' and normalize-space(//typology/@classifierTypeNumAgr)='no'">
<example num="xClassifiers.16">
<table border="1">
			<caption>
			   <xsl:text>Clasificadores para sustantivos por tipo</xsl:text>
			</caption>
			<tr>
			   <th>
				  Tipo
			   </th>
			   <th>Clasificador</th>
			</tr>
			<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//typology/classAnimalExample),'.','')" />
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
				  <xsl:text>animal</xsl:text>
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
				  <xsl:text>animal</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//typology/classInsectExample),'.','')" />
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
				  <xsl:text>insecto</xsl:text>
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
				  <xsl:text>insecto</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//typology/classLiquidExample),'.','')" />
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
				  <xsl:text>líquido</xsl:text>
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
				  <xsl:text>líquido</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//typology/classRoundExample),'.','')" />
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
				  <xsl:text>redondo</xsl:text>
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
				  <xsl:text>redondo</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue4">
<xsl:value-of select="translate(string(//typology/classCylinderExample),'.','')" />
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
				  <xsl:text>cilíndrico</xsl:text>
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
				  <xsl:text>cilíndrico</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue5">
<xsl:value-of select="translate(string(//typology/classSphereExample),'.','')" />
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
				  <xsl:text>esférico</xsl:text>
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
				  <xsl:text>esférico</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue6">
<xsl:value-of select="translate(string(//typology/classTreeExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6" select="string-length(normalize-space($sExampleValue6))" />
<xsl:choose>
<xsl:when test="$iExampleLength6 != 0 and $sExampleValue6 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>árbol</xsl:text>
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
				  <xsl:text>árbol</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue7">
<xsl:value-of select="translate(string(//typology/classWoodExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7" select="string-length(normalize-space($sExampleValue7))" />
<xsl:choose>
<xsl:when test="$iExampleLength7 != 0 and $sExampleValue7 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>madera</xsl:text>
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
				  <xsl:text>madera</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue8">
<xsl:value-of select="translate(string(//typology/classOtherExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8" select="string-length(normalize-space($sExampleValue8))" />
<xsl:choose>
<xsl:when test="$iExampleLength8 != 0 and $sExampleValue8 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>general</xsl:text>
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
				  <xsl:text>general</xsl:text>
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
</xsl:if>
	  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//typology/@classifierNum)='type' and normalize-space(//typology/@classifierTypeNumAgr)='yes'">
<example num="xClassifiers.18">
<table border="1">
			<caption>
			   <xsl:text>Clasificadores para sustantivos por tipo</xsl:text>
			</caption>
			<tr>
			   <th>Tipo</th>
<th>Singular</th>
			   <th>Plural</th>
			</tr>
			<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//typology/classAnimalSgExample),'.','')" />
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>animal</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>animal</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//typology/classAnimalPlExample),'.','')" />
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>animal</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>animal</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//typology/classInsectSgExample),'.','')" />
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>insecto</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>insecto</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//typology/classInsectPlExample),'.','')" />
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>insecto</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>insecto</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue4">
<xsl:value-of select="translate(string(//typology/classLiquidSgExample),'.','')" />
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>líquido</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>líquido</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue5">
<xsl:value-of select="translate(string(//typology/classLiquidPlExample),'.','')" />
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>líquido</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>líquido</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue6">
<xsl:value-of select="translate(string(//typology/classRoundSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6" select="string-length(normalize-space($sExampleValue6))" />
<xsl:choose>
<xsl:when test="$iExampleLength6 != 0 and $sExampleValue6 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>redondo</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>redondo</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue7">
<xsl:value-of select="translate(string(//typology/classRoundPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7" select="string-length(normalize-space($sExampleValue7))" />
<xsl:choose>
<xsl:when test="$iExampleLength7 != 0 and $sExampleValue7 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>redondo</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>redondo</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue8">
<xsl:value-of select="translate(string(//typology/classCylinderSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8" select="string-length(normalize-space($sExampleValue8))" />
<xsl:choose>
<xsl:when test="$iExampleLength8 != 0 and $sExampleValue8 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>cilíndrico</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>cilíndrico</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue9">
<xsl:value-of select="translate(string(//typology/classCylinderPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9" select="string-length(normalize-space($sExampleValue9))" />
<xsl:choose>
<xsl:when test="$iExampleLength9 != 0 and $sExampleValue9 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>cilíndrico</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>cilíndrico</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue10">
<xsl:value-of select="translate(string(//typology/classSphereSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10" select="string-length(normalize-space($sExampleValue10))" />
<xsl:choose>
<xsl:when test="$iExampleLength10 != 0 and $sExampleValue10 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>esférico</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>esférico</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue11">
<xsl:value-of select="translate(string(//typology/classSpherePlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11" select="string-length(normalize-space($sExampleValue11))" />
<xsl:choose>
<xsl:when test="$iExampleLength11 != 0 and $sExampleValue11 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>esférico</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>esférico</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue12">
<xsl:value-of select="translate(string(//typology/classTreeSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12" select="string-length(normalize-space($sExampleValue12))" />
<xsl:choose>
<xsl:when test="$iExampleLength12 != 0 and $sExampleValue12 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>árbol</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>árbol</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue13">
<xsl:value-of select="translate(string(//typology/classTreePlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13" select="string-length(normalize-space($sExampleValue13))" />
<xsl:choose>
<xsl:when test="$iExampleLength13 != 0 and $sExampleValue13 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>árbol</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>árbol</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue14">
<xsl:value-of select="translate(string(//typology/classWoodSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14" select="string-length(normalize-space($sExampleValue14))" />
<xsl:choose>
<xsl:when test="$iExampleLength14 != 0 and $sExampleValue14 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>madera</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>madera</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue15">
<xsl:value-of select="translate(string(//typology/classWoodPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength15" select="string-length(normalize-space($sExampleValue15))" />
<xsl:choose>
<xsl:when test="$iExampleLength15 != 0 and $sExampleValue15 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength15" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>madera</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>madera</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue16">
<xsl:value-of select="translate(string(//typology/classOtherSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength16" select="string-length(normalize-space($sExampleValue16))" />
<xsl:choose>
<xsl:when test="$iExampleLength16 != 0 and $sExampleValue16 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength16" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>otro / general</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>otro / general</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue17">
<xsl:value-of select="translate(string(//typology/classOtherPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength17" select="string-length(normalize-space($sExampleValue17))" />
<xsl:choose>
<xsl:when test="$iExampleLength17 != 0 and $sExampleValue17 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength17" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>otro / general</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>otro / general</xsl:text>
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
</xsl:if>
	  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//typology/@classifierNum)='number'">
<example num="xClassifiers.20">
<table border="1">
			<caption>
			   <xsl:text>Clasificadores para sustantivos por número</xsl:text>
			</caption>
			<tr>
			   <th>
				  Número de clase
			   </th>
			   <th>Clasificador</th>
			   <th>Concordancia de número</th>
			</tr>
			<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//typology/class1Example),'.','')" />
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
				  <xsl:text>1</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class1agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class1agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class1agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>1</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class1agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class1agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class1agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//typology/class2Example),'.','')" />
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
				  <xsl:text>2</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class2agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class2agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class2agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
				  </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>2</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class2agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class2agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class2agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
				  </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//typology/class3Example),'.','')" />
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
				  <xsl:text>3</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class3agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class3agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class3agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>3</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class3agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class3agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class3agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//typology/class4Example),'.','')" />
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
				  <xsl:text>4</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class4agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class4agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class4agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>4</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class4agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class4agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class4agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue4">
<xsl:value-of select="translate(string(//typology/class5Example),'.','')" />
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
				  <xsl:text>5</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class5agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class5agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class5agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>5</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class5agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class5agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class5agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue5">
<xsl:value-of select="translate(string(//typology/class6Example),'.','')" />
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
				  <xsl:text>6</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class6agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class6agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class6agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>6</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class6agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class6agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class6agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue6">
<xsl:value-of select="translate(string(//typology/class7Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6" select="string-length(normalize-space($sExampleValue6))" />
<xsl:choose>
<xsl:when test="$iExampleLength6 != 0 and $sExampleValue6 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>7</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class7agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class7agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class7agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>7</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class7agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class7agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class7agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue7">
<xsl:value-of select="translate(string(//typology/class8Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7" select="string-length(normalize-space($sExampleValue7))" />
<xsl:choose>
<xsl:when test="$iExampleLength7 != 0 and $sExampleValue7 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>8</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class8agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class8agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class8agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>8</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class8agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class8agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class8agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue8">
<xsl:value-of select="translate(string(//typology/class9Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8" select="string-length(normalize-space($sExampleValue8))" />
<xsl:choose>
<xsl:when test="$iExampleLength8 != 0 and $sExampleValue8 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>9</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class9agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class9agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class9agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>9</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class9agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class9agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class9agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue9">
<xsl:value-of select="translate(string(//typology/class10Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9" select="string-length(normalize-space($sExampleValue9))" />
<xsl:choose>
<xsl:when test="$iExampleLength9 != 0 and $sExampleValue9 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>10</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class10agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class10agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class10agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>10</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class10agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class10agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class10agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue10">
<xsl:value-of select="translate(string(//typology/class11Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10" select="string-length(normalize-space($sExampleValue10))" />
<xsl:choose>
<xsl:when test="$iExampleLength10 != 0 and $sExampleValue10 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>11</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class11agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class11agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class11agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>11</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class11agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class11agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class11agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue11">
<xsl:value-of select="translate(string(//typology/class12Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11" select="string-length(normalize-space($sExampleValue11))" />
<xsl:choose>
<xsl:when test="$iExampleLength11 != 0 and $sExampleValue11 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>12</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class12agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class12agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class12agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>12</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class12agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class12agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class12agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue12">
<xsl:value-of select="translate(string(//typology/class13Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12" select="string-length(normalize-space($sExampleValue12))" />
<xsl:choose>
<xsl:when test="$iExampleLength12 != 0 and $sExampleValue12 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>13</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class13agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class13agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class13agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>13</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class13agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class13agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class13agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue13">
<xsl:value-of select="translate(string(//typology/class14Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13" select="string-length(normalize-space($sExampleValue13))" />
<xsl:choose>
<xsl:when test="$iExampleLength13 != 0 and $sExampleValue13 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>14</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class14agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class14agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class14agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>14</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class14agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class14agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class14agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue14">
<xsl:value-of select="translate(string(//typology/class15Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14" select="string-length(normalize-space($sExampleValue14))" />
<xsl:choose>
<xsl:when test="$iExampleLength14 != 0 and $sExampleValue14 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>15</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class15agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class15agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class15agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>15</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class15agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class15agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class15agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue15">
<xsl:value-of select="translate(string(//typology/class16Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength15" select="string-length(normalize-space($sExampleValue15))" />
<xsl:choose>
<xsl:when test="$iExampleLength15 != 0 and $sExampleValue15 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength15" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>16</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class16agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class16agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class16agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>16</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class16agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class16agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class16agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue16">
<xsl:value-of select="translate(string(//typology/class17Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength16" select="string-length(normalize-space($sExampleValue16))" />
<xsl:choose>
<xsl:when test="$iExampleLength16 != 0 and $sExampleValue16 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength16" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>17</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class17agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class17agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class17agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>17</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class17agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class17agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class17agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue17">
<xsl:value-of select="translate(string(//typology/class18Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength17" select="string-length(normalize-space($sExampleValue17))" />
<xsl:choose>
<xsl:when test="$iExampleLength17 != 0 and $sExampleValue17 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength17" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>18</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class18agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class18agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class18agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>18</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class18agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class18agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class18agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue18">
<xsl:value-of select="translate(string(//typology/class19Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength18" select="string-length(normalize-space($sExampleValue18))" />
<xsl:choose>
<xsl:when test="$iExampleLength18 != 0 and $sExampleValue18 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength18" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>19</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class19agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class19agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class19agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>19</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class19agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class19agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class19agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue19">
<xsl:value-of select="translate(string(//typology/class20Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength19" select="string-length(normalize-space($sExampleValue19))" />
<xsl:choose>
<xsl:when test="$iExampleLength19 != 0 and $sExampleValue19 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength19" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>20</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class20agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class20agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class20agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>20</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class20agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class20agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class20agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue20">
<xsl:value-of select="translate(string(//typology/class21Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength20" select="string-length(normalize-space($sExampleValue20))" />
<xsl:choose>
<xsl:when test="$iExampleLength20 != 0 and $sExampleValue20 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength20" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>21</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class21agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class21agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class21agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>21</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class21agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class21agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class21agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue21">
<xsl:value-of select="translate(string(//typology/class22Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength21" select="string-length(normalize-space($sExampleValue21))" />
<xsl:choose>
<xsl:when test="$iExampleLength21 != 0 and $sExampleValue21 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength21" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>22</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class22agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class22agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class22agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>22</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class22agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class22agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class22agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue22">
<xsl:value-of select="translate(string(//typology/class23Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength22" select="string-length(normalize-space($sExampleValue22))" />
<xsl:choose>
<xsl:when test="$iExampleLength22 != 0 and $sExampleValue22 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength22" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>23</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class23agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class23agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class23agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>23</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class23agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class23agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class23agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue23">
<xsl:value-of select="translate(string(//typology/class24Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength23" select="string-length(normalize-space($sExampleValue23))" />
<xsl:choose>
<xsl:when test="$iExampleLength23 != 0 and $sExampleValue23 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength23" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>24</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class24agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class24agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class24agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>24</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class24agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class24agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class24agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue24">
<xsl:value-of select="translate(string(//typology/class25Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength24" select="string-length(normalize-space($sExampleValue24))" />
<xsl:choose>
<xsl:when test="$iExampleLength24 != 0 and $sExampleValue24 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength24" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>25</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class25agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class25agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class25agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>25</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class25agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class25agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class25agr='irrelevant'">no aplica</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
		 </table>
</example>
</xsl:if>

 <xsl:if test="normalize-space(//typology/@classifier)='yesType'">
<p>
<xsl:text>Algunos ejemplos de sustantivos con sus clasificadores de tipo son:</xsl:text>
</p>
</xsl:if>
	  <xsl:if test="normalize-space(//typology/@classifier)='yesType'">
<example num="xClassifiers.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/classifierTypeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/classifierTypeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/classifierTypeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/classifierTypeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xClassifiers.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xClassifiers.24.1</xsl:text>
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
	  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Algunos ejemplos de oraciones que muestran la concordancia de clasificador en la frase nominal y en el verbo son:</xsl:text>
</p>
</xsl:if>
	  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr'">
<example num="xClassifiers.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/classifierAgrExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/classifierAgrExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/classifierAgrExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/classifierAgrExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xClassifiers.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xClassifiers.28.1</xsl:text>
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
   </section1>
</xsl:if>

	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
		
		
	
	
		
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
   
	  
	  
	  
   
   
	  
   
   
	  
	  
	  
	  
	  
	  
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
	  
	  
   
   
	  
	  
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
	  
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   

</xsl:template>
</xsl:stylesheet>
