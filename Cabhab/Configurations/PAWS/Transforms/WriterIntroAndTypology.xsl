<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="intro">
	<section1 id="sIntro">
		<secTitle>Introduction</secTitle>
		<p>
<xsl:text>This is a description of the syntax of </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> based on the answers given to the PAWS Starter Kit.   This grammar is written as a descriptive or comparative grammar relative to English. </xsl:text>
</p>
		<p>
<object type="tComment"> Once the starter kit is completed, this file can serve as a draft for preparing a more complete grammar.  For your final version, you can delete the information about English in each section or change it to relate to the national language in your area.</object>
</p>
		<p>
<object type="tComment">Until you have completed every page of the starter kit, some of the information given may be inaccurate because it is based only on the default answers.  Default answers relating to the position of elements are shown here as ______ until you have completed the appropraite page in the starter kit.</object>
</p>
		<p>
<object type="tComment"> DO NOT MODIFY THIS FILE UNTIL THE STARTER KIT IS COMPLETED, because your work will be overwritten by the PAWS program!</object>
</p>
		<p>
<xsl:text>The </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> language is spoken in </xsl:text>
<object type="tComment">locations go here</object>
<xsl:text>.   There are approximately </xsl:text>
<object type="tComment">number goes here</object>
<xsl:text> speakers.  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> is a member of the </xsl:text>
<object type="tComment">language family name goes here</object>
<xsl:text> language family.</xsl:text>
</p>
		<section2 id="sOrtho">
			<secTitle>Orthography</secTitle>
			<p>
<xsl:text>The orthographic symbols used in writing </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are for both the native words and also for loan words from other languages. In </xsl:text>
<exampleRef num="xAlphabet" equal="no" letterOnly="no" />
<xsl:text> these symbols are presented in alphabetical order:</xsl:text>
</p>
			<example num="xAlphabet">
<table>
					<tr>
						<th>Symbol</th>
						<th>Example</th>
						<th>Gloss</th>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>
</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
</gloss>
						</td>
					</tr>
				</table>
</example>
			<p>
<xsl:text>See the appendix </xsl:text>
<appendixRef app="aAppdx" />
<xsl:text> for consonant and vowel charts which compare the practical orthography with the phonetic alphabet (IPA).</xsl:text>
</p>
		</section2>
		<section2 id="sExamples">
			<secTitle>Conventions used in the examples</secTitle>
			<p>
<xsl:text>This grammar contains many illustrative phrases and sentences.  Most of these are presented in an interlinear format consisting of three or four lines, as shown in </xsl:text>
<exampleRef num="xEx" equal="no" letterOnly="no" />
<xsl:text>:</xsl:text>
</p>
			<example num="xEx">
<table>
					<tr>
						<td align="left">
							<xsl:text>[vernacular words]</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>word</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>word</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>word</langData>
						</td>
					</tr>
					<tr>
						<td align="left">
							<xsl:text>[morpheme glosses]</xsl:text>
						</td>
						<td align="left">
							<xsl:text>PRE-root-SUF</xsl:text>
						</td>
						<td align="left">
							<xsl:text>PRE-root-SUF</xsl:text>
						</td>
						<td align="left">
							<xsl:text>PRE-root-SUF</xsl:text>
						</td>
					</tr>
					<tr>
						<td align="left">
							<xsl:text>[literal word glosses]</xsl:text>
						</td>
						<td align="left">
							<xsl:text>gloss</xsl:text>
						</td>
						<td align="left">
							<xsl:text>gloss</xsl:text>
						</td>
						<td align="left">
							<xsl:text>gloss</xsl:text>
						</td>
					</tr>
					<tr>
						<td align="left">
							<xsl:text>[free translation]</xsl:text>
						</td>
						<td align="left" colspan="3">
							<xsl:text>free translation phrase or sentence</xsl:text>
						</td>
					</tr>
				</table>
</example>
			<p>
<xsl:text>The words in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are given on the first line.   The second line shows the morpheme glosses for the parts of the word, with the prefixes, root, and suffixes separated by hyphens.  The third line presents a literal translation in English, word for word, giving the English word gloss that is the closest in meaning to the word in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  If more than one English word is needed to express the meaning of the </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> word, these English words will be separated by periods.  The final line gives the free translation for the whole example.</xsl:text>
</p>
			<p>
<object type="tComment">Say more here about  any differences between your language and English.  For example, if your language does not distinguish between number and/or gender on nouns, but the gloss language does, you choose to use only singular and/or masculine forms for the glosses.</object>
</p>
			<p>
<xsl:text>After giving information on the syntactic typology of the language, the grammar begins by describing the smaller phrases which can modify other phrases before moving through several types of nominal phrases and on to adpositional phrases.  Basic, main clause sentences are then covered, followed finally by various types of embedded clauses and constructions involving changes in word order.     Some texts are included at the end to demonstrate how larger constructions such as paragraphs, conversations, and narrative stories are formed.</xsl:text>
</p>
		</section2>
	</section1>
	<section1 id="sTypology">
		<secTitle>Word Order Typology</secTitle>
		<p>
<xsl:text>The basic word order of </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> in transitive sentences is </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@wordOrder='SVO'">Subject-Verb-Object</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">Subject-Object-Verb</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">Verb-Subject-Object</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">Verb-Object-Subject</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">Object-Verb-Subject</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">Object-Subject-Verb</xsl:when>
			</xsl:choose>
<xsl:text>, as shown in the following examples:</xsl:text>
</p>
		<example num="xTypology.6">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//typology/example))" />
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
		<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='unknown'">
<p>
<xsl:text>In keeping with the head-initial typology, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has prepositions (section </xsl:text>
<sectionRef sec="sPPType" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='after'">
<p>
<xsl:text>In contrast with the head-initial typology, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has postpositions (section </xsl:text>
<sectionRef sec="sPPType" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//pp/@pPos)='both'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has both prepositions and postpositions (section </xsl:text>
<sectionRef sec="sPPType" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='unknown'">
<p>
<xsl:text>In keeping with the head-final typology, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has postpositions (section </xsl:text>
<sectionRef sec="sPPType" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='before'">
<p>
<xsl:text>In contrast with the head-final typology, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has prepositions (section </xsl:text>
<sectionRef sec="sPPType" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<p>
<xsl:text>Possessors occur </xsl:text>
<xsl:choose>
				<xsl:when test="//np/@possNounPos='before'">before</xsl:when>
				<xsl:when test="//np/@possNounPos='after'">after</xsl:when>
				<xsl:when test="//np/@possNounPos='either'">on either side of</xsl:when>
				<xsl:when test="//np/@possNounPos='unknown'"> _______ </xsl:when>
			</xsl:choose>
<xsl:text> the noun being possessed (section </xsl:text>
<sectionRef sec="sNPPoss" />
<xsl:text>).   Adjective phrases occur </xsl:text>
<xsl:choose>
				<xsl:when test="//np/@adjpPos='before'">before</xsl:when>
				<xsl:when test="//np/@adjpPos='after'">after</xsl:when>
				<xsl:when test="//np/@adjpPos='either'">on either side (but not both sides) of</xsl:when>
				<xsl:when test="//np/@adjpPos='beforeOrBoth'">before or on both sides of</xsl:when>
				<xsl:when test="//np/@adjpPos='afterOrBoth'">after or on both sides of</xsl:when>
				<xsl:when test="//np/@adjpPos='both'">on both sides of</xsl:when>
				<xsl:when test="//np/@adjpPos='unknown'"> _______ </xsl:when>
			</xsl:choose>
<xsl:text> the noun they are modifying (section </xsl:text>
<sectionRef sec="sNPAdjP" />
<xsl:text>).   </xsl:text>
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
				<xsl:text>Relative clauses occur </xsl:text>
				<xsl:choose>
					<xsl:when test="//relcl/@clausePos='before'">before</xsl:when>
					<xsl:when test="//relcl/@clausePos='after'">after</xsl:when>
					<xsl:when test="//relcl/@clausePos='either'">on either side of</xsl:when>
					<xsl:when test="//relcl/@clausePos='unknown'"> _______ </xsl:when>
				</xsl:choose>
				<xsl:text> the head noun (section </xsl:text>
				<sectionRef sec="sRelCl" />
				<xsl:text>).   </xsl:text>
			</xsl:if>
</p>
		<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
				<xsl:when test="//ip/@proDrop='noImp'">pro-drop is not allowed.  The subject must be overt except in imperatives</xsl:when>
				<xsl:when test="//ip/@proDrop='no'">pro-drop is not allowed.  The subject must be overt even in imperatives</xsl:when>
				<xsl:when test="//ip/@proDrop='yes'">pro-drop of the subject is allowed in any type of sentence</xsl:when>
				<xsl:when test="//ip/@proDrop='yesClitic'">the subject may look like it is missing due to pronominal clitics attaching to the verb, but it is not a true pro-drop language</xsl:when>
			</xsl:choose>
<xsl:text>  (section </xsl:text>
<sectionRef sec="sIPProDrop" />
<xsl:text>).</xsl:text>
<xsl:if test="normalize-space(//ip/@proDrop)='yes'">
				<xsl:text>  Pro-drop of the object is </xsl:text>
				<xsl:choose>
					<xsl:when test="//ip/@proDropObject='no'">not</xsl:when>
					<xsl:when test="//ip/@proDropObject='yes'">also</xsl:when>
				</xsl:choose>
				<xsl:text> allowed.</xsl:text>
			</xsl:if>
</p>
		<xsl:if test="normalize-space(//ip/@aux)='no'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> does not have any auxiliaries which are written as separate words (section </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//ip/@aux)='yes'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has some auxiliaries which are written as separate words.  These occur </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@wordOrder='SVO'">before</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">after</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">before</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">before</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">after</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">after</xsl:when>
			</xsl:choose>
<xsl:text> the main verb (section </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<p>
<xsl:if test="normalize-space(//q/@mainYNWord)='yes'">
				<xsl:text>In Yes/No questions, there is a question marker or complementizer which occurs </xsl:text>
				<xsl:choose>
					<xsl:when test="//q/@mainYNPos='before'">before</xsl:when>
					<xsl:when test="//q/@mainYNPos='after'">after</xsl:when>
					<xsl:when test="//q/@mainYNPos='either'">on either side (but not both sides) of</xsl:when>
					<xsl:when test="//q/@mainYNPos='beforeOrBoth'">before or on both sides of</xsl:when>
					<xsl:when test="//q/@mainYNPos='afterOrBoth'">after or on both sides of</xsl:when>
					<xsl:when test="//q/@mainYNPos='both'">on both sides of</xsl:when>
				</xsl:choose>
				<xsl:text> the rest of the question (section </xsl:text>
				<sectionRef sec="sQuesYN" />
				<xsl:text>).  </xsl:text>
			</xsl:if>
<xsl:text>In content questions, an interrogative phrase </xsl:text>
<xsl:choose>
				<xsl:when test="//q/@contFront='no'">does not front; it simply remains in place</xsl:when>
				<xsl:when test="//q/@contFront='after'">may remain in place or it may move to the position immediately before the verb</xsl:when>
				<xsl:when test="//q/@contFront='before'">moves to the front of the clause.</xsl:when>
				<xsl:when test="//q/@contFront='unknown'"> _______ </xsl:when>
			</xsl:choose>
<xsl:text> (section </xsl:text>
<sectionRef sec="sQuesContent" />
<xsl:text>).</xsl:text>
</p>
	</section1>

































































































</xsl:template>
</xsl:stylesheet>
