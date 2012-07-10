<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="appdx">
	<appendix id="aAppdx">
		<secTitle>Appendix for linguists</secTitle>
		<p>
<xsl:text>This appendix presents a more technical explanation of the consonants and vowels in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
		<section1 id="sConsonants">
			<secTitle>Consonants</secTitle>

		<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has the consonants shown in </xsl:text>
<exampleRef num="xConsonants" equal="no" letterOnly="no" />
<xsl:text>.   The chart identifies the sounds in the phonetic alphabet (IPA), followed by the symbol used in the practical orthography in parentheses, if they are different.</xsl:text>
</p>
		<p>
<object type="tComment">Note that the chart contains many more IPA symbols than your language has.  You need to delete any symbols and possibly full columns or rows not used in your language.  Further, enter the symbol from the practical orthography in parenthesis after the IPA symbol wherever they are different.</object>
</p>
<example num="xConsonants">
<table>
					<tr>
						<th> </th>
						<th> </th>
						<th>Inter-</th>
						<th> </th>
						<th>Alveo-</th>
						<th>Retro-</th>
						<th> </th>
						<th> </th>
						<th> </th>
					</tr>
					<tr>
						<th> </th>
						<th>Bilabial</th>
						<th>dental</th>
						<th>Alveolar</th>
						<th>palatal</th>
						<th>flex</th>
						<th>Palatal</th>
						<th>Velar</th>
						<th>Glotal</th>
					</tr>
					<tr>
						<th>Stops</th>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>p</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>t</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ʈ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>c</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>k</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ʔ</langData>
						</td>
					</tr>
					<tr>
						<th> </th>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>b</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>d</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɖ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɟ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɡ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
					</tr>
					<tr>
						<th>Fricatives</th>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɸ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>θ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>s</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ʃ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ʂ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ç</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>x</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>h</langData>
						</td>
					</tr>
					<tr>
						<th> </th>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>β</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ð</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>z</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ʒ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ʐ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ʝ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɣ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɦ</langData>
						</td>
					</tr>
					<tr>
						<th>Africates</th>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>p͡ɸ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>t͡ʃ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
					</tr>
					<tr>
						<th> </th>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>b͡β</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>d͡ʒ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
					</tr>
					<tr>
						<th>Nasals</th>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>m</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>n</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɳ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɲ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ŋ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
					</tr>
					<tr>
						<th>Laterals</th>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> l</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɭ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ʎ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ʟ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
					</tr>
					<tr>
						<th>Flaps</th>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɾ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɽ</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
					</tr>
					<tr>
						<th>Aproxi-</th>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>w</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>j</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>w</langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
					</tr>
					<tr>
						<th>mants</th>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
						<td align="center">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute> </langData>
						</td>
					</tr>
				</table>
</example>
		</section1>
		<section1 id="sVowels">
			<secTitle>Vowels</secTitle>

		<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has the vowels shown in </xsl:text>
<exampleRef num="xVowels" equal="no" letterOnly="no" />
<xsl:text>.  The chart identifies the sounds according to the phonetic alphabet (IPA),  followed by the symbol used in the practical orthography in parentheses, if they are different.</xsl:text>
</p>
		<p>
<object type="tComment">Note that the chart contains many more IPA symbols than your language has.  You need to delete any symbols and possibly full columns or rows not used in your language.  Further, enter the symbol from the practical orthography in parenthesis after the IPA symbol wherever they are different.</object>
</p>
		<example num="xVowels">
<table>
				<tr>
					<th></th>
					<th>Front</th>
					<th>Central</th>
					<th>Back</th>
					<th>Back</th>
				</tr>
				<tr>
					<th></th>
					<th>Unrounded</th>
					<th>Unrounded</th>
					<th>Unrounded</th>
					<th>Rounded</th>
				</tr>
				<tr>
					<th>High</th>
					<td align="center">
						<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>i</langData>
					</td>
					<td align="center">
						<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɨ</langData>
					</td>
					<td align="center">
						<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɯ</langData>
					</td>
					<td align="center">
						<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>u</langData>
					</td>
				</tr>
				<tr>
					<th>Mid</th>
					<td align="center">
						<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>e</langData>
					</td>
					<td align="center">
						<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ə</langData>
					</td>
					<td align="center">
						<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɤ</langData>
					</td>
					<td align="center">
						<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>o</langData>
					</td>
				</tr>
				<tr>
					<th>Low</th>
					<td align="center">
						<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>æ</langData>
					</td>
					<td align="center">
						<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>a</langData>
					</td>
					<td align="center">
						<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɑ</langData>
					</td>
					<td align="center">
						<langData>
<xsl:attribute name="lang">
<xsl:text>lIPA</xsl:text>
</xsl:attribute>ɒ</langData>
					</td>
				</tr>
			</table>
</example>
		</section1>
	</appendix>
</xsl:template>
</xsl:stylesheet>
