<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="ques">
	<section1 id="sQues">
		<secTitle>Las preguntas</secTitle>
		<p>
<xsl:text>Hay dos tipos de preguntas: las que requieren una respuesta de "sí" o "no" y las que se contestan con información. Esta sección considera las preguntas de la cláusula principal y las variedades subordinadas de preguntas sí/no y de preguntas que se contestan con información, comenzando con las preguntas sí/no.</xsl:text>
</p>
		<section2 id="sQuesYN">
			<secTitle>Las preguntas sí/no</secTitle>
			<p>
<xsl:text>El español no tiene ningún marcador especial de la pregunta ni ningún cambio del orden de las palabras para las preguntas sí/no de la cláusula principal.
					Hay simplemente un cambio en la entonación. Otros idiomas utilizan marcadores y/o cambios especiales del orden de las palabras.
					En las preguntas sí/no de la cláusula principal inglesa, un verbo auxiliar mueve delante del tema. Otros idiomas utilizan un marcador en las preguntas sí/no o un complementizador especial en vez del auxiliar afrontado. Éste es el caso en preguntas sí/no en las cláusulas subordinadas en inglés; no se permite el ningún afrontar del auxiliar pero </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>whether</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'sea que'</xsl:text>
</gloss>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>if</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'si'</xsl:text>
</gloss>
<xsl:text> llena la posición del complementizador. Puesto que los idiomas pueden actuar diferentemente en preguntas sí/no en la cláusula principal contra en la cláusula subordinada, cada uno será cubierta por separado. </xsl:text>
</p>
			<section3 id="sQuesYNMain">
				<secTitle>Las preguntas sí/no de la cláusula principal</secTitle>
				<p>
<xsl:text>Mientras que el español tiene simplemente un cambio en la entonación para señalar una pregunta sí/no de la cláusula principal, otros idiomas utilizan marcadores y/o cambios especiales del orden de las palabras. Los ejemplos ingleses de las preguntas sí/no de la cláusula principal, demostrando afrontar requerido de un auxiliar, incluyen: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Are you going to the store?</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'¿Usted va al almacén?'</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Will Sue buy the present for her mother?</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'¿Compra Susana el regalo para su madre?'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Could the boy have hit the ball?</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'¿Habría podido el muchacho golpear el beísbol?'</xsl:text>
</gloss>
<xsl:text></xsl:text>
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
<xsl:text> preguntas sí/no de la cláusula principal, </xsl:text>
<xsl:choose>
						<xsl:when test="//q/@mainYN='no'"> no hay el marcador o el cambio del orden de las palabras, apenas la diferencia en la entonación o el tono o la otra marca que no es sintáctica.</xsl:when>
						<xsl:when test="//q/@mainYN='noAux'">el movimiento de un auxiliar</xsl:when>
						<xsl:when test="//q/@mainYN='yes'">hay por lo menos un marcador o complementizador de la pregunta.</xsl:when>
					</xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainYN)='noAux'">
						<xsl:text> al </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainYNAuxPos='before'">frente</xsl:when>
							<xsl:when test="//q/@mainYNAuxPos='after'">extremo</xsl:when>
							<xsl:when test="//q/@mainYNAuxPos='unknown'">_______</xsl:when>
						</xsl:choose>
						<xsl:text> de la pregunta se requiere.</xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainYN)='yes'">
						<xsl:text>El marcador o el complementizador de la pregunta es  </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainYNWord='yes'">escrito como una palabra separada.</xsl:when>
							<xsl:when test="//q/@mainYNWord='no'">un clítico que junta</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@mainYNWord)='no'">
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="//q/@mainYNCliticAttaches='edge'"> en el borde de la pregunta.</xsl:when>
								<xsl:when test="//q/@mainYNCliticAttaches='head'"> al verbo en la pregunta.</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="//q/@mainYNCliticPos='before'">Estos clíticos son procliticos.</xsl:when>
								<xsl:when test="//q/@mainYNCliticPos='after'">Estos clíticos son encliticos.</xsl:when>
								<xsl:when test="//q/@mainYNCliticPos='both'">Hay algunos clíticos del marcador o del complementizador de la pregunta que son procliticos y algunos que son encliticos.</xsl:when>
							   <xsl:when test="//q/@mainYNCliticPos='unknown'">_______</xsl:when>
						   </xsl:choose>
							<xsl:text> </xsl:text>
						</xsl:if>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainYNWord)='yes'">
						<xsl:text>El marcador o el complementizer de la pregunta ocurre  </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainYNPos='before'">antes</xsl:when>
							<xsl:when test="//q/@mainYNPos='after'">después</xsl:when>
							<xsl:when test="//q/@mainYNPos='either'">de cualquier lado (pero no ambos lados)</xsl:when>
							<xsl:when test="//q/@mainYNPos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
							<xsl:when test="//q/@mainYNPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
							<xsl:when test="//q/@mainYNPos='afterOrBoth'">después o en ambos lados</xsl:when>
							<xsl:when test="//q/@mainYNPos='both'">en ambos lados</xsl:when>
							<xsl:when test="//q/@mainYNPos='unknown'">_______</xsl:when>
						</xsl:choose>
						<xsl:text> del resto de la pregunta.  </xsl:text>
						<xsl:if test="normalize-space(//q/@mainYNEitherRestricted)='unrestricted' and normalize-space(//q/@mainYNPos)!='before' and normalize-space(//q/@mainYNPos)!='after'">
							<xsl:text>Todos los marcadores o complementizadores de la pregunta pueden ocurrir de cualquier lado de la pregunta.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@mainYNEitherRestricted)='restricted' and normalize-space(//q/@mainYNPos)!='before' and normalize-space(//q/@mainYNPos)!='after'">
							<xsl:text>Hay las restricciones en cuanto a las cuales de los marcadores o de los complementizadores de la pregunta puede ocurrir en cada lado de la pregunta.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
</p>
				<p>
<xsl:text> Los ejemplos de las preguntas sí/no de la cláusula principal  en </xsl:text>
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
				<example num="xQues.QuesYN.QuesYNMain.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//q/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//q/example)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQues.QuesYN.QuesYNMain.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQues.QuesYN.QuesYNMain.10.1</xsl:text>
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
			</section3>
			<section3 id="sQuesYNEmb">
				<secTitle>Las preguntas sí/no de la cláusula subordinada</secTitle>
				<p>
<xsl:text>Las preguntas sí/no de los ejemplos españoles en las cláusulas subordiadas, demostrando la presencia de los marcadores o de los complementizadores de la pregunta, incluyen: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Me pregunto si ella vendrá</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Yo sabré si ella va</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Susana se pregunta si el muchacho habría podido golpear el beísbol.</langData>
<xsl:text>.</xsl:text>
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
<xsl:text> preguntas sí/no de la cláusula subordinada, </xsl:text>
<xsl:choose>
						<xsl:when test="//q/@embYN='no'"> no hay el marcador o el cambio del orden de las palabras, apenas la diferencia en la entonación o el tono o la otra marca que no es sintáctica.</xsl:when>
						<xsl:when test="//q/@embYN='noAux'">el movimiento de un auxiliar</xsl:when>
						<xsl:when test="//q/@embYN='yes'">hay por lo menos un marcador o complementizador de la pregunta.</xsl:when>
					</xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embYN)='noAux'">
						<xsl:text> al </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embYNAuxPos='before'">frente</xsl:when>
							<xsl:when test="//q/@embYNAuxPos='after'">extremo</xsl:when>
							<xsl:when test="//q/@embYNAuxPos='unknown'">_______</xsl:when>
					   </xsl:choose>
						<xsl:text> de la pregunta subordinada se requiere.</xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embYN)='yes'">
						<xsl:text>El marcador o el complementizador de la pregunta es </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embYNWord='yes'">escrito como una palabra separada.</xsl:when>
							<xsl:when test="//q/@embYNWord='no'">un clítico que junta</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@embYNWord)='no'">
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="//q/@embYNCliticAttaches='edge'"> en el borde de la pregunta subordinada.</xsl:when>
								<xsl:when test="//q/@embYNCliticAttaches='head'"> al verbo en la pregunta subordinada.</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="//q/@embYNCliticPos='before'">Estos clíticos son procliticos.</xsl:when>
								<xsl:when test="//q/@embYNCliticPos='after'">Estos clíticos son encliticos.</xsl:when>
								<xsl:when test="//q/@embYNCliticPos='both'">Hay algunos clíticos del marcador o del complementizador de la pregunta que son procliticos y algunos que son encliticos.</xsl:when>
								<xsl:when test="//q/@embYNCliticPos='unknown'">_______</xsl:when>
						   </xsl:choose>
							<xsl:text> </xsl:text>
						</xsl:if>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embYNWord)='yes' and normalize-space(//q/@embYN)='yes'">
						<xsl:text>El marcador o el complementizador de la pregunta ocurre </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embYNPos='before'">antes</xsl:when>
							<xsl:when test="//q/@embYNPos='after'">después</xsl:when>
							<xsl:when test="//q/@embYNPos='either'">de cualquier lado (pero no ambos lados)</xsl:when>
							<xsl:when test="//q/@embYNPos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
							<xsl:when test="//q/@embYNPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
							<xsl:when test="//q/@embYNPos='afterOrBoth'">después o en ambos lados</xsl:when>
							<xsl:when test="//q/@embYNPos='both'">en ambos lados</xsl:when>
							<xsl:when test="//q/@embYNPos='unknown'">_______</xsl:when>
					   </xsl:choose>
						<xsl:text> del resto de la pregunta subordinada.  </xsl:text>
						<xsl:if test="normalize-space(//q/@embYNEitherRestricted)='unrestricted' and normalize-space(//q/@embYNPos)!='before' and normalize-space(//q/@embYNPos)!='after' and normalize-space(//q/@embYN)='yes'">
							<xsl:text>Todos los marcadores o complementizadores de la pregunta pueden ocurrir de cualquier lado de la pregunta subordinjada.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@embYNEitherRestricted)='restricted' and normalize-space(//q/@embYNPos)!='before' and normalize-space(//q/@embYNPos)!='after' and normalize-space(//q/@embYN)='yes'">
							<xsl:text>Hay las restricciones en cuanto a las cuales de los marcadores o de los complementizadores de la pregunta puede ocurrir en cada lado de la pregunta subordinada.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
</p>
				<p>
<xsl:text> Los ejemplos de las preguntas sí/no de la cláusula subordinada  en </xsl:text>
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
				<example num="xQues.QuesYN.QuesYNEmb.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/embYNExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//q/embYNExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/embYNExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//q/embYNExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQues.QuesYN.QuesYNEmb.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQues.QuesYN.QuesYNEmb.10.1</xsl:text>
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
			</section3>
		</section2>
		<section2 id="sQuesContent">
			<secTitle>Las preguntas que se contestan con información</secTitle>
			<p>
<xsl:text>Las preguntas que se contestan con información diferencian de preguntas sí/no en que contienen una palabra o una frase interrogativa.  Las palabras o las frases o los afijos interrogativos correspondientes en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se demuestran en la tabla siguiente.</xsl:text>
</p>
			<example num="xQues.QuesContent.6">
<table border="1">
					<caption>
						<xsl:text>Interrogativos usados en preguntas de información </xsl:text>
					</caption>
					<tr>
						<th>
							<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
						</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//q/who),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
							<xsl:text>quién</xsl:text>
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
							<xsl:text>quién</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//q/what),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>qué</xsl:text>
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
							<xsl:text>qué</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//q/why),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>por qué</xsl:text>
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
							<xsl:text>por qué</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//q/where),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3" select="string-length($sExampleValue3)" />
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
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>dónde</xsl:text>
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
							<xsl:text>dónde</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue4">
<xsl:value-of select="translate(string(//q/when),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4" select="string-length($sExampleValue4)" />
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
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>cuándo</xsl:text>
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
							<xsl:text>cuándo</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue5">
<xsl:value-of select="translate(string(//q/how),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5" select="string-length($sExampleValue5)" />
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
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>cómo</xsl:text>
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
							<xsl:text>cómo</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue6">
<xsl:value-of select="translate(string(//q/which),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6" select="string-length($sExampleValue6)" />
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
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>cuál</xsl:text>
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
							<xsl:text>cuál</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue7">
<xsl:value-of select="translate(string(//q/whose),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7" select="string-length($sExampleValue7)" />
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
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>cuyo</xsl:text>
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
							<xsl:text>cuyo</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue8">
<xsl:value-of select="translate(string(//q/other),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8" select="string-length($sExampleValue8)" />
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
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>otros interrogativos</xsl:text>
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
							<xsl:text>otros interrogativos</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
			<p>
<xsl:text>De los ejemplos de palabras interrogativas arriba, coloqúese lo más simplemente como pronombres o adverbios, pero </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cómo</langData>
<xsl:text> uede estar un adverbio de la manera por sí mismo o una palabra del grado que modifica un adjetivo, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cómo grande</langData>
<xsl:text> o una palabra del grado que modifica un cuantificador, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>how many children</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'cuántos niños'</xsl:text>
</gloss>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>qué</langData>
<xsl:text> puede ser un pronombre por sí mismo o un demostrativo modificando un sustantivo, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>what books</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'qué libros'</xsl:text>
</gloss>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cuál</langData>
<xsl:text> nunca se coloca solamente pero modifica siempre un sustantivo como demostrativo, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cuál muchacho</langData>
<xsl:text>; y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cuyo</langData>
<xsl:text> puede ser un pronombre posesivo solo del soporte, o puede llenar la posición del poseedor en una frase nominal, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cuyo jugetes</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'jugetes de quién'</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>Estas mismas posibilidades se asumen para ser verdades en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> también..  </xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='both' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demOrArtPos)='either' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demOrArtPos)='both' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demAndArtPos)='either' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demAndArtPos)='both' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demPos)='either' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demPos)='both' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demOrArtPos)='either' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demOrArtPos)='both' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demAndArtPos)='either' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demAndArtPos)='both'">
					<xsl:text>Los demonstrativos se permiten de cualquier lado del sustantivo en </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text>.  Las palabras que significan </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'cuál'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'qué'</xsl:text>
</gloss>
<xsl:text> ocurren </xsl:text>
					<xsl:choose>
						<xsl:when test="//q/@whDemPos='before'">solamente antes del sustantivo, incluso si otro demostrativo ocurre después del sustantivo.</xsl:when>
						<xsl:when test="//q/@whDemPos='after'">solamente después del sustantivo, incluso si otro demostrativo ocurre antes del sustantivo.</xsl:when>
						<xsl:when test="//q/@whDemPos='agree'">de cualquier lado el sustantivo, pero cuando hay un demostrativo en cada lado al mismo tiempo, de ellos debe convenir en características (por ejemplo, ambos sean palabras interrogativas o ambos no ser).</xsl:when>
					<xsl:when test="//q/@whDemPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text> </xsl:text>
				</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='both'">
					<xsl:text>Los artículos se permiten de cualquier lado del sustantivo en </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text>.  Las palabras que significan </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'cuál'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'qué'</xsl:text>
</gloss>
<xsl:text> ocurren </xsl:text>
					<xsl:choose>
						<xsl:when test="//q/@whArtPos='before'">solamente antes del sustantivo, incluso si otro artículo ocurre después del sustantivo.</xsl:when>
						<xsl:when test="//q/@whArtPos='after'">solamente después del sustantivo, incluso si otro artículo ocurre antes del sustantivo.</xsl:when>
						<xsl:when test="//q/@whArtPos='agree'">de cualquier lado el sustantivo, pero cuando hay un artículo en cada lado al mismo tiempo, de ellos debe convenir en características (por ejemplo, ambos sean palabras interrogativas o ambos no ser).</xsl:when>
						<xsl:when test="//q/@whArtPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text> </xsl:text>
				</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yesDegree' and normalize-space(//adjp/@degreePos)!='before' and normalize-space(//adjp/@degreePos)!='after' or normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerPos)!='before' and normalize-space(//adjp/@mannerPos)!='after'">
					<xsl:text>Las palabras del grado se permiten de cualquier lado del adjetivo en </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text>.  La palabra que significa </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'cómo'</xsl:text>
</gloss>
<xsl:text> occure </xsl:text>
					<xsl:choose>
						<xsl:when test="//q/@whDegAdjPos='before'">solamente antes del adjetivo, incluso si otra palabra del grado ocurre después del adjetivo.</xsl:when>
						<xsl:when test="//q/@whDegAdjPos='after'">solamente después del adjetivo, incluso si otra palabra del grado ocurre antes del adjetivo.</xsl:when>
						<xsl:when test="//q/@whDegAdjPos='agree'">de cualquier lado el adjetivo, pero cuando hay una palabra del grado en cada lado al mismo tiempo, de ellos debe convenir en características (por ejemplo, ambos sean palabras interrogativas o ambas no ser).</xsl:when>
					<xsl:when test="//q/@whDegAdjPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text> </xsl:text>
				</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//qp/@degree)='yes' and normalize-space(//qp/@degreePos)!='before' and normalize-space(//qp/@degreePos)!='after'">
					<xsl:text>Las palabras del grado se permiten de cualquier lado del cuantificador en </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text>.  La palabra que significa </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'cómo'</xsl:text>
</gloss>
<xsl:text> occure </xsl:text>
					<xsl:choose>
						<xsl:when test="//q/@whDegQPos='before'">solamente antes del cuantificador, incluso si otra palabra del grado ocurre después del cuantificador.</xsl:when>
						<xsl:when test="//q/@whDegQPos='after'">solamente después del cuantificador, incluso si otra palabra del grado ocurre antes del cuantificador.</xsl:when>
						<xsl:when test="//q/@whDegQPos='agree'">de cualquier lado el cuantificador, pero cuando hay una palabra del grado en cada lado al mismo tiempo, de ellos debe convenir en características (por ejemplo, ambos sean palabras interrogativas o ambas no ser).</xsl:when>
					 <xsl:when test="//q/@whDegQPos='unknown'">_______</xsl:when>
				   </xsl:choose>
					<xsl:text> </xsl:text>
				</xsl:if>
<xsl:text> </xsl:text>
</p>
			<p>
<xsl:text>Dependiendo del orden de las palabras básico del idioma, las preguntas que se contestan con información pueden ser formadas con o sin afrontar una frase interrogativa.
					Los idiomas cabeza-finales (SOV, OVS, y OSV) no tienen generalmente movimiento de una frase interrogativa en preguntas, mientras que los idiomas cabeza-iniciales (SVO, VOS, y VSO) requieren generalmente afrontar de una frase interrogativa.
					En idiomas sin afrontar para los interrogativos, la estructura de frase de una pregunta contenta será igual que una pregunta sí/no con un marcador de la pregunta o auxiliar en la posición del complementizer o apenas igual que una oración normal.
					En cualquier caso, la frase interrogativa aparece en su posición normal.  Muchos idiomas del orden SOV permiten opcionalmente el movimiento de una frase interrogativa a la posición inmediatamente antes del verbo.
</xsl:text>
</p>
			<p>
<xsl:text>En las preguntas que se contestan con información de ambos las cláusula principal y la subordinada en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, una frase interrogativa </xsl:text>
<xsl:choose>
					<xsl:when test="//q/@contFront='no'">no afronta; permanece simplemente en su posición normal.</xsl:when>
					<xsl:when test="//q/@contFront='after'">puede permanecer en su posición normal o puede moverse a la posición inmediatamente antes del verbo.</xsl:when>
					<xsl:when test="//q/@contFront='before'">mueve al frente de la cláusula.</xsl:when>
					<xsl:when test="//q/@contFront='unknown'">_______.</xsl:when>
				</xsl:choose>
<xsl:text> </xsl:text>
</p>
			<section3 id="sQuesContentMain">
				<secTitle>Las preguntas que se contestan con información de la cláusula principal</secTitle>
				<p>
<xsl:text>Los ejemplos españoles de las preguntas de la cláusula principal, demostrando afrontar requerido de una frase interrogativa, incluyen: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¿Qué muchacho golpeó el beísbol?</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¿Quién pudo haber golpeado el beísbol?</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¿Qué el muchacho golpeó?</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¿Cuándo viene ella?</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¿Dónde está el líder?</langData>
<xsl:text> </xsl:text>
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
<xsl:text> las preguntas que se contestan con información de la cláusula principal, </xsl:text>
<xsl:choose>
						<xsl:when test="//q/@mainCont='no'">no hay marcador o auxiliar que afronta,</xsl:when>
						<xsl:when test="//q/@mainCont='noAux'">movimiento de un auxiliar</xsl:when>
						<xsl:when test="//q/@mainCont='yes'">hay por lo menos un marcador o complementizador de la pregunta.</xsl:when>
					</xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainCont)='no'">
						<xsl:text> apenas </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@contFront='no'">una diferencia de</xsl:when>
							<xsl:when test="//q/@contFront='after'">movimiento opcional de una frase interrogativa y posiblemente una diferencia de</xsl:when>
							<xsl:when test="//q/@contFront='before'">el afrontar de la diferencia de una frase interrogativa y posiblemente una diferencia de</xsl:when>
							<xsl:when test="//q/@contFront='unknown'">_______ de una frase interrogativa y posiblemente una diferencia de</xsl:when>
						</xsl:choose>
						<xsl:text> la entonación o el tono o la otra marca que no es sintáctica.</xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainCont)='noAux'">
						<xsl:text> al </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainContAuxPos='before'">frente</xsl:when>
							<xsl:when test="//q/@mainContAuxPos='after'">extremo</xsl:when>
							<xsl:when test="//q/@mainContAuxPos='unknown'">_______</xsl:when>
						</xsl:choose>
						<xsl:text> de la pregunta es </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainContAuxRequired='no'">permitido pero no requerido</xsl:when>
							<xsl:when test="//q/@mainContAuxRequired='yes'">requerido</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="//q/@contFront='no'">.</xsl:when>
							<xsl:when test="//q/@contFront='after'">.</xsl:when>
							<xsl:when test="//q/@contFront='before'"> además de afrontar de una frase interrogativa.</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainCont)='yes'">
						<xsl:text>El marcador o el complementizador de la pregunta es  </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainContWord='yes'">escrito como una palabra separada.</xsl:when>
							<xsl:when test="//q/@mainContWord='no'">un clítico que junta</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/@mainCont)='yes'">
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="//q/@mainContCliticAttaches='edge'"> en el borde de la pregunta.</xsl:when>
								<xsl:when test="//q/@mainContCliticAttaches='head'"> al verbo en la pregunta.</xsl:when>
								<xsl:when test="//q/@mainContCliticAttaches='between'"> entre la frase interrogativa afrontada y el resto de la pregunta.</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="//q/@mainContCliticPos='before'">Estos clíticos son procliticos.</xsl:when>
								<xsl:when test="//q/@mainContCliticPos='after'">Estos clíticos son encliticos.</xsl:when>
								<xsl:when test="//q/@mainContCliticPos='both'">Hay algunos clíticos del marcador o del complementizador de la pregunta que son procliticos y algunos que son encliticos.</xsl:when>
							   <xsl:when test="//q/@mainContCliticPos='unknown'">_______</xsl:when>
							</xsl:choose>
							<xsl:text> </xsl:text>
						</xsl:if>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' and normalize-space(//typology/@wordOrder)!='VSO'">
						<xsl:text>El marcador o el complementizador de la pregunta ocurre </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainContPos='before'">antes</xsl:when>
							<xsl:when test="//q/@mainContPos='after'">después</xsl:when>
							<xsl:when test="//q/@mainContPos='either'">de cualquier lado (pero no ambos lados)</xsl:when>
							<xsl:when test="//q/@mainContPos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
							<xsl:when test="//q/@mainContPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
							<xsl:when test="//q/@mainContPos='afterOrBoth'">después o en ambos lados</xsl:when>
							<xsl:when test="//q/@mainContPos='both'">en ambos lados</xsl:when>
							<xsl:when test="//q/@mainContPos='unknown'">_______</xsl:when>
					   </xsl:choose>
						<xsl:text> del resto de la pregunta.  </xsl:text>
						<xsl:if test="normalize-space(//q/@mainContPos)!='before' and normalize-space(//q/@mainContPos)!='after' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' and normalize-space(//q/@mainContEitherRestrcited)='unrestricted'">
							<xsl:text>Todos los marcadores o complementizadores de la pregunta pueden ocurrir de cualquier lado de la pregunta.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@mainContPos)!='before' and normalize-space(//q/@mainContPos)!='after' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' and normalize-space(//q/@mainContEitherRestrcited)='restricted'">
							<xsl:text>Hay las restricciones en cuanto a las cuales de los marcadores o de los complementizadores de la pregunta puede ocurrir en cada lado de la pregunta.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' and normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text>El marcador o el complementizador de la pregunta ocurre </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainContVSOBeforeWh='no'">inmediatamente después de una frase interrogativa afrontada.</xsl:when>
							<xsl:when test="//q/@mainContVSOBeforeWh='noEnd'">inmediatamente después de una frase interrogativa afrontada o al final de la pregunta.</xsl:when>
							<xsl:when test="//q/@mainContVSOBeforeWh='yes'">antes de una frase interrogativa afrontada.</xsl:when>
							<xsl:when test="//q/@mainContVSOBeforeWh='some'">cualquiera antes o después de una frase interrogativa afrontada.</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@mainContVSOBeforeWh)='noEnd' and normalize-space(//q/@mainContVSONoEndRestricted)='unrestricted' and normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes'">
							<xsl:text>Todos los marcadores o complementizadores de la pregunta pueden ocurrir en cada posición.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@mainContVSOBeforeWh)='noEnd' and normalize-space(//q/@mainContVSONoEndRestricted)='restricted' and normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@mainContVSOBeforeWh)='some' and normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes'">
							<xsl:text>Hay las restricciones en cuanto a las cuales de los marcadores o de los complementizadores de la pregunta puede ocurrir en cada posición.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes'">
						<xsl:text>Un marcador o un complementizador de la pregunta </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainContRequired='yes'">es requerido</xsl:when>
							<xsl:when test="//q/@mainContRequired='yes'">no es requerido</xsl:when>
						</xsl:choose>
						<xsl:text> en cada pregunta de información.</xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
</p>
				<p>
<xsl:text> Los ejemplos del </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de las preguntas que se contestan con información de la cláusula principal incluyen: </xsl:text>
</p>
				<example num="xQues.QuesContent.QuesContentMain.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/contentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//q/contentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/contentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//q/contentExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQues.QuesContent.QuesContentMain.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQues.QuesContent.QuesContentMain.10.1</xsl:text>
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
			</section3>
			<section3 id="sQuesContentEmb">
				<secTitle>Las preguntas que se contestan con información de la cláusula subordinada</secTitle>
				<p>
<xsl:text>Los ejemplos españoles de las preguntas subordinadas, demostrando afrontar requerido de una frase interrogativa, incluyen: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sé quién golpeó el beísbol</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Me pregunto cuándo ella vendrá</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Preguntaré qué quiere el muchacho</langData>
<xsl:text>.</xsl:text>
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
<xsl:text> las preguntas que se contestan con información de la cláusula subordinada, </xsl:text>
<xsl:choose>
						<xsl:when test="//q/@embCont='no'">no hay marcador o auxiliar que afronta,</xsl:when>
						<xsl:when test="//q/@embCont='noAux'">movimiento de un auxiliar</xsl:when>
						<xsl:when test="//q/@embCont='yes'">hay por lo menos un marcador o complementizador de la pregunta.</xsl:when>
					</xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embCont)='no'">
						<xsl:text> apenas </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@contFront='no'">una diferencia en</xsl:when>
							<xsl:when test="//q/@contFront='after'">movimiento opcional de una frase interrogativa y posiblemente una diferencia en</xsl:when>
							<xsl:when test="//q/@contFront='before'">el afrontar de la diferencia de una frase interrogativa y posiblemente una diferencia en</xsl:when>
							<xsl:when test="//q/@contFront='unknown'">_______ de una frase interrogativa y posiblemente una diferencia en</xsl:when>
						</xsl:choose>
						<xsl:text> la entonación o el tono o la otra marca que no es sintáctica.</xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embCont)='noAux'">
						<xsl:text> al </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embContAuxPos='before'">frente</xsl:when>
							<xsl:when test="//q/@embContAuxPos='after'">extremo</xsl:when>
							<xsl:when test="//q/@embContAuxPos='unknown'">_______</xsl:when>
					   </xsl:choose>
						<xsl:text> de la pregunta es </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embContAuxRequired='no'">permitido pero no requerido</xsl:when>
							<xsl:when test="//q/@embContAuxRequired='yes'">requerido</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="//q/@contFront='no'">.</xsl:when>
							<xsl:when test="//q/@contFront='after'">.</xsl:when>
							<xsl:when test="//q/@contFront='before'"> además de afrontar de una frase interrogativa.</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embCont)='yes'">
						<xsl:text>El marcador o el complementizer de la pregunta es </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embContWord='yes'">escrito como una palabra separada.</xsl:when>
							<xsl:when test="//q/@embContWord='no'">un clítico que junta</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@embContWord)='no' and normalize-space(//q/@embCont)='yes'">
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="//q/@embContCliticAttaches='edge'"> en el borde de la pregunta subordinada.</xsl:when>
								<xsl:when test="//q/@embContCliticAttaches='head'"> al verbo en la pregunta subordinada.</xsl:when>
								<xsl:when test="//q/@embContCliticAttaches='between'"> entre la frase interrogativa afrontada y el resto de la pregunta subordinada.</xsl:when>
							</xsl:choose>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embContCliticPos='before'">Estos clíticos son procliticos.</xsl:when>
							<xsl:when test="//q/@embContCliticPos='after'">Estos clíticos son encliticos.</xsl:when>
							<xsl:when test="//q/@embContCliticPos='both'">Hay algunos clíticos del marcador o del complementizador de la pregunta que son procliticos y algunos que son encliticos. </xsl:when>
						   <xsl:when test="//q/@embContCliticPos='unknown'">_______</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes' and normalize-space(//typology/@wordOrder)!='VSO'">
						<xsl:text>El marcador o el complementizador de la pregunta ocurre </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embContPos='before'">antes</xsl:when>
							<xsl:when test="//q/@embContPos='after'">después</xsl:when>
							<xsl:when test="//q/@embContPos='either'">de cualquier lado (pero no ambos lados)</xsl:when>
							<xsl:when test="//q/@embContPos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
							<xsl:when test="//q/@embContPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
							<xsl:when test="//q/@embContPos='afterOrBoth'">después o en ambos lados</xsl:when>
							<xsl:when test="//q/@embContPos='both'">en ambos lados</xsl:when>
							<xsl:when test="//q/@embContPos='unknown'">_______</xsl:when>
						</xsl:choose>
						<xsl:text> del resto de la pregunta subordinada.  </xsl:text>
						<xsl:if test="normalize-space(//q/@embContPos)!='before' and normalize-space(//q/@embContPos)!='after' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes' and normalize-space(//q/@embContEitherRestrcited)='unrestricted'">
							<xsl:text>Todos los marcadores o complementizadores de la pregunta pueden ocurrir de cualquier lado de la pregunta subordinada.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@embContPos)!='before' and normalize-space(//q/@embContPos)!='after' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes' and normalize-space(//q/@embContEitherRestrcited)='restricted'">
							<xsl:text>Hay las restricciones en cuanto a las cuales de los marcadores o de los complementizadores de la pregunta puede ocurrir en cada lado de la pregunta subordinada.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes' and normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text>El marcador o el complementizador de la pregunta ocurre </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embContVSOBeforeWh='no'">inmediatamente después de una frase interrogativa afrontada.</xsl:when>
							<xsl:when test="//q/@embContVSOBeforeWh='noEnd'">inmediatamente después de una frase interrogativa afrontada o en el final de la pregunta subordinada.</xsl:when>
							<xsl:when test="//q/@embContVSOBeforeWh='yes'">antes de una frase interrogativa afrontada.</xsl:when>
							<xsl:when test="//q/@embContVSOBeforeWh='some'">cualquiera antes o después de una frase interrogativa afrontada.</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@embContVSOBeforeWh)='noEnd' and normalize-space(//q/@embContVSONoEndRestricted)='unrestricted' and normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes'">
							<xsl:text>Todos los marcadores o complementizadores de la pregunta pueden ocurrir en cada posición.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@embContVSOBeforeWh)='noEnd' and normalize-space(//q/@embContVSONoEndRestricted)='restricted' and normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@embContVSOBeforeWh)='some' and normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes'">
							<xsl:text>Hay las restricciones en cuanto a las cuales de los marcadores o de los complementizadores de la pregunta puede ocurrir en cada posición.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes'">
						<xsl:text>Un marcador o un complementizador de la pregunta </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainContRequired='yes'">es requerido</xsl:when>
							<xsl:when test="//q/@mainContRequired='yes'">no es requerido</xsl:when>
						</xsl:choose>
						<xsl:text> en cada pregunta de información subordinada.</xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
</p>
				<p>
<xsl:text> Los ejemplos del </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de las preguntas que se contestan con información de la cláusula subordinada incluyen: </xsl:text>
</p>
				<example num="xQues.QuesContent.QuesContentEmb.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/embContentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//q/embContentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/embContentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//q/embContentExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQues.QuesContent.QuesContentEmb.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQues.QuesContent.QuesContentEmb.10.1</xsl:text>
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
			</section3>
		</section2>
	</section1>


























































































































































































































































































































</xsl:template>
</xsl:stylesheet>
