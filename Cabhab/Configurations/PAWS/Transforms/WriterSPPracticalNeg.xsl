<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="neg">
	<section1 id="sNeg">
		<secTitle>Las construcciones negativas</secTitle>
		<p>
<xsl:text>Todos los idiomas tienen la capacidad de expresar la negación. Esto se realiza generalmente con el uso de:</xsl:text>
</p>
		<ul>
			<li>
				<xsl:text>palabras negativas especiales del grado, como </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
				<xsl:text> (la sección </xsl:text>
				<sectionRef sec="sQPAll" />
				<xsl:text>), o determiners negativos del cuantificador, tales como </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ninguno</langData>
				<xsl:text> (la sección </xsl:text>
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
				<xsl:text> (la sección </xsl:text>
				<sectionRef sec="sPronIndef" />
				<xsl:text>), que expresan una frase nominal negativa a sí mismo,</xsl:text>
			</li>
			<li>
				<xsl:text>adverbios negativos, tales como </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
				<xsl:text> (la sección </xsl:text>
				<sectionRef sec="sAdvPTemporal" />
				<xsl:text>) o</xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nowhere</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'en ninguna parte'</xsl:text>
</gloss>
				<xsl:text> (la sección </xsl:text>
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
<xsl:text>'no'</xsl:text>
</gloss>
				<xsl:text> o la forma afija de la contracción </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-n't</langData>
				<xsl:text> (la sección </xsl:text>
				<sectionRef sec="sIPAux" />
				<xsl:text>), y/o</xsl:text>
			</li>
			<li>
				<xsl:text>afijos verbales negativos (la sección </xsl:text>
				<sectionRef sec="sIPAux" />
				<xsl:text>).</xsl:text>
			</li>
		</ul>
		<p>
<xsl:text>Todos los antedichos se han cubierto como artículos individuales en secciones anteriores (según lo observado). Después de discutir el tipo del sistema de la negación que </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> utiliza, los datos dados serán repasados aquí por categoría o el tipo de la frase, así como la adición de los ejemplos usados en oraciones completas y la discusión de cualquier restricción de la ocurrencia entre los varios elementos negativos. </xsl:text>
</p>
		<section2 id="sNegType">
			<secTitle>El tipo del sistema de la negación</secTitle>
			<p>
<xsl:text>Las idiomas bajan en dos clasificaciones importantes con respecto a la negación: Idiomas cambiantes de la polaridad contra las idiomas de la concordia negativa, ejemplificadas por inglés estándar contra español, respectivamente.</xsl:text>
</p>
			<p>
<xsl:text>Los idiomas cambiantes de la polaridad permiten normalmente un solo elemento negativo en la oración para que la negación sea expresada (cualquier número impar de negativas expresa sin embargo técnico polaridad negativa) porque la presencia de dos (o cualesquiera números pares de) elementos negativos cambia la polaridad de nuevo a positivo. Por ejemplo, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John saw nothing</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Juan vio nada'</xsl:text>
</gloss>
<xsl:text> es negativo, pero </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn't see nothing</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Juan no vio nada'</xsl:text>
</gloss>
<xsl:text> es positivo porque significa igual que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juan vio algo</langData>
<xsl:text>.  La versión con un auxiliar negativo se expresa como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn't see anything</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Juan no vio algo'</xsl:text>
</gloss>
<xsl:text>, usando qué se conoce como  </xsl:text>
					<xsl:text>artículo negativo de la polaridad</xsl:text>
				<xsl:text> en la posición del objeto.  Tales artículos negativos de la polaridad pueden ocurrir como los temas en algunos contextos sin ninguna otra palabra de la negación presente, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Anyone may come</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Cualquiera persona pueden venir'</xsl:text>
</gloss>
<xsl:text>, pero pueden ocurrir en la posición del objeto solamente cuando un elemento anterior en la oración es negativo. Por ejemplo, uno puede decir </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Nobody saw anyone</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Nadie vio cualquiera persona'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Nowhere will they find anyone</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'En ninguna parte ellos encuentra a cualquiera persona'</xsl:text>
</gloss>
<xsl:text> pero sin el tema negativo o el adverbio negativo afrontado el auxiliar negativo debe ser utilizado, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>We did not see anyone</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'No vimos a cualquiera persona'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>They will not find anyone anywhere</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Ellos no encontrarán a cualquiera persona dondequiera'</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>En idiomas de la concordia negativa, cualquier número de elementos negativos expresa polaridad negativa, tan en español </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juan no vio nada</langData>
<xsl:text> es la manera correcta de expresar una oración negativa con un objeto negativo.
					En estos idiomas, un elemento negativo puede ocurrir normalmente en la posición sujeta o una posición afrontada sin ningún otro elemento negativo presente,
					pero un objeto negativo puede ocurrir solamente cuando un elemento anterior en la oración es negativo.
					Algunos idiomas de la concordia negativa tienen la restricción más fuerte que cualquiera palabra o frase negativa debe ocurrir con la negación verbal, y
					todavía otros requieren afrontar de la palabra o de la frase negativa, semejantemente a afrontar de las palabras o de las frases de la interogación en preguntas que se contestan con información.</xsl:text>
</p>
			<xsl:if test="normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='yesPosOnly' and normalize-space(//pron/@negIndef)='no' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='noPosOnly' and normalize-space(//pron/@negIndef)='no' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='yesPosOnly' and normalize-space(//pron/@negIndef)='no' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='noPosOnly' and normalize-space(//pron/@negIndef)='no'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> es ni un idioma cambiante de la polaridad ni un idioma de la concordia negativa, puesto que la única manera de expresar la negación es vía el afijo verbal. No hay casos múltiples de la negación para cambiar la polaridad ni a concordar con.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesNeg' or normalize-space(//qp/@npDegree)='no' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> es un </xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@type='changing'">idioma cambiante de la polaridad</xsl:when>
					<xsl:when test="//neg/@type='concord'">idioma de la concordia negativa</xsl:when>
				</xsl:choose>
<xsl:text>, puesto que </xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@type='changing'">la polaridad cambia entre positivo y la negativa con cada caso de la negación. </xsl:when>
					<xsl:when test="//neg/@type='concord'">cualquier número de elementos negativos conviene simplemente en la polaridad negativa. </xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
	 <xsl:if test="normalize-space(//neg/@type)='concord'">
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
<xsl:text>, un verbo negativo-marcado </xsl:text>
<xsl:choose>
				<xsl:when test="//neg/@objVerbRequired='no'">no se requiere cuando el objeto es negativo.  </xsl:when>
				<xsl:when test="//neg/@objVerbRequired='yes'">se requiere cuando el objeto es negativo.  </xsl:when>
				<xsl:when test="//neg/@objVerbRequired='other'"> no se requiere cuando el objeto es negativo, pero si el verbo no es negativo entonces otra palabra o frase negativa debe ocurrir anterior en la oración.  </xsl:when>
</xsl:choose>
<xsl:text>Además, </xsl:text>
<xsl:choose>
			 <xsl:when test="//neg/@negFront='no'">un objeto negativo aparece simplemente en su posición normal en la oración.</xsl:when>
			 <xsl:when test="//neg/@negFront='yes'">el afrontar de la palabra o de la frase negativa se requiere, similar al afrontar en preguntas.</xsl:when>
			 <xsl:when test="//neg/@negFront='optional'">un objeto negativo puede aparecer inicialmente en la oración, o puede permanecer en su posición normal.</xsl:when>
			 <xsl:when test="//neg/@negFront='beforeVerb'">un objeto negativo puede aparecer en la posición directamente antes del verbo, o puede permanecer en su posición normal.</xsl:when>
</xsl:choose>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='no' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='yesSome' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='yes' or normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='yesNeg'">
<p>
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
					<xsl:when test="//neg/@polarityItems='yes'"> tiene los </xsl:when>
					<xsl:when test="//neg/@polarityItems='no'"> no tiene cualesquiera </xsl:when>
				</xsl:choose>
<xsl:text>artículos negativos de la polaridad.  </xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@polarityItems='yes'">Los pronombres siguientes, los elementos especiales del grado, y los adverbios ocurren en la posición del objeto o la posición normal del adverbio en vez del artículo negativo equivalente cuando otro elemento negativo está presente en la oración.</xsl:when>
					<xsl:when test="//neg/@polarityItems='no'">Los pronombres negativos, los elementos especiales del grado, y los adverbios pueden ocurrir en la posición del objeto o la posición normal del adverbio incluso cuando hay otro elemento negativo en la oración.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='yes' or normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='yesNo'">
<p>
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
					<xsl:when test="//neg/@polarityItems='yes'"> tiene los </xsl:when>
					<xsl:when test="//neg/@polarityItems='no'"> no tiene cualesquiera </xsl:when>
				</xsl:choose>
<xsl:text>artículos negativos de la polaridad.  </xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@polarityItems='yes'">Los pronombres, los determinadores, y los adverbios siguientes ocurren en la posición del objeto o la posición normal del adverbio en vez del artículo negativo equivalente cuando otro elemento negativo está presente en la oración.</xsl:when>
					<xsl:when test="//neg/@polarityItems='no'">Los pronombres, los determinadores, y los adverbios negativos pueden ocurrir en la posición del objeto o la posición normal del adverbio incluso cuando hay otro elemento negativo en la oración.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
<example num="xNeg.NegType.20">
<table border="1">
  <tr>
	  <th>Tipo</th>
	  <th>Artículos negativos de la polaridad</th>
	  <th>Significado</th>
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
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:if test="normalize-space(//qp/@determiner)='no' or normalize-space(//qp/@determiner)='yesSome'">
<td align="left" rowspan="1">
							<xsl:text>Elementos especiales del grado</xsl:text>
						</td>
</xsl:if>
<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<td align="left" rowspan="1">
							<xsl:text>Determinadores</xsl:text>
						</td>
</xsl:if>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<xsl:if test="normalize-space(//qp/@determiner)='no' or normalize-space(//qp/@determiner)='yesSome'">
<td align="left" rowspan="1">
							<xsl:text>Elementos especiales del grado</xsl:text>
						</td>
</xsl:if>
<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<td align="left" rowspan="1">
							<xsl:text>Determinadores</xsl:text>
						</td>
</xsl:if>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
							<xsl:text>Adverbios temporales</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
							<xsl:text>Adverbios temporales</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
							<xsl:text>Adverbios locativos</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
							<xsl:text>Adverbios locativos</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='yesNo' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegree)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegree)='yesNeg'">
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
<xsl:text>, un verbo negativo-marcado </xsl:text>
<xsl:choose>
			   <xsl:when test="//neg/@objVerbRequired='no'">no se requiere cuando hay un artículo negativo de la polaridad en la posición del objeto.  </xsl:when>
			   <xsl:when test="//neg/@objVerbRequired='yes'">se requiere cuando hay un artículo negativo de la polaridad en la posición del objeto.  </xsl:when>
			   <xsl:when test="//neg/@objVerbRequired='other'"> no se requiere cuando hay un artículo negativo de la polaridad en la posición del objeto, pero si el verbo no es negativo entonces otra palabra o frase negativa debe ocurrir anterior en la oración.  </xsl:when>
</xsl:choose>
</p>
</xsl:if>
		</section2>
		<section2 id="sNegVerbal">
			<secTitle>La negación auxiliar y verbal</secTitle>
			<p>
<xsl:text>Vimos en la sección </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text> que </xsl:text>
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
					<xsl:when test="//ip/@negAux='yesOnly'"> tiene uno o más</xsl:when>
					<xsl:when test="//ip/@negAux='yesAffix'"> tiene uno o más</xsl:when>
					<xsl:when test="//ip/@negAux='yesVerb'"> tiene uno o máse</xsl:when>
					<xsl:when test="//ip/@negAux='yesAll'"> tiene uno o más</xsl:when>
					<xsl:when test="//ip/@negAux='noAffixOnly'"> no tiene cualesquiera</xsl:when>
					<xsl:when test="//ip/@negAux='noAffixAndVerb'"> no tiene cualesquiera</xsl:when>
					<xsl:when test="//ip/@negAux='noVerb'"> no tiene cualesquiera</xsl:when>
				</xsl:choose>
<xsl:text> auxiliares negativos que se escriben como palabras separadas, </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@negAux='yesOnly'">y que son el único tipo de negación verbal en la lengua. No hay afijo verbal negativo ni afijo auxiliar negativo. </xsl:when>
					<xsl:when test="//ip/@negAux='yesAffix'">y hay también un afijo auxiliar negativo, pero ningún afijo verbal negativo. </xsl:when>
					<xsl:when test="//ip/@negAux='yesVerb'">y hay también un afijo verbal negativo, pero ningún afijo auxiliar negativo.  </xsl:when>
					<xsl:when test="//ip/@negAux='yesAll'">y hay también un afijo auxiliar negativo y un afijo verbal negativo. </xsl:when>
					<xsl:when test="//ip/@negAux='noAffixOnly'">pero hay un afijo negativo que va en el auxiliar y ése es el único tipo de negación verbal en la lengua. No hay afijo verbal negativo.</xsl:when>
					<xsl:when test="//ip/@negAux='noAffixAndVerb'">pero hay un afijo negativo que va en el auxiliar y un afijo verbal negativo también.</xsl:when>
					<xsl:when test="//ip/@negAux='noVerb'">ni cualquier afijo negativo que vaya en un auxiliar. La única manera de expresar la negación verbal está por uno o más afijos verbales negativos.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@negAux)='yesOnly' or normalize-space(//ip/@negAux)='yesAffix' or normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='yesAll'">
					<xsl:text> El auxiliar negativo </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@negAuxRequiresAux='no'">pueda</xsl:when>
						<xsl:when test="//ip/@negAuxRequiresAux='yes'">no pueda</xsl:when>
					</xsl:choose>
					<xsl:text> ser el único auxiliar en la frase;  </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@negAuxRequiresAux='no'">ningún otro</xsl:when>
						<xsl:when test="//ip/@negAuxRequiresAux='yes'">la presencia de otro</xsl:when>
					</xsl:choose>
					<xsl:text> auxiliar es requirido.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='noAffixAndVerb' or normalize-space(//ip/@negAux)='yesAll'">
					<xsl:text>  Además, </xsl:text>
					<xsl:choose>
						<xsl:when test="//neg/@auxVerbRequired='yes'">no se permite a un auxiliar negativo sinoque el verbo también es negativo.</xsl:when>
						<xsl:when test="//neg/@auxVerbRequired='no'">el verbo no se requiere ser negativo cuando hay un auxiliar negativo.</xsl:when>
					</xsl:choose>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@negAux)='yesOnly' or normalize-space(//ip/@negAux)='yesAffix' or normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='yesAll'">
<p>
<xsl:text>Las palabras auxiliares negativas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='yesOnly' or normalize-space(//ip/@negAux)='yesAffix' or normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='yesAll'">
<example num="xNeg.NegVerbal.8">
<table border="1">
<tr>
	<th>Palabras auxiliares negativas</th>
	<th>Significado</th>
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
<xsl:with-param name="columnsBefore">
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
 </table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='yesOnly' or normalize-space(//ip/@negAux)='yesAffix' or normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='yesAll'">
<p>
<xsl:text>Los ejemplos de las palabras auxiliares negativas usadas en una oración completa (sin cualesquiera frases negativas) incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='yesOnly' or normalize-space(//ip/@negAux)='yesAffix' or normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='yesAll'">
<example num="xNeg.NegVerbal.12">
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
<xsl:with-param name="sExNumber">xNeg.NegVerbal.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.12.1</xsl:text>
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
			<xsl:if test="normalize-space(//ip/@negAux)='noAffixOnly' or normalize-space(//ip/@negAux)='yesAffix' or normalize-space(//ip/@negAux)='noAffixAndVerb' or normalize-space(//ip/@negAux)='yesAll'">
<p>
<xsl:text>Los ejemplos de los afijos negativos del auxiliar en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> juntados a un auxiliar incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='noAffixOnly' or normalize-space(//ip/@negAux)='yesAffix' or normalize-space(//ip/@negAux)='noAffixAndVerb' or normalize-space(//ip/@negAux)='yesAll'">
<example num="xNeg.NegVerbal.16">
<table border="1">
					<tr>
						<th>Auxiliares negativos</th>
						<th>Significado</th>
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
<xsl:with-param name="columnsBefore">
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='noAffixOnly' or normalize-space(//ip/@negAux)='yesAffix' or normalize-space(//ip/@negAux)='noAffixAndVerb' or normalize-space(//ip/@negAux)='yesAll'">
<p>
<xsl:text>Los ejemplos de los afijos auxiliares negativos juntados a un auxiliar usado en una oración completa (sin cualesquiera frases negativas) incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='noAffixOnly' or normalize-space(//ip/@negAux)='yesAffix' or normalize-space(//ip/@negAux)='noAffixAndVerb' or normalize-space(//ip/@negAux)='yesAll'">
<example num="xNeg.NegVerbal.20">
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
<xsl:with-param name="sExNumber">xNeg.NegVerbal.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.20.1</xsl:text>
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
			<xsl:if test="normalize-space(//ip/@negAux)='noVerb' or normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='noAffixAndVerb' or normalize-space(//ip/@negAux)='yesAll'">
<p>
<xsl:text>Los ejemplos de los afijos verbales negativos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> juntados a un verbo incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='noVerb' or normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='noAffixAndVerb' or normalize-space(//ip/@negAux)='yesAll'">
<example num="xNeg.NegVerbal.24">
<table border="1">
					<tr>
						<th>Verbos negativo-marcados</th>
						<th>Significado</th>
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
<xsl:with-param name="columnsBefore">
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='noVerb' or normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='noAffixAndVerb' or normalize-space(//ip/@negAux)='yesAll'">
<p>
<xsl:text>Los ejemplos en oraciones completas con verbos negativos incluyen: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='noVerb' or normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='noAffixAndVerb' or normalize-space(//ip/@negAux)='yesAll'">
<example num="xNeg.NegVerbal.28">
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
<xsl:with-param name="sExNumber">xNeg.NegVerbal.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.28.1</xsl:text>
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
		<section2 id="sNegAdverb">
			<secTitle>La negación adverbial</secTitle>
			<p>
<xsl:text>Vimos en la sección </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> la idea temporal negativa de ' nunca' se expresa </xsl:text>
<xsl:choose>
	<xsl:when test="//advp/@negTemporalType='word'">por una o más palabras separadas. Los ejemplos</xsl:when>
	<xsl:when test="//advp/@negTemporalType='affix'">por uno o más afijos verbales, en vez de por palabras separadas. Los ejemplos de los afijos juntaron a los verbos</xsl:when>
	<xsl:when test="//advp/@negTemporalType='verb'">usando el afijo negativo verbal, que puede ocurrir con adverbios temporales positivos para dar un significado temporal negativo. Los ejemplos de adverbios temporales con un verbo negativo</xsl:when>
</xsl:choose>
<xsl:text> incluyen:</xsl:text>
</p>
			<xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<example num="xNeg.NegAdverb.6">
<table border="1">
					<tr>
						<th>Verbos temporales negativos</th>
						<th>Significado</th>
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
<xsl:with-param name="columnsBefore">
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negTemporalType)='word' or normalize-space(//advp/@negTemporalType)='verb'">
<example num="xNeg.NegAdverb.8">
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
<xsl:with-param name="sExNumber">xNeg.NegAdverb.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.8.1</xsl:text>
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
			<p>
<xsl:text>Los ejemplos en oraciones completas que contienen un temporal negativo incluyen: </xsl:text>
</p>
			<example num="xNeg.NegAdverb.12">
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
<xsl:with-param name="sExNumber">xNeg.NegAdverb.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.12.1</xsl:text>
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
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sAdvPLocative" />
<xsl:text> vimos que en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> la idea negativa locativa de 'en ninguna parte' se expresa </xsl:text>
<xsl:choose>
	<xsl:when test="//advp/@negLocativeType='word'">por una o más palabras separadas. Los ejemplos</xsl:when>
	<xsl:when test="//advp/@negLocativeType='affix'">por uno o más afijos verbales, en vez de por palabras separadas. Los ejemplos de los afijos juntaron a los verbos</xsl:when>
	<xsl:when test="//advp/@negLocativeType='verb'">usando el afijo negativo verbal, que puede ocurrir con adverbios positivos locativos para dar un significado negativo locativo. Los ejemplos de los adverbios locativos con un verbo negativo</xsl:when>
</xsl:choose>
<xsl:text> incluyen:</xsl:text>
</p>
			<xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<example num="xNeg.NegAdverb.16">
<table border="1">
					<tr>
						<th>Verbos locativos negativos</th>
						<th>Significado</th>
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
<xsl:with-param name="columnsBefore">
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negLocativeType)='word' or normalize-space(//advp/@negLocativeType)='verb'">
<example num="xNeg.NegAdverb.18">
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
<xsl:with-param name="sExNumber">xNeg.NegAdverb.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.18.1</xsl:text>
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
			<p>
<xsl:text>Los ejemplos en oraciones completas que contienen un locativo negativo incluyen:</xsl:text>
</p>
			<example num="xNeg.NegAdverb.22">
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
<xsl:with-param name="sExNumber">xNeg.NegAdverb.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.22.1</xsl:text>
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
			<xsl:if test="normalize-space(//advp/@negTemporalType)='word' or normalize-space(//advp/@negLocativeType)='word'">
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
<xsl:choose>
					<xsl:when test="//neg/@advVerbRequired='yes'"> un adverbio negativo escrito como palabra separada no se permite sinoque el verbo también es negativo.</xsl:when>
					<xsl:when test="//neg/@advVerbRequired='no'"> el verbo no se requiere ser negativo cuando hay un adverbio negativo escrito como palabra separada.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
		</section2>
		<section2 id="sNegNominal">
			<secTitle>La negación de frases nominales</secTitle>
			<p>
<xsl:text>Una frase nominal se puede negar normalmente por una palabra especial del grado, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text>, o por un determinador del cuantificador, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ninguno</langData>
<xsl:text>, o usando un pronombre indefinido negativo. Cada tipo permitido en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> será ejemplificado en oraciones completas cuando está utilizado como temas y objetos directos, y cualquier restricción será discutido.</xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='yesNo' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegree)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegree)='yesNeg'">
					<xsl:text>  El uso de los artículos negativos de la polaridad en </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text> también será cubierto en la sección</xsl:text>
					<sectionRef sec="sNegNominalObject" />
					<xsl:text>.</xsl:text>
				</xsl:if>
</p>
			<section3 id="sNegNominalSubject">
				<secTitle>Los temas negativos</secTitle>
				<xsl:if test="normalize-space(//qp/@npDegree)='noPosOnly' or normalize-space(//qp/@npDegree)='yesPosOnly'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text>vimos que </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene ninguna manera de expresar la idea especial negativa del grado de ' not' modificando la frase nominal completa.  Ni las palabras especiales negativas del grado ni el cliticos ni los afijos con partículas juntados al sustantivo principal se utilizan para negar una frase nominal en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@npDegree)='no' or normalize-space(//qp/@npDegree)='yesPos'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text> vimos que </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene ningunas palabras especiales negativas del grado que se escriban como palabras separadas y modifican la frase nominal completa. En lugar, son </xsl:text>
<xsl:choose>
						<xsl:when test="//qp/@npDegreeNegType='proclitic'">procliticos que junte al frente de cualquiera palabra que comienza la frase nominal,</xsl:when>
						<xsl:when test="//qp/@npDegreeNegType='enclitic'">encliticos que junte al final de cualquiera palabra que termina la frase nominal,</xsl:when>
						<xsl:when test="//qp/@npDegreeNegType='clitic'">clíticos que junte o al frente de cualquiera palabra que comienza la frase nominal o al final de cualquiera palabra que termina la frase nominal,</xsl:when>
						<xsl:when test="//qp/@npDegreeNegType='prefix'">prefijos que juntan al sustantivo principal de la frase nominal,</xsl:when>
						<xsl:when test="//qp/@npDegreeNegType='suffix'">sufijos que juntan al sustantivo principal de la frase nominal,</xsl:when>
						<xsl:when test="//qp/@npDegreeNegType='affix'">o prefijos o sufijos que juntan al sustantivo principal de la frase nominal,</xsl:when>
					</xsl:choose>
<xsl:text> según se mostra en la tabla siguiente. </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesNeg'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text> vimos que </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene las siguientes palabras negativas especiales del grado que se escriben como palabras separadas y modifican la frase nominal completo:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<example num="xNeg.NegNominal.NegNominalSubject.10">
<table border="1">
<tr>
	<th>Elementos especiales negativos del grado</th>
	<th>Significado</th>
</tr>
						<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//qp/not),'.','')" />
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
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					</table>
</example>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text>Los ejemplos de frases nominales negativos usando los elementos especiales negativos del grado  en </xsl:text>
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
</xsl:if>
				<xsl:if test="normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
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
				<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' or normalize-space(//qp/@npDegree)!='yes' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text>Los ejemplos que incluyen los elementos especiales positivos del grado también son:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' or normalize-space(//qp/@npDegree)!='yes' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<example num="xNeg.NegNominal.NegNominalSubject.18">
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
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.18.1</xsl:text>
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
				<xsl:if test="normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text>Estas frases nominales negativas se pueden utilizar como el tema de una oración completa como se muestra aquí:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<example num="xNeg.NegNominal.NegNominalSubject.22">
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
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.22.1</xsl:text>
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
				<xsl:if test="normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='yesPosOnly' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='yesPosOnly' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='noPosOnly' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='noPosOnly'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPDeterminers" />
<xsl:text> vimos que </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>  no tiene un grupo separado de los cuantificadores que actúan como el único determinador en la frase nominal. Apenas pues no hay ninguna manera de expresar el elemento especial negativo 'not' , no hay ninguna manera de expresar ' ninguno' modificación de una frase nominal en este idioma.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)!='yesPosOnly' and normalize-space(//qp/@npDegree)!='noPosOnly' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)!='yesPosOnly' and normalize-space(//qp/@npDegree)!='noPosOnly'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPDeterminers" />
<xsl:text>  vimos que </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene un grupo separado de los cuantificadores que actúan como el único determinador en la frase nominal.  La negación de una frase nominal es expresada por los elementos especiales del grado solamente. </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sQPDeterminers" />
<xsl:text> vimos que </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene los siguientes cuantificadores negativos que se escriben como palabras separadas y actúan como el único determinador en la frase nominal: </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<example num="xNeg.NegNominal.NegNominalSubject.30">
<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<table border="1">
<tr>
	<th>Determinadores negativos del cuantificador</th>
	<th>Significado</th>
</tr>
						<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//qp/determinerNegExample),'.','')" />
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
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					</table>
</xsl:if>
</example>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<p>
<xsl:text>Los ejemplos de las frases nominales negativas usando los determinadores negativos del cuantificador  en </xsl:text>
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
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<example num="xNeg.NegNominal.NegNominalSubject.34">
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
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.34.1</xsl:text>
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
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<p>
<xsl:text>Estas frases nominales negativas se pueden utilizar como el tema de una oración completa como se muestra aquí:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<example num="xNeg.NegNominal.NegNominalSubject.38">
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
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.38</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.38.1</xsl:text>
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
			<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text>En section la sección </xsl:text>
<sectionRef sec="sPronIndef" />
<xsl:text>, vimos que </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene los siguientes pronombres indefinidos negativos y/o las frases nominales indefinidas negativas:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='yesPosOnly' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='yesPosOnly' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='noPosOnly' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='noPosOnly'">
<p>
<xsl:text>En la sección </xsl:text>
<sectionRef sec="sPronIndef" />
<xsl:text>, vimos que </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
					<xsl:when test="//pron/@negIndef='no'">no tiene ningunos pronombres indefinidos negativos ni ninguna frase nominal indefinida negativa tampoco, puesto que el idioma no tiene ningunos medios de negar una frase nominal.</xsl:when>
					<xsl:when test="//pron/@negIndef='yes'"> tiene los siguientes pronombres indefinidos negativos:</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesNeg' or normalize-space(//qp/@npDegree)='no' or normalize-space(//pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalSubject.44">
<table border="1">
 <tr>
	 <th>Tipo</th>
	 <th>Indefinido negativo</th>
	 <th>Significado</th>
 </tr>
						<xsl:if test="normalize-space(//pron/@negIndef)='yes'">
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
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
								<xsl:text>Pronombres</xsl:text>
							</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
								<xsl:text>Pronombres</xsl:text>
							</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
						<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/negIndefNPExample),'.','')" />
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
<td align="left" rowspan="1">
								<xsl:text>Frases nominales</xsl:text>
							</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
								<xsl:text>Frases nominales</xsl:text>
							</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					</table>
</example>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesNeg' or normalize-space(//qp/@npDegree)='no' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>Estas frases nominales negativas se pueden utilizar como el tema de una oración completa como se muestra aquí:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesNeg' or normalize-space(//qp/@npDegree)='no' or normalize-space(//pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalSubject.48">
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
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.48</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.48.1</xsl:text>
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
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesNeg' or normalize-space(//qp/@npDegree)='no' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>Como los ejemplos antedichos de la oración demuestran, </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@subjVerbRequired='yes'">un tema negativo no se permite sin también tener un verbo negativo o un auxiliar negativo</xsl:when>
						<xsl:when test="//neg/@subjVerbRequired='no'">el verbo o auxiliar debe ser negativo cuando el tema es negativo</xsl:when>
					</xsl:choose>
<xsl:text> en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
				<secTitle>Los objetos negativos</secTitle>
				<xsl:if test="normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='yesPosOnly' and normalize-space(//pron/@negIndef)='no' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='noPosOnly' and normalize-space(//pron/@negIndef)='no' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='yesPosOnly' and normalize-space(//pron/@negIndef)='no' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='noPosOnly' and normalize-space(//pron/@negIndef)='no'">
<p>
<xsl:text>Puesto que </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene ningunos medios de negar una frase nominal, ni ningunos pronombres indefinidos negativos, no puede tener ningunos objetos negativos.  </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='yesNo' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegree)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegree)='yesNeg'">
<p>
<xsl:text>Como vimos en la sección </xsl:text>
<sectionRef sec="sNegType" />
<xsl:text>, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene artículos negativos de la polaridad. Por lo tanto, una frase nominal negativa no se permite ocurrir en la posición del objeto. En lugar, uno de los artículos negativos de la polaridad se utiliza y </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@objVerbRequired='yes'">el verbo o el auxiliar debe ser negativo.</xsl:when>
						<xsl:when test="//neg/@objVerbRequired='other'">el verbo o el auxiliar debe ser negativo o otra palabra o frase negativa debe ocurrir anterior en la oración.</xsl:when>
					</xsl:choose>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesNeg' or normalize-space(//qp/@npDegree)='no' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>Los ejemplos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con un tema positivo y </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
						<xsl:text>un artículo negativo de la polaridad en la frase nominal del objeto incluyen: </xsl:text>
					</xsl:if>
<xsl:if test="normalize-space(//neg/@polarityItems)='no'">
<xsl:text>una frase nominal negativa del objeto incluyen: </xsl:text>
					</xsl:if>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesNeg' or normalize-space(//qp/@npDegree)='no' or normalize-space(//pron/@negIndef)='yes'">
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
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesNeg' or normalize-space(//qp/@npDegree)='no' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>Los ejemplos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con un tema positivo y </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
						<xsl:text>un artículo negativo de la polaridad en la frase nominal del objeto indirecto incluyen: </xsl:text>
					</xsl:if>
<xsl:if test="normalize-space(//neg/@polarityItems)='no'">
<xsl:text>una frase nominal negativa del objeto indirecto incluyen: </xsl:text>
					</xsl:if>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesNeg' or normalize-space(//qp/@npDegree)='no' or normalize-space(//pron/@negIndef)='yes'">
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
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesNeg' or normalize-space(//qp/@npDegree)='no' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>Finalmente, los ejemplos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con un tema negativo y  </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
						<xsl:text>un artículo negativo de la polaridad en la frase nominal del objeto incluyen: </xsl:text>
					</xsl:if>
<xsl:if test="normalize-space(//neg/@polarityItems)='no'">
<xsl:text>una frase nominal negativa del objeto incluyen: </xsl:text>
					</xsl:if>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesNeg' or normalize-space(//qp/@npDegree)='no' or normalize-space(//pron/@negIndef)='yes'">
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
				<xsl:if test="normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='yes' or normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='yesNo' or normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegree)='yes' or normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegree)='yesNeg' or normalize-space(//neg/@type)='concord' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@type)='concord' and normalize-space(//qp/@determiner)='yes' or normalize-space(//neg/@type)='concord' and normalize-space(//qp/@determiner)='yesNo' or normalize-space(//neg/@type)='concord' and normalize-space(//qp/@npDegree)='yes' or normalize-space(//neg/@type)='concord' and normalize-space(//qp/@npDegree)='yesNeg'">
<p>
<xsl:text>Como estos ejemplos demuestran, una frase nominal negativa </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
						<xsl:text>no</xsl:text>
					</xsl:if>
<xsl:text> se permite ocurrir en la posición del objeto o del objeto indirecto </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@objVerbRequired='yes'">a menos que el verbo o el auxiliar es negativo. </xsl:when>
						<xsl:when test="//neg/@objVerbRequired='other'">a menos que el verbo o el auxiliar es negativo o otra palabra o frase negativa ocurre anterior en la oración. </xsl:when>
						<xsl:when test="//neg/@objVerbRequired='no'">sin cualquiera restricción sobre otros elementos negativos en la oración. </xsl:when>
					</xsl:choose>
<xsl:if test="normalize-space(//neg/@type)='concord'">
<xsl:text></xsl:text>
<xsl:choose>
	<xsl:when test="//neg/@negFront='yes'"> Un objeto negativo debe aparecer inicialmente en la oración, semejantemente a afrontar de las frases de interrogación en las preguntas en español. </xsl:when>
	<xsl:when test="//neg/@negFront='optional'"> Un objeto negativo puede aparecer inicialmente en la oración, o puede permanecer en su posición normal. </xsl:when>
	<xsl:when test="//neg/@negFront='beforeVerb'"> Un objeto negativo puede aparecer en la posición directamente antes del verbo, o puede permanecer en su posición normal.</xsl:when>
	<xsl:when test="//neg/@negFront='no'"> Un objeto negativo aparece simplemente en su posición normal en la oración, sin ningún movimiento.</xsl:when>
</xsl:choose>
<xsl:text></xsl:text>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determiner)='yesNo' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegree)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegree)='yesNeg'">
<p>
<xsl:text>Como estos ejemplos demuestran, un artículo negativo de la polaridad </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
						<xsl:text>no</xsl:text>
					</xsl:if>
<xsl:text> se permite ocurrir en la posición del objeto o del objeto indirecto </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@objVerbRequired='yes'">a menos que el verbo o el auxiliar es negativo. </xsl:when>
						<xsl:when test="//neg/@objVerbRequired='other'">a menos que el verbo o el auxiliar es negativo o otra palabra o frase negativa ocurre anterior en la oración. </xsl:when>
						<xsl:when test="//neg/@objVerbRequired='no'">sin cualquiera restricción sobre otros elementos negativos en la oración. </xsl:when>
					</xsl:choose>
</p>
</xsl:if>

			</section3>
		</section2>
	</section1>



















































































































































































































































































































































</xsl:template>
</xsl:stylesheet>
