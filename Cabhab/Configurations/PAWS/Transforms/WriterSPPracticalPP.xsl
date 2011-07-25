<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="pp">
	<section1 id="sPP">
		<secTitle>
			<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">Las frases preposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='after'">Las frases posposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='both'">Las frases preposicionales y posposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">Las frases preposicionales y/o posposicionales</xsl:when>
			</xsl:choose>
			</secTitle>
		<p>
<xsl:text>Esta sección cubre la estructura interna de las frases preposicionales o posposicionales. Las preposiciones vienen antes de sus complementos, mientras que vienen las posposiciones luego. El español tiene preposiciones, según los ejemplos </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>para José</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>al lado del río</langData>
<xsl:text>.  Las preposiciones o las posposiciones pueden ser palabras separadas, o pueden ser clíticos que se juntan al borde del complemento o a su cabeza.</xsl:text>
</p>
		<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">solamente preposiciones.  </xsl:when>
				<xsl:when test="//pp/@pPos='after'">solamente posposiciones.  </xsl:when>
				<xsl:when test="//pp/@pPos='both'">preposiciones y posposiciones.  </xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">solamente _____-posiciones.  </xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pType='word'">Son todos palabras sintácticas separadas.</xsl:when>
				<xsl:when test="//pp/@pType='clitic'">Son todos cliticos escrito juntados a otra palabra.</xsl:when>
				<xsl:when test="//pp/@pType='both'">Escriben algunos como palabras sintácticas separadas, pero algunos son cliticos escrito juntados a otra palabra.  </xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pType)!='word'">
				<xsl:text>Los cliticos juntan </xsl:text>
				<xsl:choose>
					<xsl:when test="//pp/@attaches='egde'">en el borde</xsl:when>
					<xsl:when test="//pp/@attaches='head'">a la cabeza</xsl:when>
				</xsl:choose>
				<xsl:text> de la frase del complemento.</xsl:text>
			</xsl:if>
<xsl:text>  Véase los ejemplos en la sección</xsl:text>
<sectionRef sec="sPPComps" />
<xsl:text>.</xsl:text>
</p>

				<p>
<xsl:text>Los modificantes posibles de la frase se consideran primero, después los complementos permitidos. </xsl:text>
</p>
		<section2 id="sPPModifiers">
			<secTitle>Los modificantes</secTitle>
			<p>
<xsl:text>Hay normalmente algunas palabras del grado que pueden modificar una frase </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
				</xsl:choose>
<xsl:text> entera, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>apenas</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>right</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'hasta'</xsl:text>
</gloss>
<xsl:text> en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>apenas alrededor de la esquina</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>right to the last second</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'hasta el último momento'</xsl:text>
</gloss>
<xsl:text>. Los números ordinales y los adjetivos pueden también modificar las frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicionales o posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicionales o posposicionales</xsl:when>
				</xsl:choose>
<xsl:text>, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>próximo en línea</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>first out the door</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'primero hacia fuera la puerta'</xsl:text>
</gloss>
<xsl:text>.  Además, ciertos adverbios de la manera pueden modificar las frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicionales o posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicionales o posposicionales</xsl:when>
				</xsl:choose>
<xsl:text>, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>casi en el agujero</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>sobre todo encima del árbol</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en ángulo recto en la tabla</langData>
<xsl:text>, y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>casi sobre el enemigo</langData>
<xsl:text>.</xsl:text>
</p>
			<xsl:if test="normalize-space(//pp/@modifiers)='yes'">
<p>
<xsl:text>Los ejemplos similares según lo expresado en </xsl:text>
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
			<xsl:if test="normalize-space(//pp/@modifiers)='yes'">
<example num="xPP.PPModifiers.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPModifiers.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPModifiers.8.1</xsl:text>
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
<xsl:text></xsl:text>
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
					<xsl:when test="//pp/@modifiers='no'"> no tiene ningunos modificantes que ocurren cualquiera antes o después de la frase sintácticamente.</xsl:when>
					<xsl:when test="//pp/@modifiers='yes'"> permite </xsl:when>
				</xsl:choose>
<xsl:if test="normalize-space(//pp/@modifiers)='no'">
<xsl:text>  Ni palabras del grado ni los números ordinales ni los adverbials pueden modificar las frases </xsl:text>
					<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposicionales o posposicionales</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposicionales o posposicionales</xsl:when>
					</xsl:choose>
					<xsl:text> como palabras separadas.</xsl:text> </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@modifiers)='yes'">
					<xsl:text></xsl:text>
					<xsl:choose>
						<xsl:when test="//pp/@modifierType='degree'">solamente las palabras del grado</xsl:when>
						<xsl:when test="//pp/@modifierType='ordinal'">solamente los números ordinales</xsl:when>
						<xsl:when test="//pp/@modifierType='manner'">solamente los adverbios de la  manera</xsl:when>
						<xsl:when test="//pp/@modifierType='degreeAndOrdinal'">las palabras del grado y los números ordinales, pero no los adverbios de la manera</xsl:when>
						<xsl:when test="//pp/@modifierType='degreeAnd Manner'">las palabras del grado y los adverbios de la manera, pero no los números ordinales</xsl:when>
						<xsl:when test="//pp/@modifierType='mannerAndOrdinal'">los adverbios de la manera y los números ordinales, pero no las palabras del grado</xsl:when>
						<xsl:when test="//pp/@modifierType='all'">los tres tipos, las palabras del grado, los adverbios de la manera y los números ordinales,</xsl:when>
					</xsl:choose>
					<xsl:text> como modificantes de las frases </xsl:text>
					<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposicionales o posposicionales</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposicionales o posposicionales</xsl:when>
					</xsl:choose>
					<xsl:text>.  </xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='degree' or normalize-space(//pp/@modifierType)='degreeAndManner' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' or normalize-space(//pp/@modifierType)='all'">
						<xsl:text>Las palabras del grado ocurren </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@degreePos='before'">antes</xsl:when>
							<xsl:when test="//pp/@degreePos='after'">después</xsl:when>
							<xsl:when test="//pp/@degreePos='either'">de cualquier lado (pero no ambos lados)</xsl:when>
							<xsl:when test="//pp/@degreePos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
							<xsl:when test="//pp/@degreePos='beforeOrBoth'">antes o en ambos lados</xsl:when>
							<xsl:when test="//pp/@degreePos='afterOrBoth'">después o en ambos lados</xsl:when>
							<xsl:when test="//pp/@degreePos='both'">en ambos lados</xsl:when>
							<xsl:when test="//pp/@degreePos='unknown'">_______</xsl:when>
					   </xsl:choose>
						<xsl:text> del resto de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='degree' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted'">
						<xsl:text>Todas las palabras del grado pueden ocurrir de cualquier lado de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='degree' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted'">
						<xsl:text>Hay las restricciones en cuanto a las cuales de grado las palabras pueden ocurrir en cada lado de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='ordinal' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' or normalize-space(//pp/@modifierType)='all'">
						<xsl:text>Los números ordinales ocurren </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@ordinalPos='before'">antes</xsl:when>
							<xsl:when test="//pp/@ordinalPos='after'">después</xsl:when>
							<xsl:when test="//pp/@ordinalPos='either'">de cualquier lado (pero no ambos lados)</xsl:when>
							<xsl:when test="//pp/@ordinalPos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
							<xsl:when test="//pp/@ordinalPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
							<xsl:when test="//pp/@ordinalPos='afterOrBoth'">después o en ambos lados</xsl:when>
							<xsl:when test="//pp/@ordinalPos='both'">en ambos lados</xsl:when>
							<xsl:when test="//pp/@ordinalPos='unknown'">_______</xsl:when>
						</xsl:choose>
						<xsl:text> del resto de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='ordinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted'">
						<xsl:text>Todos los números ordinales pueden ocurrir de cualquier lado de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='ordinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted'">
						<xsl:text>Hay las restricciones en cuanto a las cuales de los números ordinales puede ocurrir en cada lado de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='manner' or normalize-space(//pp/@modifierType)='degreeAndManner' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' or normalize-space(//pp/@modifierType)='all'">
						<xsl:text>Los adverbios de la manera ocurren </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@mannerPos='before'">antes</xsl:when>
							<xsl:when test="//pp/@mannerPos='after'">después</xsl:when>
							<xsl:when test="//pp/@mannerPos='either'">de cualquier lado (pero no ambos lados)</xsl:when>
							<xsl:when test="//pp/@mannerPos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
							<xsl:when test="//pp/@mannerPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
							<xsl:when test="//pp/@mannerPos='afterOrBoth'">después o en ambos lados</xsl:when>
							<xsl:when test="//pp/@mannerPos='both'">en ambos lados</xsl:when>
							<xsl:when test="//pp/@mannerPos='unknown'">_______</xsl:when>
					   </xsl:choose>
						<xsl:text> del resto de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='manner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted'">
						<xsl:text>Todos los adverbios de la manera pueden ocurrir de cualquier lado de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='manner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted'">
						<xsl:text>Hay las restricciones en cuanto a las cuales de manera los adverbios pueden ocurrir en cada lado de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.</xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
		</section2>
		 <section2 id="sPPComps">
			 <secTitle>
<xsl:choose>
				 <xsl:when test="//pp/@pPos='before'">Los complementos a las preposiciones</xsl:when>
				 <xsl:when test="//pp/@pPos='after'">Los complementos a las posposiciones</xsl:when>
				 <xsl:when test="//pp/@pPos='both'">Los complementos a las preposiciones y posposiciones</xsl:when>
				 <xsl:when test="//pp/@pPos='unknown'">Los complementos a las preposiciones y/o posposiciones</xsl:when>
			 </xsl:choose>
</secTitle>
			<p>
<xsl:text>Las </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposiciones</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposiciones</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposiciones o posposiciones</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposiciones o posposiciones</xsl:when>
				</xsl:choose>
<xsl:text> lleven normalmente una frase nominal para su complemento, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>a [la casa de Guillermo]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>debajo [el árbol gigante del sicómoro]</langData>
<xsl:text>. </xsl:text>
</p>
			<p>
<xsl:text> Los ejemplos de </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con los complementos nominales incluyen: </xsl:text>
</p>
			<example num="xPP.PPComps.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/ppExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/ppExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/ppExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/ppExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPComps.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPComps.8.1</xsl:text>
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
			<section3 id="sPPAlone">
				<secTitle>Sin complemento</secTitle>
				<p>
<xsl:text>Algunas  </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposiciones o posposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposiciones o posposiciones</xsl:when>
					</xsl:choose>
<xsl:text>  pueden colocarse solamente sin un complemento, por ejemplo en las oraciones </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Vienen [adentro]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John turned the light [on/off]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'Juan dio vuelta a la luz [conectada/desconectada]'</xsl:text>
</gloss>
<xsl:text>.  También, algunos idiomas permiten </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposiciones o posposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposiciones o posposiciones</xsl:when>
					</xsl:choose>
<xsl:text> ser trenzadas en preguntas, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¿Quién usted dio el libro [al _ ]?</langData>
<xsl:text></xsl:text>
</p>
				<p>
<xsl:text></xsl:text>
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
						<xsl:when test="//pp/@alone='no'"> no permite cualesquiera</xsl:when>
						<xsl:when test="//pp/@alone='yes'"> permite algunss</xsl:when>
					</xsl:choose>
<xsl:text> de sus </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
						<xsl:text>preposiciones</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
						<xsl:text>posposiciones</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
						<xsl:text>_____-posiciones</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
						<xsl:text>preposiciones y posposiciones</xsl:text>
					</xsl:if>
<xsl:text> al soporte solamente.  </xsl:text>
<xsl:if test="normalize-space(//pp/@alone)='yes'">
						<xsl:text>Algunos ejemplos dentro de oraciones completas son:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//pp/@alone)='yes'">
<example num="xPP.PPComps.PPAlone.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/aloneExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/aloneExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/aloneExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/aloneExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPComps.PPAlone.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPComps.PPAlone.8.1</xsl:text>
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
			</section3>
			<section3 id="sPPLoc">
				<secTitle>Los adverbios de lugar como complementos</secTitle>
				<p>
<xsl:text>La mayoría de los idiomas permiten adverbios de lugar como complementos de las </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposiciones o posposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposiciones o posposiciones</xsl:when>
					</xsl:choose>
<xsl:text>, por ejemplo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>por allá</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>adentro aquí</langData>
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text></xsl:text>
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
						<xsl:when test="//pp/@locative='no'"> no hace permitir</xsl:when>
						<xsl:when test="//pp/@locative='yes'"> permite</xsl:when>
					</xsl:choose>
<xsl:text> los adverbios de lugar como complementos de sus </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
						<xsl:text>preposiciones.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
						<xsl:text>posposiciones.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
						<xsl:text>_____-posiciones.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
						<xsl:text>preposiciones y posposiciones.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@locative)='yes'">
						<xsl:text>  Algunos ejemplos con los complementos del adverbio de lugar son:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//pp/@locative)='yes'">
<example num="xPP.PPComps.PPLoc.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/locExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/locExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/locExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/locExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPComps.PPLoc.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPComps.PPLoc.8.1</xsl:text>
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
			</section3>
			<section3 id="sPPLocPP">
				<secTitle>   <xsl:choose>
					<xsl:when test="//pp/@pPos='before'">Las frases preposicionales locativas como complementos</xsl:when>
					<xsl:when test="//pp/@pPos='after'">Las frases posposicionales locativas como complementos</xsl:when>
					<xsl:when test="//pp/@pPos='both'">Las frases preposicionales y posposicionales locativas como complementos</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">Las frases preposicionales y/o posposicionales locativas como complementos</xsl:when>
				</xsl:choose>
</secTitle>
				<p>
<xsl:text>Las </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposiciones y posposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposiciones y/o posposiciones</xsl:when>
					</xsl:choose>
<xsl:text> locativas son un grupo especial en eso en algunos idiomas que pueden tomar otra frase  </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
					</xsl:choose>
<xsl:text> locativa como su complemento. Los ejemplos ingleses de este tipo incluyen: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>up [to the top]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'encima [al borde]'</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>around [behind the shed]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'alrededor [detrás del cobertizo]'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>over [by the table]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'sobre [cerca de la mesa]'</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text></xsl:text>
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
						<xsl:when test="//pp/@ppComp='no'"> no tiene cualesquiera</xsl:when>
						<xsl:when test="//pp/@ppComp='yes'"> tiene</xsl:when>
					</xsl:choose>
<xsl:text> las </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
						<xsl:text>preposiciones</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
						<xsl:text>posposiciones</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
						<xsl:text>_____-posiciones</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
						<xsl:text>preposiciones y posposiciones</xsl:text>
					</xsl:if>
<xsl:text> locativas que toman una frase </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
					</xsl:choose>
<xsl:text> locativa como complemento.  </xsl:text>
<xsl:if test="normalize-space(//pp/@ppComp)='yes'">
						<xsl:text>Algunos ejemplos con las frases </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicionales o posposicionales</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicionales o posposicionales</xsl:when>
						</xsl:choose>
<xsl:text> locativas como complementos son:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//pp/@ppComp)='yes'">
<example num="xPP.PPComps.PPLocPP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/compPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/compPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/compPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/compPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPComps.PPLocPP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPComps.PPLocPP.8.1</xsl:text>
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
			</section3>
			<section3 id="sPPSent">
				<secTitle>Las oraciones como complementos</secTitle>
				<p>
<xsl:text>Las </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposiciones o posposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposiciones o posposiciones</xsl:when>
					</xsl:choose>
<xsl:text> temporales pueden también tener oraciones como sus complementos, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>antes de [la lluvia cesa]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>después de [Juan volvió a casa]</langData>
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text></xsl:text>
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
						<xsl:when test="//pp/@sentComp='no'"> no tiene cualesquiera</xsl:when>
						<xsl:when test="//pp/@sentComp='yes'"> tiene</xsl:when>
					</xsl:choose>
<xsl:text> las </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
						<xsl:text>preposiciones</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
						<xsl:text>posposiciones</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
						<xsl:text>_____-posiciones</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
						<xsl:text>preposiciones and posposiciones</xsl:text>
					</xsl:if>
<xsl:text> temporales que toman una oración para su complemento.  </xsl:text>
<xsl:if test="normalize-space(//pp/@sentComp)='yes'">
						<xsl:text>Algunos ejemplos con las oraciones como complementos, incluidos en oraciones completas son:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//pp/@sentComp)='yes'">
<example num="xPP.PPComps.PPSent.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/sentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/sentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/sentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/sentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPComps.PPSent.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPComps.PPSent.8.1</xsl:text>
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
			</section3>
		</section2>
	</section1>


































































































































































































































































</xsl:template>
</xsl:stylesheet>
