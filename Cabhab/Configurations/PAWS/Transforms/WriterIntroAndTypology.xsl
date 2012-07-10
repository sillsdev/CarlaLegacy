<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="intro">
	<section1 id="sIntro">
		<secTitle>Introduction</secTitle>
		<p>
<xsl:text>This is a description of the syntax of </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> based on the answers given to the PAWS Starter Kit </xsl:text>
<object type="tComment">Insert citation for References here</object>
<xsl:text>.   This grammar is written as a descriptive or comparative grammar relative to English. </xsl:text>
</p>
		<p>
<object type="tComment"> Once the starter kit is completed, this file can serve as a draft for preparing a more complete grammar.  For your final version, you can delete the information about English in each section if you choose to, or change it to relate to the national language in your area.</object>
</p>
		<p>
<object type="tComment">Until you have completed every page of the starter kit, some of the information given may be inaccurate because it is based only on the default answers.  Default answers relating to the position of elements are shown here as ______ until you have completed the appropraite page in the starter kit.</object>
</p>
		<p>
<object type="tComment"> DO NOT MODIFY THIS FILE UNTIL THE STARTER KIT IS COMPLETED, because your work will be overwritten by the PAWS program! We suggest you save this file under another name before editing it.  Also, before you begin to edit the file, we suggest you especially check the pronouns section, to see if you need to return to PAWS to make corrections to get the proper number of tables.</object>
</p>
		<p>
<xsl:text>The </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> language is spoken in LOCATIONS.   There are approximately NUMBER speakers.  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> is a member of the NAME_OF_FAMILY language family.</xsl:text>
</p>
		<section2 id="sOrtho">
			<secTitle>Orthography</secTitle>
			<p>
<xsl:text>The orthographic symbols used in writing </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
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
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_SYMBOL</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTER_EXAMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER_GLOSS</xsl:text>
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
			<p>
<object type="tComment">Add explanations for any diacritics or other symbols used.</object>
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
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are given on the first line.   The second line shows the morpheme glosses for the parts of the word, with the prefixes, root, and suffixes separated by hyphens.  The third line presents a literal translation in English, word for word, giving the English word gloss that is the closest in meaning to the word in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  If more than one English word is needed to express the meaning of the </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
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
		<secTitle>Typology</secTitle>
		<p>
<xsl:text>The basic word order of </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
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
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has prepositions (section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='after'">
<p>
<xsl:text>In contrast with the head-initial typology, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has postpositions (section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//pp/@pPos)='both'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has both prepositions and postpositions (section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='unknown'">
<p>
<xsl:text>In keeping with the head-final typology, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has postpositions (section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='before'">
<p>
<xsl:text>In contrast with the head-final typology, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has prepositions (section </xsl:text>
<sectionRef sec="sPP" />
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
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
				<xsl:text> does not have any type of relative clause.</xsl:text>
			</xsl:if>
<xsl:if test="normalize-space(//relcl/@exist)='yes'">
				<xsl:text> Relative clauses occur </xsl:text>
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
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
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
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
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
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
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
				   <xsl:when test="//q/@mainYNPos='unknown'">________</xsl:when>
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
				   <xsl:when test="//typology/@case='none'"> does not have any case system.   The exact same set of pronouns may be used in any position in the sentence and there is no marking on nouns or on any noun modifiers based on their position in the sentence.</xsl:when>
				   <xsl:when test="//typology/@case='nominative'"> has a nominative-accusative case system.   Subjects of both transitive and intransitive verbs are marked in the same way and use the same set of pronouns, but objects of transitive verbs are marked differently.</xsl:when>
				   <xsl:when test="//typology/@case='ergative'"> has an ergative-absolutive case system.   Subjects of intransitive verbs and objects of transitive verbs are marked in the same way and use the same set of pronouns, but subjects of transitive verbs are marked differently.</xsl:when>
				   <xsl:when test="//typology/@case='split'"> has a split case system.    The language normally follows the nominative-accusative case system, but the ergative-absolutive system is used under certain grammatical conditions.</xsl:when>
				</xsl:choose>
<xsl:if test="normalize-space(//typology/@case)!='none'">
<xsl:text>  In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
				   <xsl:when test="//np/@caseN='yes'">nouns and possibly their modifiers carry case marking as well as pronouns.</xsl:when>
				   <xsl:when test="//np/@caseN='no'">there is no case marking on nouns.  Only the pronoun systems indicate the case distinctions.</xsl:when>
				</xsl:choose>
</xsl:if>
<xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseDefault)='nominative' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseDefault)='nominative'">
					  <xsl:text>  Nominative case is the default (unmarked) case.</xsl:text>
				   </xsl:if>
<xsl:text> (See section </xsl:text>
<sectionRef sec="sNPCase" />
<xsl:text>.)</xsl:text>
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
   <xsl:when test="//typology/@classifier='no'"> does not have any system of noun classifiers.</xsl:when>
   <xsl:when test="//typology/@classifier='yesAgr'"> has a system of noun classifiers, as detailed in the next section.</xsl:when>
   <xsl:when test="//typology/@classifier='yesType'"> has a system of noun classifiers, as detailed in the next section.</xsl:when>
</xsl:choose>
</p>
	</section1>
   <xsl:if test="normalize-space(//typology/@classifier)!='no'">
<section1 id="sClassifiers">
	  <secTitle>Classifiers</secTitle>
	  <p>
<xsl:text>Some languages have a classifier system that marks nouns by their shape, position, or other characteristics.  In many of these languages, the classifier marking becomes an agreement system that requires concord throughout the nominal phrase and even with the verb.  Therefore, quantifiers, articles, demonstratives, adjectives, and verbs may need to be marked with the appropriate classifier.</xsl:text>
</p>
	  <p>
<xsl:text>The Bantu languages spoken in Africa represent perhaps the best known noun classifier system with concord agreement.  These languages have up to 22 distinct classes, which are represented by number.  About half of them are for singular nouns only and an equal number for plural nouns only.  Others are for mass or abstract nouns or locations.</xsl:text>
</p>
	  <p>
<xsl:text>There is also a simpler type of classifier system where there are classifier affixes derived from either a generic noun or a pronoun that appear on most nouns that refer to animals or insects, or to liquids, trees or objects made of wood, or objects that are basically round.  In this simpler system, there is usually no concord classifier agreement within the nominal phrase or sentence, so these affixes only show up on the nouns and might be considered more derivational.  However, there may be similar distinctions in the third person pronouns that refer to these types of nouns.  Such a system may use types rather than numbers to identify the classifiers.</xsl:text>
</p>
   <xsl:if test="normalize-space(//typology/@classifier)='yesType'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has the simpler kind of classifier system which distinguishes types of nouns, but there is no concord agreement within the nominal phrase or sentence.</xsl:text>
</p>
</xsl:if>
	  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has a classifier system with concord agreement throughout the nominal phrase and sentence.  In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the classifiers are distinguished by </xsl:text>
<xsl:choose>
		 <xsl:when test="//typology/@classifierNum='number'">class numbers. </xsl:when>
		 <xsl:when test="//typology/@classifierNum='type'">types.  <xsl:choose>
			<xsl:when test="//typology/@classifierTypeNumAgr='no'">The classifiers do not distinguish between singular and plural, so there is only one classifier for each type of noun.</xsl:when>
			<xsl:when test="//typology/@classifierTypeNumAgr='yes'">There are separate classifiers for singular and plural for each type of noun.</xsl:when>
		 </xsl:choose>
</xsl:when>
	  </xsl:choose>
</p>
</xsl:if>
	  <p>
<xsl:text>The classifiers in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown in the following chart:</xsl:text>
</p>
	  <xsl:if test="normalize-space(//typology/@classifier)='yesType' or normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//typology/@classifierNum)='type' and normalize-space(//typology/@classifierTypeNumAgr)='no'">
<example num="xClassifiers.16">
<table border="1">
			<caption>
			   <xsl:text>Noun classifiers by type</xsl:text>
			</caption>
			<tr>
			   <th>
				  Type
			   </th>
			   <th>Classifier</th>
			</tr>
			<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//typology/classAnimalExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>animal</xsl:text>
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
				  <xsl:text>animal</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//typology/classInsectExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>insect</xsl:text>
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
				  <xsl:text>insect</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//typology/classLiquidExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>liquid</xsl:text>
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
				  <xsl:text>liquid</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//typology/classRoundExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>round</xsl:text>
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
				  <xsl:text>round</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue4">
<xsl:value-of select="translate(string(//typology/classCylinderExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>cylindrical</xsl:text>
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
				  <xsl:text>cylindrical</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue5">
<xsl:value-of select="translate(string(//typology/classSphereExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>spherical</xsl:text>
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
				  <xsl:text>spherical</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue6">
<xsl:value-of select="translate(string(//typology/classTreeExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>tree</xsl:text>
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
				  <xsl:text>tree</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue7">
<xsl:value-of select="translate(string(//typology/classWoodExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>wooden</xsl:text>
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
				  <xsl:text>wooden</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue8">
<xsl:value-of select="translate(string(//typology/classOtherExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>general</xsl:text>
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
				  <xsl:text>general</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		 </table>
</example>
</xsl:if>

	  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//typology/@classifierNum)='type' and normalize-space(//typology/@classifierTypeNumAgr)='yes'">
<example num="xClassifiers.18">
<table border="1">
			<caption>
			   <xsl:text>Noun classifiers by type</xsl:text>
			</caption>
			<tr>
			   <th>Type</th>
<th>Number Agreement</th>
			   <th>Classifier</th>
			</tr>
			<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//typology/classAnimalSgExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>animal</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>animal</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//typology/classAnimalPlExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>animal</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>animal</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	 <xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//typology/classInsectSgExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>insect</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>insect</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//typology/classInsectPlExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>insect</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>insect</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue4">
<xsl:value-of select="translate(string(//typology/classLiquidSgExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>liquid</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>liquid</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue5">
<xsl:value-of select="translate(string(//typology/classLiquidPlExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>liquid</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>liquid</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue6">
<xsl:value-of select="translate(string(//typology/classRoundSgExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>round</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>round</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue7">
<xsl:value-of select="translate(string(//typology/classRoundPlExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>round</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>round</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue8">
<xsl:value-of select="translate(string(//typology/classCylinderSgExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>cylindrical</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>cylindrical</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue9">
<xsl:value-of select="translate(string(//typology/classCylinderPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9" select="string-length(normalize-space($sExampleValue9))" />
<xsl:choose>
<xsl:when test="$iExampleLength9 != 0 and $sExampleValue9 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>cylindrical</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>cylindrical</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue10">
<xsl:value-of select="translate(string(//typology/classSphereSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10" select="string-length(normalize-space($sExampleValue10))" />
<xsl:choose>
<xsl:when test="$iExampleLength10 != 0 and $sExampleValue10 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>spherical</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>spherical</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue11">
<xsl:value-of select="translate(string(//typology/classSpherePlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11" select="string-length(normalize-space($sExampleValue11))" />
<xsl:choose>
<xsl:when test="$iExampleLength11 != 0 and $sExampleValue11 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>spherical</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>spherical</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue12">
<xsl:value-of select="translate(string(//typology/classTreeSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12" select="string-length(normalize-space($sExampleValue12))" />
<xsl:choose>
<xsl:when test="$iExampleLength12 != 0 and $sExampleValue12 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>tree</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>tree</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue13">
<xsl:value-of select="translate(string(//typology/classTreePlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13" select="string-length(normalize-space($sExampleValue13))" />
<xsl:choose>
<xsl:when test="$iExampleLength13 != 0 and $sExampleValue13 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>tree</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>tree</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue14">
<xsl:value-of select="translate(string(//typology/classWoodSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14" select="string-length(normalize-space($sExampleValue14))" />
<xsl:choose>
<xsl:when test="$iExampleLength14 != 0 and $sExampleValue14 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>wooden</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>wooden</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue15">
<xsl:value-of select="translate(string(//typology/classWoodPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength15" select="string-length(normalize-space($sExampleValue15))" />
<xsl:choose>
<xsl:when test="$iExampleLength15 != 0 and $sExampleValue15 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength15" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>wooden</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>wooden</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue16">
<xsl:value-of select="translate(string(//typology/classOtherSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength16" select="string-length(normalize-space($sExampleValue16))" />
<xsl:choose>
<xsl:when test="$iExampleLength16 != 0 and $sExampleValue16 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength16" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>other / general</xsl:text>
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
<xsl:text>singular</xsl:text>
</td>
<td align="left">
				  <xsl:text>other / general</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue17">
<xsl:value-of select="translate(string(//typology/classOtherPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength17" select="string-length(normalize-space($sExampleValue17))" />
<xsl:choose>
<xsl:when test="$iExampleLength17 != 0 and $sExampleValue17 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength17" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>other / general</xsl:text>
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
<xsl:text>plural</xsl:text>
</td>
<td align="left">
				  <xsl:text>other / general</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		 </table>
</example>
</xsl:if>
	  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//typology/@classifierNum)='number'">
<example num="xClassifiers.20">
<table border="1">
			<caption>
			   <xsl:text>Noun classifiers by number</xsl:text>
			</caption>
			<tr>
			   <th>
				  Class Number
			   </th>
			   <th>Classifier</th>
<th>Number Agreement</th>
			</tr>
			<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//typology/class1Example),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>1</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class1agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class1agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class1agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>1</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class1agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class1agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class1agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//typology/class2Example),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>2</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class2agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class2agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class2agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
				  </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>2</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class2agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class2agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class2agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
				  </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//typology/class3Example),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>3</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class3agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class3agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class3agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>3</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class3agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class3agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class3agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//typology/class4Example),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>4</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class4agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class4agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class4agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>4</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class4agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class4agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class4agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue4">
<xsl:value-of select="translate(string(//typology/class5Example),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>5</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class5agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class5agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class5agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>5</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class5agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class5agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class5agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue5">
<xsl:value-of select="translate(string(//typology/class6Example),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>6</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class6agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class6agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class6agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>6</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class6agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class6agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class6agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue6">
<xsl:value-of select="translate(string(//typology/class7Example),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>7</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class7agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class7agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class7agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>7</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class7agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class7agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class7agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue7">
<xsl:value-of select="translate(string(//typology/class8Example),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>8</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class8agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class8agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class8agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>8</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class8agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class8agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class8agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue8">
<xsl:value-of select="translate(string(//typology/class9Example),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>9</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class9agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class9agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class9agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>9</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class9agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class9agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class9agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue9">
<xsl:value-of select="translate(string(//typology/class10Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9" select="string-length(normalize-space($sExampleValue9))" />
<xsl:choose>
<xsl:when test="$iExampleLength9 != 0 and $sExampleValue9 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>10</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class10agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class10agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class10agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>10</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class10agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class10agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class10agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue10">
<xsl:value-of select="translate(string(//typology/class11Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10" select="string-length(normalize-space($sExampleValue10))" />
<xsl:choose>
<xsl:when test="$iExampleLength10 != 0 and $sExampleValue10 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>11</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class11agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class11agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class11agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>11</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class11agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class11agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class11agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue11">
<xsl:value-of select="translate(string(//typology/class12Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11" select="string-length(normalize-space($sExampleValue11))" />
<xsl:choose>
<xsl:when test="$iExampleLength11 != 0 and $sExampleValue11 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>12</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class12agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class12agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class12agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>12</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class12agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class12agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class12agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue12">
<xsl:value-of select="translate(string(//typology/class13Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12" select="string-length(normalize-space($sExampleValue12))" />
<xsl:choose>
<xsl:when test="$iExampleLength12 != 0 and $sExampleValue12 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>13</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class13agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class13agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class13agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>13</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class13agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class13agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class13agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue13">
<xsl:value-of select="translate(string(//typology/class14Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13" select="string-length(normalize-space($sExampleValue13))" />
<xsl:choose>
<xsl:when test="$iExampleLength13 != 0 and $sExampleValue13 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>14</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class14agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class14agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class14agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>14</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class14agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class14agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class14agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue14">
<xsl:value-of select="translate(string(//typology/class15Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14" select="string-length(normalize-space($sExampleValue14))" />
<xsl:choose>
<xsl:when test="$iExampleLength14 != 0 and $sExampleValue14 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>15</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class15agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class15agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class15agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>15</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class15agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class15agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class15agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue15">
<xsl:value-of select="translate(string(//typology/class16Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength15" select="string-length(normalize-space($sExampleValue15))" />
<xsl:choose>
<xsl:when test="$iExampleLength15 != 0 and $sExampleValue15 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength15" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>16</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class16agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class16agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class16agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>16</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class16agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class16agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class16agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue16">
<xsl:value-of select="translate(string(//typology/class17Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength16" select="string-length(normalize-space($sExampleValue16))" />
<xsl:choose>
<xsl:when test="$iExampleLength16 != 0 and $sExampleValue16 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength16" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>17</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class17agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class17agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class17agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>17</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class17agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class17agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class17agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue17">
<xsl:value-of select="translate(string(//typology/class18Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength17" select="string-length(normalize-space($sExampleValue17))" />
<xsl:choose>
<xsl:when test="$iExampleLength17 != 0 and $sExampleValue17 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength17" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>18</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class18agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class18agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class18agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>18</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class18agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class18agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class18agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue18">
<xsl:value-of select="translate(string(//typology/class19Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength18" select="string-length(normalize-space($sExampleValue18))" />
<xsl:choose>
<xsl:when test="$iExampleLength18 != 0 and $sExampleValue18 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength18" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>19</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class19agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class19agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class19agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>19</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class19agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class19agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class19agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue19">
<xsl:value-of select="translate(string(//typology/class20Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength19" select="string-length(normalize-space($sExampleValue19))" />
<xsl:choose>
<xsl:when test="$iExampleLength19 != 0 and $sExampleValue19 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength19" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>20</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class20agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class20agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class20agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>20</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class20agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class20agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class20agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue20">
<xsl:value-of select="translate(string(//typology/class21Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength20" select="string-length(normalize-space($sExampleValue20))" />
<xsl:choose>
<xsl:when test="$iExampleLength20 != 0 and $sExampleValue20 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength20" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>21</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class21agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class21agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class21agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>21</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class21agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class21agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class21agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue21">
<xsl:value-of select="translate(string(//typology/class22Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength21" select="string-length(normalize-space($sExampleValue21))" />
<xsl:choose>
<xsl:when test="$iExampleLength21 != 0 and $sExampleValue21 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength21" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>22</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class22agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class22agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class22agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>22</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class22agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class22agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class22agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue22">
<xsl:value-of select="translate(string(//typology/class23Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength22" select="string-length(normalize-space($sExampleValue22))" />
<xsl:choose>
<xsl:when test="$iExampleLength22 != 0 and $sExampleValue22 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength22" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>23</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class23agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class23agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class23agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>23</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class23agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class23agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class23agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue23">
<xsl:value-of select="translate(string(//typology/class24Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength23" select="string-length(normalize-space($sExampleValue23))" />
<xsl:choose>
<xsl:when test="$iExampleLength23 != 0 and $sExampleValue23 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength23" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>24</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class24agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class24agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class24agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>24</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class24agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class24agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class24agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue24">
<xsl:value-of select="translate(string(//typology/class25Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength24" select="string-length(normalize-space($sExampleValue24))" />
<xsl:choose>
<xsl:when test="$iExampleLength24 != 0 and $sExampleValue24 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength24" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>25</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class25agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class25agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class25agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				  <xsl:text>25</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class25agr='sg'">singular</xsl:when>
					 <xsl:when test="//typology/@class25agr='pl'">plural</xsl:when>
					 <xsl:when test="//typology/@class25agr='irrelevant'">irrelevant</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
		 </table>
</example>
</xsl:if>

 <xsl:if test="normalize-space(//typology/@classifier)='yesType'">
<p>
<xsl:text>Some example nouns with their associated type classifiers are:</xsl:text>
</p>
</xsl:if>
	  <xsl:if test="normalize-space(//typology/@classifier)='yesType'">
<example num="xClassifiers.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/classifierTypeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/classifierTypeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/classifierTypeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/classifierTypeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xClassifiers.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xClassifiers.24.1</xsl:text>
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
	  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Some example sentences showing the concord classifier agreement  within the nominal phrase and on the verb are:</xsl:text>
</p>
</xsl:if>
	  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr'">
<example num="xClassifiers.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/classifierAgrExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/classifierAgrExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/classifierAgrExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/classifierAgrExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xClassifiers.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xClassifiers.28.1</xsl:text>
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
</xsl:if>



















































































































































































































































































































































































</xsl:template>
</xsl:stylesheet>
