<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="intro">
	<section1 id="sIntro">
		<secTitle>Introduction</secTitle>
		<p contentType="ctPracticalIntro">
<xsl:text>Cette grammaire</xsl:text>
<endnote id="nPAWS">
				<p>
<xsl:text>La première version de cette grammaire a été produite par le programme PAWS </xsl:text>
<citation paren="initial" ref="rPAWS" author="yes" />
<xsl:text>, </xsl:text>
<citation author="no" paren="final" ref="rGrammaticography" />
<xsl:text>.</xsl:text>
</p>
			</endnote>
<xsl:text> est une description de la façon dont la plupart des mots et des locutions et des phrases sont formés en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Il est visé à un grand public qui comprend des personnes de langue maternelle des enseignants bilingues, des linguistes et tous ceux qui désirent en savoir plus sur </xsl:text>
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
	   <p contentType="ctComparativeIntro">
<xsl:text>Cette grammaire</xsl:text>
<endnote id="nPAWSci">
	         <p>
<xsl:text>La première version de cette grammaire a été produite par le programme PAWS </xsl:text>
<citation paren="initial" ref="rPAWS" author="yes" />
<xsl:text>, </xsl:text>
<citation author="no" paren="final" ref="rGrammaticography" />
<xsl:text>.</xsl:text>
</p>
	      </endnote>
<xsl:text> est une description de la syntaxe et est une partie de la morphologie de  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Elle fournit des comparaisons avec le français et quelquefois avec d’autres langues de même qu’elle documente une grande partie de la langue.  Il est visé à un grand public qui comprend des personnes de langue maternelle, des enseignants bilingues, des linguistes et tous ceux qui désirent en savoir plus sur </xsl:text>
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
	   <p contentType="ctPracticalIntro">
<object type="tComment"> Quand vous aura fini PAWS, ce fichier peut servir d’ébauche pour compléter votre grammaire. Les données ici sont la version de grammaire pratique par défaut qui founit une introduction de base seulement à chaque section et ensuite des renseignements sur votre langue. Nous suggérons que vous utilisiez cette version pour ajouter des gloses dans les tableaux, en complétant les exemples interlinéaires et en éditant les renseignements sur votre langue. Portez une attention spéciale aux lignes qui ont ____ puisque ce sont des endroits où vous avez dit que votre langue agit autrement que les options données dans PAWS, donc le texte s’adaptera exactement sans être édité.</object>
<object type="tComment">Vous pouvez aussi choisir de voir ou d’imprimer une version comparative de la grammaire en enregistrant  une deuxième copie du fichier sous un nouveau nom et en changeant ensuite le contentControlChoice à la fin du fichier.   </object>
</p>
	   <p contentType="ctComparativeIntro">
<object type="tComment"> Quand vous aura fini PAWS, ce fichier peut servir d’ébauche pour compléter votre grammaire. Puisque vous lisez cette version vous aurez déjà changé le contentControlChoice en grammaire comparative. Pour votre version finale, vous pouvez changer les renseignements sur le français dans chaque section pour se rapporter à la langue nationale de votre région, si vous choisissez de le faire.  </object>
</p>
	   <p>
<object type="tComment">Si vous regardez cette sortie de grammaire avant d’avoir complété chaque page du paquet initiale, certaines informations données peuvent être inexactes parce qu’elles se basent seulement sur des réponses par défaut. Les réponses par défaut relatives à la position des éléments sont montrés ici comme ________ jusqu’à ce que vous ayez complété la page appropriée du PAWS. De plus certaines informations manqueront puisque les réponses aux questions utilisant les cases n’auront pas encore été cochées.  </object>
</p>
		<p>
<object type="tComment"> NE MODIFIEZ PAS CE FICHIER JUSQU’A CE QUE VOUS AYEZ COMPLETE LE PAWS - y compris la Vérification Finale - parce que vos données seront éffacées par le programme PAWS.  Nous suggérons que vous enrégistrez ce fichier sous un autre nom avant de l’éditer. </object>
<object type="tComment">Si vous ne l’utilisez pas déjà, nous suggérons d’utiliser l’éditeur XML XMLMind si possible.  Il rend beaucoup plus facile d’imprimer une version pdf puisque des options supplémentaires sont disponibles pour traiter toutes les fonctions supplémentaires de XLing Paper, qu’utilise la sortie de grammaire. Vous trouverez plus de renseignements sur http://www.xlingpaper.org/.</object>
</p>
	   <p>
<object type="tComment">Il y a certains commentaires en rouge comme ceux-ci partout dans la grammaire qui vous donneront des instructions spéciales à respecter.  Eliminez chaque commentaire lorsque vous l’aurez complété afin qu’il ne réapparaisse pas dans la sorite.  Nous les avons fait apparaître exprès dans la sortie comme rappels pour vous et votre consultant de ce qu’il vous faudra encore faire.</object>
</p>
		<p>
<xsl:text>On parle </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> dans ENTRER_LOCATIONS.   Il y a approximativement ENTRER_CHIFFRE
				personnes qui parlent </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> est un fait partie de la famille de langues ENTRER_NOM_DE_FAMILLE.</xsl:text>
</p>
		<section2 id="sOrtho">
			<secTitle>Orthographe</secTitle>
			<p>
<xsl:text>Les symboles orthographiques utilisés pour écrire en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont pour les mots natifs et aussi pour les mots empruntés d’autres langues. Dans </xsl:text>
<exampleRef num="xAlphabet" equal="no" letterOnly="no" />
<xsl:text> ces symboles sont présentés dans l’ordre alphabétique.</xsl:text>
</p>
			<example num="xAlphabet">
<table>
					<tr>
						<th>Symbole</th>
						<th>Exemple</th>
						<th>Glose</th>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
						</td>
								<td align="left">
									<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
								</td>
								<td align="left">
									<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
								</td>
							</tr>
								<tr>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
									</td>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
									</td>
									<td align="left">
										<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
									</td>
								</tr>
								<tr>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
									</td>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
									</td>
									<td align="left">
										<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
									</td>
								</tr>
								<tr>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
									</td>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
									</td>
									<td align="left">
										<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
									</td>
								</tr>
								<tr>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
									</td>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
									</td>
									<td align="left">
										<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
									</td>
								</tr>
								<tr>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
									</td>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
									</td>
									<td align="left">
										<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
									</td>
								</tr>
								<tr>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
									</td>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
									</td>
									<td align="left">
										<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
									</td>
								</tr>
								<tr>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
									</td>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
									</td>
									<td align="left">
										<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
									</td>
								</tr>
								<tr>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
									</td>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
									</td>
									<td align="left">
										<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
									</td>
								</tr>
								<tr>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
									</td>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
									</td>
									<td align="left">
										<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
									</td>
								</tr>
								<tr>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
									</td>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
									</td>
									<td align="left">
										<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
									</td>
								</tr>
								<tr>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
									</td>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
									</td>
									<td align="left">
										<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
									</td>
								</tr>
								<tr>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
									</td>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
									</td>
									<td align="left">
										<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
									</td>
								</tr>
								<tr>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
									</td>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
									</td>
									<td align="left">
										<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
									</td>
								</tr>
								<tr>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
									</td>
									<td align="left">
										<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
									</td>
									<td align="left">
										<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
									</td>
								</tr>
								<tr>
					<td align="left">
									<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
								</td>
								<td align="left">
									<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
								</td>
								<td align="left">
									<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
								</td>
							</tr>
							<tr>
								<td align="left">
									<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
								</td>
								<td align="left">
									<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
								</td>
								<td align="left">
									<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
								</td>
							</tr>
							<tr>
								<td align="left">
									<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
								</td>
								<td align="left">
									<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
								</td>
								<td align="left">
									<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
								</td>
							</tr>
							<tr>
								<td align="left">
									<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
								</td>
								<td align="left">
									<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
								</td>
								<td align="left">
									<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
								</td>
							</tr>
							<tr>
								<td align="left">
									<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
								</td>
								<td align="left">
									<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
								</td>
								<td align="left">
									<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
								</td>
							</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
						</td>
					</tr>
					<tr>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_SYMBOLE</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>ENTRER_EXEMPLE</langData>
						</td>
						<td align="left">
							<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER_GLOSE</xsl:text>
</gloss>
						</td>
					</tr>
				</table>
</example>
			<p>
<xsl:text>Regardez l’appendice </xsl:text>
<appendixRef app="aAppdx" />
<xsl:text> pour les listes des consonnes et des voyelles qui comparent l’orthographe pratique avec l’Alphabet phonétique international (API).</xsl:text>
</p>
			<p>
<object type="tComment">Ajoutez des explications pour tous signes diacritiques ou autres symboles tels que les indicateurs de ton.</object>
</p>
		</section2>
		<section2 id="sExamples">
			<secTitle>Conventions utilisées dans des exemples</secTitle>
			<p>
<xsl:text>Cette grammaire contient beaucoup de syntagmes et phrases qui fournissent des exemples.  La plupart des exemples sont présentés dans un format interlinéaire consistant en trois ou quatre lignes comme montré sous </xsl:text>
<exampleRef num="xEx" equal="no" letterOnly="no" />
<xsl:text>:</xsl:text>
</p>
			<example num="xEx">
<table>
					<tr>
						<td align="left">
							<xsl:text>[mots vernaculaires]</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mot</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mot</langData>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mot</langData>
						</td>
					</tr>
					<tr>
						<td align="left">
							<xsl:text>[gloses littéraux du mot]</xsl:text>
						</td>
						<td align="left">
							<xsl:text>glose</xsl:text>
						</td>
						<td align="left">
							<xsl:text>glose</xsl:text>
						</td>
						<td align="left">
							<xsl:text>glose</xsl:text>
						</td>
					</tr>
					<tr>
						<td align="left">
							<xsl:text>[gloses de morpheme]</xsl:text>
						</td>
						<td align="left">
							<xsl:text>PRE-racine-SUF</xsl:text>
						</td>
						<td align="left">
							<xsl:text>PRE-racine-SUF</xsl:text>
						</td>
						<td align="left">
							<xsl:text>PRE-racine-SUF</xsl:text>
						</td>
					</tr>
					<tr>
						<td align="left">
							<xsl:text>[traduction libre]</xsl:text>
						</td>
						<td align="left" colspan="3">
							<xsl:text>traduction libre du syntagme ou de la phrase</xsl:text>
						</td>
					</tr>
				</table>
</example>
			<p>
<xsl:text>Les mots en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont donnés sur la première ligne.  La seconde ligne présente une traduction littérale en français, mot pour mot, donnant le glose du mot français qui se rapproche le plus de la signification du mot en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Si plus qu’un mot en français est nécessaire pour exprimer le signification du mot en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, ces mots en français seront séparés par des points.  Chaque fois qu’un ou plusieurs des mots en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> a plus qu’une partie (morphème), la troisième ligne montre les gloses ou abbréviations pour les parties du mot, avec les préfixes, racines et suffixes séparés par des traits d’union.  Cette troisième partie sera probablement la plus utile pour les linguists. La dernière ligne donne la traduction libre pour l’exemple entier.</xsl:text>
</p>
			<p>
<object type="tComment">Ajoutez ici plus de détails sur toutes les différences entre votre langue et le français. Par exemple, si votre langue ne distingue pas entre le nombre et/ou le genre sur les noms, mais que la langue de glose le fait, vous pouvez choisir d’utiliser seulement les formes au singulier et /ou au masculin pour les gloses</object>
</p>
			<p>
<xsl:text>Après avoir donné des informations sur la typologie syntactique de la langue, la grammaire commence par décrire les parties du discours et les syntagmes qu’elles gouvernent dans les sections </xsl:text>
<sectionRef sec="sN" />
<xsl:text> - </xsl:text>
<sectionRef sec="sExcl" />
<xsl:text>.  Les phrases simples sont alors couvertes dans la section </xsl:text>
<sectionRef sec="sIP" />
<xsl:text>. Les constructions qui impliquent des changements dans l’ordre des mots sont présentées dans les sections </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text> - </xsl:text>
<sectionRef sec="sNeg" />
<xsl:text>.  Les constructions de coordination sont traitées dans la section </xsl:text>
<sectionRef sec="sCoord" />
<xsl:text>,  suivies finalement par différents types de propositions dépendantes dans les sections </xsl:text>
<sectionRef sec="sComp" />
<xsl:text> - </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>.  Des textes sont inclus à la fin pour démontrer comment sont formées des constructions plus grandes telles que les paragraphes, les conversations et les récits narratifs.</xsl:text>
</p>
		</section2>
	</section1>
	<section1 id="sTypology">
		<secTitle>Typologie</secTitle>
		<p>
<xsl:text>L’ordre de base des mots en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> dans les phrases transitives est </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@wordOrder='SVO'">Sujet-Verbe-Objet</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">Sujet-Objet-Verbe</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">Verbe-Sujet-Objet</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">Verbe-Objet-Sujet</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">Objet-Verbe-Sujet</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">Objet-Sujet-Verbe</xsl:when>
			</xsl:choose>
<xsl:text>, comme montré dans les exemples suivants:</xsl:text>
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
		<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='unknown'">
<p>
<xsl:text>Conformément à la typologie centrifuge, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>  a des prépositions (section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//pp/@pPos)='after'">
<p>
<xsl:text>En contraste avec la typologie centrifuge, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> a des postpositions (section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//pp/@pPos)='both'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> a des prepositions et des postpositions (section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='after' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='unknown' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='unknown'">
<p>
<xsl:text>Conformément à la typologie centripète, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>a des postpositions (section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//pp/@pPos)='before' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//pp/@pPos)='before'">
<p>
<xsl:text>En contraste avec la typologie centripète, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> a des prépositions (section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<p>
<xsl:if test="normalize-space(//np/@possNP)='yes' or normalize-space(//np/@possNP)='yesOnly'">
		   	<xsl:text>Le syntagme nominal et les possessifs pronominaux se trouvent </xsl:text>
			   <xsl:choose>
				<xsl:when test="//np/@possNounPos='before'">avant le</xsl:when>
			   	<xsl:when test="//np/@possNounPos='after'">après le</xsl:when>
			   	<xsl:when test="//np/@possNounPos='either'">des deux côtés du</xsl:when>
				<xsl:when test="//np/@possNounPos='unknown'"> _______ </xsl:when>
			</xsl:choose>
		   	<xsl:text> nom possédé (section </xsl:text>
			<sectionRef sec="sNPPoss" />
			   <xsl:text>). </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possNP)='no'">
		   	<xsl:text>Les possesseurs pronominaux se trouvent </xsl:text>
		         <xsl:choose>
		         	<xsl:when test="//np/@possNounPos='before'">avant le</xsl:when>
		         	<xsl:when test="//np/@possNounPos='after'">après le</xsl:when>
		         	<xsl:when test="//np/@possNounPos='either'">des deux côtés du</xsl:when>
		            <xsl:when test="//np/@possNounPos='unknown'"> _______ </xsl:when>
		         </xsl:choose>
		   	<xsl:text> nom possédé, mais les possessifs de syntagme nominal se trouvent seulement dans </xsl:text>
		         <xsl:choose>
		         	<xsl:when test="//pp/@pPos='before'">un syntagme prépositionel</xsl:when>
		         	<xsl:when test="//pp/@pPos='after'">un syntagme postpositionnel</xsl:when>
		         	<xsl:when test="//pp/@pPos='both'">un syntagme adpositionnel</xsl:when>
		         </xsl:choose>
		   	<xsl:text> qui se trouve </xsl:text>
		         <xsl:choose>
		         	<xsl:when test="//np/@possPPPos='before'">avant le</xsl:when>
		         	<xsl:when test="//np/@possPPPos='after'">après le</xsl:when>
		         	<xsl:when test="//np/@possPPPos='either'">des deux côtés du</xsl:when>
		            <xsl:when test="//np/@possPPPos='unknown'"> _______ </xsl:when>
		         </xsl:choose>
		   	<xsl:text> nom possédé (section </xsl:text>
		         <sectionRef sec="sNPPoss" />
		         <xsl:text>). </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possNP)='none'">
		   	<xsl:text>Les syntagmes nominaux et les possesseurs pronominaux se trouvent seulement dans </xsl:text>
		         <xsl:choose>
		         	<xsl:when test="//pp/@pPos='before'">un syntagme prépositionel</xsl:when>
		         	<xsl:when test="//pp/@pPos='after'">un syntagme postpositionnel</xsl:when>
		         	<xsl:when test="//pp/@pPos='both'">un syntagme adpositionnel</xsl:when>
		         </xsl:choose>
		   	<xsl:text> qui se trouve </xsl:text>
		   	<xsl:choose>
		   		<xsl:when test="//np/@possPPPos='before'">avant le</xsl:when>
		   		<xsl:when test="//np/@possPPPos='after'">après le</xsl:when>
		   		<xsl:when test="//np/@possPPPos='either'">des deux côtés du</xsl:when>
		   		<xsl:when test="//np/@possPPPos='unknown'"> _______ </xsl:when>
		   	</xsl:choose>
		   	<xsl:text> nom possédé (section </xsl:text>
		   	<sectionRef sec="sNPPoss" />
		         <xsl:text>). </xsl:text>
</xsl:if>
</p>
	   <xsl:if test="normalize-space(//np/adjPosOther/@checked)='no'">
<p>
<xsl:text>Les syntagmes adjectivaux se trouvent </xsl:text>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>d’un côté ou de l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='no'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='no'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='no'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='yes'">
<xsl:text>d’un côté ou de l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:text> nom qu’ils modifient (section </xsl:text>
<sectionRef sec="sNPAdjP" />
<xsl:text>).   </xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no' and normalize-space(//np/adjPosOther/@checked)='yes'">
<p>
<xsl:text>Les syntagmes adjectivaux se trouvent ___</xsl:text>
<xsl:value-of select="//np/adjPosOther" />
<xsl:text> (section </xsl:text>
<sectionRef sec="sNPAdjP" />
<xsl:text>).   </xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//np/adjPosOther/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='yes' or normalize-space(//np/adjPosOther/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='yes' or normalize-space(//np/adjPosOther/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes'">
<p>
<xsl:text>Les syntagmes adjectivaux se trouvent </xsl:text>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>d’un côté ou de l’autre du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='no'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='no'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='no'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjBefore/@checked)='yes'">
<xsl:text>d’un côté ou de l’autre ou des deux côtés du</xsl:text>
</xsl:if>
<xsl:text> nom qu’ils modifient, et peuvent aussi se trouver ___</xsl:text>
<xsl:value-of select="//np/adjPosOther" />
<xsl:text> (section </xsl:text>
<sectionRef sec="sNPAdjP" />
<xsl:text>).   </xsl:text>
</p>
</xsl:if>
	   <p>
<xsl:if test="normalize-space(//relcl/@exist)='no'">
				<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
	      	<xsl:text> n’a aucun type de proposition relative.</xsl:text>
			</xsl:if>
<xsl:if test="normalize-space(//relcl/@exist)='yes'">
				<xsl:text> Les propositions relatives se trouvent </xsl:text>
				<xsl:choose>
					<xsl:when test="//relcl/@clausePos='before'">avant le</xsl:when>
					<xsl:when test="//relcl/@clausePos='after'">après le</xsl:when>
					<xsl:when test="//relcl/@clausePos='either'">des deux côtés du</xsl:when>
					<xsl:when test="//relcl/@clausePos='unknown'"> _______ </xsl:when>
				</xsl:choose>
				<xsl:text> nom principal (section </xsl:text>
				<sectionRef sec="sRelCl" />
				<xsl:text>).   </xsl:text>
			</xsl:if>
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
<xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
<xsl:text>un sujet nul (anaphore zéro) est permis dans n’importe quel type de phrase.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes'">
<xsl:text>le sujet peut paraître nul dû aux pronoms dépendants (clitiques pronominaux) qui s’attachent au verbe, mais ce n’est pas une vraie langue à sujet nul.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropOther/@checked)='no' and normalize-space(//ip/proDropNone/@checked)='no'">
<xsl:text>un sujet nul (anaphore zéro) n’est pas permis.  Le sujet peut être explicite  à l’exception des impératifs.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropNone/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropOther/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>un sujet nul (anaphore zéro) n’est pas permis.  Le sujet doit être explicite même dans les impératifs.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropNone/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text> un sujet nul est permis seulement ___</xsl:text>
<xsl:value-of select="//ip/proDropOther" />
<xsl:text> .</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='yes'">
<xsl:text> un sujet nul est permis ___</xsl:text>
<xsl:value-of select="//ip/proDropOther" />
<xsl:text> et aussi dans les impératifs.</xsl:text>
</xsl:if>
<xsl:text>  (section </xsl:text>
<sectionRef sec="sIPProDrop" />
<xsl:text>).</xsl:text>
<xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
				<xsl:text>  Un objet nul </xsl:text>
				<xsl:choose>
					<xsl:when test="//ip/@proDropObject='no'">n’est pas</xsl:when>
					<xsl:when test="//ip/@proDropObject='yes'">est</xsl:when>
				</xsl:choose>
				<xsl:text> premis.</xsl:text>
			</xsl:if>
</p>
		<xsl:if test="normalize-space(//ip/@aux)='no'">
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
<xsl:text>  il n’y a pas d’auxilliaires qui sont écrits comme mots indépendants (section </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//ip/@aux)='yes'">
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
<xsl:text> il y a des auxilliares qui sont écrits comme mots indépendants.  Ceux-ci se trouvent </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@wordOrder='SVO'">avant</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">après</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">avant</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">avant</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">après</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">après</xsl:when>
			</xsl:choose>
<xsl:text> le verbe principal (section </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>).</xsl:text>
</p>
</xsl:if>
		<p>
<xsl:if test="normalize-space(//q/@mainYNWord)='yes' and normalize-space(//q/mainYNWordOther/@checked)='no' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNWordOther/@checked)='no'">
				<xsl:text>Dans les questions oui/non il y a un marqueur de question ou complémenteur qui se trouve </xsl:text>
				<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
				<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
				<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='no'">
<xsl:text>d’un côté ou de l’autre du</xsl:text>
</xsl:if>
				<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
				<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
				<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
				<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>d’un côté ou de l’autre ou des deux côtés du</xsl:text>
</xsl:if>
				<xsl:text> reste de la question (section </xsl:text>
				<sectionRef sec="sQuesYN" />
				<xsl:text>).  </xsl:text>
			</xsl:if>
<xsl:if test="normalize-space(//q/@mainYNWord)='yes' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='no' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='no'">
		   	<xsl:text>Dans les questions oui/non il y a un marqueur de question ou complémenteur qui se trouve ___</xsl:text>
		      <xsl:value-of select="//q/mainYNWordOther" />
<xsl:text> (section </xsl:text>
		      <sectionRef sec="sQuesYN" />
		      <xsl:text>).  </xsl:text>
		   </xsl:if>
<xsl:if test="normalize-space(//q/@mainYNWord)='yes' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordBefore/@checked)='yes' or normalize-space(//q/@mainYNWord)='yes' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' or normalize-space(//q/@mainYNWord)='yes' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordBefore/@checked)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
		   	<xsl:text>Dans les questions oui/non il y a un marqueur de question ou complémenteur qui se trouve </xsl:text>
		   	<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='no'">
<xsl:text>avant le</xsl:text>
</xsl:if>
		   	<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='no'">
<xsl:text>après le</xsl:text>
</xsl:if>
		   	<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='no'">
<xsl:text>d’un côté ou de l’autre du</xsl:text>
</xsl:if>
		   	<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>des deux côtés du</xsl:text>
</xsl:if>
		   	<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>avant ou des deux côtés du</xsl:text>
</xsl:if>
		   	<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>après ou des deux côtés du</xsl:text>
</xsl:if>
		   	<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes'">
<xsl:text>d’un côté ou de l’autre ou des deux côtés du</xsl:text>
</xsl:if>
		   	<xsl:text> reste de la question, et  peut se trouver aussi ou au lieu de cela ___</xsl:text>
<xsl:value-of select="//q/mainYNWordOther" />
<xsl:text> (section </xsl:text>
		      <sectionRef sec="sQuesYN" />
		      <xsl:text>).   </xsl:text>
		   </xsl:if>
<xsl:text>Dans les questions de contenu un syntagme interrogatif </xsl:text>
<xsl:choose>
				<xsl:when test="//q/@contFront='no'">n’antériorise pas ; reste simplement en place</xsl:when>
				<xsl:when test="//q/@contFront='after'">peut rester en place ou peut changer de position immédiatement avant le verbe</xsl:when>
				<xsl:when test="//q/@contFront='before'">se place au début de la proposition</xsl:when>
				<xsl:when test="//q/@contFront='unknown'"> _______ </xsl:when>
			</xsl:choose>
<xsl:text> (section </xsl:text>
<sectionRef sec="sQuesContent" />
<xsl:text>).</xsl:text>
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
		  	<xsl:when test="//typology/@case='none'"> il n’y a  pas de système de cas.  Le même groupe de pronoms peut être utilisé dans n’importe quelle position dans la phrase et il n’y a pas de marqueur sur les noms ou sur n’importe quels modificateurs basés sur leur position dans la phrase.</xsl:when>
		  	<xsl:when test="//typology/@case='nominative'"> a un système de cas nominatif-accusatif.   Les sujets de verbes transitifs et intransitifs sont marqués de la même façon et utilisent le même groupe de pronoms, mais les objets de verbes transitifs sont marqués différemment.</xsl:when>
		  	<xsl:when test="//typology/@case='ergative'"> a un système de cas ergatif-absolutif.   Les sujets de verbes intransitifs et les objets de verbes transitifs sont marqués de la même façon et utilisent le même groupe de pronoms, mais les sujets de verbes transitifs sont marqués différemment.</xsl:when>
		  	<xsl:when test="//typology/@case='split'"> a un système de cas ergativité dédoublée.  La langue suit normalement le système de cas nominatif-accusatif mais le système ergatif-absolutif est utilisé sous certaines conditions grammaticales.</xsl:when>
		  </xsl:choose>
<xsl:if test="normalize-space(//typology/@case)!='none'">
<xsl:text>  En </xsl:text>
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
		  	<xsl:when test="//np/@caseN='yes'">les noms et éventuellement leurs modificateurs portent le marqueur du cas de même que les pronoms.</xsl:when>
		  	<xsl:when test="//np/@caseN='no'">il n’ y a pas de marqueur de cas sur les noms. Les systèmes pronominaux indiquent les distinctions de cas.</xsl:when>
		  </xsl:choose>
</xsl:if>
<xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseDefault)='nominative' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseDefault)='nominative'">
			 	<xsl:text>  Le cas nominatif est le cas par défault (non marqué).</xsl:text>
			 </xsl:if>
<xsl:text> (Voir les sections </xsl:text>
<sectionRef sec="sNPCase" />
<xsl:text> et </xsl:text>
<sectionRef sec="sPron" />
<xsl:text>.)</xsl:text>
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
	   	<xsl:when test="//typology/@classifier='no'"> n’y a pas de système de classe ou classificateur  de nom.</xsl:when>
	   	<xsl:when test="//typology/@classifier='yesAgr'"> il y a un système de classe de nom comme détaillé dans la prochaine section.</xsl:when>
	   	<xsl:when test="//typology/@classifier='yesSpecific'"> il y a un système de classificateurs de nom somme détaillé dans la prochaine section.</xsl:when>
	   	<xsl:when test="//typology/@classifier='yesType'"> il y a un système de classificateurs de nom somme détaillé dans la prochaine section.</xsl:when>
	   </xsl:choose>
</p>
	</section1>
   <xsl:if test="normalize-space(//typology/@classifier)!='no'">
<section1 id="sClassifiers">
   	<secTitle>Classes nominales ou classificateurs</secTitle>
      <p contentType="ctPracticalIntro">
<xsl:text>Les classes nominales ou les classificateurs marquent les noms par leur forme, leur position ou autres caractéristiques.  Dans un système de classe nominale, le marquage de classe peut devenir un système de concordance qui demande un accord partout dans le syntagme nominal et même avec le verbe.  Au lieu de cela des langues peuvent avoir un système de classificateurs, appelé quelque fois les mots de mesure.   Ces classificateurs sont des mots ou des morphèmes qui accompagnent des noms lorsque le nom est compté ou spécifié et servent à classifier le nom selon le type de son dénoté. Les classificateurs sont en rapport avec le nom compté ou spécifié, mais il n’y a pas d’autre accord dans le syntagme nominal ou la phrase. Dans un type plus simple de système de classificateur les affixes classificateurs dérivés soit d’un nom générique soit d’un pronom apparaissent sur la plupart des noms de types particuliers comme les animaux, les insectes ou les liquides.  Dans ce système plus simple, ces affixes n’apparaîtront que sur les noms et des distinctions similaires peuvent exister sur les pronoms à la troisième personne qui se rapportent à ces types de noms.</xsl:text>
</p>
	  <p contentType="ctComparativeIntro">
<xsl:text>Certaines langues ont un système de classes nominale qui marquent les noms par leur forme, leur position et d’autres caractéristiques.  Dans beaucoup de ces langues le marqueur de classe devient un système d’accord qui exige un accord partout dans le syntagme nominal et même avec le verbe.  C’est pourquoi les quantificateurs, les articles, les démonstratifs, les adjectifs et les verbes peuvent être marqués avec le marqueur de classe nominale approprié.</xsl:text>
</p>
   	<p contentType="ctComparativeIntro">
<xsl:text>Les langues Bantu parlées en Afrique représentent peut-être le système de classe nominale le plus connu.  Ces langues ont jusqu’à 22 classes distinctes qui sont représentées par des nombres.  A peu près la moitié d’entre elles sont pour les noms au singulier seulement et un nombre égal pour les noms au pluriel seulement.  D’autres sont pour les noms de masse de lieu ou les noms abstraits.</xsl:text>
</p>
   	<p contentType="ctComparativeIntro">
<xsl:text>Au lieu de cela les langues peuvent avoir un système de classificateurs appelés quelque fois les mots de mesure.  Ces classificateurs sont des mots ou morphèmes qui accompagnent les noms quand le nom est compté ou spécifié et servent à classifier le nom selon le type de son dénoté.  Certaines langues ont plusieurs centaines de classificateurs.  Le classificateur se rapporte au nom qui est compté ou spécifié, mais il n’y a pas d’autre accord dans le syntagme nominal ou dans la phrase.  Ce type de classificateur est une partie importante de plusieurs langues asiatiques orientales.</xsl:text>
</p>
   	<p contentType="ctComparativeIntro">
<xsl:text>Il y a aussi un type plus simple de système de classificateur où il y a des affixes classificateurs dérivés d’un nom générique ou d’un pronom qui apparaît sur la plupart des noms utilisés pour les animaux ou insectes, liquides, arbres ou objets faits de bois ou objets ronds.  Dans ce système plus simple il n’y habituellement pas d’accord de classificateur concordant avec le syntagme nominal ou la phrase, alors ces affixes n’apparaissent que sur des noms et peuvent être considérés plus dérivationnels.  Cependant, il peut y avoir des distinctions similaires dans les pronoms à la troisième personne qui se réfèrent à ces types de noms.  Un tel système peut utiliser des types plutôt que des nombres pour identifier les classificateurs.</xsl:text>
</p>
   	<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific'">
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
<xsl:text> il y a  un système de classificateur qui distingue les types de noms. Les classificateurs se trouvent avec les noms dans le syntagme nominal lorsqu’ils sont comptés ou spécifiés mais il n’y a pas d’autre accord avec le syntagme nominal ou la phrase.</xsl:text>
</p>
</xsl:if>
   	<xsl:if test="normalize-space(//typology/@classifier)='yesType'">
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
<xsl:text> il y a  un système de classificateur plus simple qui distingue les types de noms, il n’y a pas d’accord dans le syntagme nominal ou la phrase.</xsl:text>
</p>
</xsl:if>
   	<xsl:if test="normalize-space(//typology/@classifier)='yesAgr'">
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
<xsl:text> iil y a un système de classe nominale avec accord partout dans le syntagme nominal ou la phrase.  En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, les classificateurs sont distingués par </xsl:text>
<xsl:choose>
	  	<xsl:when test="//typology/@classifierNum='number'">des numéros de classe. </xsl:when>
	  	<xsl:when test="//typology/@classifierNum='type'">des types.  <xsl:choose>
	  		<xsl:when test="//typology/@classifierTypeNumAgr='no'">Les classes ne distinguent pas entre le singulier et le pluriel, il n’y a donc pas une seule classe pour chaque type de nom.</xsl:when>
	  		<xsl:when test="//typology/@classifierTypeNumAgr='yes'">Il y a des classes independents  pour le singulier et le pluriel pour chaque type de nom.</xsl:when>
		 </xsl:choose>
</xsl:when>
	  </xsl:choose>
</p>
</xsl:if>
   	<xsl:if test="normalize-space(//typology/@classifier)='yesType' or normalize-space(//typology/@classifier)='yesSpecific'">
<p>
<xsl:text>Les classificateurs en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont montrés dans le tableau di-dessous:</xsl:text>
</p>
</xsl:if>
   	<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific'">
<example num="xClassifiers.22">
<table border="1">
   			<caption>
   				<xsl:text>Classificateurs nominaux par type</xsl:text>
   			</caption>
   			<tr>
   				<th>
   					Type
   				</th>
   				<th>Classificateur</th>
   			</tr>
   			<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//typology/classifierHumanExample),'.','')" />
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
   					<xsl:text>humains</xsl:text>
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
   					<xsl:text>humains</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//typology/classifierAnimalExample),'.','')" />
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
   					<xsl:text>animaux</xsl:text>
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
   					<xsl:text>animaux</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//typology/classifierBirdExample),'.','')" />
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
   					<xsl:text>oiseaux</xsl:text>
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
   					<xsl:text>oiseaux</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//typology/classifierBoatExample),'.','')" />
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
   					<xsl:text>bateaux</xsl:text>
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
   					<xsl:text>bateaux</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue4.1">
<xsl:value-of select="translate(string(//typology/classifierClothingExample),'.','')" />
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
   					<xsl:text>vêtements</xsl:text>
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
   					<xsl:text>vêtements</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue5.1">
<xsl:value-of select="translate(string(//typology/classifierTreeExample),'.','')" />
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
   					<xsl:text>arbres</xsl:text>
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
   					<xsl:text>arbres</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue6.1">
<xsl:value-of select="translate(string(//typology/classifierLongThinExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.1" select="string-length(normalize-space($sExampleValue6.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.1 != 0 and $sExampleValue6.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
   					<xsl:text>objets longs et minces</xsl:text>
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
   					<xsl:text>objets longs et minces</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue7.1">
<xsl:value-of select="translate(string(//typology/classifierLongWavyExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.1" select="string-length(normalize-space($sExampleValue7.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.1 != 0 and $sExampleValue7.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
   					<xsl:text>objets longs et ondulés</xsl:text>
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
   					<xsl:text>objets longs et ondulés</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue8.1">
<xsl:value-of select="translate(string(//typology/classifierFlatExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.1" select="string-length(normalize-space($sExampleValue8.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.1 != 0 and $sExampleValue8.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
   					<xsl:text>objets plats</xsl:text>
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
   					<xsl:text>objets plats</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue9.1">
<xsl:value-of select="translate(string(//typology/classifierCylindricalExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.1" select="string-length(normalize-space($sExampleValue9.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.1 != 0 and $sExampleValue9.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
   					<xsl:text>objets cylindriques</xsl:text>
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
   					<xsl:text>objets cylindriques</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue10.1">
<xsl:value-of select="translate(string(//typology/classifierMechanicalExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10.1" select="string-length(normalize-space($sExampleValue10.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength10.1 != 0 and $sExampleValue10.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
   					<xsl:text>objets mécaniques</xsl:text>
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
   					<xsl:text>objets mécaniques</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue11.1">
<xsl:value-of select="translate(string(//typology/classifierGenericExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11.1" select="string-length(normalize-space($sExampleValue11.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength11.1 != 0 and $sExampleValue11.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
   					<xsl:text>objets génériques</xsl:text>
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
   					<xsl:text>objets génériques</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue12.1">
<xsl:value-of select="translate(string(//typology/classifierOtherExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12.1" select="string-length(normalize-space($sExampleValue12.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength12.1 != 0 and $sExampleValue12.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
   					<xsl:text>ENTRER GLOSE</xsl:text>
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
   					<xsl:text>ENTRER GLOSE</xsl:text>
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
</xsl:if>
   	
   			<xsl:if test="normalize-space(//typology/@classifier)='yesType'">
<example num="xClassifiers.24">
<table border="1">
			<caption>
				<xsl:text>Classificateurs nominaux par type</xsl:text>
			</caption>
			<tr>
			   <th>
				  Type
			   </th>
				<th>Classificateur</th>
			</tr>
			<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//typology/classAnimalExample),'.','')" />
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//typology/classInsectExample),'.','')" />
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
				  <xsl:text>insecte</xsl:text>
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
				  <xsl:text>insecte</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//typology/classLiquidExample),'.','')" />
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
				  <xsl:text>liquide</xsl:text>
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
				  <xsl:text>liquide</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//typology/classRoundExample),'.','')" />
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
				  <xsl:text>rond</xsl:text>
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
				  <xsl:text>rond</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue4.1">
<xsl:value-of select="translate(string(//typology/classCylinderExample),'.','')" />
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
				  <xsl:text>cylindrique</xsl:text>
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
				  <xsl:text>cylindrique</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue5.1">
<xsl:value-of select="translate(string(//typology/classSphereExample),'.','')" />
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
			   	<xsl:text>sphérique</xsl:text>
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
			   	<xsl:text>sphérique</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue6.1">
<xsl:value-of select="translate(string(//typology/classTreeExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.1" select="string-length(normalize-space($sExampleValue6.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.1 != 0 and $sExampleValue6.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>arbre</xsl:text>
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
				  <xsl:text>arbre</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue7.1">
<xsl:value-of select="translate(string(//typology/classWoodExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.1" select="string-length(normalize-space($sExampleValue7.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.1 != 0 and $sExampleValue7.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>en bois</xsl:text>
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
				  <xsl:text>en bois</xsl:text>
			   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue8.1">
<xsl:value-of select="translate(string(//typology/classOtherExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.1" select="string-length(normalize-space($sExampleValue8.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.1 != 0 and $sExampleValue8.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>ENTRER GLOSE</xsl:text>
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
				  <xsl:text>ENTRER GLOSE</xsl:text>
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
</xsl:if>
   	<xsl:if test="normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Les marqueurs de classe nominale en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> sont montrés dans le tableau di-dessous:</xsl:text>
</p>
</xsl:if>
   	<xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//typology/@classifierNum)='type' and normalize-space(//typology/@classifierTypeNumAgr)='no'">
<example num="xClassifiers.28">
<table border="1">
   			<caption>
   				<xsl:text>Marqueurs de classe nominale par type</xsl:text>
   			</caption>
   			<tr>
   				<th>
   					Type
   				</th>
   				<th>Marqueurs de classe</th>
   			</tr>
   			<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//typology/classAnimalExample),'.','')" />
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//typology/classInsectExample),'.','')" />
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
   					<xsl:text>insecte</xsl:text>
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
   					<xsl:text>insecte</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//typology/classLiquidExample),'.','')" />
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
   					<xsl:text>liquide</xsl:text>
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
   					<xsl:text>liquide</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//typology/classRoundExample),'.','')" />
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
   					<xsl:text>rond</xsl:text>
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
   					<xsl:text>rond</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue4.1">
<xsl:value-of select="translate(string(//typology/classCylinderExample),'.','')" />
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
   					<xsl:text>cylindrique</xsl:text>
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
   					<xsl:text>cylindrique</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue5.1">
<xsl:value-of select="translate(string(//typology/classSphereExample),'.','')" />
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
   					<xsl:text>sphérique</xsl:text>
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
   					<xsl:text>sphérique</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue6.1">
<xsl:value-of select="translate(string(//typology/classTreeExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.1" select="string-length(normalize-space($sExampleValue6.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.1 != 0 and $sExampleValue6.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
   					<xsl:text>arbre</xsl:text>
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
   					<xsl:text>arbre</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue7.1">
<xsl:value-of select="translate(string(//typology/classWoodExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.1" select="string-length(normalize-space($sExampleValue7.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.1 != 0 and $sExampleValue7.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
   					<xsl:text>en bois</xsl:text>
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
   					<xsl:text>en bois</xsl:text>
   				</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
   			<xsl:variable name="sExampleValue8.1">
<xsl:value-of select="translate(string(//typology/classOtherExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.1" select="string-length(normalize-space($sExampleValue8.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.1 != 0 and $sExampleValue8.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
   					<xsl:text>ENTRER GLOSE</xsl:text>
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
   					<xsl:text>ENTRER GLOSE</xsl:text>
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
</xsl:if>
   	
	  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//typology/@classifierNum)='type' and normalize-space(//typology/@classifierTypeNumAgr)='yes'">
<example num="xClassifiers.30">
<table border="1">
			<caption>
				<xsl:text>Marqueurs de classe nominale par type</xsl:text>
			</caption>
			<tr>
			   <th>Type</th>
				<th>Accord numérique</th>
				<th>Marqueurs de classe</th>
			</tr>
			<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//typology/classAnimalSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>animal</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
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
<td align="left">
<xsl:text>singulier</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//typology/classAnimalPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>animal</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
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
<td align="left">
<xsl:text>pluriel</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
	 <xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//typology/classInsectSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>insecte</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
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
				  <xsl:text>insecte</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//typology/classInsectPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>insecte</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
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
				  <xsl:text>insecte</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//typology/classLiquidSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>liquide</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
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
				  <xsl:text>liquide</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//typology/classLiquidPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>liquide</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
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
				  <xsl:text>liquide</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue6.2">
<xsl:value-of select="translate(string(//typology/classRoundSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.2" select="string-length(normalize-space($sExampleValue6.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.2 != 0 and $sExampleValue6.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>rond</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
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
				  <xsl:text>rond</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue7.2">
<xsl:value-of select="translate(string(//typology/classRoundPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.2" select="string-length(normalize-space($sExampleValue7.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.2 != 0 and $sExampleValue7.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>rond</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
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
				  <xsl:text>rond</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue8.2">
<xsl:value-of select="translate(string(//typology/classCylinderSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.2" select="string-length(normalize-space($sExampleValue8.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.2 != 0 and $sExampleValue8.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>cylindrique</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
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
				  <xsl:text>cylindrique</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue9.2">
<xsl:value-of select="translate(string(//typology/classCylinderPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.2" select="string-length(normalize-space($sExampleValue9.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.2 != 0 and $sExampleValue9.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>cylindrique</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
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
				  <xsl:text>cylindrique</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue10.2">
<xsl:value-of select="translate(string(//typology/classSphereSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10.2" select="string-length(normalize-space($sExampleValue10.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength10.2 != 0 and $sExampleValue10.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
			   	<xsl:text>sphérique</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
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
			   	<xsl:text>sphérique</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue11.2">
<xsl:value-of select="translate(string(//typology/classSpherePlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11.2" select="string-length(normalize-space($sExampleValue11.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength11.2 != 0 and $sExampleValue11.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
			   	<xsl:text>sphérique</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
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
			   	<xsl:text>sphérique</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue12.2">
<xsl:value-of select="translate(string(//typology/classTreeSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12.2" select="string-length(normalize-space($sExampleValue12.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength12.2 != 0 and $sExampleValue12.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>arbre</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
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
				  <xsl:text>arbre</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue13.2">
<xsl:value-of select="translate(string(//typology/classTreePlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13.2" select="string-length(normalize-space($sExampleValue13.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength13.2 != 0 and $sExampleValue13.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>arbre</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
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
				  <xsl:text>arbre</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue14.2">
<xsl:value-of select="translate(string(//typology/classWoodSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14.2" select="string-length(normalize-space($sExampleValue14.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength14.2 != 0 and $sExampleValue14.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>en bois</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
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
				  <xsl:text>en bois</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue15.2">
<xsl:value-of select="translate(string(//typology/classWoodPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength15.2" select="string-length(normalize-space($sExampleValue15.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength15.2 != 0 and $sExampleValue15.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength15.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>en bois</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
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
				  <xsl:text>en bois</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue16.2">
<xsl:value-of select="translate(string(//typology/classOtherSgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength16.2" select="string-length(normalize-space($sExampleValue16.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength16.2 != 0 and $sExampleValue16.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength16.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>ENTRER GLOSE</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
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
				  <xsl:text>ENTRER GLOSE</xsl:text>
			   </td>
<td align="left">
<xsl:text>singulier</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue17.2">
<xsl:value-of select="translate(string(//typology/classOtherPlExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength17.2" select="string-length(normalize-space($sExampleValue17.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength17.2 != 0 and $sExampleValue17.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength17.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>ENTRER GLOSE</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
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
				  <xsl:text>ENTRER GLOSE</xsl:text>
			   </td>
<td align="left">
<xsl:text>pluriel</xsl:text>
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
</xsl:if>
	  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//typology/@classifierNum)='number'">
<example num="xClassifiers.32">
<table border="1">
			<caption>
				<xsl:text>Classes nominales par numéro</xsl:text>
			</caption>
			<tr>
			   <th>Numéro de classe</th>
			   <th>Marqueur de classe</th>
				<th>Accord numérique</th>
			</tr>
			<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//typology/class1Example),'.','')" />
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
				  <xsl:text>1</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class1agr='sg'">singulier</xsl:when>
					 <xsl:when test="//typology/@class1agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class1agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
					 <xsl:when test="//typology/@class1agr='sg'">singulier</xsl:when>
					 <xsl:when test="//typology/@class1agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class1agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//typology/class2Example),'.','')" />
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
				  <xsl:text>2</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class2agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class2agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class2agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class2agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class2agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class2agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
				  </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//typology/class3Example),'.','')" />
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
				  <xsl:text>3</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class3agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class3agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class3agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class3agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class3agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class3agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//typology/class4Example),'.','')" />
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
				  <xsl:text>4</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class4agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class4agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class4agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class4agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class4agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class4agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue4.1">
<xsl:value-of select="translate(string(//typology/class5Example),'.','')" />
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
				  <xsl:text>5</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class5agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class5agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class5agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class5agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class5agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class5agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue5.1">
<xsl:value-of select="translate(string(//typology/class6Example),'.','')" />
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
				  <xsl:text>6</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class6agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class6agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class6agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class6agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class6agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class6agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue6.1">
<xsl:value-of select="translate(string(//typology/class7Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.1" select="string-length(normalize-space($sExampleValue6.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.1 != 0 and $sExampleValue6.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>7</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class7agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class7agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class7agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class7agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class7agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class7agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue7.1">
<xsl:value-of select="translate(string(//typology/class8Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.1" select="string-length(normalize-space($sExampleValue7.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.1 != 0 and $sExampleValue7.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>8</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class8agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class8agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class8agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class8agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class8agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class8agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue8.1">
<xsl:value-of select="translate(string(//typology/class9Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.1" select="string-length(normalize-space($sExampleValue8.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.1 != 0 and $sExampleValue8.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>9</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class9agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class9agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class9agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class9agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class9agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class9agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue9.1">
<xsl:value-of select="translate(string(//typology/class10Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.1" select="string-length(normalize-space($sExampleValue9.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.1 != 0 and $sExampleValue9.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>10</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class10agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class10agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class10agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class10agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class10agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class10agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue10.1">
<xsl:value-of select="translate(string(//typology/class11Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10.1" select="string-length(normalize-space($sExampleValue10.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength10.1 != 0 and $sExampleValue10.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>11</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class11agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class11agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class11agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class11agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class11agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class11agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue11.1">
<xsl:value-of select="translate(string(//typology/class12Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11.1" select="string-length(normalize-space($sExampleValue11.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength11.1 != 0 and $sExampleValue11.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>12</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class12agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class12agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class12agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class12agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class12agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class12agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue12.1">
<xsl:value-of select="translate(string(//typology/class13Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12.1" select="string-length(normalize-space($sExampleValue12.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength12.1 != 0 and $sExampleValue12.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>13</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class13agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class13agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class13agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class13agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class13agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class13agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue13.1">
<xsl:value-of select="translate(string(//typology/class14Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13.1" select="string-length(normalize-space($sExampleValue13.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength13.1 != 0 and $sExampleValue13.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>14</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class14agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class14agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class14agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class14agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class14agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class14agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue14.1">
<xsl:value-of select="translate(string(//typology/class15Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14.1" select="string-length(normalize-space($sExampleValue14.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength14.1 != 0 and $sExampleValue14.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>15</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class15agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class15agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class15agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class15agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class15agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class15agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue15.1">
<xsl:value-of select="translate(string(//typology/class16Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength15.1" select="string-length(normalize-space($sExampleValue15.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength15.1 != 0 and $sExampleValue15.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength15.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>16</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class16agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class16agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class16agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class16agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class16agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class16agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue16.1">
<xsl:value-of select="translate(string(//typology/class17Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength16.1" select="string-length(normalize-space($sExampleValue16.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength16.1 != 0 and $sExampleValue16.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength16.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>17</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class17agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class17agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class17agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class17agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class17agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class17agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue17.1">
<xsl:value-of select="translate(string(//typology/class18Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength17.1" select="string-length(normalize-space($sExampleValue17.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength17.1 != 0 and $sExampleValue17.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength17.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>18</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class18agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class18agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class18agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class18agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class18agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class18agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue18.1">
<xsl:value-of select="translate(string(//typology/class19Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength18.1" select="string-length(normalize-space($sExampleValue18.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength18.1 != 0 and $sExampleValue18.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength18.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>19</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class19agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class19agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class19agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class19agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class19agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class19agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue19.1">
<xsl:value-of select="translate(string(//typology/class20Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength19.1" select="string-length(normalize-space($sExampleValue19.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength19.1 != 0 and $sExampleValue19.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength19.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>20</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class20agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class20agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class20agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class20agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class20agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class20agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue20.1">
<xsl:value-of select="translate(string(//typology/class21Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength20.1" select="string-length(normalize-space($sExampleValue20.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength20.1 != 0 and $sExampleValue20.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength20.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>21</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class21agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class21agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class21agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class21agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class21agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class21agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue21.1">
<xsl:value-of select="translate(string(//typology/class22Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength21.1" select="string-length(normalize-space($sExampleValue21.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength21.1 != 0 and $sExampleValue21.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength21.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>22</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class22agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class22agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class22agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class22agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class22agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class22agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue22.1">
<xsl:value-of select="translate(string(//typology/class23Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength22.1" select="string-length(normalize-space($sExampleValue22.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength22.1 != 0 and $sExampleValue22.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength22.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>23</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class23agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class23agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class23agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class23agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class23agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class23agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue23.1">
<xsl:value-of select="translate(string(//typology/class24Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength23.1" select="string-length(normalize-space($sExampleValue23.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength23.1 != 0 and $sExampleValue23.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength23.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>24</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class24agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class24agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class24agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class24agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class24agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class24agr='irrelevant'">ne s’applique pas</xsl:when>
				  </xsl:choose>
			   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			<xsl:variable name="sExampleValue24.1">
<xsl:value-of select="translate(string(//typology/class25Example),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength24.1" select="string-length(normalize-space($sExampleValue24.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength24.1 != 0 and $sExampleValue24.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength24.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				  <xsl:text>25</xsl:text>
			   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class25agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class25agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class25agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				  <xsl:choose>
				  	<xsl:when test="//typology/@class25agr='sg'">singulier</xsl:when>
				  	<xsl:when test="//typology/@class25agr='pl'">pluriel</xsl:when>
				  	<xsl:when test="//typology/@class25agr='irrelevant'">ne s’applique pas</xsl:when>
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
<xsl:text>Voici des exemples de noms accompagnés de leurs classificateurs de type:</xsl:text>
</p>
</xsl:if>
	  <xsl:if test="normalize-space(//typology/@classifier)='yesType'">
<example num="xClassifiers.36">
<table border="1">
	        <tr>
	           <th>Nom</th>
	           <th>Glose</th>
	        </tr>
	        <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//typology/classifierTypeExample),'.','')" />
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
   	<xsl:if test="normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Voici des exemples de phrases avec accord de classe nominale dans le syntagme nominal et sur le verbe:</xsl:text>
</p>
</xsl:if>
	  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr'">
<example num="xClassifiers.40">
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
<xsl:with-param name="sExNumber">xClassifiers.40</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xClassifiers.40.1</xsl:text>
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
   	<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific'">
<p>
<xsl:text>Voici des exemples de syntagmes nominaux qui illustrent des classificateurs varies utilisés avec des numéros ou démonstratifs et des noms:</xsl:text>
</p>
</xsl:if>
   	<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific'">
<example num="xClassifiers.44">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/classifierSpecificExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/classifierSpecificExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/classifierSpecificExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/classifierSpecificExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xClassifiers.44</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xClassifiers.44.1</xsl:text>
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
   </section1>
</xsl:if>

   
   
   

   
      
      
   
      
   
   
      
      
        
      
        
   
   
        
      
        
      
        
   
   
        
 
        
      
        
   
   
        
      
        
      
        
   
   
        
      
        
      
        
   
   
        
      
        
      
        
   
   
        
      
        
      
        
   
   
      
   
   
        
      
        
      
        
      
        
   
   
        
      
        
      
        
      
        
        
        
      
        
      
 
    
 
   
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
   
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
		
		
	
	
		
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
   
		
      
      
	   
	   
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      

      
      
      
      
      
      
      
      
      
      
      
  
      
      
      
      
      
   
      
      
      
      
      
   
   
      
      
      
      
      
      
   
      
      
      
      
      
      
   
      
      
      
      
      
      
   
      
      
      
      
      
      
   
      
      
      
      
      
      
   
      
      
      
      
      
      
   
      
      
      
      
      
      
   
   
   
	  
	  
	  
   
   
	  
   
   
	  
	  
	  
	  
	  
	  
	  
   
   
	  
   
   
	  
   
	
		
	
	
	  
   
	
		
		
		
	
	
	  
	  
	  
   
   
	  
	  
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
   
	
		
		
		
		
		
	
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
	  
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   

</xsl:template>
</xsl:stylesheet>
