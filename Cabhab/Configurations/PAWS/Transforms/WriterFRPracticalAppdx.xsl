<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="appdx">
	<appendix id="aAppdx">
		<secTitle>Appendice pour les linguistes</secTitle>
		<p>
<xsl:text>Cet appendice présente une explication plus technique des consonnes et des voyelles en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
		<section1 id="sConsonants">
			<secTitle>Consonnes</secTitle>
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
<xsl:text> il y a les consonnes montrés en </xsl:text>
<exampleRef num="xConsonants" equal="no" letterOnly="no" />
<xsl:text>.   Le tableau identifie les sons dans l’alphabet phonétique (API), suivis du symbole utilisé dans l’orthographe pratique entre parenthèses, 
					s’ils sont différents.</xsl:text>
</p>
			<p>
<object type="tComment">Il faut noter que le tableau contient un plus grand nombre de symboles API que l’on ne voit en votre langue. Il faut effacer tous les symboles et peut-être des colonnes ou des lignes entières qui ne sont pas utilisés dans votre langue. 
			En plus, entrez le symbole de l’orthographe pratique entre parenthèses après le symbole API dans chaque cas où ils sont différents.</object>
</p>
			<example num="xConsonants">
<table>
					<tr>
						<th> </th>
						<th> </th>
						<th>Inter-</th>
						<th> </th>
						<th>Alvéolo-</th>
						<th>Rétro-</th>
						<th> </th>
						<th> </th>
						<th> </th>
					</tr>
					<tr>
						<th> </th>
						<th>Bilabiale</th>
						<th>dentale</th>
						<th>Alvéolaire</th>
						<th>palatale</th>
						<th>flexe</th>
						<th>Palatale</th>
						<th>Vélaire</th>
						<th>Glottale</th>
					</tr>
					<tr>
						<th>Occlusives</th>
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
						<th>Affriquées</th>
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
						<th>Nasales</th>
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
						<th>Latérales</th>
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
						<th>Battues</th>
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
						<th>mantes</th>
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
			<secTitle>Voyelles</secTitle>
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
<xsl:text> il y a les voyelles montrées en </xsl:text>
<exampleRef num="xVowels" equal="no" letterOnly="no" />
<xsl:text>.  Le tableau identifie les sons de l’alphabet phonétique (API), suivis du symbole utilisé dans l’orthographe pratique entre parenthèses, s’ils sont différents.</xsl:text>
</p>
			<p>
<object type="tComment">Il faut noter que le tableau contient un plus grand nombre de symboles API que l’on ne voit en votre langue. Il faut effacer tous les symboles et peut-être des colonnes ou des lignes entières qui ne sont pas utilisés dans votre langue. En plus, entrez le symbole de l’orthographe pratique entre parenthèses après le symbole 
				API dans chaque cas où ils sont différents.</object>
</p>
			<example num="xVowels">
<table>
					<tr>
						<th></th>
						<th>Antérieure</th>
						<th>Centrale</th>
						<th>Postérieure</th>
						<th>Postérieure</th>
					</tr>
					<tr>
						<th></th>
						<th>Non-arroudie</th>
						<th>Non-arroudie</th>
						<th>Non-arroudie</th>
						<th>Arroudie</th>
					</tr>
					<tr>
						<th>Fermeé</th>
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
						<th>Moyenne</th>
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
						<th>Ouverte</th>
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
