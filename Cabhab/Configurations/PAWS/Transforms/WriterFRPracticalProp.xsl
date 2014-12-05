<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="prop">
    <section1 id="sProp">
        <secTitle>Noms propres</secTitle>
       <p contentType="ctPracticalIntro">
<xsl:text>Les noms propres sont une espèce spéciale de substantif ou de syntagme qui fonctionne dans la syntaxe tout comme les autres substantifs ou syntagmes nominaux.</xsl:text>
</p>
       <p contentType="ctComparativeIntro">
<xsl:text>Les noms propres sont une espèce spéciale de substantif ou de syntagme qui fonctionne dans la syntaxe tout comme les autres substantifs ou syntagmes nominaux.  En français, certains nom propres peuvent se présenter seuls, comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Susanne</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Russie</langData>
<xsl:text>.  D’autres sont comme les substantifs composés, tels que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>George Washington</langData>
<xsl:text>.  Les noms propres peuvent aussi contenir des articles et/ou des syntagmes </xsl:text>
<xsl:choose>
                <xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
                <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
                <xsl:when test="//pp/@pPos='both'">prépositionnels ou postpositionnels</xsl:when>
                <xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
            </xsl:choose>
<xsl:text> comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>les Etats-Unis d’Amérique</langData>
<xsl:text>.  Bien des langues exigent un article devant un nom.  Les appositifs se présentent, parfois avec un possesseur, comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mon fils, David</langData>
<xsl:text> mais on les traitera plus tard dans la section </xsl:text>
<sectionRef sec="sCoordAppositive" />
<xsl:text>.  En plus, les noms propres peuvent être modifiés par des adjectifs et des propositions relatives, comme dans  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>la belle France</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>la Susanne Leblanc que je connais</langData>
<xsl:text>.</xsl:text>
</p>
        <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//prop/@pnClassifier)='yes'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> les noms propres portent des classificateurs comme les substantifs comme partie du système de concorde.</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//prop/@pnClassifier)='no'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> les noms propres ne portent pas de classificateurs comme le font les substantifs comme partie du système de concorde.</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<p>
<xsl:text>Les nom propres en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
            <xsl:when test="//prop/@pnDeterminer='none'"> ne peuvent pas</xsl:when>
            <xsl:when test="//prop/@pnDeterminer='no'"> peuvent mais ne sont pas obligés de</xsl:when>
            <xsl:when test="//prop/@pnDeterminer='yes'"> doivent</xsl:when>
       </xsl:choose>
<xsl:text> contenir </xsl:text>
<xsl:choose>
          <xsl:when test="//np/@artAndDem='article'">un article</xsl:when>
           <xsl:when test="//np/@artAndDem='demonstrative'">un démonstratif</xsl:when>
           <xsl:when test="//np/@artAndDem='both'">un article et/ou un démonstratif</xsl:when>
</xsl:choose>
<xsl:text> ou un possesseur.</xsl:text>
</p>
</xsl:if>
       <p>
<xsl:text>Des exemples avec des noms propres simples et composés en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> comprennent:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Des exemples de noms propres avec syntagmes </xsl:text>
<xsl:choose>
                <xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
                <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
                <xsl:when test="//pp/@pPos='both'">prépositionnels ou postpositionnels</xsl:when>
                <xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
            </xsl:choose>
<xsl:text> en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> comprennent:</xsl:text>
</p>
        <example num="xProp.20">
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
<xsl:with-param name="sExNumber">xProp.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xProp.20.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Des exemples de noms propres modifiés par des propositions relatives comprises dans des phrases simples mais complètes sont:</xsl:text>
</p>
        <example num="xProp.24">
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
<xsl:with-param name="sExNumber">xProp.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xProp.24.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
