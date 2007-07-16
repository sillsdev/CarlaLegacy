<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="intro">
	<section1 id="sIntro">
		<secTitle>Introduction</secTitle>
		<p>
<xsl:text>This is a description of the syntax of </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> based on the answers given to the PAWS Starter Kit. </xsl:text>
</p>
<p>
<object type="tComment"> Once the starter kit is completed, this file can serve as a draft for preparing a more complete grammar.  This grammar is written at the practical grammar level as a descriptive/comparative grammar relative to English.  For your final version, you can delete the information about English in each section or change it to relate to the national language in your area.</object>
</p>
<p>
<object type="tComment">Until you have completed every page of the starter kit, some of the information given may be inaccurate because it is based only on the default answers.  Default answers relating to the position of elements are shown here as ______ until you have completed the appropriate page in the starter kit.</object>
</p>
<p>
<object type="tComment"> DO NOT MODIFY THIS FILE UNTIL THE STARTER KIT IS COMPLETED, because your work will be overwritten by the PAWS program!</object>
</p>
		<p>
<xsl:text>The </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> language is spoken in </xsl:text>
<object type="tComment">locations go here</object>
<xsl:text>.   There are approximately </xsl:text>
<object type="tComment">number goes here</object>
<xsl:text> speakers.  </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> is a member of the </xsl:text>
<object type="tComment">language family name goes here</object>
<xsl:text> language family.</xsl:text>
</p>
		<p>
<xsl:text>After giving information on the syntactic typology of the language, the grammar begins by describing the smaller phrases which can modify other phrases before moving through several types of nominal phrases and on to adpositional phrases.  Basic, main clause sentences are then covered, followed finally by various types of embedded clauses and constructions involving changes in word order.   </xsl:text>
</p>
	</section1>
	<section1 id="sTypology">
		<secTitle>Word Order Typology</secTitle>
		<p>
<xsl:text>The basic word order of </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> in transitive sentences is </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@wordOrder='SVO'">
<xsl:text>Subject-Verb-Object</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">
<xsl:text>Subject-Object-Verb</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">
<xsl:text>Verb-Subject-Object</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">
<xsl:text>Verb-Object-Subject</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">
<xsl:text>Object-Verb-Subject</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">
<xsl:text>Object-Subject-Verb</xsl:text>
</xsl:when>
			</xsl:choose>
<xsl:text>, as shown in the following examples:</xsl:text>
</p>
		<example num="xTypology.6">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//typology/example)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//typology/example)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTypology.6</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTypology.6.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
		<xsl:if test="normalize-space(////typology/@wordOrder)='SVO' and normalize-space(////pp/@pPos)='before' or normalize-space(////typology/@wordOrder)='VSO' and normalize-space(////pp/@pPos)='before' or normalize-space(////typology/@wordOrder)='VOS' and normalize-space(////pp/@pPos)='before' or normalize-space(////typology/@wordOrder)='SVO' and normalize-space(////pp/@pPos)='unknown' or normalize-space(////typology/@wordOrder)='VSO' and normalize-space(////pp/@pPos)='unknown' or normalize-space(////typology/@wordOrder)='VOS' and normalize-space(////pp/@pPos)='unknown'">
<p>
<xsl:text>In keeping with the head-initial typology, </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has prepositions (section </xsl:text>
<sectionRef sec="sPPType" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(////typology/@wordOrder)='SVO' and normalize-space(////pp/@pPos)='after' or normalize-space(////typology/@wordOrder)='VSO' and normalize-space(////pp/@pPos)='after' or normalize-space(////typology/@wordOrder)='VOS' and normalize-space(////pp/@pPos)='after'">
<p>
<xsl:text>In contrast with the head-initial typology, </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has postpositions (section </xsl:text>
<sectionRef sec="sPPType" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(////pp/@pPos)='both'">
<p>
<xsl:value-of select="//language/langName" />
<xsl:text> has both prepositions and postpositions (section </xsl:text>
<sectionRef sec="sPPType" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(////typology/@wordOrder)='SOV' and normalize-space(////pp/@pPos)='after' or normalize-space(////typology/@wordOrder)='OVS' and normalize-space(////pp/@pPos)='after' or normalize-space(////typology/@wordOrder)='OSV' and normalize-space(////pp/@pPos)='after' or normalize-space(////typology/@wordOrder)='SOV' and normalize-space(////pp/@pPos)='unknown' or normalize-space(////typology/@wordOrder)='OVS' and normalize-space(////pp/@pPos)='unknown' or normalize-space(////typology/@wordOrder)='OSV' and normalize-space(////pp/@pPos)='unknown'">
<p>
<xsl:text>In keeping with the head-final typology, </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has postpositions (section </xsl:text>
<sectionRef sec="sPPType" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(////typology/@wordOrder)='SOV' and normalize-space(////pp/@pPos)='before' or normalize-space(////typology/@wordOrder)='OVS' and normalize-space(////pp/@pPos)='before' or normalize-space(////typology/@wordOrder)='OSV' and normalize-space(////pp/@pPos)='before'">
<p>
<xsl:text>In contrast with the head-final typology, </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has prepositions (section </xsl:text>
<sectionRef sec="sPPType" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<p>
<xsl:text>Possessors occur </xsl:text>
<xsl:choose>
				<xsl:when test="//np/@possNounPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
				<xsl:when test="//np/@possNounPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
				<xsl:when test="//np/@possNounPos='either'">
<xsl:text>on either side of</xsl:text>
</xsl:when>
				<xsl:when test="//np/@possNounPos='unknown'">
<xsl:text> _______ </xsl:text>
</xsl:when>
			</xsl:choose>
<xsl:text> the noun being possessed (section </xsl:text>
<sectionRef sec="sNPPoss" />
<xsl:text>).   Adjective phrases occur </xsl:text>
<xsl:choose>
				<xsl:when test="//np/@adjpPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
				<xsl:when test="//np/@adjpPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
				<xsl:when test="//np/@adjpPos='either'">
<xsl:text>on either side (but not both sides) of</xsl:text>
</xsl:when>
				<xsl:when test="//np/@adjpPos='beforeOrBoth'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:when>
				<xsl:when test="//np/@adjpPos='afterOrBoth'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:when>
				<xsl:when test="//np/@adjpPos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
				<xsl:when test="//np/@adjpPos='unknown'">
<xsl:text> _______ </xsl:text>
</xsl:when>
			</xsl:choose>
<xsl:text> the noun they are modifying (section </xsl:text>
<sectionRef sec="sNPAdjP" />
<xsl:text>).   </xsl:text>
<xsl:if test="normalize-space(////relcl/@exist)='no'">
<xsl:value-of select="//language/langName" /> <xsl:text> does not have any type of relative clause.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(////relcl/@exist)='yes'">
<xsl:text>Relative clauses occur </xsl:text> <xsl:choose>
				<xsl:when test="//relcl/@clausePos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
				<xsl:when test="//relcl/@clausePos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
				<xsl:when test="//relcl/@clausePos='either'">
<xsl:text>on either side of</xsl:text>
</xsl:when>
				<xsl:when test="//relcl/@clausePos='unknown'">
<xsl:text> _______ </xsl:text>
</xsl:when>
</xsl:choose>
<xsl:text> the head noun (section </xsl:text>
			<sectionRef sec="sRelCl" />
			<xsl:text>).   </xsl:text> </xsl:if>
</p>
		<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, </xsl:text>
<xsl:choose>
				<xsl:when test="//ip/@proDrop='noImp'">
<xsl:text>pro-drop is not allowed.  The subject must be overt except in imperatives</xsl:text>
</xsl:when>
				<xsl:when test="//ip/@proDrop='no'">
<xsl:text>pro-drop is not allowed.  The subject must be overt even in imperatives</xsl:text>
</xsl:when>
				<xsl:when test="//ip/@proDrop='yes'">
<xsl:text>pro-drop of the subject is allowed in any type of sentence</xsl:text>
</xsl:when>
				<xsl:when test="//ip/@proDrop='yesClitic'">
<xsl:text>the subject may look like it is missing due to pronominal clitics attaching to the verb, but it is not a true pro-drop language</xsl:text>
</xsl:when>
			</xsl:choose>
<xsl:text>  (section </xsl:text>
<sectionRef sec="sIPProDrop" />
<xsl:text>).</xsl:text>
<xsl:if test="normalize-space(////ip/@proDrop)='yes'">
				<xsl:text>  Pro-drop of the object is </xsl:text>
				<xsl:choose>
					<xsl:when test="//ip/@proDropObject='no'">
<xsl:text>not</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@proDropObject='yes'">
<xsl:text>also</xsl:text>
</xsl:when>
				</xsl:choose>
				<xsl:text> allowed.</xsl:text>
			</xsl:if>
</p>
		<xsl:if test="normalize-space(////ip/@aux)='no'">
<p>
<xsl:value-of select="//language/langName" />
<xsl:text> does not have any auxiliaries which are written as separate words (section </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(////ip/@aux)='yes'">
<p>
<xsl:value-of select="//language/langName" />
<xsl:text> has some auxiliaries which are written as separate words.  These occur </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@wordOrder='SVO'">
<xsl:text>before</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">
<xsl:text>after</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">
<xsl:text>before</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">
<xsl:text>before</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">
<xsl:text>after</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">
<xsl:text>after</xsl:text>
</xsl:when>
			</xsl:choose>
<xsl:text> the main verb (section </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<p>
<xsl:if test="normalize-space(////q/@mainYNWord)='yes'">
				<xsl:text>In Yes/No questions, there is a question marker or complementizer which occurs </xsl:text>
				<xsl:choose>
					<xsl:when test="//q/@mainYNPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//q/@mainYNPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//q/@mainYNPos='either'">
<xsl:text>on either side (but not both sides) of</xsl:text>
</xsl:when>
					<xsl:when test="//q/@mainYNPos='beforeOrBoth'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//q/@mainYNPos='afterOrBoth'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//q/@mainYNPos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
				</xsl:choose>
				<xsl:text> the rest of the question (section </xsl:text>
				<sectionRef sec="sQuesYN" />
				<xsl:text>).  </xsl:text>
			</xsl:if>
<xsl:text>In content questions, an interrogative phrase </xsl:text>
<xsl:choose>
				<xsl:when test="//q/@contFront='no'">
<xsl:text>does not front; it simply remains in place</xsl:text>
</xsl:when>
				<xsl:when test="//q/@contFront='after'">
<xsl:text>may remain in place or it may move to the position immediately before the verb</xsl:text>
</xsl:when>
				<xsl:when test="//q/@contFront='before'">
<xsl:text>moves to the front of the clause.</xsl:text>
</xsl:when>
				<xsl:when test="//q/@contFront='unknown'">
<xsl:text> _______ </xsl:text>
</xsl:when>
			</xsl:choose>
<xsl:text> (section </xsl:text>
<sectionRef sec="sQuesContent" />
<xsl:text>).</xsl:text>
</p>
	</section1>

































































































</xsl:template>
</xsl:stylesheet>
