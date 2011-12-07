<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="ques">
	<section1 id="sQues">
		<secTitle>Questions</secTitle>
		<p>
<xsl:text>This section considers the main clause and embedded clause varieties of Yes/No questions and content questions.</xsl:text>
</p>
		<section2 id="sQuesYN">
			<secTitle>Yes/No Questions</secTitle>
			<p>
<xsl:text> In English, main clause Yes/No questions are formed by moving an auxiliary verb in front of the subject.  Other languages use a Yes/No question marker or special complementizer instead of the fronted auxiliary.  This is the case in embedded Yes/No questions in English; no auxiliary fronting is allowed but </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>whether</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>if</langData>
<xsl:text> fills the complementizer position.  Since languages may act differently in main clause and embedded clause Yes/No questions, each will be covered separately.</xsl:text>
</p>
			<section3 id="sQuesYNMain">
				<secTitle>Main Clause Yes/No Questions</secTitle>
				<p>
<xsl:text>English examples of main clause Yes/No questions, showing the required fronting of an auxiliary, include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Are you going to the store?</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Will Sue buy the present for her mother?</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Could the boy have hit the ball?</langData>
<xsl:text></xsl:text>
</p>
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
<xsl:text> main clause Yes/No questions, </xsl:text>
<xsl:choose>
						<xsl:when test="//q/@mainYN='no'"> there is no marker or word order change, just a difference in intonation or tone or other non-syntactic marking.</xsl:when>
						<xsl:when test="//q/@mainYN='noAux'">movement of an auxiliary</xsl:when>
						<xsl:when test="//q/@mainYN='yes'">there is at least one question marker or complementizer.</xsl:when>
					</xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainYN)='noAux'">
						<xsl:text> to the </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainYNAuxPos='before'">front</xsl:when>
							<xsl:when test="//q/@mainYNAuxPos='after'">end</xsl:when>
							<xsl:when test="//q/@mainYNAuxPos='unknown'">_______</xsl:when>
						</xsl:choose>
						<xsl:text> of the question is required.</xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainYN)='yes'">
						<xsl:text>The question marker or complementizer is </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainYNWord='yes'">written as a separate word.</xsl:when>
							<xsl:when test="//q/@mainYNWord='no'">is a clitic which attaches</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@mainYNWord)='no'">
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="//q/@mainYNCliticAttaches='edge'"> at the edge of the question.</xsl:when>
								<xsl:when test="//q/@mainYNCliticAttaches='head'"> to the verb in the question.</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="//q/@mainYNCliticPos='before'">These clitic(s) is(are) proclitic(s).</xsl:when>
								<xsl:when test="//q/@mainYNCliticPos='after'">These clitic(s) is(are) enclitic(s).</xsl:when>
								<xsl:when test="//q/@mainYNCliticPos='both'">There are some question marker or complementizer clitics which are proclitics and some which are enclitics.</xsl:when>
							   <xsl:when test="//q/@mainYNCliticPos='unknown'">_______</xsl:when>
						   </xsl:choose>
							<xsl:text> </xsl:text>
						</xsl:if>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainYNWord)='yes'">
						<xsl:text>The question marker or complementizer occurs </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainYNPos='before'">before</xsl:when>
							<xsl:when test="//q/@mainYNPos='after'">after</xsl:when>
							<xsl:when test="//q/@mainYNPos='either'">on either side (but not both sides) of</xsl:when>
							<xsl:when test="//q/@mainYNPos='eitherOrBoth'">on either side or on both sides of</xsl:when>
							<xsl:when test="//q/@mainYNPos='beforeOrBoth'">before or on both sides of</xsl:when>
							<xsl:when test="//q/@mainYNPos='afterOrBoth'">after or on both sides of</xsl:when>
							<xsl:when test="//q/@mainYNPos='both'">on both sides of</xsl:when>
							<xsl:when test="//q/@mainYNPos='unknown'">_______</xsl:when>
						</xsl:choose>
						<xsl:text> the rest of the question.  </xsl:text>
						<xsl:if test="normalize-space(//q/@mainYNEitherRestricted)='unrestricted' and normalize-space(//q/@mainYNPos)!='before' and normalize-space(//q/@mainYNPos)!='after'">
							<xsl:text>All of the question markers or complementizers can occur on either side of the question.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@mainYNEitherRestricted)='restricted' and normalize-space(//q/@mainYNPos)!='before' and normalize-space(//q/@mainYNPos)!='after'">
							<xsl:text>There are restrictions as to which of the question markers or complementizers can occur on each side of the question.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
</p>
				<p>
<xsl:text> </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> examples of main clause Yes/No questions include:</xsl:text>
</p>
				<example num="xQues.QuesYN.QuesYNMain.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//q/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//q/example))" />
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
			</section3>
			<section3 id="sQuesYNEmb">
				<secTitle>Embedded Clause Yes/No Questions</secTitle>
				<p>
<xsl:text>English examples of embedded clause Yes/No questions, showing the presence of the question markers or complementizers, include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I wonder whether she will come</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will know if she goes</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue wonders whether the boy could have hit the ball</langData>
<xsl:text>.</xsl:text>
</p>
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
<xsl:text> embedded clause Yes/No questions, </xsl:text>
<xsl:choose>
						<xsl:when test="//q/@embYN='no'"> there is no marker or word order change, just a difference in intonation or tone or other non-syntactic marking.</xsl:when>
						<xsl:when test="//q/@embYN='noAux'">movement of an auxiliary</xsl:when>
						<xsl:when test="//q/@embYN='yes'">there is at least one question marker or complementizer.</xsl:when>
					</xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embYN)='noAux'">
						<xsl:text> to the </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embYNAuxPos='before'">front</xsl:when>
							<xsl:when test="//q/@embYNAuxPos='after'">end</xsl:when>
							<xsl:when test="//q/@embYNAuxPos='unknown'">_______</xsl:when>
					   </xsl:choose>
						<xsl:text> of the embedded question is required.</xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embYN)='yes'">
						<xsl:text>The question marker or complementizer is </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embYNWord='yes'">written as a separate word.</xsl:when>
							<xsl:when test="//q/@embYNWord='no'">is a clitic which attaches</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@embYNWord)='no'">
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="//q/@embYNCliticAttaches='edge'"> at the edge of the embedded question.</xsl:when>
								<xsl:when test="//q/@embYNCliticAttaches='head'"> to the verb in the embedded question.</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="//q/@embYNCliticPos='before'">These clitic(s) is(are) proclitic(s).</xsl:when>
								<xsl:when test="//q/@embYNCliticPos='after'">These clitic(s) is(are) enclitic(s).</xsl:when>
								<xsl:when test="//q/@embYNCliticPos='both'">There are some question marker or complementizer clitics which are proclitics and some which are enclitics.</xsl:when>
							   <xsl:when test="//q/@embYNCliticPos='unknown'">_______</xsl:when>
						   </xsl:choose>
							<xsl:text> </xsl:text>
						</xsl:if>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embYNWord)='yes' and normalize-space(//q/@embYN)='yes'">
						<xsl:text>The question marker or complementizer occurs </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embYNPos='before'">before</xsl:when>
							<xsl:when test="//q/@embYNPos='after'">after</xsl:when>
							<xsl:when test="//q/@embYNPos='either'">on either side (but not both sides) of</xsl:when>
						   <xsl:when test="//q/@embYNPos='eitherOrBoth'">on either side or on both sides of</xsl:when>
						   <xsl:when test="//q/@embYNPos='beforeOrBoth'">before or on both sides of</xsl:when>
							<xsl:when test="//q/@embYNPos='afterOrBoth'">after or on both sides of</xsl:when>
							<xsl:when test="//q/@embYNPos='both'">on both sides of</xsl:when>
							<xsl:when test="//q/@embYNPos='unknown'">_______</xsl:when>
					   </xsl:choose>
						<xsl:text> the rest of the embedded question.  </xsl:text>
						<xsl:if test="normalize-space(//q/@embYNEitherRestricted)='unrestricted' and normalize-space(//q/@embYNPos)!='before' and normalize-space(//q/@embYNPos)!='after' and normalize-space(//q/@embYN)='yes'">
							<xsl:text>All of the question markers or complementizers can occur on either side of the embedded question.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@embYNEitherRestricted)='restricted' and normalize-space(//q/@embYNPos)!='before' and normalize-space(//q/@embYNPos)!='after' and normalize-space(//q/@embYN)='yes'">
							<xsl:text>There are restrictions as to which of the question markers or complementizers can occur on each side of the embedded question.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
</p>
				<p>
<xsl:text> </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> examples of embedded clause Yes/No questions include:</xsl:text>
</p>
				<example num="xQues.QuesYN.QuesYNEmb.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/embYNExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//q/embYNExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/embYNExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//q/embYNExample))" />
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
			</section3>
		</section2>
		<section2 id="sQuesContent">
			<secTitle>Content Questions</secTitle>
			<p>
<xsl:text>Content questions differ from Yes/No questions in that they contain an interrogative word or phrase, known as wh-phrases in English because they almost all begin with </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>wh</langData>
<xsl:text>.  The corresponding interrogative words or phrases or affixes in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown in the following chart.</xsl:text>
</p>
			<example num="xQues.QuesContent.6">
<table border="1">
					<caption>
						<xsl:text>Interrogatives used in content questions</xsl:text>
					</caption>
					<tr>
						<th>
							<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
						</th>
						<th>Gloss</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//q/who),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
							<xsl:text>who</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
							<xsl:text>who</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//q/what),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length(normalize-space($sExampleValue1))" />
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
							<xsl:text>what</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
							<xsl:text>what</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//q/why),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length(normalize-space($sExampleValue2))" />
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
							<xsl:text>why</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
							<xsl:text>why</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//q/where),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3" select="string-length(normalize-space($sExampleValue3))" />
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
							<xsl:text>where</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
							<xsl:text>where</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue4">
<xsl:value-of select="translate(string(//q/when),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4" select="string-length(normalize-space($sExampleValue4))" />
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
							<xsl:text>when</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
							<xsl:text>when</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue5">
<xsl:value-of select="translate(string(//q/how),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5" select="string-length(normalize-space($sExampleValue5))" />
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
							<xsl:text>how</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
							<xsl:text>how</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue6">
<xsl:value-of select="translate(string(//q/which),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6" select="string-length(normalize-space($sExampleValue6))" />
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
							<xsl:text>which</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
							<xsl:text>which</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue7">
<xsl:value-of select="translate(string(//q/whose),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7" select="string-length(normalize-space($sExampleValue7))" />
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
							<xsl:text>whose</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
							<xsl:text>whose</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue8">
<xsl:value-of select="translate(string(//q/other),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8" select="string-length(normalize-space($sExampleValue8))" />
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
							<xsl:text>other interrogatives</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
							<xsl:text>other interrogatives</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
			<p>
<xsl:text>Of the examples of interrogative words above, most simply stand alone as pronouns or adverbs, but </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>how</langData>
<xsl:text> can either be a manner adverb by itself or a degree word modifying an adjective, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>how big</langData>
<xsl:text> or a degree word modifying a quantifier, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>how many children</langData>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>what</langData>
<xsl:text> can either be a pronoun by itself or a demonstrative modifying a noun, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>what books</langData>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>which</langData>
<xsl:text> never stands alone but always modifies a noun as a demonstrative, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>which boy</langData>
<xsl:text>; and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>whose</langData>
<xsl:text> can be either a stand alone possessive pronoun, or it can fill the possessor position in a nominal phrase, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>whose toys</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>These same possibilities are assumed to be true in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> also.  </xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='both' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demOrArtPos)='either' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demOrArtPos)='both' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demAndArtPos)='either' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demAndArtPos)='both' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demPos)='either' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demPos)='both' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demOrArtPos)='either' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demOrArtPos)='both' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demAndArtPos)='either' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demAndArtPos)='both'">
					<xsl:text>Demonstratives are allowed on either side of the noun in </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text>.  The words meaning 'which' and 'what' occur </xsl:text>
					<xsl:choose>
						<xsl:when test="//q/@whDemPos='before'">only before the noun, even if another determiner occurs after the noun.</xsl:when>
						<xsl:when test="//q/@whDemPos='after'">only after the noun, even if another determiner occurs before the noun.</xsl:when>
						<xsl:when test="//q/@whDemPos='agree'">on either side of the noun, but when there is a demonstrative on each side at the same time, they must agree in features (e.g. both be interrogative words or both not be).</xsl:when>
					<xsl:when test="//q/@whDemPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text> </xsl:text>
				</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='both'">
					<xsl:text>Articles are allowed on either side of the noun in </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text>.  The words meaning 'which' and 'what' occur </xsl:text>
					<xsl:choose>
						<xsl:when test="//q/@whArtPos='before'">only before the noun, even if another article occurs after the noun.</xsl:when>
						<xsl:when test="//q/@whArtPos='after'">only after the noun, even if another article occurs before the noun.</xsl:when>
						<xsl:when test="//q/@whArtPos='agree'">on either side of the noun, but when there is a article on each side at the same time, they must agree in features (e.g. both be interrogative words or both not be).</xsl:when>
					 <xsl:when test="//q/@whArtPos='unknown'">_______</xsl:when>
				   </xsl:choose>
					<xsl:text> </xsl:text>
				</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yesDegree' and normalize-space(//adjp/@degreePos)!='before' and normalize-space(//adjp/@degreePos)!='after' or normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerPos)!='before' and normalize-space(//adjp/@mannerPos)!='after'">
					<xsl:text>Degree words are allowed on either side of the adjective in </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text>.  The word meaning 'how' occurs </xsl:text>
					<xsl:choose>
						<xsl:when test="//q/@whDegAdjPos='before'">only before the adjective, even if another degree word occurs after the adjective.</xsl:when>
						<xsl:when test="//q/@whDegAdjPos='after'">only after the adjective, even if another degree word occurs before the adjective.
</xsl:when>
						<xsl:when test="//q/@whDegAdjPos='agree'">on either side of the adjective, but when there is a degree word on each side at the same time, they must agree in features (e.g. both be interrogative words or both not be).</xsl:when>
					<xsl:when test="//q/@whDegAdjPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text> </xsl:text>
				</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//qp/@degree)='yes' and normalize-space(//qp/@degreePos)!='before' and normalize-space(//qp/@degreePos)!='after'">
					<xsl:text>Degree words are allowed on either side of the quantifier in </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text>.  The word meaning 'how' occurs </xsl:text>
					<xsl:choose>
						<xsl:when test="//q/@whDegQPos='before'">only before the quantifier, even if another degree word occurs after the quantifier.</xsl:when>
						<xsl:when test="//q/@whDegQPos='after'">only after the quantifier, even if another degree word occurs before the quantifier.
</xsl:when>
						<xsl:when test="//q/@whDegQPos='agree'">on either side of the quantifier, but when there is a degree word on each side at the same time, they must agree in features (e.g. both be interrogative words or both not be).</xsl:when>
					 <xsl:when test="//q/@whDegQPos='unknown'">_______</xsl:when>
				   </xsl:choose>
					<xsl:text> </xsl:text>
				</xsl:if>
<xsl:text> </xsl:text>
</p>
			<p>
<xsl:text>Depending on the basic word order of the language, content questions may be formed with or without fronting an interrogative phrase.  Head-final languages (SOV, OVS, and OSV) usually do not have movement of an interrogative phrase in content questions, while head-initial languages (SVO, VOS, and VSO) usually require fronting of an interrogative phrase.  In languages without fronting for interrogatives, the phrase structure of a content question will either be the same as a Yes/No question with a question marker or auxiliary in the complementizer position or just the same as a normal sentence.  In either case, the interrogative phrase appears in its normal argument positon.  Many SOV languages optionally allow movement of an interrogative phrase to the position immediately before the verb.
</xsl:text>
</p>
			<p>
<xsl:text>In both main clause and embedded content questions in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, an interrogative phrase </xsl:text>
<xsl:choose>
					<xsl:when test="//q/@contFront='no'">does not front; it simply remains in place.</xsl:when>
					<xsl:when test="//q/@contFront='after'">may remain in place or it may move to the position immediately before the verb.</xsl:when>
					<xsl:when test="//q/@contFront='before'">moves to the front of the clause.</xsl:when>
					<xsl:when test="//q/@contFront='unknown'">_______.</xsl:when>
				</xsl:choose>
<xsl:text> </xsl:text>
</p>
			<section3 id="sQuesContentMain">
				<secTitle>Main Clause Content Questions</secTitle>
				<p>
<xsl:text>English examples of main clause content questions, showing the required fronting of an interrogative phrase, include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Which boy hit the ball?</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Who might have hit the ball?</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>What did the boy hit?</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>When will she come?</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Where is the leader?</langData>
<xsl:text> </xsl:text>
</p>
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
<xsl:text> main clause content questions, </xsl:text>
<xsl:choose>
						<xsl:when test="//q/@mainCont='no'">there is no marker or auxiliary fronting,</xsl:when>
						<xsl:when test="//q/@mainCont='noAux'">movement of an auxiliary</xsl:when>
						<xsl:when test="//q/@mainCont='yes'">there is at least one question marker or complementizer.</xsl:when>
					</xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainCont)='no'">
						<xsl:text> just </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@contFront='no'">a difference in</xsl:when>
							<xsl:when test="//q/@contFront='after'">optional movement of an interrogative phrase and possibly a difference in</xsl:when>
							<xsl:when test="//q/@contFront='before'">fronting of an interrogative phrase and possibly a difference in</xsl:when>
							<xsl:when test="//q/@contFront='unknown'">_______ of an interrogative phrase and possibly a difference in</xsl:when>
						</xsl:choose>
						<xsl:text> intonation or tone or other non-syntactic marking.</xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainCont)='noAux'">
						<xsl:text> to the </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainContAuxPos='before'">front</xsl:when>
							<xsl:when test="//q/@mainContAuxPos='after'">end</xsl:when>
							<xsl:when test="//q/@mainContAuxPos='unknown'">_______</xsl:when>
						</xsl:choose>
						<xsl:text> of the question is </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainContAuxRequired='no'">allowed but not required</xsl:when>
							<xsl:when test="//q/@mainContAuxRequired='yes'">required</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="//q/@contFront='no'">.</xsl:when>
							<xsl:when test="//q/@contFront='after'">.</xsl:when>
							<xsl:when test="//q/@contFront='before'"> in addition to the fronting of an interrogative phrase.</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainCont)='yes'">
						<xsl:text>The question marker or complementizer is </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainContWord='yes'">written as a separate word.</xsl:when>
							<xsl:when test="//q/@mainContWord='no'">is a clitic which attaches</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/@mainCont)='yes'">
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="//q/@mainContCliticAttaches='edge'"> at the edge of the question.</xsl:when>
								<xsl:when test="//q/@mainContCliticAttaches='head'"> to the verb in the question.</xsl:when>
								<xsl:when test="//q/@mainContCliticAttaches='between'"> between the fronted interrogative phrase and the rest of the question.</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="//q/@mainContCliticPos='before'">These clitic(s) is(are) proclitic(s).</xsl:when>
								<xsl:when test="//q/@mainContCliticPos='after'">These clitic(s) is(are) enclitic(s).</xsl:when>
								<xsl:when test="//q/@mainContCliticPos='both'">There are some question marker or complementizer clitics which are proclitics and some which are enclitics.</xsl:when>
							   <xsl:when test="//q/@mainContCliticPos='unknown'">_______</xsl:when>
							</xsl:choose>
							<xsl:text> </xsl:text>
						</xsl:if>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' and normalize-space(//typology/@wordOrder)!='VSO'">
						<xsl:text>The question marker or complementizer occurs </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainContPos='before'">before</xsl:when>
							<xsl:when test="//q/@mainContPos='after'">after</xsl:when>
							<xsl:when test="//q/@mainContPos='either'">on either side (but not both sides) of</xsl:when>
						   <xsl:when test="//q/@mainContPos='eitherOrBoth'">on either side or on both sides of</xsl:when>
						   <xsl:when test="//q/@mainContPos='beforeOrBoth'">before or on both sides of</xsl:when>
							<xsl:when test="//q/@mainContPos='afterOrBoth'">after or on both sides of</xsl:when>
							<xsl:when test="//q/@mainContPos='both'">on both sides of</xsl:when>
							<xsl:when test="//q/@mainContPos='unknown'">_______</xsl:when>
					   </xsl:choose>
						<xsl:text> the rest of the question.  </xsl:text>
						<xsl:if test="normalize-space(//q/@mainContPos)!='before' and normalize-space(//q/@mainContPos)!='after' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' and normalize-space(//q/@mainContEitherRestrcited)='unrestricted'">
							<xsl:text>All of the question markers or complementizers can occur on either side of the question.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@mainContPos)!='before' and normalize-space(//q/@mainContPos)!='after' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' and normalize-space(//q/@mainContEitherRestrcited)='restricted'">
							<xsl:text>There are restrictions as to which of the question markers or complementizers can occur on each side of the question.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' and normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text>The question marker or complementizer occurs </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainContVSOBeforeWh='no'">immediately after a fronted interrogative phrase.</xsl:when>
							<xsl:when test="//q/@mainContVSOBeforeWh='noEnd'">either immediately after a fronted interrogative phrase or at the end of the question.</xsl:when>
							<xsl:when test="//q/@mainContVSOBeforeWh='yes'">before a fronted interrogative phrase.</xsl:when>
							<xsl:when test="//q/@mainContVSOBeforeWh='some'">either before or after a fronted interrogative phrase.</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@mainContVSOBeforeWh)='noEnd' and normalize-space(//q/@mainContVSONoEndRestricted)='unrestricted' and normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes'">
							<xsl:text>All of the question markers or complementizers can occur in each position.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@mainContVSOBeforeWh)='noEnd' and normalize-space(//q/@mainContVSONoEndRestricted)='restricted' and normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@mainContVSOBeforeWh)='some' and normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes'">
							<xsl:text>There are restrictions as to which of the question markers or complementizers can occur in each position.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes'">
						<xsl:text>A question marker or complementizer is </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainContRequired='yes'">required</xsl:when>
							<xsl:when test="//q/@mainContRequired='yes'">not required</xsl:when>
						</xsl:choose>
						<xsl:text> in every content question.</xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
</p>
				<p>
<xsl:text> </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> examples of main clause content questions include:</xsl:text>
</p>
				<example num="xQues.QuesContent.QuesContentMain.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/contentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//q/contentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/contentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//q/contentExample))" />
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
			</section3>
			<section3 id="sQuesContentEmb">
				<secTitle>Embedded Clause Content Questions</secTitle>
				<p>
<xsl:text>English examples of embedded clause content questions, showing the required fronting of an interrogative phrase, include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I know who hit the ball</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I wonder when she will come</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will ask what the boy hit</langData>
<xsl:text>.</xsl:text>
</p>
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
<xsl:text> embedded clause content questions, </xsl:text>
<xsl:choose>
						<xsl:when test="//q/@embCont='no'">there is no marker or auxiliary fronting,</xsl:when>
						<xsl:when test="//q/@embCont='noAux'">movement of an auxiliary</xsl:when>
						<xsl:when test="//q/@embCont='yes'">there is at least one question marker or complementizer.</xsl:when>
					</xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embCont)='no'">
						<xsl:text> just </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@contFront='no'">a difference in</xsl:when>
							<xsl:when test="//q/@contFront='after'">optional movement of an interrogative phrase and possibly a difference in</xsl:when>
							<xsl:when test="//q/@contFront='before'">fronting of an interrogative phrase and possibly a difference in</xsl:when>
							<xsl:when test="//q/@contFront='unknown'">_______ of an interrogative phrase and possibly a difference in</xsl:when>
						</xsl:choose>
						<xsl:text> intonation or tone or other non-syntactic marking.</xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embCont)='noAux'">
						<xsl:text> to the </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embContAuxPos='before'">front</xsl:when>
							<xsl:when test="//q/@embContAuxPos='after'">end</xsl:when>
							<xsl:when test="//q/@embContAuxPos='unknown'">_______</xsl:when>
					   </xsl:choose>
						<xsl:text> of the question is </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embContAuxRequired='no'">allowed but not required</xsl:when>
							<xsl:when test="//q/@embContAuxRequired='yes'">required</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="//q/@contFront='no'">.</xsl:when>
							<xsl:when test="//q/@contFront='after'">.</xsl:when>
							<xsl:when test="//q/@contFront='before'"> in addition to the fronting of an interrogative phrase.</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embCont)='yes'">
						<xsl:text>The question marker or complementizer is </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embContWord='yes'">written as a separate word.</xsl:when>
							<xsl:when test="//q/@embContWord='no'">is a clitic which attaches</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@embContWord)='no' and normalize-space(//q/@embCont)='yes'">
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="//q/@embContCliticAttaches='edge'"> at the edge of the embedded question.</xsl:when>
								<xsl:when test="//q/@embContCliticAttaches='head'"> to the verb in the embedded question.</xsl:when>
								<xsl:when test="//q/@embContCliticAttaches='between'"> between the fronted interrogative phrase and the rest of the embedded question.</xsl:when>
							</xsl:choose>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embContCliticPos='before'">These clitic(s) is(are) proclitic(s).</xsl:when>
							<xsl:when test="//q/@embContCliticPos='after'">These clitic(s) is(are) enclitic(s).</xsl:when>
							<xsl:when test="//q/@embContCliticPos='both'">There are some question marker or complementizer clitics which are proclitics and some which are enclitics.</xsl:when>
						   <xsl:when test="//q/@embContCliticPos='unknown'">_______</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes' and normalize-space(//typology/@wordOrder)!='VSO'">
						<xsl:text>The question marker or complementizer occurs </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embContPos='before'">before</xsl:when>
							<xsl:when test="//q/@embContPos='after'">after</xsl:when>
							<xsl:when test="//q/@embContPos='either'">on either side (but not both sides) of</xsl:when>
							<xsl:when test="//q/@embContPos='eitherOrBoth'">on either side or on both sides of</xsl:when>
						   <xsl:when test="//q/@embContPos='beforeOrBoth'">before or on both sides of</xsl:when>
							<xsl:when test="//q/@embContPos='afterOrBoth'">after or on both sides of</xsl:when>
							<xsl:when test="//q/@embContPos='both'">on both sides of</xsl:when>
							<xsl:when test="//q/@embContPos='unknown'">_______</xsl:when>
						</xsl:choose>
						<xsl:text> the rest of the embedded question.  </xsl:text>
						<xsl:if test="normalize-space(//q/@embContPos)!='before' and normalize-space(//q/@embContPos)!='after' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes' and normalize-space(//q/@embContEitherRestrcited)='unrestricted'">
							<xsl:text>All of the question markers or complementizers can occur on either side of the embedded question.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//q/@embContPos)!='before' and normalize-space(//q/@embContPos)!='after' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes' and normalize-space(//q/@embContEitherRestrcited)='restricted'">
							<xsl:text>There are restrictions as to which of the question markers or complementizers can occur on each side of the embedded question.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes' and normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text>The question marker or complementizer occurs </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@embContVSOBeforeWh='no'">immediately after a fronted interrogative phrase.</xsl:when>
							<xsl:when test="//q/@embContVSOBeforeWh='noEnd'">either immediately after a fronted interrogative phrase or at the end of the embedded question.</xsl:when>
							<xsl:when test="//q/@embContVSOBeforeWh='yes'">before a fronted interrogative phrase.</xsl:when>
							<xsl:when test="//q/@embContVSOBeforeWh='some'">either before or after a fronted interrogative phrase.</xsl:when>
						</xsl:choose>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@embContVSOBeforeWh)='noEnd' and normalize-space(//q/@embContVSONoEndRestricted)='unrestricted' and normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes'">
							<xsl:text>All of the question markers or complementizers can occur in each position.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@embContVSOBeforeWh)='noEnd' and normalize-space(//q/@embContVSONoEndRestricted)='restricted' and normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@embContVSOBeforeWh)='some' and normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes'">
							<xsl:text>There are restrictions as to which of the question markers or complementizers can occur in each position.</xsl:text>
						</xsl:if>
						<xsl:text> </xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes'">
						<xsl:text>A question marker or complementizer is </xsl:text>
						<xsl:choose>
							<xsl:when test="//q/@mainContRequired='yes'">required</xsl:when>
							<xsl:when test="//q/@mainContRequired='yes'">not required</xsl:when>
						</xsl:choose>
						<xsl:text> in every embedded content question.</xsl:text>
					</xsl:if>
<xsl:text> </xsl:text>
</p>
				<p>
<xsl:text> </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> examples of embedded clause content questions include:</xsl:text>
</p>
				<example num="xQues.QuesContent.QuesContentEmb.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/embContentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//q/embContentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/embContentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//q/embContentExample))" />
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
			</section3>
		</section2>
	</section1>


























































































































































































































































































































</xsl:template>
</xsl:stylesheet>
