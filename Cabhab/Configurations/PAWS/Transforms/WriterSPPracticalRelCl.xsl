<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="relcl">
	<section1 id="sRelCl">
		<secTitle>Las cláusulas relativas</secTitle>
		<p>
<xsl:text>Las cláusulas relativas modifican un sustantivo principal y tienen normalmente una de cuatro estructuras:</xsl:text>
</p>
		<ul>
			<li>
				<xsl:text>como una cláusula de complemento dirigida por 'que' , como en  </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el hombre que vino a la reunión tarde</langData>
				<xsl:text>;</xsl:text>
			</li>
			<li>
				<xsl:text>como una pregunta de información subordinada con 'quien' o 'cual' afrontado, como en </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el hombre quien vino a la reunión tarde</langData>
				<xsl:text>;</xsl:text>
			</li>
			<li>
				<xsl:text>(o para algunos idiomas con excepción del español) como una cláusula de complemento pero con un marcador relativo especial que ocurre en la posición del complementizador, o posiblemente con dos marcadores que ocurren en cada lado de la cláusula relativa;</xsl:text>
			</li>
			<li>
				<xsl:text>(o para algunos idiomas con excepción del español) como una oración regular con un marcador relativo juntado al verbo.</xsl:text>
			</li>
		</ul>
		<p>
<xsl:text>Algunos idiomas también permiten que una de las estructuras antedichas ocurra por sí mismo como frase nominal sin un sustantivo principal para modificarse, generalmente llamado cláusulas relativas "sin cabeza". </xsl:text>
</p>
		<p>
<xsl:if test="normalize-space(//relcl/@exist)='no'">
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
				<xsl:text>En </xsl:text>
				<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
				<xsl:text>, las cláusulas relativas ocurren </xsl:text>
				<xsl:choose>
					<xsl:when test="//relcl/@clausePos='before'">antes</xsl:when>
					<xsl:when test="//relcl/@clausePos='after'">después</xsl:when>
					<xsl:when test="//relcl/@clausePos='either'">de cualquier lado</xsl:when>
					<xsl:when test="//relcl/@clausePos='unknown'"> _______ </xsl:when>
				</xsl:choose>
				<xsl:text> del sustantivo principal.  En </xsl:text>
				<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:choose>
					<xsl:when test="//relcl/@type='IP'">, las cláusulas relativas son como una oración regular con un marcador relativo juntado al verbo.</xsl:when>
					<xsl:when test="//relcl/@type='CP'">, las cláusulas relativas son </xsl:when>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:if test="normalize-space(//relcl/@type)='CP'">
					<xsl:text> </xsl:text>
					<xsl:choose>
						<xsl:when test="//relcl/@compCP='no'">como preguntas porque una palabra interrogativa se afronta.</xsl:when>
						<xsl:when test="//relcl/@compCP='yes'">como cláusulas de complemento con los marcadores relativos que </xsl:when>
						<xsl:when test="//relcl/@compCP='yesBoth'">como preguntas porque una palabra interrogativa se afronta y algunos son como cláusulas de complemento con los marcadores relativos que </xsl:when>
					</xsl:choose>
					<xsl:if test="normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' or normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)='no' and normalize-space(//relcl/@whAndComp)!='no'">
						<xsl:text>sea </xsl:text>
						<xsl:choose>
							<xsl:when test="//relcl/@relWord='yes'">escrito como una palabra separada.</xsl:when>
							<xsl:when test="//relcl/@relWord='no'">clíticos que juntan a otra palabra en el borde de la cláusula relativa.</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//relcl/@relWord)='no' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' or normalize-space(//relcl/@relWord)='no' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)='no' and normalize-space(//relcl/@whAndComp)!='no'">
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="//relcl/@relCliticPos='before'">Estos clíticos son procliticos.</xsl:when>
								<xsl:when test="//relcl/@relCliticPos='after'">Estos clíticos son encliticos.</xsl:when>
								<xsl:when test="//relcl/@relCliticPos='both'">Algunos de los clíticos son procliticos y algunos son encliticos.</xsl:when>
							   <xsl:when test="//relcl/@relCliticPos='unknown'"> _______ </xsl:when>
						   </xsl:choose>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//relcl/@relWord)='yes' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' or normalize-space(//relcl/@relWord)='yes' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)='no' and normalize-space(//relcl/@whAndComp)!='no'">
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="//relcl/@relCompSame='yes'">Algunos de</xsl:when>
								<xsl:when test="//relcl/@relCompSame='no'">Ningunos de</xsl:when>
							</xsl:choose>
							<xsl:text> los marcadores relativos son iguales que el complementizador que se usa en las cláusulas complementos de los verbos. El marcador relativo ocurre </xsl:text>
							<xsl:choose>
								<xsl:when test="//relcl/@relCompPos='before'">antes</xsl:when>
								<xsl:when test="//relcl/@relCompPos='after'">después</xsl:when>
								<xsl:when test="//relcl/@relCompPos='either'">de cualquier lado (pero no ambos lados)</xsl:when>
								<xsl:when test="//relcl/@relCompPos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
								<xsl:when test="//relcl/@relCompPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
								<xsl:when test="//relcl/@relCompPos='afterOrBoth'">después o en ambos lados</xsl:when>
								<xsl:when test="//relcl/@relCompPos='both'">en ambos lados</xsl:when>
								<xsl:when test="//relcl/@relCompPos='unknown'">_______</xsl:when>
						   </xsl:choose>
							<xsl:text> de la pieza de la oración de la cláusula relativa.</xsl:text>
							<xsl:if test="normalize-space(//relcl/@relWord)='yes' and normalize-space(//relcl/@relCompEitherRestricted)='unrestricted' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' and normalize-space(//relcl/@relCompPos)!='before' and normalize-space(//relcl/@relCompPos)!='after'">
								<xsl:text>Todos los marcadores relativos pueden ocurrir de cualquier lado.</xsl:text>
							</xsl:if>
							<xsl:text> </xsl:text>
							<xsl:if test="normalize-space(//relcl/@relWord)='yes' and normalize-space(//relcl/@relCompEitherRestricted)='restricted' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' and normalize-space(//relcl/@relCompPos)!='before' and normalize-space(//relcl/@relCompPos)!='after'">
								<xsl:text>Hay las restricciones en cuanto a las cuales de los marcadores relativos puede ocurrir en cada lado.</xsl:text>
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
						<xsl:when test="//relcl/@whAndComp='no'">solamente la palabra interrogativa ocurre sin ningún tipo de marcador relativo. </xsl:when>
						<xsl:when test="//relcl/@whAndComp='yes'">la palabra interrogativa y los marcadores relativos se requieren ambas estén presentes.</xsl:when>
						<xsl:when test="//relcl/@whAndComp='optional'">un marcador relativo puede ocurrir opcionalmente junto con la palabra interrogativa.</xsl:when>
					</xsl:choose>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:text> </xsl:text>
			</xsl:if>
<xsl:text> </xsl:text>
</p>
		<xsl:if test="normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text>Los ejemplos de cláusulas relativas en </xsl:text>
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
		<xsl:if test="normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text>Los ejemplos completos de la oración de las cláusulas relativas antedichas incluyen:</xsl:text>
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
		<xsl:if test="normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text> </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> </xsl:text>
<xsl:choose>
				<xsl:when test="//relcl/@headless='no'">requiere un sustantivo principal estar presente en todas las cláusulas relativas, así que no se permite ningunas cláusulas relativas sin cabeza.</xsl:when>
				<xsl:when test="//relcl/@headless='yes'">permite que un sustantivo principal falte en cláusulas relativas, así que se permiten las cláusulas relativas sin cabeza.</xsl:when>
			</xsl:choose>
<xsl:text> </xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//relcl/@headless)='yes' and normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text>Los ejemplos de las cláusulas relativas sin cabeza incluidas en oraciones completas incluyen:</xsl:text>
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
	</section1>
	<section1 id="sTexts">
		<secTitle>Los textos</secTitle>
		<p>
<object type="tComment">Incluya varios textos aquí para demostrar cómo  se forman las construcciones más grandes tales como párrafos, conversaciones, e historias narrativas. Incluya los ejemplos de varios tipos literarios.</object>
</p>
		<p>
<object type="tComment">  Un formato sugerido para presentar los textos es presente lo en la lengua vernácula en conjunto primero, así que los nativos pueden apreciarla. Entonces presente la forma interlineal, como en los ejemplos a través de la gramática. Finalmente, dé una traducción libre en conjunto, así que el altavoz extranjero puede apreciar más sobre la cultura.</object>
</p>
	</section1>























































































</xsl:template>
</xsl:stylesheet>
