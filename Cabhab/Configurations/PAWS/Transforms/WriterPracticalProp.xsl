<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="prop">
    <section1 id="sProp">
        <secTitle>Proper Names</secTitle>
       <p contentType="ctPracticalIntro">
<xsl:text>Proper names are a special kind of noun or phrase that acts syntactically just like other nouns or nominal phrases.</xsl:text>
</p>
       <p contentType="ctComparativeIntro">
<xsl:text>Proper names are a special kind of noun or phrase that acts syntactically just like other nouns or nominal phrases.  In English, some proper names can stand alone, like </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Russia</langData>
<xsl:text>.  Others are like compound nouns, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>George Washington</langData>
<xsl:text>.  Proper names may also contain articles and/or </xsl:text>
<xsl:choose>
                <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
            </xsl:choose>
<xsl:text> phrases, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the United States of America</langData>
<xsl:text>.  Many languages require an article before a name.  Appositives also occur, possibly including a possessor, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>my son, David</langData>
<xsl:text>, but these will be handled later in section </xsl:text>
<sectionRef sec="sCoordAppositive" />
<xsl:text>.  In addition, proper names can be modified by adjectives and relative clauses, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the good, old USA</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the Susan Welch that I know</langData>
<xsl:text>.</xsl:text>
</p>
       <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//prop/@pnClassifier)='yes'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, proper names carry classifiers just like nouns as part of the concord agreement system.</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//prop/@pnClassifier)='no'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, proper names do not carry classifiers as nouns do as part of the concord agreement system.</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<p>
<xsl:text>Proper names in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
          <xsl:when test="//prop/@pnDeterminer='no'"> may but are not required to</xsl:when>
          <xsl:when test="//prop/@pnDeterminer='yes'"> must</xsl:when>
       </xsl:choose>
<xsl:text> contain </xsl:text>
<xsl:choose>
          <xsl:when test="//np/@artAndDem='article'">an article</xsl:when>
          <xsl:when test="//np/@artAndDem='demonstrative'">a demonstrative</xsl:when>
          <xsl:when test="//np/@artAndDem='both'">an article and/or demonstrative</xsl:when>
</xsl:choose>
<xsl:text> or a possessor.</xsl:text>
</p>
</xsl:if>
       <p>
<xsl:text>Examples with simple and compound proper names, or those including articles, demonstratives, adjectives, and/or possessors in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> include:</xsl:text>
</p>
        <example num="xProp.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//prop/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//prop/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//prop/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//prop/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xProp.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xProp.16.1</xsl:text>
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
	   <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//prop/@pnClassifier)='yes'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, proper names carry classifiers just like nouns as part of the concord agreement system.</xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//prop/@pnClassifier)='no'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, proper names do not carry classifiers as nouns do as part of the concord agreement system.</xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<p>
<xsl:text>Proper names in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
		  <xsl:when test="//prop/@pnDeterminer='no'"> may but are not required to</xsl:when>
		  <xsl:when test="//prop/@pnDeterminer='yes'"> must</xsl:when>
	   </xsl:choose>
<xsl:text> contain an </xsl:text>
<xsl:choose>
		  <xsl:when test="//np/@artAndDem='article'">article</xsl:when>
		  <xsl:when test="//np/@artAndDem='demonstrative'">demonstrative</xsl:when>
		  <xsl:when test="//np/@artAndDem='both'">article and/or demonstrative</xsl:when>
</xsl:choose>
<xsl:text> or a possessor.</xsl:text>
</p>
</xsl:if>
	   <p>
<xsl:text>Examples of proper names with </xsl:text>
<xsl:choose>
                <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
            </xsl:choose>
<xsl:text> phrases in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> include:</xsl:text>
</p>
        <example num="xProp.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//prop/ppExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//prop/ppExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//prop/ppExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//prop/ppExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xProp.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xProp.26.1</xsl:text>
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
        <p>
<xsl:text>Some examples of proper names modified by relative clauses included in simple full sentences are:</xsl:text>
</p>
        <example num="xProp.30">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//prop/relClExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//prop/relClExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//prop/relClExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//prop/relClExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xProp.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xProp.30.1</xsl:text>
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
    </section1>
   
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
   
</xsl:template>
</xsl:stylesheet>
