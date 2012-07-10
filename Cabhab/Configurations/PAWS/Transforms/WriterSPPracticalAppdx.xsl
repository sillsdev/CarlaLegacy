<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="appdx">
	<appendix id="aAppdx">
		<secTitle>Apéndice para lingüistas</secTitle>
		<p>
<xsl:text>Este apéndice presenta una explicacón técnica lingüística de las consonantes y las vocales del </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
		<section1 id="sConsonants">
			<secTitle>Las consonantes</secTitle>
			<p>
<xsl:text>Las consonantes que se presentan en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran en el cuadro </xsl:text>
<exampleRef num="xConsonants" equal="no" letterOnly="no" />
<xsl:text>.  También se presenta la identificación de estos sonidos en el alfabeto fonético, con los símbolos del alfabeto práctico entre paréntesis, si hay diferencias.</xsl:text>
</p>
			<p>
<object type="tComment">Observe que el cuadro contiene muchos símbolos más del alfabeto fonético que los que su lengua tiene. Usted necesita suprimir cualquiera de los símbolos y posiblemente también columnas o filas que no se usan en su lengua. Además, es necesario incorporear el símbolo de la ortografía práctica entre paréntesis después del símbolo fonético dondequiera que son diferentes. </object>
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
						<th>flejo</th>
						<th>Palatal</th>
						<th>Velar</th>
						<th>Glotal</th>
					</tr>
					<tr>
						<th>Oclusiva</th>
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
						<th>Fricativa</th>
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
						<th>Africada</th>
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
						<th>Nasal</th>
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
						<th>Lateral</th>
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
						<th>Vibrante</th>
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
						<th>mante</th>
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
			<secTitle>Las vocales</secTitle>
			<p>
<xsl:text>Las vocales que se presentan en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran en el cuadro </xsl:text>
<exampleRef num="xVowels" equal="no" letterOnly="no" />
<xsl:text>.  También se presenta la identificación de estos sonidos en el alfabeto fonético, con los símbolos del alfabeto práctico entre paréntesis, si hay diferencias.</xsl:text>
</p>
			<p>
<object type="tComment">Observe que el cuadro contiene muchos símbolos más del alfabeto fonético que los que su lengua tiene. Usted necesita suprimir cualquiera de los símbolos y posiblemente también columnas o filas que no se usan en su lengua. Además, es necesario incorporear el símbolo de la ortografía práctica entre paréntesis después del símbolo fonético dondequiera que son diferentes. </object>
</p>
			<example num="xVowels">
<table>
					<tr>
						<th> </th>
						<th>Anterior</th>
						<th>Central</th>
						<th>Posterior</th>
						<th>Posterior</th>
					</tr>
					<tr>
						<th> </th>
						<th>no redondeada</th>
						<th>no redondeada</th>
						<th>no redondeada</th>
						<th>redondeada</th>
					</tr>
					<tr>
						<th>Alta</th>
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
						<th>Media</th>
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
						<th>Baja</th>
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
