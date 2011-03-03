<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="pp">
    <section1 id="sPP">
        <secTitle>Pre/Post-Positional Phrases</secTitle>
        <p>
<xsl:text>This section covers the internal structure of PPs, which can be either prepositional or postpositional phrases.  Possible modifiers are considered first, then the type of PP, and finally the complements allowed.</xsl:text>
</p>
        <section2 id="sPPModifiers">
            <secTitle>Modifiers</secTitle>
            <p>
<xsl:text>There are normally a few degree words that can modify a whole PP, such as </xsl:text>
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
<xsl:text>. Ordinal numbers and adjectives can also modify PPs, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>next in line</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>first out the door</langData>
<xsl:text>.  In addition, certain manner adverbs can modify PPs, as in </xsl:text>
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
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//pp/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pp/example)" />
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
<xsl:call-template name="DoMorphemeGloss" />
<xsl:call-template name="DoWordGloss" />
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
                    <xsl:when test="//pp/@modifiers='no'"> does not have any modifiers which occur either before or after PPs syntactically.  Neither degree words nor ordinals nor adverbials can modify PPs as separate words.</xsl:when>
                    <xsl:when test="//pp/@modifiers='yes'"> allows </xsl:when>
                </xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@modifiers)='yes'">
                    <xsl:text></xsl:text>
                    <xsl:choose>
                        <xsl:when test="//pp/@modifierType='degree'">only degree words</xsl:when>
                        <xsl:when test="//pp/@modifierType='ordinal'">only ordinals</xsl:when>
                        <xsl:when test="//pp/@modifierType='manner'">only manner adverbials</xsl:when>
                        <xsl:when test="//pp/@modifierType='degreeAndOrdinal'">both degree words and ordinals, but not manner adverbials</xsl:when>
                        <xsl:when test="//pp/@modifierType='degreeAnd Manner'">both degree words and manner adverbials, but not ordinals</xsl:when>
                        <xsl:when test="//pp/@modifierType='mannerAndOrdinal'">both manner adverbials and ordinals, but not degree words</xsl:when>
                        <xsl:when test="//pp/@modifierType='all'">all three types, degree words, manner adverbials and ordinals,</xsl:when>
                    </xsl:choose>
                    <xsl:text> as modifiers to PPs.  </xsl:text>
                    <xsl:if test="normalize-space(//pp/@modifierType)='degree' or normalize-space(//pp/@modifierType)='degreeAndManner' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' or normalize-space(//pp/@modifierType)='all'">
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
                        <xsl:text> the rest of the PP.  </xsl:text>
                    </xsl:if>
                    <xsl:text></xsl:text>
                    <xsl:if test="normalize-space(//pp/@modifierType)='degree' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted'">
                        <xsl:text>All the degree words can occur on either side of the PP.  </xsl:text>
                    </xsl:if>
                    <xsl:text></xsl:text>
                    <xsl:if test="normalize-space(//pp/@modifierType)='degree' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted'">
                        <xsl:text>There are restrictions as to which of the degree words can occur on each side of the PP.  </xsl:text>
                    </xsl:if>
                    <xsl:text></xsl:text>
                    <xsl:if test="normalize-space(//pp/@modifierType)='ordinal' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' or normalize-space(//pp/@modifierType)='all'">
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
                        <xsl:text> the rest of the PP.  </xsl:text>
                    </xsl:if>
                    <xsl:text></xsl:text>
                    <xsl:if test="normalize-space(//pp/@modifierType)='ordinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted'">
                        <xsl:text>All the ordinals can occur on either side of the PP.  </xsl:text>
                    </xsl:if>
                    <xsl:text></xsl:text>
                    <xsl:if test="normalize-space(//pp/@modifierType)='ordinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='degreeAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted'">
                        <xsl:text>There are restrictions as to which of the ordinals can occur on each side of the PP.  </xsl:text>
                    </xsl:if>
                    <xsl:text></xsl:text>
                    <xsl:if test="normalize-space(//pp/@modifierType)='manner' or normalize-space(//pp/@modifierType)='degreeAndManner' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' or normalize-space(//pp/@modifierType)='all'">
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
                        <xsl:text> the rest of the PP.  </xsl:text>
                    </xsl:if>
                    <xsl:text></xsl:text>
                    <xsl:if test="normalize-space(//pp/@modifierType)='manner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='unrestricted'">
                        <xsl:text>All the manner adverbials can occur on either side of the PP.  </xsl:text>
                    </xsl:if>
                    <xsl:text></xsl:text>
                    <xsl:if test="normalize-space(//pp/@modifierType)='manner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='degreeAndManner' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='mannerAndOrdinal' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted' or normalize-space(//pp/@modifierType)='all' and normalize-space(//pp/@degreePos)!='before' and normalize-space(//pp/@degreePos)!='after' and normalize-space(//pp/@degreeEither)='restricted'">
                        <xsl:text>There are restrictions as to which of the manner adverbials can occur on each side of the PP.</xsl:text>
                    </xsl:if>
                    <xsl:text></xsl:text>
                </xsl:if>
<xsl:text></xsl:text>
</p>
        </section2>
        <section2 id="sPPType">
            <secTitle>Head Type</secTitle>
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
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
                    <xsl:when test="//pp/@pType='word'">They are all separate syntactic words.</xsl:when>
                    <xsl:when test="//pp/@pType='clitic'">They are all clitics written attached to another word.</xsl:when>
                    <xsl:when test="//pp/@pType='both'">Some are written as separate syntactic words, but some are clitics written attached to another word.  </xsl:when>
                </xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pType)!='word'">
                    <xsl:text>The clitics attach </xsl:text>
                    <xsl:choose>
                        <xsl:when test="//pp/@attaches='egde'">at the edge</xsl:when>
                        <xsl:when test="//pp/@attaches='head'">to the head</xsl:when>
                    </xsl:choose>
                    <xsl:text> of the complement phrase.</xsl:text>
                </xsl:if>
<xsl:text>  See the examples in the next section.</xsl:text>
</p>
        </section2>
        <section2 id="sPPComps">
            <secTitle>Complements within PP</secTitle>
            <p>
<xsl:text>Prepositions or postpositions normally take a nominal phrase for their complements, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>to [Bill's house]</langData>
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
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//pp/ppExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/ppExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pp/ppExample)" />
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
<xsl:call-template name="DoMorphemeGloss" />
<xsl:call-template name="DoWordGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
            <section3 id="sPPAlone">
                <secTitle>Stranding or No Complement</secTitle>
                <p>
<xsl:text>Some prepositions or postpositions can stand alone without a complement, such as in the sentences </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Come [right in]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John turned the light [on/off]</langData>
<xsl:text>.  Also, some languages allow prepositions or postpositions to be stranded in questions, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Who(m) did you give the book [to _ ]?</langData>
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
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//pp/aloneExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/aloneExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pp/aloneExample)" />
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
<xsl:call-template name="DoMorphemeGloss" />
<xsl:call-template name="DoWordGloss" />
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
<xsl:text>Most languages will allow locative adverbs as complements of prepositions or postpositions, such as </xsl:text>
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
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//pp/locExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/locExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pp/locExample)" />
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
<xsl:call-template name="DoMorphemeGloss" />
<xsl:call-template name="DoWordGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
            </section3>
            <section3 id="sPPLocPP">
                <secTitle>Locative PP Complements</secTitle>
                <p>
<xsl:text>Locative prepositions and postpositions are a special group in that they can take another locative PP as their complement.  English examples of this type include: </xsl:text>
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
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
<xsl:text> which take a locative PP complement.  </xsl:text>
<xsl:if test="normalize-space(//pp/@ppComp)='yes'">
                        <xsl:text>Some examples with locative PP complements are:</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
</p>
                <xsl:if test="normalize-space(//pp/@ppComp)='yes'">
<example num="xPP.PPComps.PPLocPP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/compPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//pp/compPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/compPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pp/compPPExample)" />
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
<xsl:call-template name="DoMorphemeGloss" />
<xsl:call-template name="DoWordGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
            </section3>
            <section3 id="sPPSent">
                <secTitle>Sentential Complements</secTitle>
                <p>
<xsl:text>Temporal prepositions or postpositions can also have sentences as their complements, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before [the rain stops]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after [John came home]</langData>
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
                        <xsl:when test="//pp/@sentComp='no'"> does not have any</xsl:when>
                        <xsl:when test="//pp/@sentComp='yes'"> has</xsl:when>
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
<xsl:text> which take a sentential complement.  </xsl:text>
<xsl:if test="normalize-space(//pp/@sentComp)='yes'">
                        <xsl:text>Some examples with sentential complements, included in full sentences are:</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
</p>
                <xsl:if test="normalize-space(//pp/@sentComp)='yes'">
<example num="xPP.PPComps.PPSent.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/sentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//pp/sentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/sentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pp/sentExample)" />
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoMorphemeGloss" />
<xsl:call-template name="DoWordGloss" />
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
