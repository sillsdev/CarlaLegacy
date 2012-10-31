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
<xsl:text>Esta sección trata sobre la estructura interna de las frases preposicionales o posposicionales, que expresan generalmente la localidad, el acompañamiento, la meta, el instrumento, el recipiente o el agente en lenguas que no indican el caso en sustantivos o frases nominales. Las lenguas que tienen marcadores de caso en sustantivos normalmente tienen frases preposionales o posposicionales de lugar y tiempo todavía.</xsl:text>
</p>
	   <p>
<xsl:text>Las preposiciones se presentan antes de los complementos, mientras que las posposiciones se presentan después. El español tiene preposiciones, de acuerdo con los ejemplos </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>para José</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>al lado del río</langData>
<xsl:text>.  Las preposiciones o las posposiciones pueden ser palabras independientes, o pueden ser clíticos que se unen a la orilla de la frase del complemento o al núcleo.</xsl:text>
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
<xsl:text> hay </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">solamente preposiciones.  </xsl:when>
				<xsl:when test="//pp/@pPos='after'">solamente posposiciones.  </xsl:when>
				<xsl:when test="//pp/@pPos='both'">preposiciones y posposiciones.  </xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">solamente _____-posiciones.  </xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pType='word'">Todos son palabras independientes.</xsl:when>
				<xsl:when test="//pp/@pType='clitic'">Todos son clíticos que se escriben unidos a otra palabra.</xsl:when>
				<xsl:when test="//pp/@pType='both'">Algunos se escriben como palabras independientes, pero algunos son clíticos que se escriben unidos a otra palabra.  </xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pType)!='word'">
				<xsl:text>Los clíticos se unen </xsl:text>
				<xsl:choose>
					<xsl:when test="//pp/@attaches='edge'">a la orilla</xsl:when>
					<xsl:when test="//pp/@attaches='head'">al núcleo</xsl:when>
				</xsl:choose>
				<xsl:text> de la frase del complemento.</xsl:text>
			</xsl:if>
<xsl:text>  Véase los ejemplos en la sección </xsl:text>
<sectionRef sec="sPPComps" />
<xsl:text>.</xsl:text>
<xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//pp/@ppClassifier)='yes' and normalize-space(//pp/@pType)!='clitic'">
<xsl:choose>
			   <xsl:when test="//pp/@pPos='before'">Los preposiciones</xsl:when>
			   <xsl:when test="//pp/@pPos='after'">Los posposiciones</xsl:when>
			   <xsl:when test="//pp/@pPos='both'">Los preposiciones y posposiciones</xsl:when>
			   <xsl:when test="//pp/@pPos='unknown'">Los preposiciones y/o posposiciones</xsl:when>
</xsl:choose>
			   <xsl:text> se marcan con clasificadores en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> como parte del sistema de concordancia.</xsl:text> </xsl:if>
</p>

				<p>
<xsl:text>Primero se analizan los posibles modificadores de la frase, después los complementos permitidos. </xsl:text>
</p>
		<section2 id="sPPModifiers">
			<secTitle>Modificadores</secTitle>
			<p>
<xsl:text>Normalmente hay algunas palabras de grado que pueden modificar una frase </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
				</xsl:choose>
<xsl:text> completa, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘justo’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>right</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘hasta’</xsl:text>
</gloss>
<xsl:text> en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just around the corner</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘justo a la vuelta de la esquina’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>right to the last second</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘hasta el último momento’</xsl:text>
</gloss>
<xsl:text>.  En algunas lenguas hay adverbios de lugar que significa </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘right here’ ‘exactamente aquí’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘right there’ ‘exactamente allí’</xsl:text>
</gloss>
<xsl:text> que pueden modificar las frases </xsl:text>
<xsl:choose>
				  <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
				  <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
				  <xsl:when test="//pp/@pPos='both'">preposicionales o posposicionales</xsl:when>
				  <xsl:when test="//pp/@pPos='unknown'">preposicionales o posposicionales</xsl:when>
			   </xsl:choose>
<xsl:text>.  Los números ordinales y los adjetivos también pueden modificar las frases </xsl:text>
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
</xsl:attribute>next in line</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘siguiente en la linea’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>first out the door</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘el primero en salir’</xsl:text>
</gloss>
<xsl:text>.  Además, ciertos adverbios de modo pueden modificar las frases </xsl:text>
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
</xsl:attribute>almost in the hole</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘casi en el agujero’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mostly up the tree</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘la mayoría en el árbol’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>squarely on the table</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘justo en la mesa’</xsl:text>
</gloss>
<xsl:text>, y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nearly upon the enemy</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘casi sobre el enemigo’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
			<xsl:if test="normalize-space(//pp/@modifiers)='yes'">
<p>
<xsl:text>Algunos ejemplos similares  en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de acuerdo con lo expresado son:</xsl:text>
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
					<xsl:when test="//pp/@modifiers='no'"> no hay modificadores que se presenten sintácticamente antes o después de la frase.</xsl:when>
					<xsl:when test="//pp/@modifiers='yes'"> se permiten </xsl:when>
				</xsl:choose>
<xsl:if test="normalize-space(//pp/@modifiers)='no'">
<xsl:text>  Ni palabras de grado ni los números ordinales ni los adverbios pueden modificar las frases </xsl:text>
					<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposicionales o posposicionales</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposicionales o posposicionales</xsl:when>
					</xsl:choose>
					<xsl:text> como palabras independientes.</xsl:text> </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@modifiers)='yes'">
					<xsl:text></xsl:text>
					<xsl:choose>
						<xsl:when test="//pp/@modifierType='degree'">solamente las palabras de grado</xsl:when>
						<xsl:when test="//pp/@modifierType='ordinal'">solamente los números ordinales</xsl:when>
						<xsl:when test="//pp/@modifierType='manner'">solamente los adverbios de modo</xsl:when>
					   <xsl:when test="//pp/@modifierType='locative'">solamente los adverbios de lugar</xsl:when>
						<xsl:when test="//pp/@modifierType='degreeAndOrdinal'">las palabras de grado y los números ordinales, pero no los adverbios</xsl:when>
						<xsl:when test="//pp/@modifierType='degreeAnd Manner'">las palabras de grado y los adverbios de modo, pero no los números ordinales ni los adverbios de lugar</xsl:when>
						<xsl:when test="//pp/@modifierType='mannerAndOrdinal'">los adverbios de modo y los números ordinales, pero no las palabras de grado ni los adverbios de lugar</xsl:when>
					   <xsl:when test="//pp/@modifierType='mannerAndLocative'">los adverbios de modo y de lugar, pero no los números ordinales ni las palabras de grado</xsl:when>
						<xsl:when test="//pp/@modifierType='all'">los tres tipos principales, las palabras de grado, los adverbios de modo y los números ordinales,</xsl:when>
					   <xsl:when test="//pp/@modifierType='all4'">los cuatro tipos, las palabras de grado, los adverbios de modo y de lugar y los números ordinales,</xsl:when>
				   </xsl:choose>
					<xsl:text> como modificadores de las frases </xsl:text>
					<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposicionales o posposicionales</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposicionales o posposicionales</xsl:when>
					</xsl:choose>
					<xsl:text>.  </xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='degree' or normalize-space(//pp/@modifierType)='degreeAndManner' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' or normalize-space(//pp/@modifierType)='all' or normalize-space(//pp/@modifierType)='all4'">
						<xsl:text>Las palabras de grado se presentan </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@degreePos='before'">antes</xsl:when>
							<xsl:when test="//pp/@degreePos='after'">después</xsl:when>
							<xsl:when test="//pp/@degreePos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
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
					<xsl:if test="normalize-space(//pp/@modifierType)='degree' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='unrestricted'">
						<xsl:text>Todas las palabras de grado pueden presentarse de cualquier lado de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='degree' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='restricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='restricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='restricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='restricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='restricted'">
						<xsl:text>Hay restricciones en cuanto a cuáles palabras de grado pueden presentarse en cada lado de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='ordinal' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' or normalize-space(//pp/@modifierType)='all' or normalize-space(//pp/@modifierType)='all4'">
						<xsl:text>Los números ordinales se presentan </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@ordinalPos='before'">antes</xsl:when>
							<xsl:when test="//pp/@ordinalPos='after'">después</xsl:when>
							<xsl:when test="//pp/@ordinalPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
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
					<xsl:if test="normalize-space(//pp/@modifierType)='ordinal' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='unrestricted'">
						<xsl:text>Todos los números ordinales pueden presentarse de cualquier lado de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='ordinal' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='restricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='restricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='restricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='restricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='restricted'">
						<xsl:text>Hay restricciones en cuanto a cuáles  números ordinales pueden presentarse en cada lado de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='manner' or normalize-space(//pp/@modifierType)='degreeAndManner' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' or normalize-space(//pp/@modifierType)='all' or normalize-space(//pp/@modifierType)='mannerAndLocative' or normalize-space(//pp/@modifierType)='all4'">
						<xsl:text>Los adverbios de modo se presentan </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@mannerPos='before'">antes</xsl:when>
							<xsl:when test="//pp/@mannerPos='after'">después</xsl:when>
							<xsl:when test="//pp/@mannerPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
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
					<xsl:if test="normalize-space(//pp/@modifierType)='manner' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='mannerAndLocative' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='unrestricted'">
						<xsl:text>Todos los adverbios de modo pueden presentarse de cualquier lado de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='manner' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='restricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='restricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='restricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='restricted' or normalize-space(//pp/@modifierType)='mannerAndLocative' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='restricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='restricted'">
						<xsl:text>Hay restricciones en cuanto a cuáles adverbios de modo pueden presentarse en cada lado de la frase </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
						</xsl:choose>
						<xsl:text>.  </xsl:text>
					</xsl:if>
				   <xsl:if test="normalize-space(//pp/@modifierType)='locative' or normalize-space(//pp/@modifierType)='mannerAndLocative' or normalize-space(//pp/@modifierType)='all4'">
					  <xsl:text>Los adverbios de lugar se presentan </xsl:text>
					  <xsl:choose>
						 <xsl:when test="//pp/@locativePos='before'">antes</xsl:when>
						 <xsl:when test="//pp/@locativePos='after'">después</xsl:when>
						 <xsl:when test="//pp/@locativePos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
						 <xsl:when test="//pp/@locativePos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
						 <xsl:when test="//pp/@locativePos='beforeOrBoth'">antes o en ambos lados</xsl:when>
						 <xsl:when test="//pp/@locativePos='afterOrBoth'">después o en ambos lados</xsl:when>
						 <xsl:when test="//pp/@locativePos='both'">en ambos lados</xsl:when>
						 <xsl:when test="//pp/@locativePos='unknown'">_______</xsl:when>
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
				   <xsl:if test="normalize-space(//pp/@modifierType)='locative' and normalize-space(//pp/@locativePos)!='before' and normalize-space(//pp/@locativePos)!='after' and normalize-space(//pp/@locativeRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='mannerAndLocative' and normalize-space(//pp/@locativePos)!='before' and normalize-space(//pp/@locativePos)!='after' and normalize-space(//pp/@locativeRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@locativePos)!='before' and normalize-space(//pp/@locativePos)!='after' and normalize-space(//pp/@locativeRestricted)='unrestricted'">
					  <xsl:text>Todos los adverbios de lugar pueden presentarse de cualquier lado de la frase </xsl:text>
					  <xsl:choose>
						 <xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
						 <xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
						 <xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
						 <xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
					  </xsl:choose>
					  <xsl:text>.  </xsl:text>
				   </xsl:if>
				   <xsl:text></xsl:text>
				   <xsl:if test="normalize-space(//pp/@modifierType)='locative' and normalize-space(//pp/@locativePos)!='before' and normalize-space(//pp/@locativePos)!='after' and normalize-space(//pp/@locativeRestricted)='restricted' or normalize-space(//pp/@modifierType)='mannerAndLocative' and normalize-space(//pp/@locativePos)!='before' and normalize-space(//pp/@locativePos)!='after' and normalize-space(//pp/@locativeRestricted)='restricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@locativePos)!='before' and normalize-space(//pp/@locativePos)!='after' and normalize-space(//pp/@locativeRestricted)='restricted'">
					  <xsl:text>Hay restricciones en cuanto a cuáles adverbios de lugar pueden presentarse en cada lado de la frase </xsl:text>
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
				 <xsl:when test="//pp/@pPos='before'">Complementos de las preposiciones</xsl:when>
				 <xsl:when test="//pp/@pPos='after'">Complementos de las posposiciones</xsl:when>
				 <xsl:when test="//pp/@pPos='both'">Complementos de las preposiciones y posposiciones</xsl:when>
				 <xsl:when test="//pp/@pPos='unknown'">Complementos de las preposiciones y/o posposiciones</xsl:when>
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
<xsl:text> llevan normalmente una frase nominal como complemento, por ejemplo en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>a [la casa de Guillermo]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>debajo [del árbol sicómoro gigante]</langData>
<xsl:text>. </xsl:text>
</p>
			<p>
<xsl:text> Algunos ejemplos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con complementos nominales son: </xsl:text>
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
<xsl:text>  pueden colocarse solas sin un complemento por razón de movimiento de una partícula, por ejemplo en las oraciones </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Come [in] ‘Viene [adentro]’</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John turned the light [on/off]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan apaga la luz [conectada/desconectada]’</xsl:text>
</gloss>
<xsl:text>.  También, algunas lenguas permiten </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposiciones o posposiciones</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposiciones o posposiciones</xsl:when>
					</xsl:choose>
<xsl:text> dejar aisladas en preguntas cuando el complemento desplaza a la izquierda, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Whom did you give the book [to _]?</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘¿Quién usted dio el libro [a _ ]?’</xsl:text>
</gloss>
<xsl:text> (No se permite en español.)</xsl:text>
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
						<xsl:when test="//pp/@alone='no'"> no permite </xsl:when>
						<xsl:when test="//pp/@alone='yes'"> permite algunas </xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
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
<xsl:text> colocarse solas sin un complemento.  </xsl:text>
<xsl:if test="normalize-space(//pp/@alone)='yes'">
						<xsl:text>Algunos ejemplos incluidos en oraciones completas son:</xsl:text>
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
			</section3>
			<section3 id="sPPLoc">
				<secTitle>Adverbios de lugar como complementos</secTitle>
				<p>
<xsl:text>La mayoría de las lenguas permiten adverbios de lugar como complementos de las </xsl:text>
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
</xsl:attribute>in here</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘aquí adentro’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
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
						<xsl:when test="//pp/@locative='no'"> no se permiten</xsl:when>
						<xsl:when test="//pp/@locative='yes'"> se permiten</xsl:when>
					</xsl:choose>
<xsl:text> los adverbios de lugar como complementos de los </xsl:text>
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
						<xsl:text>  Algunos ejemplos con adverbios de lugar como complementos son:</xsl:text>
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
			</section3>
			<section3 id="sPPLocPP">
				<secTitle>   <xsl:choose>
					<xsl:when test="//pp/@pPos='before'">Frases preposicionales de lugar como complementos</xsl:when>
					<xsl:when test="//pp/@pPos='after'">Frases posposicionales de lugar como complementos</xsl:when>
					<xsl:when test="//pp/@pPos='both'">Frases preposicionales y posposicionales de lugar como complementos</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">Frases preposicionales y/o posposicionales de lugar como complementos</xsl:when>
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
<xsl:text> de lugar forman una categoría especial porque en algunas lenguas pueden tener otra frase  </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
					</xsl:choose>
<xsl:text> de lugar como su complemento. Algunos ejemplos en inglés son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>up [to the top]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘encima [al borde]’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>around [behind the shed]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘alrededor [detrás del cobertizo]’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>over [by the table]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘sobre [cerca de la mesa]’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
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
						<xsl:when test="//pp/@ppComp='no'"> no hay </xsl:when>
						<xsl:when test="//pp/@ppComp='yes'"> hay </xsl:when>
					</xsl:choose>
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
<xsl:text> de lugar que pueden tener una frase </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposicional o posposicional</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposicional o posposicional</xsl:when>
					</xsl:choose>
<xsl:text> de lugar como complemento.  </xsl:text>
<xsl:if test="normalize-space(//pp/@ppComp)='yes'">
						<xsl:text>Algunos ejemplos con frases </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
							<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
							<xsl:when test="//pp/@pPos='both'">preposicionales o posposicionales</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">preposicionales o posposicionales</xsl:when>
						</xsl:choose>
<xsl:text> de lugar como complementos en </xsl:text>
						<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
						<xsl:text> son:</xsl:text>
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
			</section3>
			<section3 id="sPPTemp">
			   <secTitle>
<xsl:choose>
				  <xsl:when test="//pp/@pPos='before'">Complementos de preposiciones de tiempo</xsl:when>
				 <xsl:when test="//pp/@pPos='after'">Complementos de posposiciones de tiempo</xsl:when>
				 <xsl:when test="//pp/@pPos='both'">Complementos de preposiciones y posposiciones de tiempo</xsl:when>
				 <xsl:when test="//pp/@pPos='unknown'">Complementos de preposiciones y/o posposiciones de tiempo</xsl:when>
			   </xsl:choose>
</secTitle>
			   <p>
<xsl:text>Palabras de tiempo como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘antes’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘después’</xsl:text>
</gloss>
<xsl:text> son preposiciones
 de tiempo cuando llevan una frase nominal como complemento, por ejemplo en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before you</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘antes de usted’</xsl:text>
</gloss>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after that</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘después de esto’</xsl:text>
</gloss>
<xsl:text>.  También pueden llevar un gerundio como complemento, por ejemplo en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before [signing the contract]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘antes de [firmar el contrato]’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after [buying our new house]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘después de [comprar nuestra casa nueva]’</xsl:text>
</gloss>
<xsl:text>, puesto que los gerundios son un tipo especial de frase nominal.</xsl:text>
</p>
			   <p>
<xsl:text>Las mismas palabras de tiempo pueden llevar oraciones como complementos, por ejemplo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before [the rain stops]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘antes de que [la lluvia cese]’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after [John returns home]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘después de que [Juan volvió a casa]’</xsl:text>
</gloss>
<xsl:text>.  En este uso, son adverbios de tiempo en vez de preposiciones, y la frase completa es una cláusula adverbial que normalmente modifica la oración principal. Tales ejemplos serán detallados en la sección </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text>.</xsl:text>
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
						<xsl:when test="//pp/@tempComp='no'"> no hay </xsl:when>
						<xsl:when test="//pp/@tempComp='yes'"> hay </xsl:when>
					</xsl:choose>
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
<xsl:text> de tiempo que pueden tener una frase nominal o un gerundio como complemento.  </xsl:text>
<xsl:if test="normalize-space(//pp/@tempComp)='yes'">
					   <xsl:text>Algunos ejemplos de temporales con frases nominales o gerundios como complementos, incluidos en oraciones completas son:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//pp/@tempComp)='yes'">
<example num="xPP.PPComps.PPTemp.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/tempExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/tempExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/tempExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/tempExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPComps.PPTemp.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPComps.PPTemp.10.1</xsl:text>
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
			</section3>
		</section2>
	</section1>
	 
		
	
	
		
	
	
		
		
		
		
		
		
		
	   
	   
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	   
		
		
		
		
		
		
		
	   
		
		
		
		
		
		
		
	   
	   
	   
	   
	   
	   
	   
	   
	   
	
	
		
		
		
		
		
		
	   
		
		
		
		
		
		
		
	   
		
		
		
		
		
		
		
	   
		
		
		
		
		
		
		
	   
	   
	   
	   
	   
	   
	   
	   
	   
	
	
		
		
		
		
		
		
		
	   
	   
	
	
		
		
	   
	   
	   
	   
	   
		
		
		
	   
	   
	   
	   
	   
		
		
		
	   
	   
	   
	   
	   
		
		
		
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	
	
		
		
	   
	   
	   
	   
	   
		
		
		
	   
	   
	   
	   
	   
		
		
		
	   
	   
	   
	   
	   
		
		
		
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	
	
		
		
		
		
		
		
		
	   
	   
	   
	   
	
	
		
		
		
		
		
		
	   
		
		
		
	   
	   
	   
	   
	   
		
		
		
	   
	   
	   
	   
	   
		
		
		
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	
	
		
		
	   
	   
	   
	   
	   
		
		
		
	   
	   
	   
	   
	   
		
		
		
	   
	   
	   
	   
	   
		
		
		
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	
   
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
   

   
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
</xsl:template>
</xsl:stylesheet>
