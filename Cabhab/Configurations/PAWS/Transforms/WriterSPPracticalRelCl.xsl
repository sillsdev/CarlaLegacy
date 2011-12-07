<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="relcl">
	<section1 id="sRelCl">
		<secTitle>Las cláusulas relativas</secTitle>
		<p>
<xsl:text>Las cláusulas relativas modifican un sustantivo principal y normalmente tienen una de cuatro estructuras:</xsl:text>
</p>
		<ul>
			<li>
				<xsl:text>al al igual que una cláusula de complemento con el complementizador 'que' , como en  </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el hombre que vino a la reunión tarde</langData>
				<xsl:text>;</xsl:text>
			</li>
			<li>
				<xsl:text>al al igual que una pregunta abierta subordinada con 'quien' o 'cual' desplazado a la izquierda, como en </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el hombre quien vino a la reunión tarde</langData>
				<xsl:text>;</xsl:text>
			</li>
			<li>
				<xsl:text>(o para algunos idiomas con excepción del español) al al igual que una cláusula de complemento pero con un indicador relativo especial que se presenta en la posición del complementizador, o posiblemente con dos indicadores que se presentan en cada lado de la cláusula relativa;</xsl:text>
			</li>
			<li>
				<xsl:text>(o para algunos idiomas con excepción del español) al al igual que una oración regular con un indicador relativo unido al verbo.</xsl:text>
			</li>
		</ul>
		<p>
<xsl:text>Algunos idiomas también permiten que una de las estructuras antedichas se presente por sí mismo como frase nominal sin un sustantivo principal para modificarse, generalmente llamado cláusulas relativas "sin núcleo". </xsl:text>
</p>
		<p>
<xsl:if test="normalize-space(//relcl/@exist)='no'">
				<xsl:text>En </xsl:text>
				<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
				<xsl:text> no hay ningún tipo de cláusula relativa.</xsl:text>
			</xsl:if>
<xsl:if test="normalize-space(//relcl/@exist)='yes'">
				<xsl:text>En </xsl:text>
				<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
				<xsl:text>, las cláusulas relativas se presentan </xsl:text>
				<xsl:choose>
					<xsl:when test="//relcl/@clausePos='before'">antes</xsl:when>
					<xsl:when test="//relcl/@clausePos='after'">después</xsl:when>
					<xsl:when test="//relcl/@clausePos='either'">de cualquier lado</xsl:when>
					<xsl:when test="//relcl/@clausePos='unknown'"> _______ </xsl:when>
				</xsl:choose>
				<xsl:text> del sustantivo principal.  En </xsl:text>
				<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
				<xsl:choose>
					<xsl:when test="//relcl/@type='IP'">, las cláusulas relativas son como una oración normal con un indicador relativo unido al verbo.</xsl:when>
					<xsl:when test="//relcl/@type='CP'">, las cláusulas relativas son </xsl:when>
				</xsl:choose>
				<xsl:if test="normalize-space(//relcl/@type)='CP'">
					<xsl:choose>
						<xsl:when test="//relcl/@compCP='no'">como preguntas porque una palabra interrogativa se desplaza a la izquierda.</xsl:when>
						<xsl:when test="//relcl/@compCP='yes'">como cláusulas de complemento con los indicadores relativos que </xsl:when>
						<xsl:when test="//relcl/@compCP='yesBoth'">como preguntas porque una palabra interrogativa se desplaza a la izquierda y algunos son como cláusulas de complemento con los indicadores relativos que </xsl:when>
					</xsl:choose>
					<xsl:if test="normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' or normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)='no' and normalize-space(//relcl/@whAndComp)!='no'">
						<xsl:text>son </xsl:text>
						<xsl:choose>
							<xsl:when test="//relcl/@relWord='yes'">escritos como palabras independientes.</xsl:when>
							<xsl:when test="//relcl/@relWord='no'">clíticos que se unen a otra palabra en el extremo de la cláusula relativa.</xsl:when>
						</xsl:choose>
						<xsl:if test="normalize-space(//relcl/@relWord)='no' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' or normalize-space(//relcl/@relWord)='no' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)='no' and normalize-space(//relcl/@whAndComp)!='no'">
							<xsl:choose>
								<xsl:when test="//relcl/@relCliticPos='before'">Estos clíticos son proclíticos.</xsl:when>
								<xsl:when test="//relcl/@relCliticPos='after'">Estos clíticos son enclíticos.</xsl:when>
								<xsl:when test="//relcl/@relCliticPos='both'">Algunos de los clíticos son proclíticos y algunos son enclíticos.</xsl:when>
							   <xsl:when test="//relcl/@relCliticPos='unknown'"> _______ </xsl:when>
						   </xsl:choose>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//relcl/@relWord)='yes' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' or normalize-space(//relcl/@relWord)='yes' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)='no' and normalize-space(//relcl/@whAndComp)!='no'">
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="//relcl/@relCompSame='yes'">Uno o más de los indicadores relativos son iguales</xsl:when>
								<xsl:when test="//relcl/@relCompSame='no'">Ningún indicador relativo es igual</xsl:when>
							</xsl:choose>
							<xsl:text> que el complementizador que se usa en las cláusulas complementos de los verbos. Los indicadores relativos se presentan </xsl:text>
							<xsl:choose>
								<xsl:when test="//relcl/@relCompPos='before'">antes</xsl:when>
								<xsl:when test="//relcl/@relCompPos='after'">después</xsl:when>
								<xsl:when test="//relcl/@relCompPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
								<xsl:when test="//relcl/@relCompPos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
								<xsl:when test="//relcl/@relCompPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
								<xsl:when test="//relcl/@relCompPos='afterOrBoth'">después o en ambos lados</xsl:when>
								<xsl:when test="//relcl/@relCompPos='both'">en ambos lados</xsl:when>
								<xsl:when test="//relcl/@relCompPos='unknown'">_______</xsl:when>
						   </xsl:choose>
							<xsl:text> de la oración pieza de la cláusula relativa.</xsl:text>
							<xsl:if test="normalize-space(//relcl/@relWord)='yes' and normalize-space(//relcl/@relCompEitherRestricted)='unrestricted' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' and normalize-space(//relcl/@relCompPos)!='before' and normalize-space(//relcl/@relCompPos)!='after'">
								<xsl:text>Todos los indicadores relativos pueden presentarse de cualquier lado.</xsl:text>
							</xsl:if>
							<xsl:text> </xsl:text>
							<xsl:if test="normalize-space(//relcl/@relWord)='yes' and normalize-space(//relcl/@relCompEitherRestricted)='restricted' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' and normalize-space(//relcl/@relCompPos)!='before' and normalize-space(//relcl/@relCompPos)!='after'">
								<xsl:text>Hay restricciones en cuanto a cuáles de los indicadores relativos pueden presentarse en cada lado.</xsl:text>
							</xsl:if>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:text> </xsl:text>
				<xsl:if test="normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='yes'">
					<xsl:text>En las cláusulas relativas de tipo interrogativo, </xsl:text>
					<xsl:choose>
						<xsl:when test="//relcl/@whAndComp='no'">solamente la palabra interrogativa se presenta sin ningún tipo de indicador relativo. </xsl:when>
						<xsl:when test="//relcl/@whAndComp='yes'">la palabra interrogativa y los indicadores relativos se requieren ambas estén presentes.</xsl:when>
						<xsl:when test="//relcl/@whAndComp='optional'">un indicador relativo puede presentarse opcionalmente junto con la palabra interrogativa.</xsl:when>
					</xsl:choose>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:text> </xsl:text>
			</xsl:if>
<xsl:text> </xsl:text>
</p>
		<xsl:if test="normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text>Algunos ejemplos de cláusulas relativas en </xsl:text>
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
		<xsl:if test="normalize-space(//relcl/@exist)='yes'">
<example num="xRelCl.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//relcl/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//relcl/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//relcl/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//relcl/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xRelCl.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xRelCl.14.1</xsl:text>
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
		<xsl:if test="normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text>Algunos ejemplos de las cláusulas relativas antedichas incluidas en oraciones completas son:</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//relcl/@exist)='yes'">
<example num="xRelCl.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//relcl/sentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//relcl/sentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//relcl/sentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//relcl/sentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xRelCl.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xRelCl.18.1</xsl:text>
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
		<xsl:if test="normalize-space(//relcl/@exist)='yes'">
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
<xsl:text> se </xsl:text>
<xsl:choose>
				<xsl:when test="//relcl/@headless='no'">requiere un sustantivo principal estar presente en todas las cláusulas relativas, así que no se permite ninguna cláusula relativa sin núcleo.</xsl:when>
				<xsl:when test="//relcl/@headless='yes'">permite que un sustantivo principal no estar presente en cláusulas relativas, así que se permiten las cláusulas relativas sin núcleo.</xsl:when>
			</xsl:choose>
<xsl:text> </xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//relcl/@headless)='yes' and normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text>Algunos ejemplos de las cláusulas relativas sin núcleo incluidas en oraciones completas son:</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//relcl/@headless)='yes' and normalize-space(//relcl/@exist)='yes'">
<example num="xRelCl.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//relcl/headlessExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//relcl/headlessExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//relcl/headlessExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//relcl/headlessExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xRelCl.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xRelCl.24.1</xsl:text>
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
	<section1 id="sTexts">
		<secTitle>Los textos</secTitle>
		<p>
<object type="tComment">Incluya varios textos aquí para mostrar cómo se forman las construcciones más grandes tales como párrafos, conversaciones e historias narrativas. Incluya los ejemplos de varios tipos literarios.</object>
</p>
		<p>
<object type="tComment">  Un formato sugerido para presentar los textos es presente el texto completo en el idioma vernáculo primero, así que los nativos pueden apreciarla. Después presenta la forma interlineal, como en los ejemplos a través de la gramática. Finalmente, dé una traducción libre completo, así que el altavoz extranjero puede apreciar más sobre la cultura.</object>
</p>
	</section1>























































































</xsl:template>
</xsl:stylesheet>
