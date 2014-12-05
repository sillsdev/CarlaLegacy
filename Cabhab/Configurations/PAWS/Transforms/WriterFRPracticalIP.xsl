<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="ip">
	<section1 id="sIP">
		<secTitle>Phrases simples</secTitle>
		<p>
<xsl:text>Cette section traite les phrases copulatives, intransitives, transitives, ditransitives, impératives, subjonctives, conditionnelles, passives et causatives; chaque phrase selon son ordre fondamental (c’est à dire sans changement dû au focus, thème, ou constructions interrogatives ou négatives).  Comme on a noté dans la section </xsl:text>
<sectionRef sec="sIntro" />
<xsl:text>,  en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> la typologie est </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@wordOrder='SVO'">SVO, alors l’ordre fondamental des mots est: le sujet, puis des éléments auxiliaires, puis le syntagme verbal qui comprend le verbe en position initiale et les compléments qui suivent.</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">SOV, alors l’ordre fondamental des mots est: le sujet, suivi par le syntagme verbal qui comprend le verbe en position finale et des compléments qui le précèdent, puis les éléments auxiliaires.</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">VSO, alors l’ordre fondamental des mots est: le verbe en position initiale, puis le sujet, puis les compléments.</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">VOS, alors l’ordre fondamental des mots est: le syntagme verbal qui comprend le verbe en position initiale et les compléments qui suivent, puis les éléments auxiliaires, puis le sujet.</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">OVS, alors l’ordre fondamental des mots est: le syntagme verbal qui comprend le verbe en position finale avec les compléments qui le précèdent, puis les éléments auxiliaires, puis le sujet.</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">OSV, alors l’ordre fondamental des mots est celui-ci: d’abord les compléments verbaux, puis le sujet, puis le verbe en position finale.</xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' or normalize-space(//typology/@wordOrder)='OSV'">
				<xsl:text>  Les changements de l’ordre des mots avec les auxiliaires présents ont été discutées dans la section</xsl:text>
				<sectionRef sec="sIPAux" />
				<xsl:text>.</xsl:text>
			</xsl:if>
<xsl:text></xsl:text>
</p>
		<p>
<xsl:text>Chaque type de phrase est traité ici à son tour.</xsl:text>
</p>

	   <section2 id="sIPCop">
	   	<secTitle>Copulatifs</secTitle>

	   	<p>
<xsl:text>Les constructions copulatives comprennent celles qui ont un verbe copulatif, ou un verbe de perception, plus des comparatifs et des existentiels.</xsl:text>
</p>
		  <p contentType="ctComparativeIntro">
<xsl:text>Dans les phrases copulatives authentiques il peut y avoir un adjectif, ou bien un syntagme adpositionnel ou nominal qui suit le verbe copulatif. Dans certaines langues la présence d’un verbe copulatif ou d’un auxiliaire n’est pas nécessaire. Voici des exemples en français: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>La fille est belle</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Suzanne est malade</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ma soeur est à l’hôpital</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Il est le chef</langData>
<xsl:text>.</xsl:text>
</p>
	      <p>
<xsl:text>Voici des exemples de phrases copulatives en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
	      <example num="xIP.IPCop.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/copularExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/copularExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/copularExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/copularExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.10.1</xsl:text>
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
	      <xsl:if test="normalize-space(//ip/@copular)='yes' or normalize-space(//ip/@copular)='optional'">
<p>
<xsl:text>Comme le montrent les exemples, </xsl:text>
<xsl:choose>
			 	<xsl:when test="//ip/@copular='yes'">un verbe copulatif est nécessaire </xsl:when>
			 	<xsl:when test="//ip/@copular='optional'">un verbe copulatif est facultatif </xsl:when>
			 </xsl:choose>
<xsl:text>dans des phrases copulatives en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>. Les verbes copulatifs sont: </xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@copular)='yes' or normalize-space(//ip/@copular)='optional'">
<example num="xIP.IPCop.14">
<table border="1">
	            <tr>
	            	<th>Verbes copulatifs</th>
	               <th>Glose</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularVerb),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@copular)='no'">
<p>
<xsl:text>Comme le montrent les exemples, dans les phrases copulatives en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> il n’y a pas de verbe copulatif.  </xsl:text>
<xsl:choose>
	         	<xsl:when test="//ip/@copularAffix='no'">Il n’y a pas d’affixe copulatif au prédicat nominal ni au prédicat adjectival.</xsl:when>
	         	<xsl:when test="//ip/@copularAffix='yesPrefix'">Par contre  il y a un préfixe copulatif au prédicat nominal ou au prédicat adjectival. Ce préfixe est:</xsl:when>
	         	<xsl:when test="//ip/@copularAffix='yesSuffix'">Par contre  il y a un préfixe copulatif au prédicat nominal ou au prédicat adjectival. Ce préfixe est:</xsl:when>
	         	<xsl:when test="//ip/@copularAffix='yesEither'">Par contre  il y a ou bien un préfixe copulatif ou bien un suffix copulatif  au prédicat nominal ou au prédicat adjectival. Ce préfixe est:</xsl:when>
	         </xsl:choose>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@copular)='no' and normalize-space(//ip/@copularAffix)='yesPrefix'">
<example num="xIP.IPCop.18">
<table border="1">
	            <tr>
	            	<th>Préfixe copulatif</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@copular)='no' and normalize-space(//ip/@copularAffix)='yesSuffix'">
<example num="xIP.IPCop.20">
<table border="1">
	            <tr>
	            	<th>Suffixe copulatif</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@copular)='no' and normalize-space(//ip/@copularAffix)='yesEither'">
<example num="xIP.IPCop.22">
<table border="1">
	            <tr>
	            	<th>Affixes copulatifs</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>
	      
	      <xsl:if test="normalize-space(//ip/@copular)='optional'">
<p>
<xsl:text>  Il </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@copularAffix='no'">n’y a pas d’affixe copulatif au nominal prédicatif ni à l’adjectif prédicatif qui existe quand le verbe copulatif est absent.</xsl:when>
					<xsl:when test="//ip/@copularAffix='yesPrefix'">y a aussi un préfix copulatif au nominal prédicatif  ou à l’adjectif prédicatif qui existe quand il n’y a pas de verbe copulatif. Ce préfixe est:</xsl:when>
					<xsl:when test="//ip/@copularAffix='yesSuffix'">y a aussi un suffixe copulatif au nominal prédicatif ou à l’adjectif prédicatif qui existe quand il n’y a pas de verbe copulatif. Ce suffixe est:</xsl:when>
					<xsl:when test="//ip/@copularAffix='yesEither'">y a ou bien un préfixe copulatif ou un suffixe copulatif au nominal prédicatif ou à l’adjectif prédicatif qui existe quand le verbe copulatif est absent. Ces affixes sont:</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@copular)='optional' and normalize-space(//ip/@copularAffix)='yesPrefix'">
<example num="xIP.IPCop.26">
<table border="1">
	            <tr>
	            	<th>Préfixe copulatif</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@copular)='optional' and normalize-space(//ip/@copularAffix)='yesSuffix'">
<example num="xIP.IPCop.28">
<table border="1">
	            <tr>
	            	<th>Suffixe copulatif</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@copular)='optional' and normalize-space(//ip/@copularAffix)='yesEither'">
<example num="xIP.IPCop.30">
<table border="1">
	            <tr>
	            	<th>Affixes copulatifs</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>
	      
	   	<p contentType="ctComparativeIntro">
<xsl:text>Contrairement aux verbes copulatifs, les verbes de perception permettent d’habitude seulement un syntagme adjectival qui suit, sauf dans les constructions superlatives où un syntagme nominal suit un verbe de perception, comme dans la prochaine section. Voici quelques exemples en français de verbes de perception: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>La fille a l’aire joli</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Elle semble sympathique</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>l’eau paraît trouble</langData>
<xsl:text>.</xsl:text>
</p>
		  <p>
<xsl:text>Voici quelques exemples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de phrases qui contiennent des verbes de perception:</xsl:text>
</p>
		  <example num="xIP.IPCop.36">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/perceptionExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/perceptionExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/perceptionExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/perceptionExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.36</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.36.1</xsl:text>
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
<xsl:text>Et les verbes copulatifs et les verbes de perception peuvent contenir un syntagme adjectival comme complément, là où une phrase ou bien une proposition complétive suit l’adjectif. On traitera ces constructions dans la section </xsl:text>
<sectionRef sec="sCompRaising" />
<xsl:text>.
		  </xsl:text>
</p>
		  <section3 id="sIPComparatives">
		  	<secTitle>Comparatifs et superlatifs</secTitle>
		  	<p>
<xsl:text>Les comparatifs sont une sous-catégorie des phrases copulatives. Nous allons traiter deux types qui considèrent que deux parties sont égales, puis les comparatifs (où une partie est meilleure que l’autre), puis les superlatifs. Tous ces types peuvent d’habitude utiliser un verbe copulatif ou de perception. </xsl:text>
</p>
		  	<p contentType="ctComparativeIntro">
<xsl:text>Pour comparer des parties égales on peut utiliser un nom où un adjectif.  La construction nominale d’égalité utilise une expression qui veut dire </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « est le même Nom que »</xsl:text>
</gloss>
<xsl:text> entre deux syntagmes nominaux.  Voici quelques exemples en français: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Les rideaux semblent de la même couleur que les murs</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Votre sac à dos est de la même taille que le mien</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Suzanne a la même coupe de cheveux que Marie</langData>
<xsl:text>. </xsl:text>
</p>
		  	<p contentType="ctPracticalIntro">
<xsl:text>Pour comparer des parties égales on peut utiliser un nom où un adjectif.  La construction nominale d’égalité utilise une expression qui veut dire </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « est le même Nom que »</xsl:text>
</gloss>
<xsl:text> entre deux syntagmes nominaux.</xsl:text>
</p>
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
<xsl:choose>
		     	<xsl:when test="//ip/@same='yes'"> il y a un mot de degré comparatif qui signifie « même »; on l’utilise avec le nom de comparaison dans des phrases qui comparent les choses égales, comme le montre le tableau suivant.</xsl:when>
		     	<xsl:when test="//ip/@same='attaches'"> on attache au nom de comparaison dans les phrases de parties égales un affixe ou clitique de degré comparatif qui signifie « même », comme le montre le tableau suivant.</xsl:when>
		     	<xsl:when test="//ip/@same='no'"> il n’y a pas de mot de degré comparatif qui signifie « même ». Seule la présence des deux syntagmes nominaux et le nom de comparaison accompagné du prédicat copulatif se trouve dans les phrases de comparaison à parts égales.</xsl:when>
			 </xsl:choose>
</p>

			 <xsl:if test="normalize-space(//ip/@same)='yes'">
<example num="xIP.IPCop.IPComparatives.12">
<table border="1">
				   <tr>
				   	<th>Nom égal mot de degré comparatif </th>
					  <th>Glose</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/sameWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>même</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>même</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>

			 <xsl:if test="normalize-space(//ip/@same)='attaches'">
<example num="xIP.IPCop.IPComparatives.14">
<table border="1">
				   <tr>
				   	<th>Nom égal affixe de degré comparatif </th>
					  <th>Glose</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/sameAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>même</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>même</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
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
<xsl:choose>
			 	<xsl:when test="//ip/@compareN='yes'"> on utilise dans les phrases de comparaison à parties égales la conjonction comparatif « que » avant le deuxième syntagme nominal:</xsl:when>
			 	<xsl:when test="//ip/@compareN='no'"> il n’y a pas de conjonction comparatif « que » avant le deuxième syntagme nominal dans les phrases de comparaison à parties égales.</xsl:when>
			 </xsl:choose>
</p>

			 <xsl:if test="normalize-space(//ip/@compareN)='yes'">
<example num="xIP.IPCop.IPComparatives.18">
<table border="1">
				   <tr>
				   	<th>Nom égal conjonction comparatif</th>
					  <th>Glose</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/compareNExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>que</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>que</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			 <p>
<xsl:text>Voici quelques exemples de phrases qui expriment la construction nominale à parties égales en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
			 <example num="xIP.IPCop.IPComparatives.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/sameExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/sameExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/sameExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/sameExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.22.1</xsl:text>
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
		  	<p contentType="ctComparativeIntro">
<xsl:text>Le deuxième type de comparaison de choses égales utilise un adjectif pour faire la comparaison. Cette construction utilise une formule signifiant </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « est aussi Adjectif que »</xsl:text>
</gloss>
<xsl:text> entre les deux syntagmes nominaux. En voici  des exemples: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jean est aussi amical que Guillaume</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Suzanne est aussi vite que Marie</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>David paraît aussi grand que Michel</langData>
<xsl:text>.</xsl:text>
</p>
		  	<p contentType="ctPracticalIntro">
<xsl:text>Le deuxième type de comparaison de choses égales utilise un adjectif pour faire la comparaison. Cette construction utilise une formule signifiant </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « est aussi Adjectif que »</xsl:text>
</gloss>
<xsl:text> entre les deux syntagmes nominaux.</xsl:text>
</p>
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
<xsl:choose>
		     	<xsl:when test="//ip/@as='yes'"> il y a un mot de degré comparatif qui signifie « aussi », qu’on utilise avec l’adjectif de comparaison, comme le montre le tableau suivant.</xsl:when>
		     	<xsl:when test="//ip/@as='no'"> il n’y a pas de mot de degree comparatif qui signifie « aussi ». Le sens est implicite dans l’adjectif des phrases de comparaison qui comprennent la comparaison de parties égales.</xsl:when>
			 </xsl:choose>
</p>

			 <xsl:if test="normalize-space(//ip/@as)='yes'">
<example num="xIP.IPCop.IPComparatives.30">
<table border="1">
				   <tr>
				   	<th>Mot de degré comparatif à adjectif égal</th>
					  <th>Glose</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/asWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>aussi</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>aussi</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
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
<xsl:choose>
			 	<xsl:when test="//ip/@compareAdj='yes'"> on utilise la conjunction comparatif qui signifie « que » avant le deuxième syntagme nominal: </xsl:when>
			 	<xsl:when test="//ip/@compareAdj='no'"> il n’y a pas de conjunction comparatif qui signifie « que » avant le deuxième syntagme nominal dans les phrases qui comprennent une comparaison d’adjectifs qualitatifs égaux.</xsl:when>
			 </xsl:choose>
</p>

			 <xsl:if test="normalize-space(//ip/@compareAdj)='yes'">
<example num="xIP.IPCop.IPComparatives.34">
<table border="1">
				   <tr>
				   	<th>Conjonction comparatif à adjectif égal</th>
					  <th>Glose</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/compareAdjExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>que</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>que</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			 <p>
<xsl:text>Voici des exemples de phrases en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> qui expriment la construction adjectivale d’égalité:</xsl:text>
</p>
			 <example num="xIP.IPCop.IPComparatives.38">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/asExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/asExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/asExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/asExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.38</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.38.1</xsl:text>
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

		  	<p contentType="ctComparativeIntro">
<xsl:text>Les comparatifs où une partie est meilleure que l’autre comparent deux syntagmes nominaux; ils utilisent un mot comparatif </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>que</langData>
<xsl:text> et comprennent un verbe copulatif ou de perception. Il y a un marqueur de degré avec le prédicat adjectival ou le syntagme nominal. Dans certaines langues ce marqueur de degré peut être un mot indépendent ou bien un affixe au prédicat adjectival, comme le montrent ces exemples en français: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jean est plus beau que Guillaume</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Suzanne est une coureuse plus faible que Marie</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>David paraît plus grand que Michel</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Marie a l’air plus jolie que Juliette</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jean semble moins certain de ses réponses que Suzanne</langData>
<xsl:text>.</xsl:text>
</p>
		  	<p contentType="ctComparativeIntro">
<xsl:text>Notez qu’il y a une copule implicite qui suit le syntagme nominal final des exemples en français. Un type de comparatif plus complexe à une phrase visible au lieu du deuxième syntagme nominal. On examinera ces phénomènes en-dessous.</xsl:text>
</p>
		  	<p contentType="ctPracticalIntro">
<xsl:text>Les comparatifs où une partie est meilleure que l’autre comparent deux syntagmes nominaux en utilisant un mot comparatif </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>que</langData>
<xsl:text>; ils comprennent un verb copulatif ou de perception. Il y a un marqueur de degré avec le prédicat adjectival ou le syntagme nominal. </xsl:text>
</p>
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
<xsl:choose>
		     	<xsl:when test="//ip/@comparative='yes'"> il y a une conjunction comparatif qui signifie « que » qu’on utilise dans les comparaisons où une partie est meilleure que l’autre, comme le montre le tableau suivant.</xsl:when>
		     	<xsl:when test="//ip/@comparative='no'"> il n’y a pas de conjonction comparatif qui signifie « que ».  Seule la présence des deux syntagmes nominaux et le mot de degré avec le prédicat copulatif annonce un comparatif où une partie est meilleure que l’autre.</xsl:when>
			 </xsl:choose>
</p>

			 <xsl:if test="normalize-space(//ip/@comparative)='yes'">
<example num="xIP.IPCop.IPComparatives.48">
<table border="1">
				   <tr>
				   	<th>Conjonction comparatif</th>
					  <th>Glose</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/comparativeWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>que</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>que</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
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
<xsl:text> </xsl:text>
<xsl:choose>
			 	<xsl:when test="//ip/@comparativeAdj='no'"> il n’y a pas d’affixe pour exprimer le degré de comparaison au prédicat adjectival. On utilise un mot de degré comparatif à part avec les prédicats adjectivaux et les syntagmes nominaux. </xsl:when>
			 	<xsl:when test="//ip/@comparativeAdj='yes'"> un affixe ou plusieurs exprime(nt) le degré de comparaison au prédicat adjectival; pour faire des comparaisons on utilise un affixe pour le prédicat adjectival.  </xsl:when>
			 	<xsl:when test="//ip/@comparativeAdj='both'">un affixe ou plusieurs peut/peuvent exprimer le degré de comparaison aux adjectifs attributs. Cependant pour les comparaisons, certains adjectifs attributs utilisent les affixes, d’autres utilisent les mots de degré individuels. </xsl:when>
			 </xsl:choose>
</p>
		  	<xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<p>
<xsl:text> Les affixes de degré comparatifs qu’on utilise sur le prédicat adjectival sont</xsl:text>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<example num="xIP.IPCop.IPComparatives.54">
<table border="1">
				   <tr>
				   	<th>Affixes de degré comparatifs</th>
					  <th>Glose</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/comparativeAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
		  	<xsl:if test="normalize-space(//ip/@comparativeAdj)='no' or normalize-space(//ip/@comparativeAdj)='both'">
<p>
<xsl:text>Les mots de degré comparatif qu’on utilise avec un prédicat adjectival et un prédicat nominal sont:</xsl:text>
</p>
</xsl:if>
		  	<xsl:if test="normalize-space(//ip/@comparativeAdj)='yes'">
<p>
<xsl:text>Les mots de degré comparatif qu’on utilise avec un prédicat nominal sont:</xsl:text>
</p>
</xsl:if>
			 <example num="xIP.IPCop.IPComparatives.60">
<table border="1">
				   <tr>
				   	<th>Mots de degré comparatifs</th>
					  <th>Glose</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/comparativeDegExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>

			 <p>
<xsl:text>Voici quelques exemples de phrases en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> qui expriment la comparaison, où une partie est meilleure que l’autre:</xsl:text>
</p>
			 <example num="xIP.IPCop.IPComparatives.64">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/comparativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/comparativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/comparativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/comparativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.64</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.64.1</xsl:text>
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
		  	<p contentType="ctComparativeIntro">
<xsl:text>Maintenant considérez les comparatifs qui ont une phrase de chaque côté du mot comparatif, bien que l’adjectif manque peut-être  à la deuxième phrase. Comme les comparatifs plus courts, ceux-ci comparent les caractéristiques ou les actions des sujets des phrases; ils peuvent avoir un verbe copulatif ou un verbe de perception accompagné d’un adjectif modifié par un mot de degré ou d’un affixe. Quelques exemples en anglais sont donnés ici; ces constructions ne sont pas utilisées en français.
		  	</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John is more handsome than Bill is</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « Jean est plus beau que (ne l’est) Bill »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue runs much faster than Mary can run</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « Sue court beaucoup plus vite que Mary (peut courir) »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>David appears lots shorter than Michael does</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « David paraît beaucoup plus court que Michael (paraît) »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mary looks prettier than Julie looks</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « Mary paraît plus jolie que Julie (ne le paraît) »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John seems less certain of his answers than Sue seems</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « John semble moins certain de ses réponses que Sue (semble) »</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
		  	<p contentType="ctComparativeIntro">
<xsl:text>Certaines langues ne permettent pas l’absence d’une partie de la deuxième phrase; par contre, la comparaison se fait avec deux phrases complètes. En plus, les langues qui n’ont pas de mot comparatif indépendant </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>« que »</xsl:text>
</gloss>
<xsl:text> pour les constructions comparatives plus courtes auront deux parties successifs.
		        </xsl:text>
</p>
		  	<p contentType="ctPracticalIntro">
<xsl:text>Considérez les comparatifs qui ont deux phrases qui entourent la conjonction comparative, bien que l’adjectif  manque à la deuxième phrase. 
		     </xsl:text>
</p>
		  	<p>
<xsl:text>Dans ces comparaisons plus complètes en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
		  		<xsl:when test="//ip/@gap='yes'"> l’absence de l’adjectif dans la deuxième partie est permis. </xsl:when>
		  		<xsl:when test="//ip/@gap='no'"> la phrase complète doit être répétée pour la deuxième partie, y compris l’adjectif. </xsl:when>
		        </xsl:choose>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
		          	<xsl:when test="//ip/@comparative='yes'"> il y a une conjonction comparative qui signifie « que » qui s’emploie dans la construction courte et la construction plus longue, comme le montrent les exemples ci-dessus. </xsl:when>
		          	<xsl:when test="//ip/@comparative='no'"> il n’y a pas pas de conjonction de comparaison qui significe « que »; donc cette comparaison veut que les deux phrases se succèdent directement.</xsl:when>
		           </xsl:choose>
</p>
		        <p>
<xsl:text>Voici des exemples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de ces phrases de comparaison plus longue:</xsl:text>
</p>
		        <example num="xIP.IPCop.IPComparatives.76">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/comparativeSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/comparativeSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/comparativeSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/comparativeSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.76</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.76.1</xsl:text>
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
		        
		  	<p contentType="ctComparativeIntro">
<xsl:text>Les superlatifs sont une autre sous-catégorie de phrase copulative, liés directement aux comparatifs. Ils comparent un syntagme nominal à un groupe, qui peut s’exprimer comme un syntagme </xsl:text>
<xsl:choose>
		        	<xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
		           <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
		           <xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
		           <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
		        </xsl:choose>
<xsl:text>, ou s’exprimer implicitement. Tout comme les comparatifs, les superlatifs comprennent quel que soit le copule utilisé par la langue, ou bien un verbe de perception, accompagné d’un marqueur spécifique du degré superlatif au prédicat adjectival ou au syntagme nominal. Dans certaines langues le degré qui marque le superlatif peut être un mot indépendent, ou bien un affixe au prédicat adjectival.  Ceci est illustré dans les exemples de anglais: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John is the most handsome of the boys</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jean est le plus beau des garçons »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue is the worst runner (in the class)</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Suzanne est la pire coureuse (de la classe) »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>David appears the tallest (of all)</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « David semble le plus grand (de tous) »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mary looks prettiest</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Marie a l’air le plus joli »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John seems the least certain of his answers of all my students</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jean semble le moins confiant de ses réponses de tous mes étudiants »</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
		  	<p contentType="ctPracticalIntro">
<xsl:text>Les superlatifs sont une autre sous-catégorie de phrases copulatives, directement liés aux comparatifs.  Ils comparent un syntagme nominal à un groupe, qui peut s’exprimer comme un syntagme </xsl:text>
<xsl:choose>
		        	<xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
		        	<xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
		        	<xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
		        	<xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
		        </xsl:choose>
<xsl:text>, ou s’exprimer implicitement.</xsl:text>
</p>
		     
		  	<p>
<xsl:text>Tout comme les comparatifs en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
		  		<xsl:when test="//ip/@comparativeAdj='no'">il n’y a pas d’affixe qui exprime le degré de superlatif au prédicat adjectival. On utilise un mot distinct de degré superlatif pour les adjectifs du prédicat et pour les syntagmes nominaux.</xsl:when>
		  		<xsl:when test="//ip/@comparativeAdj='yes'">un affixe - ou plusieurs -  exprime le degré superlatif au prédicat adjectival, et on en utilise un avec le prédicat adjectival dans les expressions superlatifs.  </xsl:when>
		  		<xsl:when test="//ip/@comparativeAdj='both'">un affixe  - ou même plusieurs – peut exprimer le degré superlatif aux adjectifs du  prédicat.  Cependant, certains adjectifs du prédicat utilisent les affixes; d’autres utilisent les mots distincts de degré superlatif. </xsl:when>
			 </xsl:choose>
</p>
		  	<xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<p>
<xsl:text>Les affixes de degré superlatif qu’on utilise attachés aux adjectifs du prédicat sont</xsl:text>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<example num="xIP.IPCop.IPComparatives.86">
<table border="1">
				   <tr>
				   	<th>Affixes de degré superlatif</th>
					  <th>Glose</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/superlativeAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
		  	<xsl:if test="normalize-space(//ip/@comparativeAdj)='no' or normalize-space(//ip/@comparativeAdj)='both'">
<p>
<xsl:text> Les mots de degré superlatif qu’on utilise attachés aux adjectifs du prédicat sont:</xsl:text>
</p>
</xsl:if>
		  	<xsl:if test="normalize-space(//ip/@comparativeAdj)='yes'">
<p>
<xsl:text>Les mots de degré superlatif qu’on utilise attachés aux prédicats nominaux sont:</xsl:text>
</p>
</xsl:if>
			 <example num="xIP.IPCop.IPComparatives.92">
<table border="1">
				   <tr>
				   	<th>Mots de degré superlatif</th>
					  <th>Glose</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/superlativeDegExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>

			 <p>
<xsl:text>Voici des exemples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de phrases superlatives:</xsl:text>
</p>
			 <example num="xIP.IPCop.IPComparatives.96">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/superlativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/superlativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/superlativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/superlativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.96</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.96.1</xsl:text>
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
		  </section3>

		  <section3 id="sIPExistentials">
			 <secTitle>Existentiels</secTitle>

		  	<p contentType="ctComparativeIntro">
<xsl:text>Les phrases existentielles ressemblent les phrases copulatives, sauf qu’elles utilisent un mot ou plusieurs mots pour exprimer </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>il y a</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>il existe</langData>
<xsl:text> avec un syntagme nominal et – souvent – un lieu. Voici des exemples en français: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Il y a un livre sur la table</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Il y a deux hommes dehors</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Il n’y a plus de nourriture</langData>
<xsl:text>.</xsl:text>
</p>
		  	<p contentType="ctComparativeIntro">
<xsl:text>Au lieu de cela certaines langues ont un verbe existentiel distinct, comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>hay</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « il existe »</xsl:text>
</gloss>
<xsl:text> en espagnol. D’autres langues ont une série de verbes existentiels qui expriment la position de l’objet décrit.</xsl:text>
</p>
		  	<p contentType="ctPracticalIntro">
<xsl:text>Les phrases existentielles se distinguent des phrases copulatives; elles contiennent des verbes existentiels spécifiques et/ou des mots accompagnés d’un syntagme nominal et d’un lieu. </xsl:text>
</p>

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
<xsl:if test="normalize-space(//ip/existNone/@checked)='yes'">
<xsl:text> on ne distingue aucunement les phrases existentielles. Elles ressemblent aux phrases copulatives citées ci-dessus dans la section </xsl:text>
<sectionRef sec="sIPCop" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existVerb/@checked)='no' and normalize-space(//ip/existPosition/@checked)='no'">
<xsl:text> il y a un mot existentiel indépendent (ou plusieurs) qui veut dire </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>il y a</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>il existe</langData>
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='no' and normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existPosition/@checked)='no'">
<xsl:text> il y a un verbe ou plusieurs qu’on utilise spécifiquement dans les phrases existentielles, et ces verbes expriment pleinement l’existentiel.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existPosition/@checked)='no'">
<xsl:text> il y a un verbe ou plusieurs qu’on utilise spécifiquement dans les phrases existentielles, et il y a un mot existentiel indépendent (ou plusieurs) qui veut dire </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>il y a</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>il existe</langData>
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='no' and normalize-space(//ip/existVerb/@checked)='no' and normalize-space(//ip/existPosition/@checked)='yes'">
<xsl:text> il y a une série de verbes existentiels qui expriment la position de l’objet. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existVerb/@checked)='no' and normalize-space(//ip/existPosition/@checked)='yes'">
<xsl:text> il y a un mot existentiel indépendent (ou plusieurs) qui veut dire </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>il y a</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>il existe</langData>
<xsl:text> et une série de verbes existentiels qui expriment la position de l’objet.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='no' and normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existPosition/@checked)='yes'">
<xsl:text> il y a un verbe ou plusieurs utilisés surtout dans les phrases existentielles, accompagné d’une série de verbes existentiels qui expriment la position de l’objet.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existPosition/@checked)='yes'">
<xsl:text> il y a un verbe ou plusieurs utilisé surtout dans les phrases existentielles, et il y a aussi un mot existentiel indépendent (ou plusieurs) qui veut dire </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>il y a</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>il existe</langData>
<xsl:text>, accompagné d’une  série de verbes existentiels qui expriment la position de l’objet.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='no' and normalize-space(//ip/existVerb/@checked)='no' and normalize-space(//ip/existPosition/@checked)='no' and normalize-space(//ip/existOther/@checked)='yes'">
<xsl:text> les phrases existentielles sont marquées par ___</xsl:text>
<xsl:value-of select="//ip/existOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existOther/@checked)='yes' or normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existOther/@checked)='yes' or normalize-space(//ip/existPosition/@checked)='yes' and normalize-space(//ip/existOther/@checked)='yes'">
<xsl:text>  Les phrases existentielles sont aussi marquées par ___</xsl:text>
<xsl:value-of select="//ip/existOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
		  	<xsl:if test="normalize-space(//ip/existVerb/@checked)='yes'">
<p>
<xsl:text>Les verbes utilisés dans les phrases existentielles en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont:</xsl:text>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//ip/existVerb/@checked)='yes'">
<example num="xIP.IPCop.IPExistentials.14">
<table border="1">
				   <tr>
				   	<th>Verbes existentiels</th>
					  <th>Glose</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/existVerbExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
		  	<xsl:if test="normalize-space(//ip/existWord/@checked)='yes'">
<p>
<xsl:text>Les mots existentiels qui signifient </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>il y a</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>il existe</langData>
<xsl:text> utilisés dans les phrases existentielles sont:</xsl:text>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//ip/existWord/@checked)='yes'">
<example num="xIP.IPCop.IPExistentials.18">
<table border="1">
				   <tr>
				   	<th>Mots existentiels</th>
					  <th>Glose</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/existWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
		  	<xsl:if test="normalize-space(//ip/existPosition/@checked)='yes'">
<p>
<xsl:text>Les verbes existentiels qui marquent la position de l’objet sont:</xsl:text>
</p>
</xsl:if>
		     <xsl:if test="normalize-space(//ip/existPosition/@checked)='yes'">
<example num="xIP.IPCop.IPExistentials.22">
<table border="1">
		           <tr>
		           	<th>Verbes existentiels de position</th>
		              <th>Glose</th>
		           </tr>
		           <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/existPositionExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		        </table>
</example>
</xsl:if>
		  	<xsl:if test="normalize-space(//ip/existOther/@checked)='yes'">
<p>
<xsl:text>Les marqueurs spéciaux pour les phrases existentielles en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont:</xsl:text>
</p>
</xsl:if>
		     <xsl:if test="normalize-space(//ip/existOther/@checked)='yes'">
<example num="xIP.IPCop.IPExistentials.26">
<table border="1">
		           <tr>
		           	<th>Marqueurs existentiels</th>
		              <th>Glose</th>
		           </tr>
		           <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/existOtherExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		        </table>
</example>
</xsl:if>
		     <p>
<xsl:text>Voici des exemples de phrases existentielles en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> :</xsl:text>
</p>
			 <example num="xIP.IPCop.IPExistentials.30">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/existExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/existExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/existExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/existExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPExistentials.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPExistentials.30.1</xsl:text>
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

		  </section3>

	   </section2>

	   <section2 id="sIPMotion">
	   	<secTitle>Verbes intransitifs et constructions de mouvement</secTitle>
		  <p contentType="ctComparativeIntro">
<xsl:text>Les verbes intransitifs simples n’ont pas de compléments après le verbe, par exemple: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>La fille nage</langData>
<xsl:text>.  Beaucoup de verbes intransitifs ont un sujet-expérienceur au lieu d’un sujet-agent, comme par exemple </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ma sœur a ri</langData>
<xsl:text>.  </xsl:text>
</p>  
	      <p contentType="ctPracticalIntro">
<xsl:text>Les verbes intransitifs simples n’ont pas de compléments après le verbe.  Le sujet peut être un sujet-agent ou un sujet-expérienceur, selon le verbe.</xsl:text>
</p>  
	      <p>
<xsl:text>On trouve des exemples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de phrases intransitives simples avec un sujet-agent à </xsl:text>
<exampleRef num="xIntranAgentNP" equal="no" letterOnly="no" />
<xsl:text>-</xsl:text>
<exampleRef num="xIntranAgentPron" equal="no" letterOnly="no" />
<xsl:text>.  Un syntagme nominal ou un nom propre tient la position du sujet à </xsl:text>
<exampleRef num="xIntranAgentNP" equal="no" letterOnly="no" />
<xsl:text>; à </xsl:text>
<exampleRef num="xIntranAgentPron" equal="no" letterOnly="no" />
<xsl:text> le sujet est un pronom.</xsl:text>
</p>
		  <example num="xIntranAgentNP">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/intExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/intExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/intExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/intExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIntranAgentNP</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIntranAgentNP.1</xsl:text>
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
		  <example num="xIntranAgentPron">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/pnIntExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/pnIntExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/pnIntExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/pnIntExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIntranAgentPron</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIntranAgentPron.1</xsl:text>
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
<xsl:text>On trouve des exemples avec un sujet-expérienceur aux </xsl:text>
<exampleRef num="xIntranExperiencerNP" equal="no" letterOnly="no" />
<xsl:text>-</xsl:text>
<exampleRef num="xIntranExperiencerPron" equal="no" letterOnly="no" />
<xsl:text>.  Un syntagme  nominal ou un nom propre tient la position du sujet à </xsl:text>
<exampleRef num="xIntranExperiencerNP" equal="no" letterOnly="no" />
<xsl:text>; à </xsl:text>
<exampleRef num="xIntranExperiencerPron" equal="no" letterOnly="no" />
<xsl:text> le sujet est un pronom.</xsl:text>
</p>
		  <example num="xIntranExperiencerNP">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerIntExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerIntExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerIntExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerIntExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIntranExperiencerNP</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIntranExperiencerNP.1</xsl:text>
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
		  <example num="xIntranExperiencerPron">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerPnIntExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerPnIntExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerPnIntExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerPnIntExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIntranExperiencerPron</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIntranExperiencerPron.1</xsl:text>
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
	   	<p contentType="ctComparativeIntro">
<xsl:text>Les phrases avec un verbe de mouvement comprennent un lieu, sous la forme ou d’un adverbe ou d’un syntagme </xsl:text>
<xsl:choose>
			       	<xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
			       	<xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
			       	<xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel</xsl:when>
			       	<xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
</xsl:choose>
<xsl:text>.  Voici des exemples de verbes de mouvement en français: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>La jeune fille a traversé la rivière</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ma mère est allée au magasin</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mon professeur est venu ici</langData>
<xsl:text>.</xsl:text>
</p>
	   	<p contentType="ctPracticalIntro">
<xsl:text>Les phrases avec un verbe de mouvement comprennent un lieu, sous la forme ou d’un adverbe ou d’un syntagme </xsl:text>
<xsl:choose>
	         	<xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
	         	<xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
	         	<xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel</xsl:when>
	         	<xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
	      <p>
<xsl:text>Voici des exemples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> qui comprennent les verbes de mouvement:</xsl:text>
</p>
		  <example num="xIP.IPMotion.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/motionExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/motionExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/motionExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/motionExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPMotion.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.26.1</xsl:text>
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
	   </section2>
	   <section2 id="sIPTrans">
	   	<secTitle>Phrases transitives et ditransitives</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>Voici des exemples en français de phrases transitives qui ont un sujet-agent: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Le garçon chasse la balle</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Le chien aurait pu enterrer son os</langData>
<xsl:text>.  Voici des exemples qui comprennent un sujet-expérienceur: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Le bébé veut ce jouet</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ma fille aime son cadeau</langData>
<xsl:text>.</xsl:text>
</p>
	   
	         <p>
<xsl:text>Voici des exemples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de phrases transitives avec un sujet-agent à </xsl:text>
<exampleRef num="xTranAgentNP" equal="no" letterOnly="no" />
<xsl:text>-</xsl:text>
<exampleRef num="xTranAgentPron" equal="no" letterOnly="no" />
<xsl:text>.  Les syntagmes ou noms propres remplissent la position du sujet et de l’objet direct à </xsl:text>
<exampleRef num="xTranAgentNP" equal="no" letterOnly="no" />
<xsl:text>, tandis qu’à </xsl:text>
<exampleRef num="xTranAgentPron" equal="no" letterOnly="no" />
<xsl:text> le sujet et l’objet direct sont des pronoms.</xsl:text>
</p>
	      
		  <example num="xTranAgentNP">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTranAgentNP</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTranAgentNP.1</xsl:text>
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
		  <example num="xTranAgentPron">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/pnExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/pnExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/pnExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/pnExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTranAgentPron</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTranAgentPron.1</xsl:text>
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
<xsl:text>Des exemples avec un sujet-expérienceur sont montrés aux </xsl:text>
<exampleRef num="xTranExperiencerNP" equal="no" letterOnly="no" />
<xsl:text>-</xsl:text>
<exampleRef num="xTranExperiencerPron" equal="no" letterOnly="no" />
<xsl:text>.  A </xsl:text>
<exampleRef num="xTranExperiencerNP" equal="no" letterOnly="no" />
<xsl:text>les syntagmes nominaux ou les noms propres remplissent la position du sujet et de l’objet direct, tandis qu’à </xsl:text>
<exampleRef num="xTranExperiencerPron" equal="no" letterOnly="no" />
<xsl:text> le sujet et l’objet direct sont des pronoms.</xsl:text>
</p>
	      <example num="xTranExperiencerNP">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTranExperiencerNP</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTranExperiencerNP.1</xsl:text>
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
	      <example num="xTranExperiencerPron">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/pnExperiencerExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/pnExperiencerExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/pnExperiencerExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/pnExperiencerExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTranExperiencerPron</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTranExperiencerPron.1</xsl:text>
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
		  <p contentType="ctComparativeIntro">
<xsl:text>Les phrases ditransitives peuvent avoir le deuxième objet formulé comme un syntagme  </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
</xsl:choose>
<xsl:text> ou comme un syntagme nominal. Certaines langues, comme l’anglais mais pas de français, permettent les deux par un mouvement au datif, exemple</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl gave the gift to her mother</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « La fille a donné le cadeau à sa mère »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl gave her mother the gift</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « La fille a donné le cadeau à sa mère »</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
	      <p>
<xsl:text>Dans les phrases ditransitives en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, le deuxième objet </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@diCat='pp'">est toujours un syntagme <xsl:choose>
						<xsl:when test="//pp/@pPos='before'">prépositionnel.</xsl:when>
						<xsl:when test="//pp/@pPos='after'">postpositionnel.</xsl:when>
						<xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel.</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">adpositionnel.</xsl:when>
					</xsl:choose>
						</xsl:when>
					<xsl:when test="//ip/@diCat='dp'">est toujours un syntagme nominal.  L’objet </xsl:when>
					<xsl:when test="//ip/@diCat='both'">peut être ou bien un syntagme <xsl:choose>
						<xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
						<xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
						<xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
					</xsl:choose>
						ou bien un syntagme nominal. Quand les deux objets sont des syntagmes nominaux, l’objet </xsl:when>
				</xsl:choose>
<xsl:if test="normalize-space(//ip/@diCat)!='pp'">
					<xsl:choose>
						<xsl:when test="//ip/@diOrder='direct'">direct</xsl:when>
						<xsl:when test="//ip/@diOrder='indirect'">indirect</xsl:when>
					</xsl:choose>
					<xsl:text> apparaît le plus proche du verbe.</xsl:text>
				</xsl:if>
</p>
	   	<p>
<xsl:text>  Voici quelques exemples de phrases ditransitives:</xsl:text>
</p>
			<example num="xIP.IPTrans.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/diExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/diExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/diExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/diExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPTrans.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.24.1</xsl:text>
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
	   </section2>
	   <section2 id="sIPImp">
	   	<secTitle>Impératifs</secTitle>
	   	<p>
<xsl:text>Les phrases impératives sont les ordres. En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> un sujet </xsl:text>
<xsl:if test="normalize-space(//ip/proDropImp/@checked)='yes'">
<xsl:text>peut être absent dans les phrases impératives, puisqu’on suppose que le verbe est à la deuxième personne.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>est nécessaire dans les phrases impératives.</xsl:text>
</xsl:if>
<xsl:text>  En voici quelques exemples:</xsl:text>
</p>
	      <example num="xIP.IPImp.6">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/impExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/impExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/impExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/impExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPImp.6</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPImp.6.1</xsl:text>
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
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
	      	<xsl:when test="//ip/@impPolite='yes'"> il y a aussi une forme polie pour les impératifs. Les exemples sont: </xsl:when>
	      	<xsl:when test="//ip/@impPolite='no'"> il n’y a pas de forme polie pour les impératifs.  </xsl:when>
	      </xsl:choose>
<xsl:text></xsl:text>
</p>
	      <xsl:if test="normalize-space(//ip/@impPolite)='yes'">
<example num="xIP.IPImp.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/impPoliteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/impPoliteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/impPoliteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/impPoliteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPImp.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPImp.10.1</xsl:text>
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
</xsl:if>
	   </section2>
	   
	   <section2 id="sIPConditional">
	      <secTitle>Conditionnels</secTitle>
	      
	   	<p contentType="ctComparativeIntro">
<xsl:text>Les conditionnels ont deux parties: une condition et une conséquence. La condition est présentée par un mot de condition, par exemple </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>si</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>quand</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>après</langData>
<xsl:text>, et se sépare avec un virgule. La conséquence peut être marquée par un mot qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>alors</langData>
<xsl:text> dans des examples où la comparaison vient en tête. Des exemples en français: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Si tu épargnes assez d’argent, alors tu pourras acheter cela</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Après que tu auras nettoyé ta chambre, alors tu pourras jouer</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Quand tu auras mangé tes legumes, je te donnerai le dessert</langData>
<xsl:text>.  
	   		La conséquence peut aussi se présenter avant la condition, dans quel cas la conséquence ne porte pas de marqueur, seule la condition le porte. Voici des exemples en français: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Tu peux acheter cela si tu as épargné assez d’argent</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Tu  pourras jouer avec tes amis quand tu auras nettoyé ta chambre</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Je te donnerai le dessert quand tu auras mangé tes légumes</langData>
<xsl:text>.</xsl:text>
</p>
	   	<p contentType="ctPracticalIntro">
<xsl:text>Les conditionnels ont deux parties: une condition et une conséquence. Les deux peuvent paraître dans n’importe quel ordre. </xsl:text>
</p>
	      
	         <p>
<xsl:text>Voici les exemples de conditionnels en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
	      <example num="xIP.IPConditional.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/conditionalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/conditionalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/conditionalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/conditionalExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPConditional.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPConditional.10.1</xsl:text>
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
	   	<xsl:if test="normalize-space(//ip/@conditionWord)='mood'">
<p>
<xsl:text>Comme le montrent les exemples, il n’y a pas de marqueur pour la condition en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, seulement la voix conditionnelle est marquée au verbe.</xsl:text>
</p>
</xsl:if>
	   	<xsl:if test="normalize-space(//ip/@conditionWord)='yes' or normalize-space(//ip/@conditionWord)='some'">
<p>
<xsl:text>Comme le montrent les exemples, la condition est </xsl:text>
<xsl:choose>
	      	<xsl:when test="//ip/@conditionWord='yes'">marquée par des mots indépendents qui viennent </xsl:when>
	      	<xsl:when test="//ip/@conditionWord='some'">marquée quelquefois par des mots indépendents qui viennent </xsl:when>
	      </xsl:choose>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='no' and normalize-space(//ip/conditionWordBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='no' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='no' and normalize-space(//ip/conditionWordAfter/@checked)='no' and normalize-space(//ip/conditionWordBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='no'">
<xsl:text>d’un côte ou de l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='no' and normalize-space(//ip/conditionWordBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='no' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='yes'">
<xsl:text>d’un côte ou de l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordOther/@checked)='no'">
<xsl:text> reste du syntagme conditionnel.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='no' and normalize-space(//ip/conditionWordAfter/@checked)='no' and normalize-space(//ip/conditionWordBoth/@checked)='no' and normalize-space(//ip/conditionWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//ip/conditionWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordOther/@checked)='yes' or normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordOther/@checked)='yes' or normalize-space(//ip/conditionWordBoth/@checked)='yes' and normalize-space(//ip/conditionWordOther/@checked)='yes'">
<xsl:text> reste du syntagme conditionnel et peut aussi se mettre ___ </xsl:text>
<xsl:value-of select="//ip/conditionWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  Les mots qui marquent la condition sont:</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@conditionWord)='yes' or normalize-space(//ip/@conditionWord)='some'">
<example num="xIP.IPConditional.16">
<table border="1">
	            <tr>
	            	<th>Mots de condition</th>
	               <th>Glose</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/conditionWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>     
	   	<xsl:if test="normalize-space(//ip/@conditionWord)='no' or normalize-space(//ip/@conditionWord)='some'">
<p>
<xsl:if test="normalize-space(//ip/@conditionWord)='no'">
<xsl:text>Comme le montrent les exemples, la condition est marquée par </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/@conditionWord)='some'">
<xsl:text>La condition peut aussi être marquée par </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='no'">
<xsl:text>des proclitiques qui s’attachent à la tête du mot qui commence le syntagme conditionnel.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='no'">
<xsl:text>des enclitiques qui s’attachent à la fin du mot qui termine le syntagme conditionnel.    </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='no'">
<xsl:text>des clitiques qui s’attachent à la tête du mot qui commence le syntagme conditionnel ou bien à la fin du mot qui termine le syntagme conditionnel.   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='no'">
<xsl:text>des préfixes qui s’attachent au verbe du syntagme conditionnel.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<xsl:text>des suffixes qui s’attachent au verbe du syntagme conditionnel.   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<xsl:text>des affixes qui s’attachent au verbe du syntagme conditionnel.   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='no' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='no' or normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='no' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<xsl:text>ou bien par des clitiques qui s’attachent au début ou à la fin du syntagme conditionnel, ou bien par des affixes qui s’attachent au verbe du syntagme conditionnel.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='no' and normalize-space(//ip/conditionOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//ip/conditionOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/conditionSuffix/@checked)='yes' and normalize-space(//ip/conditionOther/@checked)='yes'">
<xsl:text>  Certains s’attachent aussi ___</xsl:text>
<xsl:value-of select="//ip/conditionOther" />  <xsl:text>.</xsl:text>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>   
	   	<xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionProclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionProclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionEnclitic/@checked)='yes'">
<p>
<xsl:text>Les clitiques qui marquent la condition sont:</xsl:text>
</p>
</xsl:if>      
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionProclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionProclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionEnclitic/@checked)='yes'">
<example num="xIP.IPConditional.22">
<table border="1">
	            <tr>
	            	<th>Clitiques de condition</th>
	               <th>Glose</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/conditionCliticExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>     
	   	<xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' or normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionPrefix/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<p>
<xsl:text>Les affixes qui marquent la condition sont:</xsl:text>
</p>
</xsl:if>      
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' or normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionPrefix/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<example num="xIP.IPConditional.26">
<table border="1">
	            <tr>
	            	<th>Affixes de condition</th>
	               <th>Glose</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/conditionAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>     
	   	<xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionOther/@checked)='yes'">
<p>
<xsl:text>Les autres éléments qui marquent la condition en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont:</xsl:text>
</p>
</xsl:if>      
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionOther/@checked)='yes'">
<example num="xIP.IPConditional.30">
<table border="1">
	            <tr>
	            	<th>Marqueurs de condition</th>
	               <th>Glose</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/conditionOtherExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>     
	   	<xsl:if test="normalize-space(//ip/@conditionWord)!='mood'">
<p>
<xsl:text>La partie conséquence du conditionnel </xsl:text>
<xsl:choose>
	      	<xsl:when test="//ip/@consequence='yes'">peut être marquée par un mot indépendent, ce qui est nécessaire lorsque le syntagme conditionnel vient avant la consequence.  </xsl:when>
	      	<xsl:when test="//ip/@consequence='optional'">peut être marquée par un mot indépendent, mais il est facultatif, même si le syntagme conditionnel vient avant.  </xsl:when>
	      	<xsl:when test="//ip/@consequence='no'">n’est jamais marquée par un mot indépendent.</xsl:when>
</xsl:choose>
<xsl:text>Ce mot vient  </xsl:text>
<xsl:choose>
	         <xsl:when test="//ip/@consequencePos='before'">avant</xsl:when>
	      	<xsl:when test="//ip/@consequencePos='after'">après</xsl:when>
</xsl:choose>
<xsl:text> le reste du syntagme consequence.</xsl:text>
</p>
</xsl:if>
	      
	   </section2>
	   
	   <section2 id="sIPSubjunctive">
	      <secTitle>Subjonctifs</secTitle>
	   	<p contentType="ctComparativeIntro">
<xsl:text>On emploie le mode du subjonctif pour exprimer les notions qui sont spéculatives, qu’on doute, craint, ou désire. Elles ne constituent pas la réalité du moment. En anglais on n’emploie pas beaucoup les subjonctifs; les exemples ressemblent à des conditionnels, sauf à la première personne, comme suit:  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>If I were in charge, I would fix the problem</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « Si j’étais le responsable, je résoudrais le problème »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>If I were a man, I would be a soccer player</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « Si j’étais un homme, je serais joueur de foot »</xsl:text>
</gloss>
<xsl:text>
	   			Dans les exemples en anglias ci-dessus, le verbe au subjonctif est </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>were</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « étais »</xsl:text>
</gloss>
<xsl:text> et il vient après le mot au conditionnel</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>if</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « si »</xsl:text>
</gloss>
<xsl:text>.  La conséquence est normalement au future.  En français ces phrases seraient à l’imparfait et au conditionel.  La conséquence peut se présenter avant la condition au subjonctif, comme suit: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would fix the problem if I were in charge</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « Je résoudrais le problème si j’étais le responsable »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be a soccer player if I were a man</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « J’aimerais être joueur de foot si j’étais homme »</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
	   	<p contentType="ctComparativeIntro">
<xsl:text>Dans beaucoup de langues - comme français - les subjonctifs s’emploient le plus souvent dans les propositions subordonnées, après les verbe principaux comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>exiger</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>douter</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>vouloir</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>craindre</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>souhaiter</langData>
<xsl:text> avec the complémentiseur </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>que</langData>
<xsl:text>.  Les exemples de les propositions subordonnées seront traits plus tard à la section </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>. </xsl:text>
</p>
	   	<p contentType="ctPracticalIntro">
<xsl:text>On emploie le mode du subjonctif pour exprimer les notions qui sont spéculatives, qu’on supppose, doute, craint, ou désire. Elles ne constituent pas la réalité du moment. Les subjonctifs peuvent ressembler aux conditionnels, sauf à la première personne.  Dans beaucoup de langues les subjonctifs s’emploient le plus souvent dans les propositions subordonnées.  Les exemples de les propositions subordonnées seront traits plus tard à la section </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>. </xsl:text>
</p>
	   	<p>
<xsl:text>Voici quelques exemples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de subjonctifs dans des propositions principales:</xsl:text>
</p>
	      <example num="xIP.IPSubjunctive.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/subjunctiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/subjunctiveExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/subjunctiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/subjunctiveExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPSubjunctive.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPSubjunctive.12.1</xsl:text>
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

	   	<xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='mood'">
<p>
<xsl:text>Comme le montrent les exemples, en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> il n’y a pas de marqueur de la condition dans les subjonctifs; seul le mode subjonctif se marque au verbe.</xsl:text>
</p>
</xsl:if>
	      
	   	<xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some'">
<p>
<xsl:text>Comme le montrent les exemples, la condition dans les subjonctifs </xsl:text>
<xsl:choose>
	         	<xsl:when test="//ip/@subjunctiveCondWord='yes'">se marque par des mots indépendents qui se trouvent </xsl:when>
	         	<xsl:when test="//ip/@subjunctiveCondWord='some'">se marque quelquefois par des mots indépendents qui se trouvent </xsl:when>
	         </xsl:choose>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='no' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='no' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='no' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='no' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='no'">
<xsl:text>d’un côte ou de l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='no' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='no' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes'">
<xsl:text>d’un côte ou de l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordOther/@checked)='no'">
<xsl:text> reste du syntagme conditionnel au subjonctif.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='no' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='no' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='no' and normalize-space(//ip/subjunctiveCondWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//ip/subjunctiveCondWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordOther/@checked)='yes'">
<xsl:text> reste du syntagme conditionnel au subjonctif et peut aussi se mettre  ___</xsl:text>
<xsl:value-of select="//ip/subjunctiveCondWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  Les mots qui marquent la condition dans les subjonctifs sont:</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some'">
<example num="xIP.IPSubjunctive.18">
<table border="1">
	            <tr>
	            	<th>Mots de condition au subjonctif</th>
	               <th>Glose</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/subjunctiveCondWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>     
	   	<xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' or normalize-space(//ip/@subjunctiveCondWord)='some'">
<p>
<xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no'">
<xsl:text>Comme le montrent les exemples, la condition dans les subjonctifs se marque par </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='some'">
<xsl:text>La condition dans les subjonctifs peut aussi se marquer par </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no'">
<xsl:text>des proclitiques qui s’attachent à la tête du mot qui commence le syntagme conditionnel au subjonctif.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no'">
<xsl:text>des enclitiques qui s’attachent à la fin du mot qui termine le syntagme conditionnel au subjonctif.    </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no'">
<xsl:text>des clitiques qui s’attachent ou bien à la tête du mot qui commence le syntagme conditionnel au subjonctif ou à la fin du mot qui termine le syntagme conditionnel au subjonctif.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no'">
<xsl:text>des préfixes qui s’attachent au verbe du syntagme conditionnel au subjonctif.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<xsl:text>des suffixes qui s’attachent au verbe du syntagme conditionnel au subjonctif.   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<xsl:text>des affixes qui s’attachent au verbe du syntagme conditionnel au subjonctif.   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<xsl:text>ou bien des clitiques qui s’attachent à la tête ou bien à la fin du syntagme conditionnel au subjonctif, ou bien par des préfixes qui s’attachent au verbe du syntagme conditionnel au subjonctif.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//ip/subjunctiveCondOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes'">
<xsl:text>  Certains s’attachent ___</xsl:text>
<xsl:value-of select="//ip/subjunctiveCondOther" />  <xsl:text>.</xsl:text>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>   
	   	<xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes'">
<p>
<xsl:text>Les clitiques qui marquent la condition au subjonctif sont:</xsl:text>
</p>
</xsl:if>      
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes'">
<example num="xIP.IPSubjunctive.24">
<table border="1">
	            <tr>
	            	<th>Clitiques de condition au subjonctif</th>
	               <th>Glose</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/subjunctiveCondCliticExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>     
	   	<xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<p>
<xsl:text>Les affixes qui marquent la condition au subjonctif sont:</xsl:text>
</p>
</xsl:if>      
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<example num="xIP.IPSubjunctive.28">
<table border="1">
	            <tr>
	            	<th>Affixes de condition au subjonctif</th>
	               <th>Glose</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/subjunctiveCondAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>     
	   	<xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes'">
<p>
<xsl:text>Les autres éléments qui marquent la condition au sujonctif en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont:</xsl:text>
</p>
</xsl:if>      
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes'">
<example num="xIP.IPSubjunctive.32">
<table border="1">
	            <tr>
	            	<th>Marqueurs de condition au subjonctif</th>
	               <th>Glose</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/subjunctiveCondOtherExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>     
	      
	   </section2>
	   
	   <section2 id="sIPPassive">
		  <secTitle>Passifs</secTitle>
		  <p contentType="ctComparativeIntro">
<xsl:text>La plupart des langues ont des phrases au passif, là où le thème ou le patient prend la position du sujet. Dans certaines langues l’agent peut s’exprimer, mais dans d’autres il n’est pas admis. Si l’agent doit s’exprimer par moyen d’un syntagme prépositionnel ou postpositionnel (comme en anglais qui utilise la preposition </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>by</langData>
<xsl:text> ou en français qui utilise la préposition </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>par</langData>
<xsl:text>) ou d’un syntagme nominal, selon la langue. En plus, un auxiliaire spécifique peut être nécessaire dans les passifs (en anglais, une forme du verbe </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>be</langData>
<xsl:text>, en français </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>être</langData>
<xsl:text>).  Voici des exemples en anglais et français avec/sans syntagme agent, y compris certains qui comprennent des auxiliaires multiples: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The glass was broken</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Le verre a été cassé »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The glass was broken by the child</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Le verre a été cassé par l’enfant »</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The thief might have been seen</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Le voleur a pu être vu »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The thief might have been seen by the boy</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Le voleur a pu être vu par le garçon »</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>Dans les phrases passives, le thème ou le patient prend la position du sujet.  </xsl:text>
</p>
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
<xsl:text></xsl:text>
<xsl:choose>
			 	<xsl:when test="//ip/@passive='no'"> il n’y a pas de passif.</xsl:when>
			 	<xsl:when test="//ip/@passive='yes'"> il y a des passifs comme suivent:</xsl:when>
			 </xsl:choose>
</p>
	      <xsl:if test="normalize-space(//ip/@passive)='yes'">
<example num="xIP.IPPassive.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/passiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/passiveExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/passiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/passiveExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPPassive.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPPassive.10.1</xsl:text>
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
</xsl:if>
	      
	      <xsl:if test="normalize-space(//ip/@passive)='yes'">
<p>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@passive)='yes'">
			 	<xsl:text>L’agent </xsl:text>
				<xsl:choose>
					<xsl:when test="//ip/@passiveAgent='no'">ne s’exprime pas.</xsl:when>
					<xsl:when test="//ip/@passiveAgent='yes'">s’exprime</xsl:when>
				</xsl:choose>
				<xsl:text></xsl:text>
				<xsl:if test="normalize-space(//ip/@passiveAgent)='yes'">
				   <xsl:text> comme un syntagme </xsl:text>
				   <xsl:choose>
					  <xsl:when test="//ip/@passiveAgentCat='pp'">
						 <xsl:choose>
						 	<xsl:when test="//pp/@pPos='before'">prépositionnel.</xsl:when>
							<xsl:when test="//pp/@pPos='after'">postpositionnel.</xsl:when>
						 	<xsl:when test="//pp/@pPos='both'">prépositionnel ou postpositionnel.</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">adpositionnel.</xsl:when>
</xsl:choose>
</xsl:when>
					  <xsl:when test="//ip/@passiveAgentCat='dp'">nominal.</xsl:when>
				   </xsl:choose>
				   <xsl:text></xsl:text>
				</xsl:if>
			 	<xsl:text>  Un auxiliaire spécifique </xsl:text>
				<xsl:choose>
					<xsl:when test="//ip/@passiveAux='no'">n’est pas</xsl:when>
				   <xsl:when test="//ip/@passiveAux='yes'">est</xsl:when>
				</xsl:choose>
			 	<xsl:text> nécessaire dans des phrases passifs.</xsl:text>
			 </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
	   	<xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp'">
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
<xsl:text> la </xsl:text>
<xsl:choose>
			 	<xsl:when test="//pp/@pPos='before'">préposition</xsl:when>
				<xsl:when test="//pp/@pPos='after'">postposition</xsl:when>
			 	<xsl:when test="//pp/@pPos='both'">préposition ou postposition</xsl:when>
			 	<xsl:when test="//pp/@pPos='unknown'">adposition</xsl:when>
</xsl:choose>
<xsl:text> utilisée comme marqueur du syntagme agent  est:</xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp'">
<example num="xIP.IPPassive.16">
<table border="1">
				<tr>
					<th>Marqueur d’agent</th>
				   <th>Glose</th>
				</tr>
				<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/passiveAgentPExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			 </table>
</example>
</xsl:if>
	   	<xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes'">
<p>
<xsl:text>L’auxiliaire utilisé dans les passifs est:</xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes'">
<example num="xIP.IPPassive.20">
<table border="1">
				<tr>
					<th>Auxiliaire du passif</th>
				   <th>Glose</th>
				</tr>
				<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/passiveAuxExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			 </table>
</example>
</xsl:if>

	   </section2>
	   <xsl:if test="normalize-space(//ip/@antipassive)='yes'">
<section2 id="sIPAntipassives">
	   	<secTitle>Antipassifs</secTitle>
	   	<p contentType="ctComparativeIntro">
<xsl:text>Au lieu de promouvoir l’objet au rôle de sujet dans les constructions passifs, l’antipassif est une voix verbale qui efface l’objet du verbe transitif. L’antipassif se trouve dans des langues à système casuel ergatif-absolutif, là où la disparition de l’objet entraîne le changement casuel du sujet, de l’ergatif à l’absolutif. On le trouve aussi dans quelques langues à système casuel nominatif-accusatif où le verbe s’accorde avec le sujet et l’objet. Dans ces langues, l’antipassif se forme d’habitude en supprimant l’affixe qui marque l’accord de l’objet. La plupart des langues à la voix antipassive sont les langues indigènes de l’Australie et de l’Amérique. </xsl:text>
</p>
	   	<p contentType="ctComparativeIntro">
<xsl:text>Tout comme le sujet ou l’agent dans le passif, certaines langues acceptent que l’objet ou le patient soit exprimé facultativement dans un syntagme prépositionnel ou postpositionnel. </xsl:text>
</p>
	   	<p contentType="ctPracticalIntro">
<xsl:text>Au lieu de transformer l’objet en sujet pour la voix passif, l’antipassif est une voix verbale qui efface l’objet des verbes transitifs.</xsl:text>
</p>
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
<xsl:text>, </xsl:text>
<xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='no' or normalize-space(//typology/@case)='split' and normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='no'">
<xsl:text> le sujet d’un verbe transitif prend le cas absolutif quand l’objet est effacé dans les antipassifs. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='no' and normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveAffix/@checked)='no'">
<xsl:text> l’affixe du verbe qui marque l’accord de l’objet est effacé pour signaler un antipassif. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='no' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<xsl:text> il y a un affixe verbal pour l’antipassif qui signale le changement de rôles grammaticaux. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveAffix/@checked)='no'">
<xsl:text> le sujet d’un verbe transitif prend le cas absolutif quand l’objet est effacé dans les antipassifs; l’affixe au verbe qui marque l’accord de l’objet est effacé pour signaler un antipassif. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<xsl:text> le sujet d’un verbe transitif prend le cas absolutif quand l’objet est effacé dans les antipassifs et qu’il y a un affixe verbal pour l’antipassif qui signale le changement de rôles grammaticaux. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<xsl:text> le sujet d’un verbe transitif prend le cas absolutif quand l’objet est effacé dans les antipassifs; l’affixe au verbe qui marque l’accord de l’objet est effacé pour signaler un antipassif, et il y a un affixe verbal pour l’antipassif qui signale le changement dans les rôles grammaticaux. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='no' and normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<xsl:text> l’affixe au verbe qui marque l’accord de l’objet s’efface pour signaler un antipassif, et il y a un affixe verbal pour l’antipassif qui signale le changement dans les rôles grammaticaux. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='no' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='no' and normalize-space(//ip/antipassiveOther/@checked)='yes'">
<xsl:text> les antipassifs s’expriment par  ___</xsl:text>
<xsl:value-of select="//ip/antipassiveOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveOther/@checked)='yes' or normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveOther/@checked)='yes' or normalize-space(//ip/antipassiveAffix/@checked)='yes' and normalize-space(//ip/antipassiveOther/@checked)='yes'">
<xsl:text> Les antipassifs peuvent aussi s’expriment par ___</xsl:text>
<xsl:value-of select="//ip/antipassiveOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
	   	<xsl:if test="normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<p>
<xsl:text>L’affixe antipassif est:</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<example num="xIP.IPAntipassives.14">
<table border="1">
				<tr>
					<th>Affixe antipassif</th>
				   <th>Glose</th>
				</tr>
				<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/antipassiveAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			 </table>
</example>
</xsl:if>
	   	<p>
<xsl:text>Voici des exemples des antipassifs en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
		  <example num="xIP.IPAntipassives.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/antipassiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/antipassiveExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/antipassiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/antipassiveExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPAntipassives.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPAntipassives.18.1</xsl:text>
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
	   </section2>
</xsl:if>


	   <xsl:if test="normalize-space(//ip/@voice)='yes'">
<section2 id="sIPVoice">
	   	<secTitle>Autres changements de voix</secTitle>
	   	<p contentType="ctComparativeIntro">
<xsl:text>Certaines langues, comme le tagalog et d’autres langues austronésiennes ont des affixes au verbe qui aident à définir les rôles et les rapports des syntagmes nominaux dans la phrase. Il s’agit d’un changement de voix semblable au passif, vu qu’il souligne le syntagme nominal particulier. Les marqueurs d’affixes au verbe montrent quel syntagme nominal a la priorité; ceci peut entraîner un changement de l’ordre des mots et des marques casuelles. Par exemple, au tagalog le marqueur de voix reflète le rôle de l’argument nominatif.  </xsl:text>
</p>
	   	<p contentType="ctPracticalIntro">
<xsl:text>D’autres affixes au verbe peuvent montrer un changement de voix semblable au passif parce qu’il souligne un syntagme nominal particulier. Le marqueur d’affixe montre quel syntagme nominal a la priorité; il peut entraîner un changement dans l’ordre des mots et/ou dans le marquage de cas.</xsl:text>
</p>
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
<xsl:text> </xsl:text>
<xsl:choose>
	      	<xsl:when test="//ip/@voiceCase='no'"> les changements de voix se montrent par des changements dans l’ordre des mots, et non par le marquage des cas.</xsl:when>
	      	<xsl:when test="//ip/@voiceCase='yesNom'"> quand un affixe de voix particulier est visible au verbe, le syntagme nominal correspondant prend le marqueur du nominatif.</xsl:when>
	      	<xsl:when test="//ip/@voiceCase='yesAbs'"> quand un affixe de voix particulier est visible au verbe, le syntagme nominal correspondant prend le marqueur de l’absolutif.</xsl:when>
	      </xsl:choose>
<xsl:text>  Le tableau suivant montre les affixes verbaux qui indiquent la voix de la phrase:</xsl:text>
</p>
		  <example num="xIP.IPVoice.10">
<table border="1">
				<caption>
					<xsl:text>Les affixes de voix sur les verbes</xsl:text>
				</caption>
				<tr>
				   <th>Type de voix</th>
				   <th>
					  Affixes
				   </th>
				</tr>
				<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//ip/actorVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.1" select="string-length(normalize-space($sExampleValue0.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.1 != 0 and $sExampleValue0.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				   	<xsl:text>Agent ou Actif</xsl:text>
				   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				   	<xsl:text>Agent ou Actif</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//ip/objectVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.1" select="string-length(normalize-space($sExampleValue1.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.1 != 0 and $sExampleValue1.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				   	<xsl:text>Objet, Patient, Thème ou Transmission</xsl:text>
				   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				   	<xsl:text>Objet, Patient, Thème ou Transmission</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//ip/dativeVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
					  <xsl:text>Datif</xsl:text>
				   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
					  <xsl:text>Datif</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//ip/locativeVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.1" select="string-length(normalize-space($sExampleValue3.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.1 != 0 and $sExampleValue3.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
					  <xsl:text>Locatif</xsl:text>
				   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
					  <xsl:text>Locatif</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue4.1">
<xsl:value-of select="translate(string(//ip/instrumentalVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.1" select="string-length(normalize-space($sExampleValue4.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.1 != 0 and $sExampleValue4.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
					  <xsl:text>Instrumental</xsl:text>
				   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
					  <xsl:text>Instrumental</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue5.1">
<xsl:value-of select="translate(string(//ip/goalVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.1" select="string-length(normalize-space($sExampleValue5.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.1 != 0 and $sExampleValue5.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
					  <xsl:text>But</xsl:text>
				   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
					  <xsl:text>But</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			 </table>
</example>
	   	<p>
<xsl:text>Voici des exemples de phrases qui montrent des changements dans ce type de marquage de voix:</xsl:text>
</p>
		  <example num="xIP.IPVoice.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/voiceExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/voiceExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/voiceExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/voiceExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPVoice.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPVoice.14.1</xsl:text>
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
	   </section2>
</xsl:if>

	   <section2 id="sIPCausatives">
		  <secTitle>Causatifs</secTitle>
	   	<p contentType="ctComparativeIntro">
<xsl:text>Les causatifs ajoutent un argument supplémentaire à la phrase. Certaines langues ont des phrases causatives à proposition unique, où le verbe se marque d’un affixe qui présente l’argument supplémentaire. C’est bien le type de construction que nous présentons dans cette section. Le français et l’anglais ont des constructions causatives à deux propositions seulement, exemples: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ma mère m’a fait nettoyer ma chambre</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>L’autre fille nous a fait séparer</langData>
<xsl:text>.  Ce deuxième type de causatif sera présenté en détail à la section </xsl:text>
<sectionRef sec="sCompCausative" />
<xsl:text>.</xsl:text>
</p>
	   	<p contentType="ctPracticalIntro">
<xsl:text>Les causatifs ajoutent à la phrase un argument supplémentaire. Dans les phrases causatives à proposition unique on marque le verbe d’un affixe qui présente cet argument. C’est bien le type de construction qu’on présente ici. Les causatifs syntaxiques à proposition double seront présentés en détail à la section </xsl:text>
<sectionRef sec="sCompCausative" />
<xsl:text>.</xsl:text>
</p>
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
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes' and normalize-space(//ip/causativeMake/@checked)='no'">
<xsl:text> il y a un affixe verbal pour le causatif qui présente un argument supplémentaire. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='no' and normalize-space(//ip/causativeMake/@checked)='yes'">
<xsl:text> il n’y a pas d’affixe verbal causatif.  Les phrases causatives consistent en deux propositions à verbe principal qui veut dire </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>faire</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>causer</langData>
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes' and normalize-space(//ip/causativeMake/@checked)='yes'">
<xsl:text> il y a un affixe verbal pour le causatif qui présente un argument supplémentaire, et les phrases causatives peuvent aussi consister en deux propositions à verbe principal qui veut dire </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>faire</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>causer</langData>
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='no' and normalize-space(//ip/causativeMake/@checked)='no' and normalize-space(//ip/causativeOther/@checked)='yes'">
<xsl:text> il n’y a pas d’affixe verbal causatif. Les causatifs s’expriment par ___</xsl:text>
<xsl:value-of select="//ip/causativeOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes' and normalize-space(//ip/causativeOther/@checked)='yes' or normalize-space(//ip/causativeMake/@checked)='yes' and normalize-space(//ip/causativeOther/@checked)='yes'">
<xsl:text>  Les causatifs peuvent aussi s’exprimer par ___</xsl:text>
<xsl:value-of select="//ip/causativeOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
	   	<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes'">
<p>
<xsl:text>Les affixes causatifs sont:</xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes'">
<example num="xIP.IPCausatives.12">
<table border="1">
				<tr>
					<th>Affixes causatifs</th>
				   <th>Glose</th>
				</tr>
				<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/causativeAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			 </table>
</example>
</xsl:if>
	   	<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de phrases causatives à proposition unique utilisant les affixes causatifs: </xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes'">
<example num="xIP.IPCausatives.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/causativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/causativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/causativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/causativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCausatives.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCausatives.16.1</xsl:text>
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
</xsl:if>
	   	<xsl:if test="normalize-space(//ip/causativeMake/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de phrases causatives syntaxiques qui consistent en deux propositions: </xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/causativeMake/@checked)='yes'">
<example num="xIP.IPCausatives.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/causativeMakeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/causativeMakeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/causativeMakeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/causativeMakeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCausatives.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCausatives.20.1</xsl:text>
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
</xsl:if>
	   	<xsl:if test="normalize-space(//ip/causativeOther/@checked)='yes'">
<p>
<xsl:text>Voici des exemples de l’autre type de phrases causatives possibles en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>: </xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/causativeOther/@checked)='yes'">
<example num="xIP.IPCausatives.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/causativeOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/causativeOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/causativeOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/causativeOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCausatives.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCausatives.24.1</xsl:text>
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
</xsl:if>
	      
	   </section2>
		<xsl:if test="normalize-space(//ip/@applicative)='yes'">
<section2 id="sIPApplicatives">
			<secTitle>Applicatifs</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>Certaines langues ont une construction supplémentaire applicative. L’applicatif est une voix verbale qui promeut l’argument oblique du verbe à l’argument objet, et qui indique le rôle oblique à travers le sens du verbe. Un verbe intransitif devient transitif, et un verbe transitif devient ditransitif quand l’affixe applicatif s’y attache. C’est le contraire de vouloir exprimer ces argumens par les adpositions. </xsl:text>
</p>
			<p contentType="ctComparativeIntro">
<xsl:text>Les applicatifs peuvent exprimer un rôle comitatif, locatif, instrumental et bénéfactif. Certaines langues permettent plus d’un applicatif pour un seul verbe.</xsl:text>
</p>
			<p contentType="ctPracticalIntro">
<xsl:text>L’applicatif est une voix verbale qui promeut l’argument oblique du verbe à l’argument objet, et qui indique le rôle oblique à travers le sens du verbe. Un verbe intransitif devient transitif, et un verbe transitif devient ditransitif quand l’affixe applicatif s’y attache.</xsl:text>
</p>
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
<xsl:text> les affixes qu’on utilise pour marquer les applicatifs sont:</xsl:text>
</p>
			<example num="xIP.IPApplicatives.12">
<table border="1">
					<tr>
						<th>Affixes applicatifs</th>
						<th>Glose</th>
					</tr>
					<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/applicativeVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
			<p>
<xsl:text>Voici des exemples d’applicatifs en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
			<example num="xIP.IPApplicatives.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/applicativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/applicativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/applicativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/applicativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPApplicatives.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPApplicatives.16.1</xsl:text>
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
		</section2>
</xsl:if>
		
		
	</section1>
	
		
		
		
	
   
      
   
   
      
   
   
      
 
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
   
   
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
	  
	  
   
   
	  
   


   

   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
   
   
      
   
   
      
   
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
         
         
            
            
            
            
            
            
            
         
         
            
            
            
            
            
            
            
            
            
            
            
         
         
   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
            
            
            
            
         
         
            
         
         
            
            
            
            
            
            
            
         
         
            
            
            
            
            
            
            
            
            
            
            
         
	
		
	
	
   
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
         
         
         
         
         
      
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
       
	
		
	
	
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
   
	  
	  
	  
	  
	  
   
   
	  
	  
	  
   

   
      
      
      
      
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
   
      
   
   
      
   
   
      
	  
   
   
	  
	  
	  
   
   
	  
   
   
	  
   
</xsl:template>
</xsl:stylesheet>
