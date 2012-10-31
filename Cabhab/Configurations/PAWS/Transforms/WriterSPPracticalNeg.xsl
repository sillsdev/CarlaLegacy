<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="neg">
	<section1 id="sNeg">
		<secTitle>Las construcciones negativas</secTitle>
		<p>
<xsl:text>Todos las lenguas tienen la capacidad de expresar la negación. Esto generalmente se realiza con el uso de:</xsl:text>
</p>
		<ul>
			<li>
				<xsl:text>palabras negativas especiales de grado, como </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
				<xsl:text> (véase la sección </xsl:text>
				<sectionRef sec="sQPAll" />
				<xsl:text>), o determinantes negativos del cuantificador, tales como </xsl:text>
			   <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ningún</langData>
				<xsl:text> (véase la sección </xsl:text>
				<sectionRef sec="sQPDeterminers" />
				<xsl:text>), que niegan una frase nominal,</xsl:text>
			</li>
			<li>
				<xsl:text>pronombres indefinidos negativos, tales como </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nadie</langData>
				<xsl:text> o </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nada</langData>
				<xsl:text> (véase la sección </xsl:text>
				<sectionRef sec="sPronIndef" />
				<xsl:text>), que expresan una frase nominal negativa a sí mismo,</xsl:text>
			</li>
			<li>
				<xsl:text>adverbios negativos, tales como </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
				<xsl:text> (véase la sección </xsl:text>
				<sectionRef sec="sAdvPTemporal" />
				<xsl:text>) o </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nowhere</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘en ninguna parte’</xsl:text>
</gloss>
				<xsl:text> (véase la sección </xsl:text>
				<sectionRef sec="sAdvPLocative" />
				<xsl:text>),</xsl:text>
			</li>
			<li>
				<xsl:text>auxiliares negativos, como </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘no’</xsl:text>
</gloss>
				<xsl:text> o la forma afija de la contracción </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-n’t</langData>
				<xsl:text> (véase la sección </xsl:text>
				<sectionRef sec="sIPAux" />
				<xsl:text>), y/o</xsl:text>
			</li>
			<li>
				<xsl:text>afijos verbales negativos (véase la sección </xsl:text>
				<sectionRef sec="sIPAux" />
				<xsl:text>).</xsl:text>
			</li>
		</ul>
		<p>
<xsl:text>Todos los antedichos se han cubierto como artículos individuales en secciones anteriores (de acuerdo con lo observado). Después de analizar el tipo del sistema de la negación que </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> utiliza, los datos dados serán repasados a continuación por categoría o el tipo de la frase.  Algunos ejemplos de cada construcción usado en oraciones completas se presentan y también el análisis de cualquier restricción de la ocurrencia entre los varios elementos negativos. </xsl:text>
</p>
		<section2 id="sNegType">
			<secTitle>Tipo del sistema de la negación</secTitle>
			<p>
<xsl:text>Hay dos clasificaciones importantes para las lenguas con respecto a la negación: lenguas que cambian la polaridad contra lenguas de concordancia negativa, ejemplificados por inglés estándar contra español, respectivamente.</xsl:text>
</p>
			<p>
<xsl:text>Las lenguas que cambian la polaridad normalmente permiten presentarse un solo elemento negativo en la oración para que la negación sea expresada (sin embargo, cualquier número impar de negativas expresa técnico polaridad negativa) porque la presencia de dos (o cualquier número de pares de) elementos negativos cambia la polaridad de nuevo a positivo. Por ejemplo, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John saw nothing</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan vio nada’</xsl:text>
</gloss>
<xsl:text> es negativo, pero </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn’t see nothing</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan no vio nada’</xsl:text>
</gloss>
<xsl:text> es positivo porque significa al igual que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juan vio algo</langData>
<xsl:text>.  La versión con un auxiliar negativo se expresa como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn’t see anything</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan no vio algo’</xsl:text>
</gloss>
<xsl:text>, usando qué se conoce como “artículo negativo de polaridad ” en la posición del objeto.  Tales artículos negativos de polaridad  pueden presentarse como los sujetos en algunos contextos sin ninguna otra palabra negativa presente, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Anyone may come</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Cualquiera persona pueden venir’</xsl:text>
</gloss>
<xsl:text>, pero pueden presentarse en la posición del objeto solamente cuando un elemento anterior en la oración es negativo. Por ejemplo, uno puede decir </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Nobody saw anyone</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Nadie vio cualquiera persona’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Nowhere will they find anyone</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘En ninguna parte ellos encuentra a cualquiera persona’</xsl:text>
</gloss>
<xsl:text> pero sin el sujeto negativo o el adverbio negativo desplazado, el auxiliar negativo debe ser utilizado, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>We did not see anyone</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘No vimos a cualquiera persona’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>They will not find anyone anywhere</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Ellos no encontrarán a cualquiera persona dondequiera’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>En lenguas de concordancia negativa, cualquier número de elementos negativos expresa polaridad negativa, tan en español </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juan no vio nada</langData>
<xsl:text> es la manera correcta de expresar una oración negativa con un objeto negativo.
					En estas lenguas, un elemento negativo normalmente puede presentarse en la posición sujeta o una posición desplazada a la izquierda sin ningún otro elemento negativo presente,
					pero un objeto negativo solamente puede presentarse cuando un elemento anterior en la oración es negativo.
					Algunas lenguas de concordancia negativa tienen la restricción más fuerte que cualquiera palabra o frase negativa debe presentarse con la negación verbal, y
					todavía otros requieren el desplazamiento a la izquierda de la palabra o frase negativa, semejantemente al desplazamiento a la izquierda de las palabras o frases interrogativas en preguntas.</xsl:text>
</p>
			<xsl:if test="normalize-space(//qp/@determinerNeg)='none' and normalize-space(//qp/@npDegreeNeg)='none' and normalize-space(//pron/@negIndef)='no'">
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
<xsl:text> ni es una lengua que cambia la polaridad ni una lengua de concordancia negativa, puesto que la única manera de expresar la negación es vía el afijo verbal. No exhibe casos múltiples en la negación que cambiar la polaridad ni de concordancia.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
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
<xsl:text> es un </xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@type='changing'">lengua que cambia la polaridad</xsl:when>
					<xsl:when test="//neg/@type='concord'">lengua de concordancia negativa</xsl:when>
				</xsl:choose>
<xsl:text>, puesto que </xsl:text>
<xsl:choose>
				   <xsl:when test="//neg/@type='changing'">la polaridad cambia entre positiva y negativa con cada expresión negativa. </xsl:when>
					<xsl:when test="//neg/@type='concord'">cualquier número de elementos negativos concuerda simplemente en la polaridad negativa. </xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
	 <xsl:if test="normalize-space(//neg/@type)='concord'">
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
<xsl:text>, un verbo negativo-marcado </xsl:text>
<xsl:choose>
				<xsl:when test="//neg/@objVerbRequired='no'">no se requiere cuando el objeto es negativo.  </xsl:when>
				<xsl:when test="//neg/@objVerbRequired='yes'">se requiere cuando el objeto es negativo.  </xsl:when>
				<xsl:when test="//neg/@objVerbRequired='other'"> no se requiere cuando el objeto es negativo, pero si el verbo no es negativo así que otra palabra o frase negativa debe presentarse anteriormente en la oración.  </xsl:when>
</xsl:choose>
<xsl:text>Además, </xsl:text>
<xsl:choose>
			 <xsl:when test="//neg/@negFront='no'">un objeto negativo se presenta simplemente en su posición normal en la oración.</xsl:when>
			 <xsl:when test="//neg/@negFront='yes'">el despazamiento a la izquierda de la palabra o de la frase negativa se requiere, semejantemente al desplazamiento a la izquierda en preguntas.</xsl:when>
			 <xsl:when test="//neg/@negFront='optional'">un objeto negativo puede presentarse inicialmente en la oración, o puede permanecer en su posición normal.</xsl:when>
			 <xsl:when test="//neg/@negFront='beforeVerb'">un objeto negativo puede presentarse en la posición directamente antes del verbo, o puede permanecer en su posición normal.</xsl:when>
</xsl:choose>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='no' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='none' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='no' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='none' and normalize-space(//qp/@npDegreeNeg)='some'">
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
					<xsl:when test="//neg/@polarityItems='yes'"> hay los </xsl:when>
					<xsl:when test="//neg/@polarityItems='no'"> no hay los </xsl:when>
				</xsl:choose>
<xsl:text>artículos negativos de polaridad .  </xsl:text>
<xsl:choose>
				   <xsl:when test="//neg/@polarityItems='yes'">Los pronombres, los elementos especiales de grado y los adverbios siguientes se presentan en la posición del objeto o la posición normal del adverbio en vez del artículo negativo equivalente cuando otro elemento negativo está presente en la oración.</xsl:when>
					<xsl:when test="//neg/@polarityItems='no'">Los pronombres negativos, los elementos especiales de grado y los adverbios pueden presentarse en la posición del objeto o la posición normal del adverbio incluso cuando hay otro elemento negativo en la oración.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='some'">
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
					<xsl:when test="//neg/@polarityItems='yes'"> hay los </xsl:when>
					<xsl:when test="//neg/@polarityItems='no'"> no hay los </xsl:when>
				</xsl:choose>
<xsl:text>artículos negativos de polaridad .  </xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@polarityItems='yes'">Los pronombres, los determinantes y los adverbios siguientes se presentan en la posición del objeto o la posición normal del adverbio en vez del artículo negativo equivalente cuando otro elemento negativo está presente en la oración.</xsl:when>
					<xsl:when test="//neg/@polarityItems='no'">Los pronombres, los determinantes y los adverbios negativos pueden presentarse en la posición del objeto o la posición normal del adverbio incluso cuando hay otro elemento negativo en la oración.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
<example num="xNeg.NegType.20">
<table border="1">
  <tr>
	  <th>Tipo</th>
	  <th>Artículos negativos de polaridad </th>
	  <th>Glosa</th>
  </tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//neg/npiPronounExample),'.','')" />
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
<td align="left" rowspan="1">
							<xsl:text>Pronombres (y/o frases)</xsl:text>
						</td>
</xsl:with-param>
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
<td align="left" rowspan="1">
							<xsl:text>Pronombres (y/o frases)</xsl:text>
						</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//neg/npiDeterminerExample),'.','')" />
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
<xsl:if test="normalize-space(//qp/@determinerNeg)='no' or normalize-space(//qp/@determinerNeg)='none'">
<td align="left" rowspan="1">
							<xsl:text>Elementos especiales de grado</xsl:text>
						</td>
</xsl:if>
<xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
<td align="left" rowspan="1">
							<xsl:text>Determinantes</xsl:text>
						</td>
</xsl:if>
</xsl:with-param>
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
<xsl:if test="normalize-space(//qp/@determinerNeg)='no' or normalize-space(//qp/@determinerNeg)='none'">
<td align="left" rowspan="1">
							<xsl:text>Elementos especiales de grado</xsl:text>
						</td>
</xsl:if>
<xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
<td align="left" rowspan="1">
							<xsl:text>Determinantes</xsl:text>
						</td>
</xsl:if>
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
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//neg/npiTemporalExample),'.','')" />
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
<td align="left" rowspan="1">
							<xsl:text>Adverbios de tiempo</xsl:text>
						</td>
</xsl:with-param>
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
<td align="left" rowspan="1">
							<xsl:text>Adverbios de tiempo</xsl:text>
						</td>
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
					<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//neg/npiLocativeExample),'.','')" />
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
<td align="left" rowspan="1">
							<xsl:text>Adverbios de lugar</xsl:text>
						</td>
</xsl:with-param>
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
<td align="left" rowspan="1">
							<xsl:text>Adverbios de lugar</xsl:text>
						</td>
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
			<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='some' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='some'">
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
<xsl:text>, un verbo negativo-indicado </xsl:text>
<xsl:choose>
			   <xsl:when test="//neg/@objVerbRequired='no'">no se requiere cuando hay un artículo negativo de polaridad  en la posición del objeto.  </xsl:when>
			   <xsl:when test="//neg/@objVerbRequired='yes'">se requiere cuando hay un artículo negativo de polaridad  en la posición del objeto.  </xsl:when>
			   <xsl:when test="//neg/@objVerbRequired='other'"> no se requiere cuando hay un artículo negativo de polaridad  en la posición del objeto, pero si el verbo no es negativo así que otra palabra o frase negativa debe presentarse anteriormente en la oración.  </xsl:when>
</xsl:choose>
</p>
</xsl:if>
		</section2>

		<section2 id="sNegVerbal">
			<secTitle>Negación auxiliar y verbal</secTitle>
			<p>
<xsl:text>Vimos en la sección </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text> que en </xsl:text>
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
					 <xsl:when test="//ip/@negAux='yes'"> hay uno o más</xsl:when>
					 <xsl:when test="//ip/@negAux='no'"> no hay</xsl:when>
				  </xsl:choose>
<xsl:text> auxiliares negativos que se escriben como palabras independientes. </xsl:text>
<xsl:if test="normalize-space(//ip/@negAux)='yes'">
					 <xsl:text> El auxiliar negativo </xsl:text>
					 <xsl:choose>
						<xsl:when test="//ip/@negAuxRequiresAux='no'">puede</xsl:when>
						<xsl:when test="//ip/@negAuxRequiresAux='yes'">no puede</xsl:when>
					 </xsl:choose>
					 <xsl:text> ser el único auxiliar en la frase; </xsl:text>
					 <xsl:choose>
						<xsl:when test="//ip/@negAuxRequiresAux='no'">ningún otro</xsl:when>
						<xsl:when test="//ip/@negAuxRequiresAux='yes'">la presencia de otro</xsl:when>
					 </xsl:choose>
					 <xsl:text> auxiliar es requerido.</xsl:text>
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
<xsl:text></xsl:text>
<xsl:choose>
					 <xsl:when test="//ip/@negAuxAffix='yes'"> hay <xsl:choose>
<xsl:when test="//ip/@negAux='yes'">también</xsl:when>
</xsl:choose> un afijo negativo que se une con un auxiliar positivo, </xsl:when>
					 <xsl:when test="//ip/@negAuxAffix='no'"> no hay un afijo negativo que se une con un auxiliar positivo, </xsl:when>
				  </xsl:choose>
<xsl:choose>

					 <xsl:when test="//ip/@negVAffix='yes'">
<xsl:choose>
<xsl:when test="//ip/@negAuxAffix='yes'">y</xsl:when>
						<xsl:when test="//ip/@negAuxAffix='no'">pero hay</xsl:when>
</xsl:choose> un afijo verbal negativo. </xsl:when>

					 <xsl:when test="//ip/@negVAffix='no'">
<xsl:choose>
<xsl:when test="//ip/@negAuxAffix='yes'">pero no hay</xsl:when>
						<xsl:when test="//ip/@negAuxAffix='no'">ni</xsl:when>
</xsl:choose> un afijo verbal negativo.</xsl:when>
				  </xsl:choose>
<xsl:text></xsl:text>
</p>

				<xsl:if test="normalize-space(//ip/@negAux)='yes' or normalize-space(//ip/@negAuxAffix)='yes'">
<p>
<xsl:text>  Además, </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@auxVerbRequired='yes'">no se permite a un auxiliar negativo sinoque el verbo también es negativo.</xsl:when>
						<xsl:when test="//neg/@auxVerbRequired='no'">el verbo no se requiere ser negativo cuando hay un auxiliar negativo.</xsl:when>
					</xsl:choose>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='yes'">
<p>
<xsl:text>Las palabras auxiliares negativas en </xsl:text>
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
			<xsl:if test="normalize-space(//ip/@negAux)='yes'">
<example num="xNeg.NegVerbal.12">
<table border="1">
<tr>
	<th>Palabras auxiliares negativas</th>
	<th>Glosa</th>
</tr>
	 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/negAuxExample),'.','')" />
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
			<xsl:if test="normalize-space(//ip/@negAux)='yes'">
<p>
<xsl:text>Algunos ejemplos de las palabras auxiliares negativas usadas en una oración completa (sin frases negativas) son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='yes'">
<example num="xNeg.NegVerbal.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/auxExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/auxExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/auxExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/auxExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.16.1</xsl:text>
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
			<xsl:if test="normalize-space(//ip/@negAuxAffix)='yes'">
<p>
<xsl:text>Algunos ejemplos de los afijos negativos del auxiliar en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> unidos a un auxiliar son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAuxAffix)='yes'">
<example num="xNeg.NegVerbal.20">
<table border="1">
					<tr>
						<th>Auxiliares negativos</th>
						<th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/negAuxAffixExample),'.','')" />
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
			<xsl:if test="normalize-space(//ip/@negAuxAffix)='yes'">
<p>
<xsl:text>Algunos ejemplos de los afijos auxiliares negativos unidos a un auxiliar usado en una oración completa (sin frases negativas) son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAuxAffix)='yes'">
<example num="xNeg.NegVerbal.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/auxAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/auxAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/auxAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/auxAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.24.1</xsl:text>
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
			<xsl:if test="normalize-space(//ip/@negVAffix)='yes'">
<p>
<xsl:text>Algunos ejemplos de los afijos verbales negativos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> unidos a un verbo son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negVAffix)='yes'">
<example num="xNeg.NegVerbal.28">
<table border="1">
					<tr>
						<th>Verbos negativo-indicados</th>
						<th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/negVerbExample),'.','')" />
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
			<xsl:if test="normalize-space(//ip/@negVAffix)='yes'">
<p>
<xsl:text>Algunos ejemplos en oraciones completas con verbos negativos son: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negVAffix)='yes'">
<example num="xNeg.NegVerbal.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/verbAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/verbAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/verbAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/verbAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.32.1</xsl:text>
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
		<section2 id="sNegAdverb">
			<secTitle>Negación adverbial</secTitle>

			   <xsl:if test="normalize-space(//advp/@negTemporalType)='word'">
<p>
<xsl:text>Vimos en la sección </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, el concepto negativo de tiempo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
<xsl:text> se expresa con una o más palabras independientes que no se relacionan con los adverbios positivos de tiempo.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
<p>
<xsl:text>Vimos en la sección </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, el concepto negativo de tiempo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
<xsl:text> se expresa con un afijo negativo que se une con un adverbio positivo de tiempo para formar un adverbio negativo de tiempo.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
<p>
<xsl:text>Vimos en la sección </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, el concepto negativo de tiempo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
<xsl:text> se expresa con una palabra negativa independiente que se presenta </xsl:text>
<xsl:choose>
					 <xsl:when test="//advp/@negTemporalWordPos='before'">antes</xsl:when>
					 <xsl:when test="//advp/@negTemporalWordPos='after'">después</xsl:when>
					 <xsl:when test="//advp/@negTemporalWordPos='unknown'">________</xsl:when>
				  </xsl:choose>
<xsl:text> de un adverbio positivo de tiempo para formar una adverbio negativo de tiempo frase.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<p>
<xsl:text>Vimos en la sección </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, el concepto negativo de tiempo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
<xsl:text> se expresa con uno o más afijos verbales, en lugar de palabras independientes.</xsl:text>
</p>
</xsl:if>

			   <xsl:if test="normalize-space(//advp/@negTemporalType)='verb'">
<p>
<xsl:text>Vimos en la sección </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, hay solamente un afijo negativo verbal, pero puede presentarse con adverbios positivos de tiempo para dar un significado negativo de tiempo.</xsl:text>
</p>
</xsl:if>

			   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
<p>
<xsl:text>La palabra negativa que se presenta con los adverbios positivos de tiempo es:</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
<example num="xNeg.NegAdverb.16">
<table border="1">
					 <tr>
						<th>Palabra negativa</th>
						<th>Glosa</th>
					 </tr>
					 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalAdverbWordExample),'.','')" />
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
			   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
<p>
<xsl:text>Algunos ejemplos de frases de adverbios negativos de tiempo formado por la palabra negativa presentarse </xsl:text>
<xsl:choose>
				  <xsl:when test="//advp/@negTemporalWordPos='before'">antes</xsl:when>
				  <xsl:when test="//advp/@negTemporalWordPos='after'">después</xsl:when>
				  <xsl:when test="//advp/@negTemporalWordPos='unknown'">________</xsl:when>
			   </xsl:choose>
<xsl:text> de un adverbio positivo de tiempo son:</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
<example num="xNeg.NegAdverb.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negTemporalAdverbWordsExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/negTemporalAdverbWordsExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negTemporalAdverbWordsExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/negTemporalAdverbWordsExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.20.1</xsl:text>
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

			   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
<p>
<xsl:text>El afijo negativo que se une con un adverbio positivo de tiempo es:</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
<example num="xNeg.NegAdverb.24">
<table border="1">
					 <tr>
						<th>Afijo negativo</th>
						<th>Glosa</th>
					 </tr>
					 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalAdverbAffixExample),'.','')" />
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
			   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
<p>
<xsl:text>Algunos ejemplos de adverbios negativos de tiempo formados por unirse el afijo negativo con un adverbio positivo de tiempo son:</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
<example num="xNeg.NegAdverb.28">
<table border="1">
					 <tr>
						<th>Adverbios negativos de tiempo</th>
						<th>Glosa</th>
					 </tr>
					 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalAdverbExample),'.','')" />
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

			   <xsl:if test="normalize-space(//advp/@negTemporalType)='word'">
<p>
<xsl:text>Los adverbios negativos de tiempo en </xsl:text>
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
			   <xsl:if test="normalize-space(//advp/@negTemporalType)='word'">
<example num="xNeg.NegAdverb.32">
<table border="1">
					 <tr>
						<th>Adverbios negativos de tiempo</th>
						<th>Glosa</th>
					 </tr>
					 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalExample),'.','')" />
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

			   <xsl:if test="normalize-space(//advp/@negTemporalType)='verb'">
<p>
<xsl:text>Algunos ejemplos de adverbios positivos de tiempo con un verbo negativo son:</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//advp/@negTemporalType)='verb'">
<example num="xNeg.NegAdverb.36">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negTemporalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/negTemporalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negTemporalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/negTemporalExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.36</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.36.1</xsl:text>
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

			   <xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<p>
<xsl:text>Los afijos adverbiales negativos de tiempo que se unen a los verbos son:</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<example num="xNeg.NegAdverb.40">
<table border="1">
					 <tr>
						<th>Afijos adverbiales negativos de tiempo</th>
						<th>Glosa</th>
					 </tr>
					 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalAffixExample),'.','')" />
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

			   <xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<p>
<xsl:text>Algunos ejemplos de afijos adverbiales negativos de tiempo unidos a los verbos son:</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<example num="xNeg.NegAdverb.44">
<table border="1">
					 <tr>
						<th>Verbos con un afijo adverbial negativo de tiempo</th>
						<th>Gloss</th>
					 </tr>
					 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalVerbExample),'.','')" />
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
<xsl:text>Algunos ejemplos en oraciones completas con una expresión negativa de tiempo son: </xsl:text>
</p>
			<example num="xNeg.NegAdverb.48">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/advTemporalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/advTemporalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/advTemporalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/advTemporalExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.48</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.48.1</xsl:text>
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

			  <xsl:if test="normalize-space(//advp/@negLocativeType)='word'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sAdvPLocative" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, el concepto negativo de lugar de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no lugar’</xsl:text>
</gloss>
<xsl:text> se expresa con una o más palabras independientes que no se relacionan con los adverbios positivos de lugar.</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sAdvPLocative" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, el concepto negativo de lugar de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no lugar’</xsl:text>
</gloss>
<xsl:text> se expresa con un afijo negativo que se une con un adverbio positivo de lugar para formar un adverbio negativo de lugar.</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sAdvPLocative" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, el concepto negativo de lugar de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no lugar’</xsl:text>
</gloss>
<xsl:text> se expresa con una palabra negativa independiente que se presenta </xsl:text>
<xsl:choose>
					<xsl:when test="//advp/@negLocativeWordPos='before'">antes</xsl:when>
					<xsl:when test="//advp/@negLocativeWordPos='after'">después</xsl:when>
					<xsl:when test="//advp/@negLocativeWordPos='unknown'">________</xsl:when>
				 </xsl:choose>
<xsl:text> de un adverbio positivo de lugar para formar una adverbio negativo de lugar frase.</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sAdvPLocative" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, el concepto negativo de lugar de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no lugar’</xsl:text>
</gloss>
<xsl:text> se expresa con uno o más afijos verbales, en vez de palabras independientes.</xsl:text>
</p>
</xsl:if>

			  <xsl:if test="normalize-space(//advp/@negLocativeType)='verb'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sAdvPLocative" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, hay solamente un afijo negativo verbal, pero puede presentarse con adverbios positivos de lugar para dar un significado negativo de lugar.</xsl:text>
</p>
</xsl:if>

			  <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
<p>
<xsl:text>La palabra negativa que se presenta con los adverbios positivos de lugar es:</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
<example num="xNeg.NegAdverb.62">
<table border="1">
					<tr>
					   <th>Palabra negativa</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeAdverbWordExample),'.','')" />
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
			  <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
<p>
<xsl:text>Algunos ejemplos de frases de adverbios negativos de lugar formado por la palabra negativa presentarse </xsl:text>
<xsl:choose>
				 <xsl:when test="//advp/@negLocativeWordPos='before'">antes</xsl:when>
				 <xsl:when test="//advp/@negLocativeWordPos='after'">después</xsl:when>
				 <xsl:when test="//advp/@negLocativeWordPos='unknown'">________</xsl:when>
			  </xsl:choose>
<xsl:text> de un adverbio positivo de lugar son:</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
<example num="xNeg.NegAdverb.66">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negLocativeAdverbWordsExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/negLocativeAdverbWordsExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negLocativeAdverbWordsExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/negLocativeAdverbWordsExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.66</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.66.1</xsl:text>
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

			  <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
<p>
<xsl:text>El afijo negativo que se une con un adverbio positivo de lugar es:</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
<example num="xNeg.NegAdverb.70">
<table border="1">
					<tr>
					   <th>Afijo negativo</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeAdverbAffixExample),'.','')" />
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
			  <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
<p>
<xsl:text>Algunos ejemplos de adverbios negativos de lugar formados por unirse el afijo negativo con un adverbio positivo de lugar son:</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
<example num="xNeg.NegAdverb.74">
<table border="1">
					<tr>
					   <th>Adverbios negativos de lugar</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeAdverbExample),'.','')" />
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

			  <xsl:if test="normalize-space(//advp/@negLocativeType)='word'">
<p>
<xsl:text>Los adverbios negativos de lugar en </xsl:text>
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
			  <xsl:if test="normalize-space(//advp/@negLocativeType)='word'">
<example num="xNeg.NegAdverb.78">
<table border="1">
					<tr>
					   <th>Adverbios negativos de lugar</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeExample),'.','')" />
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

			  <xsl:if test="normalize-space(//advp/@negLocativeType)='verb'">
<p>
<xsl:text>Algunos ejemplos de adverbios positivos de lugar con un verbo negativo son:</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//advp/@negLocativeType)='verb'">
<example num="xNeg.NegAdverb.82">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negLocativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/negLocativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negLocativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/negLocativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.82</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.82.1</xsl:text>
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

			  <xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<p>
<xsl:text>Los afijos adverbiales negativos de lugar que se unen a los verbos son:</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<example num="xNeg.NegAdverb.86">
<table border="1">
					<tr>
					   <th>Afijos adverbiales negativos de lugar</th>
					   <th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeAffixExample),'.','')" />
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

			  <xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<p>
<xsl:text>Algunos ejemplos de afijos adverbiales negativos de lugar unidos a los verbos son:</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<example num="xNeg.NegAdverb.90">
<table border="1">
					<tr>
					   <th>Verbos con un afijo adverbial negativo de lugar</th>
					   <th>Gloss</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeVerbExample),'.','')" />
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
<xsl:text>Algunos ejemplos en oraciones completas con una expresión negativa de lugar son:</xsl:text>
</p>
			<example num="xNeg.NegAdverb.94">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/advLocativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/advLocativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/advLocativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/advLocativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.94</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.94.1</xsl:text>
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
			<xsl:if test="normalize-space(//advp/@negTemporalType)='word' or normalize-space(//advp/@negLocativeType)='word' or normalize-space(//advp/@negTemporalType)='adverb' or normalize-space(//advp/@negLocativeType)='adverb' or normalize-space(//advp/@negTemporalType)='adverbWord' or normalize-space(//advp/@negLocativeType)='adverbWord'">
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
					<xsl:when test="//neg/@advVerbRequired='yes'"> un adverbio negativo escrito como palabra independiente no se permite sinoque el verbo también es negativo.</xsl:when>
					<xsl:when test="//neg/@advVerbRequired='no'"> el verbo no se requiere ser negativo cuando hay un adverbio negativo escrito como palabra independiente.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
		</section2>
		<section2 id="sNegNominal">
			<secTitle>Negación de frases nominales</secTitle>
			<p>
<xsl:text>Una frase nominal normalmente se puede negar por una palabra especial de grado, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text>, o por un determinante del cuantificador, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ningún</langData>
<xsl:text>, o usando un pronombre indefinido negativo. Cada tipo permitido en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> será ejemplificado en oraciones completas cuando está utilizado como sujetos y objetos directos, y cualquier restricción será analizado.</xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='some' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='some'">
					<xsl:text>  El uso de los artículos negativos de polaridad  en </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text> también será cubierto en la sección </xsl:text>
					<sectionRef sec="sNegNominalObject" />
					<xsl:text>.</xsl:text>
				</xsl:if>
</p>
			<section3 id="sNegNominalSubject">
				<secTitle>Sujetos negativos</secTitle>

				   <xsl:if test="normalize-space(//qp/@npDegreeNeg)='none'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>,  parece que no hay ninguna manera en la lengua para expresar el significado de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> cuando está modificando a una frase nominal completa. </xsl:text>
</p>
</xsl:if>
				   <xsl:if test="normalize-space(//qp/@npDegreeNeg)='no'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los elementos especiales negativos de grado no se expresan como palabras independientes. Por el contrario, todos se unen a otra palabra de la frase nominal como </xsl:text>
<xsl:choose>
						 <xsl:when test="//qp/@npDegreeType='proclitic'">proclíticos que se unen al inicio de cualquier palabra que comienza la frase nominal.</xsl:when>
						 <xsl:when test="//qp/@npDegreeType='enclitic'">enclíticos que se unen al final de cualquier palabra que termina la frase nominal.</xsl:when>
						 <xsl:when test="//qp/@npDegreeType='clitic'">clíticos que se unen al inicio de cualquier palabra que comienza la frase nominal o al final de cualquier palabra que termina la frase nominal.</xsl:when>
						 <xsl:when test="//qp/@npDegreeType='prefix'">prefijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
						 <xsl:when test="//qp/@npDegreeType='suffix'">sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
						 <xsl:when test="//qp/@npDegreeType='affix'">prefijos o sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					  </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>

				   <xsl:if test="normalize-space(//qp/@npDegreeNeg)='some'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, algunos son palabras independientes pero algunos de los elementos especiales negativos de grado no se expresan como palabras independientes.  Por el contrario, algunos se unen a otra palabra de la frase nominal como </xsl:text>
<xsl:choose>
						 <xsl:when test="//qp/@npDegreeNegType='proclitic'">proclíticos que se unen al inicio de cualquier palabra que comienza la frase nominal.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='enclitic'">enclíticos que se unen al final de cualquier palabra que termina la frase nominal.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='clitic'">clíticos que se unen al inicio de cualquier palabra que comienza la frase nominal o al final de cualquier palabra que termina la frase nominal.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='prefix'">prefijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='suffix'">sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='affix'">prefijos o sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					  </xsl:choose>
<xsl:text>  Los elementos especiales negativos de grado que se expresan como palabras independientes se presentan </xsl:text>
<xsl:choose>
						 <xsl:when test="//qp/@npDegreeNegPos='before'">antes</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='after'">después</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='afterOrBoth'">después o en ambos lados</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='both'">en ambos lados</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='unknown'">_______</xsl:when>
					  </xsl:choose>
<xsl:text> del resto de la frase nominal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegEither)='unrestricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
						 <xsl:text>Todas estas palabras pueden presentarse de cualquier lado de la frase nominal.</xsl:text>
					  </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegEither)='restricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
						 <xsl:text>Hay restricciones en cuanto a cuáles de estas palabras pueden presentarse en cada lado de la frase nominal.  </xsl:text>
					  </xsl:if>
</p>
</xsl:if>
				   <xsl:if test="normalize-space(//qp/@npDegreeNeg)='yes'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los elementos especiales negativos de grado se expresan como palabras independientes que modifican la frase nominal completa.  Se presentan  </xsl:text>
<xsl:choose>
						 <xsl:when test="//qp/@npDegreeNegPos='before'">antes</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='after'">después</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='afterOrBoth'">después o en ambos lados</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='both'">en ambos lados</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='unknown'">_______</xsl:when>
					  </xsl:choose>
<xsl:text> del resto de la frase nominal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegEither)='unrestricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
						 <xsl:text>Todas estas palabras pueden presentarse de cualquier lado de la frase nominal.</xsl:text>
					  </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegEither)='restricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
						 <xsl:text>Hay restricciones en cuanto a cuáles de estas palabras pueden presentarse en cada lado de la frase nominal.  </xsl:text>
					  </xsl:if>
</p>
</xsl:if>
				   <xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none'">
<p>
<xsl:text>Algunos ejemplos de las frases nominales negativas (no incluyendo los elementos positivos especiales de grado) en </xsl:text>
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
				   <example num="xNeg.NegNominal.NegNominalSubject.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/negExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/negExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/negExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/negExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.14.1</xsl:text>
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

				   <xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none' and normalize-space(//qp/@npDegreeNegCooccur)='yes'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se permite que las palabras que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> se presentan con las palabras especiales positivas de grado en una sola frase nominal.  Las palabras especiales negativas de grado se presentan </xsl:text>
<xsl:choose>
						 <xsl:when test="//qp/@npDegreeNegPos='before'">antes</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='after'">después</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='afterOrBoth'">después o en ambos lados</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='both'">en ambos lados</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='unknown'">_______</xsl:when>
					  </xsl:choose>
<xsl:text> del resto de la frase nominal (incluyendo las palabras especiales positivas de grado).  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegEither)='unrestricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
						 <xsl:text>Todas estas palabras negativas pueden presentarse de cualquier lado de la frase nominal.  </xsl:text>
					  </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegEither)='restricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
						 <xsl:text>Hay restricciones en cuanto a cuáles de estas palabras negativas pueden presentarse en cada lado de la frase nominal.  </xsl:text>
					  </xsl:if>
</p>
</xsl:if>
				   <xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none' and normalize-space(//qp/@npDegreeNegCooccur)='yes'">
<p>
<xsl:text>Algunos ejemplos de las frases nominales negativos que incluyen las palabras especiales positivas de grado en </xsl:text>
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
				   <xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none' and normalize-space(//qp/@npDegreeNegCooccur)='yes'">
<example num="xNeg.NegNominal.NegNominalSubject.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/negCooccurExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/negCooccurExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/negCooccurExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/negCooccurExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.20.1</xsl:text>
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


				   <xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none'">
<p>
<xsl:text>Estas frases nominales negativas se pueden utilizar como el sujeto de una oración completa, como se muestra a continuación:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none'">
<example num="xNeg.NegNominal.NegNominalSubject.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/degreeSubjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/degreeSubjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/degreeSubjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/degreeSubjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.24.1</xsl:text>
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


			   <xsl:if test="normalize-space(//qp/@determinerNeg)='no'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPDeterminers" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no hay una categoría independiente de los cuantificadores negativos que funciona al igual que el único determinante de la frase nominal. La negación de una frase nominal es expresa solamente con los elementos especiales de grado. El concepto negativo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ningún</langData>
<xsl:text> es expresado como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> en la sección anterior.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//qp/@determinerNeg)='attaches'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPDeterminers" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no hay una categoría independiente de los cuantificadores negativos que funciona al igual que el único determinante de la frase nominal.  El concepto negativo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ningún</langData>
<xsl:text> es expresado por un clítico o afijo que se une a una palabra en la frase nominal, como explicó para </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> en la sección anterior.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//qp/@determinerNeg)='none' and normalize-space(//qp/@npDegreeNeg)='none'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPDeterminers" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no hay una categoría independiente de los cuantificadores negativos que funciona al igual que el único determinante de la frase nominal. Asimismo tampoco hay alguna manera de expresar el elemento especial negativo de grado. </xsl:text>
</p>
</xsl:if>

			   <xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPDeterminers" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se encuentran cuantificadores negativos que funcionan al igual que el único determinante de la frase nominal.  Estos determinantes del cuantificador se presentan  </xsl:text>
<xsl:choose>
					 <xsl:when test="//qp/@determinerNegPos='before'">antes</xsl:when>
					 <xsl:when test="//qp/@determinerNegPos='after'">después</xsl:when>
					 <xsl:when test="//qp/@determinerNegPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
					 <xsl:when test="//qp/@determinerNegPos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
					 <xsl:when test="//qp/@determinerNegPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
					 <xsl:when test="//qp/@determinerNegPos='afterOrBoth'">después o en ambos lados</xsl:when>
					 <xsl:when test="//qp/@determinerNegPos='both'">en ambos lados</xsl:when>
					 <xsl:when test="//qp/@determinerNegPos='unknown'">_______</xsl:when>
				  </xsl:choose>
<xsl:text> del sustantivo principal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@determinerNegEither)='unrestricted' and normalize-space(//qp/@determinerNegPos)!='before' and normalize-space(//qp/@determinerNegPos)!='after'">
					 <xsl:text>Todos los determinantes del cuantificador pueden presentarse de cualquier lado del sustantivo.</xsl:text>
				  </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@determinerNegEither)='restricted' and normalize-space(//qp/@determinerNegPos)!='before' and normalize-space(//qp/@determinerNegPos)!='after'">
					 <xsl:text>Hay restricciones en cuanto a cuáles de los determinantes del cuantificador pueden presentarse en cada lado del sustantivo.</xsl:text>
				  </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>

			   <xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
<p>
<xsl:text>Algunos ejemplos de los determinantes negativos del cuantificador en frases nominales completas en </xsl:text>
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
			   <xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
<example num="xNeg.NegNominal.NegNominalSubject.36">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/determinerNegNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/determinerNegNPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/determinerNegNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/determinerNegNPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.36</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.36.1</xsl:text>
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

			   <xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
<p>
<xsl:text>Estas frases nominales negativas se pueden utilizar como el sujeto de una oración completa, como se muestra a continuación:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
<example num="xNeg.NegNominal.NegNominalSubject.40">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/determinerSubjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/determinerSubjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/determinerSubjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/determinerSubjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.40</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.40.1</xsl:text>
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

			   <xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sPronIndef" />
<xsl:text>, vimos que en </xsl:text>
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
					 <xsl:when test="//pron/@negIndef='no'">todos los negativos indefinidos son frases nominales, en lugar de pronombres de una sóla palabra.</xsl:when>
					 <xsl:when test="//pron/@negIndef='yes'">algunos o todos los negativos indefinidos se combinan con pronombres para formar una palabra. A continuación se dan algunos ejemplos de pronombres negativos indefinidos: </xsl:when>
				  </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//qp/@determinerNeg)='none' and normalize-space(//qp/@npDegreeNeg)='none'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sPronIndef" />
<xsl:text>, vimos que en </xsl:text>
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
					 <xsl:when test="//pron/@negIndef='no'">no hay pronombres negativos indefinidos y tampoco expresa ningún nominal indefinido negativo, puesto que la lengua no tiene ningún medio para negar una frase nominal.</xsl:when>
					 <xsl:when test="//pron/@negIndef='yes'">todos los negativos indefinidos se combinan con pronombres para formar una palabra. No hay frases nominales negativas indefinidas, puesto que la lengua no tiene ningún medio para negar una frase nominal. A continuación se dan algunos ejemplos de pronombres negativos indefinidos:</xsl:when>
				  </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalSubject.46">
<table border="1">
					 <tr>
						<th>Pronombres negativos indefinidos</th>
						<th>Glosa</th>
					 </tr>
					 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/negIndefExample),'.','')" />
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

			   <xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none'">
<p>
<xsl:text>Algunos ejemplos </xsl:text>
<xsl:if test="normalize-space(//pron/@negIndef)='yes'">
					 <xsl:text>(si hay) </xsl:text>
				  </xsl:if>
<xsl:text>de frases nominales negativas indefinidas son:</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none'">
<example num="xNeg.NegNominal.NegNominalSubject.50">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/negIndefNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pron/negIndefNPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/negIndefNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pron/negIndefNPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.50</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.50.1</xsl:text>
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

			   <xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>Estas frases nominales negativas se pueden utilizar como el sujeto de una oración completa, como se muestra a continuación:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalSubject.54">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/pronounSubjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/pronounSubjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/pronounSubjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/pronounSubjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.54</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.54.1</xsl:text>
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
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>Como los ejemplos de las oraciones muestran, </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@subjVerbRequired='yes'">un sujeto negativo no se permite sin también tener un verbo negativo o un auxiliar negativo</xsl:when>
						<xsl:when test="//neg/@subjVerbRequired='no'">no requiere el verbo o auxiliar ser negativo cuando el sujeto es negativo</xsl:when>
					</xsl:choose>
<xsl:text> en </xsl:text>
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
			<section3 id="sNegNominalObject">
				<secTitle>Objetos negativos</secTitle>
				<xsl:if test="normalize-space(//qp/@determinerNeg)='none' and normalize-space(//qp/@npDegreeNeg)='none' and normalize-space(//pron/@negIndef)='no'">
<p>
<xsl:text>Puesto que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no hay ningún medio de negar una frase nominal, ni ningún pronombre indefinido negativo, no puede tener ningún objeto negativo.  </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='some' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='some'">
<p>
<xsl:text>Como vimos en la sección </xsl:text>
<sectionRef sec="sNegType" />
<xsl:text>, en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> hay artículos negativos de polaridad . Por lo tanto, una frase nominal negativa no permite presentarse en la posición del objeto. Por el contrario, uno de los artículos negativos de polaridad  se utiliza y </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@objVerbRequired='yes'">el verbo o el auxiliar debe ser negativo.</xsl:when>
						<xsl:when test="//neg/@objVerbRequired='other'">el verbo o el auxiliar debe ser negativo o otra palabra o frase negativa debe presentarse anteriormente en la oración.</xsl:when>
					</xsl:choose>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>Algunos ejemplos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con un sujeto positivo y </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
						<xsl:text>un artículo negativo de polaridad  en la posición del objeto son: </xsl:text>
					</xsl:if>
<xsl:if test="normalize-space(//neg/@polarityItems)='no' or normalize-space(//neg/@type)='concord'">
<xsl:text>un objeto negativo son: </xsl:text>
					</xsl:if>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalObject.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/objectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/objectExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/objectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/objectExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalObject.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalObject.10.1</xsl:text>
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
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>Algunos ejemplos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con un sujeto positivo y </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
						<xsl:text>un artículo negativo de polaridad  en la posición del objeto indirecto son: </xsl:text>
					</xsl:if>
<xsl:if test="normalize-space(//neg/@polarityItems)='no' or normalize-space(//neg/@type)='concord'">
<xsl:text>un objeto indirecto negativo son: </xsl:text>
					</xsl:if>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalObject.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/indirectObjectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/indirectObjectExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/indirectObjectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/indirectObjectExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalObject.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalObject.14.1</xsl:text>
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
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>Finalmente, algunos ejemplos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con un sujeto negativo y  </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
						<xsl:text>un artículo negativo de polaridad  en la posición del objeto son: </xsl:text>
					</xsl:if>
<xsl:if test="normalize-space(//neg/@polarityItems)='no' or normalize-space(//neg/@type)='concord'">
<xsl:text>un objeto negativo son: </xsl:text>
					</xsl:if>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalObject.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/subjectObjectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/subjectObjectExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/subjectObjectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/subjectObjectExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalObject.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalObject.18.1</xsl:text>
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
				<xsl:if test="normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='some' or normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='some' or normalize-space(//neg/@type)='concord' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@type)='concord' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//neg/@type)='concord' and normalize-space(//qp/@determinerNeg)='some' or normalize-space(//neg/@type)='concord' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//neg/@type)='concord' and normalize-space(//qp/@npDegreeNeg)='some'">
<p>
<xsl:text>Como estos ejemplos muestran, una frase nominal negativa </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
						<xsl:text>no</xsl:text>
					</xsl:if>
<xsl:text> permite presentarse en la posición del objeto o del objeto indirecto </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@objVerbRequired='yes'">a menos que el verbo o el auxiliar es negativo. </xsl:when>
						<xsl:when test="//neg/@objVerbRequired='other'">a menos que el verbo o el auxiliar es negativo o otra palabra o frase negativa se presenta anteriormente en la oración. </xsl:when>
						<xsl:when test="//neg/@objVerbRequired='no'">sin cualquiera restricción sobre otros elementos negativos en la oración. </xsl:when>
					</xsl:choose>
<xsl:if test="normalize-space(//neg/@type)='concord'">
<xsl:text></xsl:text>
<xsl:choose>
	<xsl:when test="//neg/@negFront='yes'"> Un objeto negativo debe presentarse inicialmente en la oración, semejantemente al desplazamiento a la izquierda de las frases interrogativas en las preguntas en español. </xsl:when>
	<xsl:when test="//neg/@negFront='optional'"> Un objeto negativo puede presentarse inicialmente en la oración o puede permanecer en su posición normal. </xsl:when>
	<xsl:when test="//neg/@negFront='beforeVerb'"> Un objeto negativo puede presentarse en la posición directamente antes del verbo o puede permanecer en su posición normal.</xsl:when>
	<xsl:when test="//neg/@negFront='no'"> Un objeto negativo simplemente presentarse en su posición normal en la oración, sin ningún desplazamiento.</xsl:when>
</xsl:choose>
<xsl:text></xsl:text>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='some' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='some'">
<p>
<xsl:text>Como estos ejemplos muestran, un artículo negativo de polaridad  </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
						<xsl:text>no</xsl:text>
					</xsl:if>
<xsl:text> permite presentarse en la posición del objeto o del objeto indirecto </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@objVerbRequired='yes'">a menos que el verbo o el auxiliar es negativo. </xsl:when>
						<xsl:when test="//neg/@objVerbRequired='other'">a menos que el verbo o el auxiliar es negativo o otra palabra o frase negativa se presenta anteriormente en la oración. </xsl:when>
						<xsl:when test="//neg/@objVerbRequired='no'">sin cualquiera restricción sobre otros elementos negativos en la oración. </xsl:when>
					</xsl:choose>
</p>
</xsl:if>

			</section3>
		</section2>
	</section1>



		 
		
		
		
		


		
		
		
		
		

	
		
	
	
		
		
		

		
		
		
	
	
		
		
		

		
		
		
	

		
		
		
	
		

		
		
		
	
		

		
		
		
	
		

		
		
		
	
		


		
		
		

   
	  
	  
	  
   

		
		
		
	
		

		
		
		
		
		
	
	
	
	
	
	

		
		
		
	
		

		
		
		
	
		


		


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
		

   
	  
   
   
	  
   
   
	  
   
   
	  
	  
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
	  
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
	  
	  
   
   
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
   
   
	  
   
   
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
	  
	  
   
   
		
   
   
	  
   
   
	  
	  
	  
	  
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
	  
	  
   
   </xsl:template>
</xsl:stylesheet>
