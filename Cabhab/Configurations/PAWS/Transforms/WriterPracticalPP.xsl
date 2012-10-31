<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="pp">
	<section1 id="sPP">
		<secTitle>
			<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">Prepositional Phrases</xsl:when>
				<xsl:when test="//pp/@pPos='after'">Postpositional Phrases</xsl:when>
				<xsl:when test="//pp/@pPos='both'">Prepositional and Postpositional Phrases</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">Prepositional and/or Postpositional Phrases</xsl:when>
			</xsl:choose>
			</secTitle>
	   <p>
<xsl:text>This section covers the internal structure of prepositional or postpositional phrases, which usually express location, accompaniment, goal, instrument, recipient, or agent for languages which do not have case marking on nouns or nominal phrases.    Languages with case marking normally still have locative and temporal prepositional or postpositional phrases.</xsl:text>
</p>
	   <p>
<xsl:text>Prepositions come before their complements, while postpositions come afterward.  English has prepositions, as shown in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>for Joe</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>by the river</langData>
<xsl:text>.  The prepositions or postpositions may be separate words, or they may be clitics which are attached to the edge of the complement or to its head.</xsl:text>
</p>
		<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">prepositions only.  </xsl:when>
				<xsl:when test="//pp/@pPos='after'">postpositions only.  </xsl:when>
				<xsl:when test="//pp/@pPos='both'">both prepositions and postpositions.  </xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">_____-positions only.  </xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pType='word'">They are all separate words.</xsl:when>
				<xsl:when test="//pp/@pType='clitic'">They are all clitics written attached to another word.</xsl:when>
				<xsl:when test="//pp/@pType='both'">Some are written as separate words, but some are clitics written attached to another word.  </xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pType)!='word'">
				<xsl:text>The clitics attach </xsl:text>
				<xsl:choose>
					<xsl:when test="//pp/@attaches='edge'">at the edge</xsl:when>
					<xsl:when test="//pp/@attaches='head'">to the head</xsl:when>
				</xsl:choose>
				<xsl:text> of the complement phrase.</xsl:text>
			</xsl:if>
<xsl:text>  See the examples in section </xsl:text>
<sectionRef sec="sPPComps" />
<xsl:text>.  </xsl:text>
<xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//pp/@ppClassifier)='yes' and normalize-space(//pp/@pType)!='clitic'">
<xsl:choose>
			  <xsl:when test="//pp/@pPos='before'">Prepositions</xsl:when>
		   <xsl:when test="//pp/@pPos='after'">Postpositions</xsl:when>
		   <xsl:when test="//pp/@pPos='both'">Prepositions and postpositions</xsl:when>
			  <xsl:when test="//pp/@pPos='unknown'">Prepositions and/or postpositions</xsl:when>
</xsl:choose>
			  <xsl:text> are marked with classifiers in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> as part of the concord agreement system.</xsl:text> </xsl:if>
</p>

				<p>
<xsl:text>Possible modifiers of the phrase are considered first, then the complements allowed.</xsl:text>
</p>
		<section2 id="sPPModifiers">
			<secTitle>Modifiers</secTitle>
			<p>
<xsl:text>There are normally a few degree words that can modify a whole </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrase, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>right</langData>
<xsl:text> in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just around the corner</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>right to the last second</langData>
<xsl:text>. Some languages have a set of locative adverbs meaning </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘right here’</xsl:text>
</gloss>
<xsl:text> and </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘right there’</xsl:text>
</gloss>
<xsl:text> that can modify PPs. Ordinal numbers and adjectives can also modify </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrases, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>next in line</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>first out the door</langData>
<xsl:text>.  In addition, certain manner adverbs can modify </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrases, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>almost in the hole</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mostly up the tree</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>squarely on the table</langData>
<xsl:text>, and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nearly upon the enemy</langData>
<xsl:text>.</xsl:text>
</p>
			<xsl:if test="normalize-space(//pp/@modifiers)='yes'">
<p>
<xsl:text>Similar examples as expressed in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
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
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@modifiers='no'"> does not have any modifiers which occur either before or after the phrase syntactically.</xsl:when>
					<xsl:when test="//pp/@modifiers='yes'"> allows </xsl:when>
				</xsl:choose>
<xsl:if test="normalize-space(//pp/@modifiers)='no'">
<xsl:text>  Neither degree words nor ordinals nor adverbials can modify </xsl:text>
					<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
						<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
						<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
					</xsl:choose>
					<xsl:text> phrases as separate words.</xsl:text> </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@modifiers)='yes'">
					<xsl:text></xsl:text>
					<xsl:choose>
						<xsl:when test="//pp/@modifierType='degree'">only degree words</xsl:when>
						<xsl:when test="//pp/@modifierType='ordinal'">only ordinals</xsl:when>
						<xsl:when test="//pp/@modifierType='manner'">only manner adverbials</xsl:when>
					   <xsl:when test="//pp/@modifierType='locative'">only locative adverbials</xsl:when>
						<xsl:when test="//pp/@modifierType='degreeAndOrdinal'">both degree words and ordinals, but no adverbials</xsl:when>
						<xsl:when test="//pp/@modifierType='degreeAnd Manner'">both degree words and manner adverbials, but not ordinals or locative adverbials</xsl:when>
						<xsl:when test="//pp/@modifierType='mannerAndOrdinal'">both manner adverbials and ordinals, but not degree words or locative adverbials</xsl:when>
					   <xsl:when test="//pp/@modifierType='mannerAndLocative'">both manner and locative adverbials, but not degree words or ordinals</xsl:when>
						<xsl:when test="//pp/@modifierType='all'">all three main types, degree words, manner adverbials and ordinals,</xsl:when>
					   <xsl:when test="//pp/@modifierType='all4'">all four types, degree words, manner and locative adverbials and ordinals,</xsl:when>
					</xsl:choose>
					<xsl:text> as modifiers to </xsl:text>
					<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
						<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
						<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
					</xsl:choose>
					<xsl:text> phrases.  </xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='degree' or normalize-space(//pp/@modifierType)='degreeAndManner' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' or normalize-space(//pp/@modifierType)='all' or normalize-space(//pp/@modifierType)='all4'">
						<xsl:text>The degree words occur </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@degreePos='before'">before</xsl:when>
							<xsl:when test="//pp/@degreePos='after'">after</xsl:when>
							<xsl:when test="//pp/@degreePos='either'">on either side (but not both sides) of</xsl:when>
							<xsl:when test="//pp/@degreePos='eitherOrBoth'">on either side or on both sides of</xsl:when>
							<xsl:when test="//pp/@degreePos='beforeOrBoth'">before or on both sides of</xsl:when>
							<xsl:when test="//pp/@degreePos='afterOrBoth'">after or on both sides of</xsl:when>
							<xsl:when test="//pp/@degreePos='both'">on both sides of</xsl:when>
							<xsl:when test="//pp/@degreePos='unknown'">_______</xsl:when>
					   </xsl:choose>
						<xsl:text> the rest of the </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
						</xsl:choose>
						<xsl:text> phrase.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='degree' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='unrestricted'">
						<xsl:text>All the degree words can occur on either side of the </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
						</xsl:choose>
						<xsl:text> phrase.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='degree' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='restricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='restricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='restricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='restricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeRestricted)='restricted'">
						<xsl:text>There are restrictions as to which of the degree words can occur on each side of the </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
						</xsl:choose>
						<xsl:text> phrase.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='ordinal' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' or normalize-space(//pp/@modifierType)='all' or normalize-space(//pp/@modifierType)='all4'">
						<xsl:text>The ordinals occur </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@ordinalPos='before'">before</xsl:when>
							<xsl:when test="//pp/@ordinalPos='after'">after</xsl:when>
							<xsl:when test="//pp/@ordinalPos='either'">on either side (but not both sides) of</xsl:when>
							<xsl:when test="//pp/@ordinalPos='eitherOrBoth'">on either side or on both sides of</xsl:when>
							<xsl:when test="//pp/@ordinalPos='beforeOrBoth'">before or on both sides of</xsl:when>
							<xsl:when test="//pp/@ordinalPos='afterOrBoth'">after or on both sides of</xsl:when>
							<xsl:when test="//pp/@ordinalPos='both'">on both sides of</xsl:when>
						   <xsl:when test="//pp/@ordinalPos='unknown'">_______</xsl:when>
						</xsl:choose>
						<xsl:text> the rest of the </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
						</xsl:choose>
						<xsl:text> phrase.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='ordinal' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='unrestricted'">
						<xsl:text>All the ordinals can occur on either side of the </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
						</xsl:choose>
						<xsl:text> phrase.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='ordinal' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='restricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='restricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='restricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='restricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@ordinalPos)!='before' and normalize-space(//pp/@ordinalPos)!='after' and normalize-space(//pp/@ordinalRestricted)='restricted'">
						<xsl:text>There are restrictions as to which of the ordinals can occur on each side of the </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
						</xsl:choose>
						<xsl:text> phrase.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='manner' or normalize-space(//pp/@modifierType)='degreeAndManner' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' or normalize-space(//pp/@modifierType)='all' or normalize-space(//pp/@modifierType)='mannerAndLocative' or normalize-space(//pp/@modifierType)='all4'">
						<xsl:text>The manner adverbials occur </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@mannerPos='before'">before</xsl:when>
							<xsl:when test="//pp/@mannerPos='after'">after</xsl:when>
							<xsl:when test="//pp/@mannerPos='either'">on either side (but not both sides) of</xsl:when>
						   <xsl:when test="//pp/@mannerPos='eitherOrBoth'">on either side or on both sides of</xsl:when>
						   <xsl:when test="//pp/@mannerPos='beforeOrBoth'">before or on both sides of</xsl:when>
							<xsl:when test="//pp/@mannerPos='afterOrBoth'">after or on both sides of</xsl:when>
							<xsl:when test="//pp/@mannerPos='both'">on both sides of</xsl:when>
							<xsl:when test="//pp/@mannerPos='unknown'">_______</xsl:when>
					   </xsl:choose>
						<xsl:text> the rest of the </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
						</xsl:choose>
						<xsl:text> phrase.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='manner' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='mannerAndLocative' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='unrestricted'">
						<xsl:text>All the manner adverbials can occur on either side of the </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
						</xsl:choose>
						<xsl:text> phrase.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//pp/@modifierType)='manner' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='restricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='restricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='restricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='restricted' or normalize-space(//pp/@modifierType)='mannerAndLocative' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='restricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@mannerPos)!='before' and normalize-space(//pp/@mannerPos)!='after' and normalize-space(//pp/@mannerRestricted)='restricted'">
						<xsl:text>There are restrictions as to which of the manner adverbials can occur on each side of the </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
						</xsl:choose>
						<xsl:text> phrase.  </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@modifierType)='locative' or normalize-space(//pp/@modifierType)='mannerAndLocative' or normalize-space(//pp/@modifierType)='all4'">
			  <xsl:text>The locative adverbials occur </xsl:text>
			  <xsl:choose>
				 <xsl:when test="//pp/@locativePos='before'">before</xsl:when>
				 <xsl:when test="//pp/@locativePos='after'">after</xsl:when>
				 <xsl:when test="//pp/@locativePos='either'">on either side (but not both sides) of</xsl:when>
				 <xsl:when test="//pp/@locativePos='eitherOrBoth'">on either side or on both sides of</xsl:when>
				 <xsl:when test="//pp/@locativePos='beforeOrBoth'">before or on both sides of</xsl:when>
				 <xsl:when test="//pp/@locativePos='afterOrBoth'">after or on both sides of</xsl:when>
				 <xsl:when test="//pp/@locativePos='both'">on both sides of</xsl:when>
				 <xsl:when test="//pp/@locativePos='unknown'">_______</xsl:when>
			  </xsl:choose>
			  <xsl:text> the rest of the </xsl:text>
			  <xsl:choose>
				 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
				 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
				 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
				 <xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
			  </xsl:choose>
			  <xsl:text> phrase.  </xsl:text>
		   </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@modifierType)='locative' and normalize-space(//pp/@locativePos)!='before' and normalize-space(//pp/@locativePos)!='after' and normalize-space(//pp/@locativeRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='mannerAndLocative' and normalize-space(//pp/@locativePos)!='before' and normalize-space(//pp/@locativePos)!='after' and normalize-space(//pp/@locativeRestricted)='unrestricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@locativePos)!='before' and normalize-space(//pp/@locativePos)!='after' and normalize-space(//pp/@locativeRestricted)='unrestricted'">
			  <xsl:text>All the locative adverbials can occur on either side of the </xsl:text>
			  <xsl:choose>
				 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
				 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
				 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
				 <xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
			  </xsl:choose>
			  <xsl:text> phrase.  </xsl:text>
		   </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@modifierType)='locative' and normalize-space(//pp/@locativePos)!='before' and normalize-space(//pp/@locativePos)!='after' and normalize-space(//pp/@locativeRestricted)='restricted' or normalize-space(//pp/@modifierType)='mannerAndLocative' and normalize-space(//pp/@locativePos)!='before' and normalize-space(//pp/@locativePos)!='after' and normalize-space(//pp/@locativeRestricted)='restricted' or normalize-space(//pp/@modifierType)='all4' and normalize-space(//pp/@locativePos)!='before' and normalize-space(//pp/@locativePos)!='after' and normalize-space(//pp/@locativeRestricted)='restricted'">
			  <xsl:text>There are restrictions as to which of the locative adverbials can occur on each side of the </xsl:text>
			  <xsl:choose>
				 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
				 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
				 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
				 <xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
			  </xsl:choose>
			  <xsl:text> phrase.</xsl:text>
		   </xsl:if>
<xsl:text></xsl:text>
</p>
		</section2>
		 <section2 id="sPPComps">
			 <secTitle>
<xsl:choose>
				 <xsl:when test="//pp/@pPos='before'">Complements to Prepositions</xsl:when>
				 <xsl:when test="//pp/@pPos='after'">Complements to Postpositions</xsl:when>
				 <xsl:when test="//pp/@pPos='both'">Complements to Prepositions and Postpositions</xsl:when>
				 <xsl:when test="//pp/@pPos='unknown'">Complements to Prepositions and/or Postpositions</xsl:when>
			 </xsl:choose>
</secTitle>
			<p>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">Prepositions</xsl:when>
					<xsl:when test="//pp/@pPos='after'">Postpositions</xsl:when>
					<xsl:when test="//pp/@pPos='both'">Prepositions and postpositions</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">Prepositions and/or postpositions</xsl:when>
				</xsl:choose>
<xsl:text> normally take a nominal phrase for their complements, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>to [Bill’s house]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>under [the giant Sycamore tree]</langData>
<xsl:text>. </xsl:text>
</p>
			<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> examples with nominal phrase complements include:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
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
				<secTitle>Stranding or No Complement</secTitle>
				<p>
<xsl:text>Some </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
						<xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
						<xsl:when test="//pp/@pPos='both'">prepositions or postpositions</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">prepositions or postpositions</xsl:when>
					</xsl:choose>
<xsl:text>  can stand alone without a complement due to particle movement, such as in the sentences </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Come [right in]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John turned the light [on/off]</langData>
<xsl:text>.  Also, some languages allow </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
						<xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
						<xsl:when test="//pp/@pPos='both'">prepositions or postpositions</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">prepositions or postpositions</xsl:when>
					</xsl:choose>
<xsl:text> to be stranded when its complement is fronted with questions, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Who(m) did you give the book [to _ ]?</langData>
<xsl:text></xsl:text>
</p>
				<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@alone='no'"> does not allow any</xsl:when>
						<xsl:when test="//pp/@alone='yes'"> allows some</xsl:when>
					</xsl:choose>
<xsl:text> of its </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
						<xsl:text>prepositions</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
						<xsl:text>postpositions</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
						<xsl:text>_____-positions</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
						<xsl:text>prepositions and postpositions</xsl:text>
					</xsl:if>
<xsl:text> to stand alone.  </xsl:text>
<xsl:if test="normalize-space(//pp/@alone)='yes'">
						<xsl:text>Some examples within full sentences are:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
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
				<secTitle>Locative Adverb Complements</secTitle>
				<p>
<xsl:text>Most languages will allow locative adverbs as complements of </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
						<xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
						<xsl:when test="//pp/@pPos='both'">prepositions or postpositions</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">prepositions or postpositions</xsl:when>
					</xsl:choose>
<xsl:text>, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>over there</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>in here</langData>
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@locative='no'"> does not allow</xsl:when>
						<xsl:when test="//pp/@locative='yes'"> allows</xsl:when>
					</xsl:choose>
<xsl:text> locative adverbs as complements of its </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
						<xsl:text>prepositions.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
						<xsl:text>postpositions.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
						<xsl:text>_____-positions.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
						<xsl:text>prepositions and postpositions.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@locative)='yes'">
						<xsl:text>  Some examples with locative adverb complements are:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
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
				<secTitle>            <xsl:choose>
					<xsl:when test="//pp/@pPos='before'">Locative Prepositional Phrase Complements</xsl:when>
					<xsl:when test="//pp/@pPos='after'">Locative Postpositional Phrase Complements</xsl:when>
					<xsl:when test="//pp/@pPos='both'">Locative Prepositional and Postpositional Phrase Complements</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">Locative Prepositional and/or Postpositional Phrase Complements</xsl:when>
				</xsl:choose>
</secTitle>
				<p>
<xsl:text>Locative </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
						<xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
						<xsl:when test="//pp/@pPos='both'">prepositions and postpositions</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">prepositions and/or postpositions</xsl:when>
					</xsl:choose>
<xsl:text> are a special group in that they can take another locative </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
						<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
						<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
					</xsl:choose>
<xsl:text> phrase as their complement.  English examples of this type include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>up [to the top]</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>around [behind the shed]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>over [by the table]</langData>
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@ppComp='no'"> does not have any</xsl:when>
						<xsl:when test="//pp/@ppComp='yes'"> has</xsl:when>
					</xsl:choose>
<xsl:text> locative </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
						<xsl:text>prepositions</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
						<xsl:text>postpositions</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
						<xsl:text>_____-positions</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
						<xsl:text>prepositions and postpositions</xsl:text>
					</xsl:if>
<xsl:text> which take a locative </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
						<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
						<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
					</xsl:choose>
<xsl:text> phrase complement.  </xsl:text>
<xsl:if test="normalize-space(//pp/@ppComp)='yes'">
						<xsl:text>Some examples with locative </xsl:text>
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
						</xsl:choose>
<xsl:text> phrase complements are:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
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
				  <xsl:when test="//pp/@pPos='before'">Complements of Temporal Prepositions</xsl:when>
				  <xsl:when test="//pp/@pPos='after'">Complements of Temporal Postpositions</xsl:when>
				  <xsl:when test="//pp/@pPos='both'">Complements of Temporal Prepositions and Postpositions</xsl:when>
				  <xsl:when test="//pp/@pPos='unknown'">Complements of Temporal Prepositions and/or Postpositions</xsl:when>
			   </xsl:choose>
</secTitle>
				<p>
<xsl:text>Temporals such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after</langData>
<xsl:text> are </xsl:text>
<xsl:choose>
					  <xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
					  <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
					  <xsl:when test="//pp/@pPos='both'">prepositions or postpositions</xsl:when>
					  <xsl:when test="//pp/@pPos='unknown'">prepositions or postpositions</xsl:when>
				   </xsl:choose>
<xsl:text> when they take a nominal phrase complement, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before you</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after that</langData>
<xsl:text>.  They can also have a gerund complement, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before [signing the contract]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after [buying our new house]</langData>
<xsl:text>, since gerunds are a special type of nominal phrase.</xsl:text>
</p>
			   <p>
<xsl:text>These same temporal </xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
						<xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
						<xsl:when test="//pp/@pPos='both'">prepositions or postpositions</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">prepositions or postpositions</xsl:when>
					</xsl:choose>
<xsl:text> can also have sentences as their complements, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before [the rain stops]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after [John came home]</langData>
<xsl:text>.  In this usage, they are temporal adverbs instead of </xsl:text>
<xsl:choose>
					 <xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
					 <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
					 <xsl:when test="//pp/@pPos='both'">prepositions or postpositions</xsl:when>
					 <xsl:when test="//pp/@pPos='unknown'">prepositions or postpositions</xsl:when>
				  </xsl:choose>
<xsl:text>, and the whole phrase is an adverbial clause which normally modifies the main sentence.  Such examples will be detailed in section </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text>.</xsl:text>
</p>
				<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
						<xsl:when test="//pp/@tempComp='no'"> does not have any</xsl:when>
						<xsl:when test="//pp/@tempComp='yes'"> has</xsl:when>
					</xsl:choose>
<xsl:text> temporal </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
						<xsl:text>prepositions</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
						<xsl:text>postpositions</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
						<xsl:text>_____-positions</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
						<xsl:text>prepositions and postpositions</xsl:text>
					</xsl:if>
<xsl:text> which take a nominal phrase or a gerund complement.  </xsl:text>
<xsl:if test="normalize-space(//pp/@tempComp)='yes'">
						<xsl:text>Some examples with nominal phrase or gerund complements, included in full sentences are:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
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
