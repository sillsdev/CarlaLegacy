<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="relcl">
    <section1 id="sRelCl">
        <secTitle>Relative Clauses</secTitle>
        <p>
<xsl:text>Relative clauses normally modify a head noun and have one of four structures:</xsl:text>
</p>
        <ul>
            <li>
                <xsl:text>like a complement clause headed by 'that', as in </xsl:text>
                <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the man that came to the meeting late</langData>
                <xsl:text>;</xsl:text>
            </li>
            <li>
                <xsl:text>like a content question with 'who' or 'which' fronted, as in </xsl:text>
                <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the man who came to the meeting late</langData>
                <xsl:text>;</xsl:text>
            </li>
            <li>
                <xsl:text>(or for some languages other than English) like a complement clause but with a special relative marker occurring in the complementizer position, or possibly with two markers which occur on each sides of the relative clause;</xsl:text>
            </li>
            <li>
                <xsl:text>(or for some languages other than English) like a regular sentence with a relative marker attached to the verb.</xsl:text>
            </li>
        </ul>
        <p>
<xsl:text>Some languages also allow one of the above structures to occur by itself as a nominal phrase without a head noun to modify, usually called "headless" relative clauses.</xsl:text>
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
                <xsl:text> does not have any type of relative clause.</xsl:text>
            </xsl:if>
<xsl:if test="normalize-space(//relcl/@exist)='yes'">
                <xsl:text>In </xsl:text>
                <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
                <xsl:text>, relative clauses occur </xsl:text>
                <xsl:choose>
                    <xsl:when test="//relcl/@clausePos='before'">before</xsl:when>
                    <xsl:when test="//relcl/@clausePos='after'">after</xsl:when>
                    <xsl:when test="//relcl/@clausePos='either'">on either side of</xsl:when>
                    <xsl:when test="//relcl/@clausePos='unknown'"> _______ </xsl:when>
                </xsl:choose>
                <xsl:text> the head noun.   </xsl:text>
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
                    <xsl:when test="//relcl/@type='IP'"> relative clauses are like a regular sentence with a relative marker attached to the verb.</xsl:when>
                    <xsl:when test="//relcl/@type='CP'"> relative clauses </xsl:when>
                </xsl:choose>
                <xsl:text> </xsl:text>
                <xsl:if test="normalize-space(//relcl/@type)='CP'">
                    <xsl:text> </xsl:text>
                    <xsl:choose>
                        <xsl:when test="//relcl/@compCP='no'">are like questions because a "wh" word is fronted.</xsl:when>
                        <xsl:when test="//relcl/@compCP='yes'">are like complement clauses with relative markers that </xsl:when>
                        <xsl:when test="//relcl/@compCP='yesBoth'">are like questions because a "wh" word is fronted and some are  like complement clauses with relative markers that </xsl:when>
                    </xsl:choose>
                    <xsl:if test="normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' or normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)='no' and normalize-space(//relcl/@whAndComp)!='no'">
                        <xsl:text>are </xsl:text>
                        <xsl:choose>
                            <xsl:when test="//relcl/@relWord='yes'">written as a separate word.</xsl:when>
                            <xsl:when test="//relcl/@relWord='no'">clitics which attach to another word at the edge of the relative clause.</xsl:when>
                        </xsl:choose>
                        <xsl:text> </xsl:text>
                        <xsl:if test="normalize-space(//relcl/@relWord)='no' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' or normalize-space(//relcl/@relWord)='no' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)='no' and normalize-space(//relcl/@whAndComp)!='no'">
                            <xsl:text> </xsl:text>
                            <xsl:choose>
                                <xsl:when test="//relcl/@relCliticPos='before'">These clitics are pro-clitics.</xsl:when>
                                <xsl:when test="//relcl/@relCliticPos='after'">These clitics are post-clitics.</xsl:when>
                                <xsl:when test="//relcl/@relCliticPos='both'">Some of the clitics are pro-clitics and some are post-clitics.</xsl:when>
                               <xsl:when test="//relcl/@relCliticPos='unknown'"> _______ </xsl:when>
                           </xsl:choose>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:text> </xsl:text>
                        <xsl:if test="normalize-space(//relcl/@relWord)='yes' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' or normalize-space(//relcl/@relWord)='yes' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)='no' and normalize-space(//relcl/@whAndComp)!='no'">
                            <xsl:text> </xsl:text>
                            <xsl:choose>
                                <xsl:when test="//relcl/@relCompSame='yes'">Some of</xsl:when>
                                <xsl:when test="//relcl/@relCompSame='no'">None of</xsl:when>
                            </xsl:choose>
                            <xsl:text> the relative markers are the same as the complementizer(s) used in verbal complement clauses.  The relative marker occurs </xsl:text>
                            <xsl:choose>
                                <xsl:when test="//relcl/@relCompPos='before'">before</xsl:when>
                                <xsl:when test="//relcl/@relCompPos='after'">after</xsl:when>
                                <xsl:when test="//relcl/@relCompPos='either'">on either side (but not both sides) of</xsl:when>
                                <xsl:when test="//relcl/@relCompPos='eitherOrBoth'">on either side or on both sides of</xsl:when>
                                <xsl:when test="//relcl/@relCompPos='beforeOrBoth'">before or on both sides of</xsl:when>
                                <xsl:when test="//relcl/@relCompPos='afterOrBoth'">after or on both sides of</xsl:when>
                                <xsl:when test="//relcl/@relCompPos='both'">on both sides of</xsl:when>
                                <xsl:when test="//relcl/@relCompPos='unknown'"> _______ </xsl:when>
                           </xsl:choose>
                            <xsl:text> the sentence part of the relative clause.</xsl:text>
                            <xsl:if test="normalize-space(//relcl/@relWord)='yes' and normalize-space(//relcl/@relCompEitherRestricted)='unrestricted' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' and normalize-space(//relcl/@relCompPos)!='before' and normalize-space(//relcl/@relCompPos)!='after'">
                                <xsl:text>All of the relative markers can occur on either side.</xsl:text>
                            </xsl:if>
                            <xsl:text> </xsl:text>
                            <xsl:if test="normalize-space(//relcl/@relWord)='yes' and normalize-space(//relcl/@relCompEitherRestricted)='restricted' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='no' and normalize-space(//relcl/@relCompPos)!='before' and normalize-space(//relcl/@relCompPos)!='after'">
                                <xsl:text>There are restrictions as to which of the relative markers can occur on each side.</xsl:text>
                            </xsl:if>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    <xsl:text> </xsl:text>
                </xsl:if>
                <xsl:text> </xsl:text>
                <xsl:if test="normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@compCP)!='yes'">
                    <xsl:text>In the "wh"-relative clauses, </xsl:text>
                    <xsl:choose>
                        <xsl:when test="//relcl/@whAndComp='no'">only the "wh"-word occurs without any type of relative marker.</xsl:when>
                        <xsl:when test="//relcl/@whAndComp='yes'">the "wh"-word and the relative marker(s) are required to both be present.</xsl:when>
                        <xsl:when test="//relcl/@whAndComp='optional'">a relative marker may optionally co-occur along with the "wh"-word.</xsl:when>
                    </xsl:choose>
                    <xsl:text> </xsl:text>
                </xsl:if>
                <xsl:text> </xsl:text>
            </xsl:if>
<xsl:text> </xsl:text>
</p>
        <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text>Examples of relative clauses in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> include:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<example num="xRelCl.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//relcl/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//relcl/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//relcl/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//relcl/example)" />
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
        <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text>Full sentence examples of the above relative clauses include:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//relcl/@exist)='yes'">
<example num="xRelCl.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//relcl/sentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//relcl/sentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//relcl/sentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//relcl/sentExample)" />
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
                <xsl:when test="//relcl/@headless='no'">requires a head noun to be present in all relative clauses, so no headless relative clauses are allowed.</xsl:when>
                <xsl:when test="//relcl/@headless='yes'">allows a head noun to be missing in relative clauses, so headless relative clauses are allowed.</xsl:when>
            </xsl:choose>
<xsl:text> </xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//relcl/@headless)='yes' and normalize-space(//relcl/@exist)='yes'">
<p>
<xsl:text>Examples of headless relative clauses included in full sentences include:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//relcl/@headless)='yes' and normalize-space(//relcl/@exist)='yes'">
<example num="xRelCl.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//relcl/headlessExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//relcl/headlessExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//relcl/headlessExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//relcl/headlessExample)" />
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
    </section1>






















































































</xsl:template>
</xsl:stylesheet>
