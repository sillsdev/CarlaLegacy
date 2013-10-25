<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to convert PAWS answer file from dbversion 7a to 8
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no"/>
	<xsl:template match="@* |  node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<!--
		increment dbversion
	-->
	<xsl:template match="/paws[@dbversion='8']">
		<paws dbversion="9">
			<xsl:apply-templates select="@*[name()!='dbversion']"/>
			<xsl:apply-templates/>
			<final checkedOff="no"/>
		</paws>
	</xsl:template>
	<!--
		typology: add <splitConditions/> before <class1Example/>
	-->
	<xsl:template match="typology">
		<typology>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="typology"/>
		</typology>
	</xsl:template>
	<xsl:template match="class1Example" mode="typology">
		<splitConditions/>
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="*" mode="typology">
		<xsl:copy-of select="."/>
	</xsl:template>
	<!--
		adjp:  remmove some attributes add some examples and checkboxes
	-->
	<xsl:template match="adjp">
		<adjp>
			<xsl:copy-of select="@*[name()='checkedOff' or name()='adjectiveClassifier' or name()='adjectiveDegreeClassifier']"/>
			<xsl:attribute name="modifiers">
				<xsl:choose>
					<xsl:when test="@modifiers='no'">no</xsl:when>
					<xsl:otherwise>yes</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<modifiersDegree>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@modifiers='yes'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</modifiersDegree>
			<modifiersManner>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@modifiers='yesManner'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</modifiersManner>
			<modifiersAttaches>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@modifiers='attaches'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</modifiersAttaches>
			<modifiersRedup>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@modifiers='noRedup'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</modifiersRedup>
			<modifiersOther checked="no"/>
			<degreeBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@degreePos"/>
				</xsl:call-template>
			</degreeBefore>
			<degreeAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@degreePos"/>
				</xsl:call-template>
			</degreeAfter>
			<degreeBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@degreePos"/>
				</xsl:call-template>
			</degreeBoth>
			<degreeOther checked="no"/>
			<mannerBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@mannerPos"/>
				</xsl:call-template>
			</mannerBefore>
			<mannerAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@mannerPos"/>
				</xsl:call-template>
			</mannerAfter>
			<mannerBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@mannerPos"/>
				</xsl:call-template>
			</mannerBoth>
			<mannerOther checked="no"/>
			<xsl:copy-of select="example"/>
			<xsl:copy-of select="adjectiveDegreeExample"/>
			<adjectiveDegreePhraseExample>
				<xsl:value-of select="adjectivePhraseExample"/>
			</adjectiveDegreePhraseExample>
			<adjectiveMannerPhraseExample/>
			<xsl:copy-of select="adjectiveDegreeAffixExample"/>
			<adjectiveDegreeAffixPhraseExample>
				<xsl:value-of select="adjectivePhraseAffixExample"/>
			</adjectiveDegreeAffixPhraseExample>
			<xsl:copy-of select="adjectiveDegreeRedupExample"/>
			<adjectiveDegreeOtherExample/>
			<xsl:copy-of select="adjectiveCategory"/>
		</adjp>
	</xsl:template>
	<!--
		advp:  adjust attributes, examples and add checkboxes
	-->
	<xsl:template match="advp">
		<advp>
			<xsl:copy-of select="@checkedOff"/>
			<xsl:attribute name="temporalDegree">
				<xsl:choose>
					<xsl:when test="@temporalDegree='no'">no</xsl:when>
					<xsl:otherwise>yes</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:copy-of select="@locativeClassifier"/>
			<xsl:attribute name="locativeDem">
				<xsl:choose>
					<xsl:when test="@advLocDem='no'">distinct</xsl:when>
					<xsl:when test="@advLocDem='same'">same</xsl:when>
					<xsl:when test="@advLocDem='affix'">demAffix</xsl:when>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="locativeDegree">
				<xsl:choose>
					<xsl:when test="@locativeDegree='no'">no</xsl:when>
					<xsl:otherwise>yes</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:copy-of select="@mannerType"/>
			<xsl:attribute name="mannerDegree">
				<xsl:choose>
					<xsl:when test="@mannerDegree='no'">no</xsl:when>
					<xsl:otherwise>yes</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="mannerAffixDegree">
				<xsl:choose>
					<xsl:when test="@mannerAffixDegree='no'">no</xsl:when>
					<xsl:otherwise>yes</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<temporalDegreeWord>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@temporalDegree='yesBefore' or @temporalDegree='yesAfter'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</temporalDegreeWord>
			<temporalDegreeAttaches>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@temporalDegree='attaches'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</temporalDegreeAttaches>
			<temporalDegreeRedup>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@temporalDegree='noRedup'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</temporalDegreeRedup>
			<temporalDegreeOther checked="no"/>
			<temporalDegreeWordBefore>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@temporalDegree='yesBefore'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</temporalDegreeWordBefore>
			<temporalDegreeWordAfter>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@temporalDegree='yesAfter'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</temporalDegreeWordAfter>
			<temporalDegreeWordBoth checked="no"/>
			<temporalDegreeWordOther checked="no"/>
			<temporalIndefQWord checked="no"/>
			<temporalIndefQPhrase checked="no"/>
			<temporalIndefQOther checked="no"/>
			<temporalIndefTypeQPQBefore checked="no"/>
			<temporalIndefTypeQPQAfter checked="no"/>
			<temporalIndefTypeQPQBoth checked="no"/>
			<temporalIndefTypeQPQOther checked="no"/>
			<temporalIndefIntWord checked="no"/>
			<temporalIndefIntPhrase checked="no"/>
			<temporalIndefIntOther checked="no"/>
			<temporalIndefTypeIntBefore checked="no"/>
			<temporalIndefTypeIntAfter checked="no"/>
			<temporalIndefTypeIntBoth checked="no"/>
			<temporalIndefTypeIntOther checked="no"/>
			<locativeDegreeWord>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@locativeDegree='yesBefore' or @locativeDegree='yesAfter'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</locativeDegreeWord>
			<locativeDegreeAttaches>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@locativeDegree='attaches'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</locativeDegreeAttaches>
			<locativeDegreeRedup>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@locativeDegree='noRedup'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</locativeDegreeRedup>
			<locativeDegreeOther checked="no"/>
			<locativeDegreeWordBefore>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@locativeDegree='yesBefore'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</locativeDegreeWordBefore>
			<locativeDegreeWordAfter>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@locativeDegree='yesAfter'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</locativeDegreeWordAfter>
			<locativeDegreeWordBoth checked="no"/>
			<locativeDegreeWordOther checked="no"/>
			<locativeIndefQWord checked="no"/>
			<locativeIndefQPhrase checked="no"/>
			<locativeIndefQOther checked="no"/>
			<locativeIndefTypeQPQBefore checked="no"/>
			<locativeIndefTypeQPQAfter checked="no"/>
			<locativeIndefTypeQPQBoth checked="no"/>
			<locativeIndefTypeQPQOther checked="no"/>
			<locativeIndefIntWord checked="no"/>
			<locativeIndefIntPhrase checked="no"/>
			<locativeIndefIntOther checked="no"/>
			<locativeIndefTypeIntBefore checked="no"/>
			<locativeIndefTypeIntAfter checked="no"/>
			<locativeIndefTypeIntBoth checked="no"/>
			<locativeIndefTypeIntOther checked="no"/>
			<mannerWordDegreeWord>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mannerDegree='yesBefore' or @mannerDegree='yesAfter'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mannerWordDegreeWord>
			<mannerWordDegreeAttaches>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mannerDegree='attaches'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mannerWordDegreeAttaches>
			<mannerWordDegreeRedup>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mannerDegree='noRedup'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mannerWordDegreeRedup>
			<mannerWordDegreeOther checked="no"/>
			<mannerDegreeWordBefore>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mannerDegree='yesBefore'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mannerDegreeWordBefore>
			<mannerDegreeWordAfter>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mannerDegree='yesAfter'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mannerDegreeWordAfter>
			<mannerDegreeWordBoth checked="no"/>
			<mannerDegreeWordOther checked="no"/>
			<mannerAffixDegreeYesBefore>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mannerAffixDegree='yesBefore'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mannerAffixDegreeYesBefore>
			<mannerAffixDegreeYesAfter>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mannerAffixDegree='yesAfter'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mannerAffixDegreeYesAfter>
			<mannerAffixDegreeRedup>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mannerAffixDegree='noRedup'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mannerAffixDegreeRedup>
			<mannerAffixDegreeOther checked="no"/>
			<xsl:copy-of select="temporalExample"/>
			<xsl:copy-of select="temporalDegreeExample"/>
			<xsl:copy-of select="temporalPhraseExample"/>
			<xsl:copy-of select="temporalDegreeAffixExample"/>
			<xsl:copy-of select="temporalPhraseAffixExample"/>
			<xsl:copy-of select="temporalDegreeRedupExample"/>
			<temporalDegreeOtherExample/>
			<temporalNounExample/>
			<temporalNounModifierExample/>
			<temporalIndefTypeQWordExample/>
			<temporalIndefTypeQPhraseExample/>
			<temporalIndefTypeQOtherExample/>
			<temporalIndefTypeIntWordExample/>
			<temporalIndefTypeIntPhraseExample/>
			<temporalIndefTypeIntOtherExample/>
			<xsl:copy-of select="locativeExample"/>
			<locativeDemOther/>
			<xsl:copy-of select="locativeDegreeExample"/>
			<xsl:copy-of select="locativePhraseExample"/>
			<xsl:copy-of select="locativeDegreeAffixExample"/>
			<xsl:copy-of select="locativePhraseAffixExample"/>
			<xsl:copy-of select="locativeDegreeRedupExample"/>
			<locativeOtherExample/>
			<locativeIndefTypeQWordExample/>
			<locativeIndefTypeQPhraseExample/>
			<locativeIndefTypeQOtherExample/>
			<locativeIndefTypeIntWordExample/>
			<locativeIndefTypeIntPhraseExample/>
			<locativeIndefTypeIntOtherExample/>
			<xsl:copy-of select="mannerExample"/>
			<xsl:copy-of select="mannerDegreeExample"/>
			<xsl:copy-of select="mannerDegreePhraseExample"/>
			<xsl:copy-of select="mannerDegreeAffixExample"/>
			<xsl:copy-of select="mannerPhraseAffixExample"/>
			<xsl:copy-of select="mannerDegreeRedupExample"/>
			<mannerDegreeOtherExample/>
			<xsl:copy-of select="mannerAffixDegreeExample"/>
			<xsl:copy-of select="mannerAffixDegreePhraseExample"/>
			<xsl:copy-of select="mannerAffixDegreeRedupExample"/>
			<mannerAffixDegreeOtherExample/>
			<xsl:copy-of select="*[name()='reasonExample' or name()='reasonPPExample' or name()='reasonSentExample' or name()='adverbCategory']"/>
		</advp>
	</xsl:template>
	<!--
		comp:  mostly mapping attributes to checkboxes, but some new examples and attributes, too
	-->
	<xsl:template match="comp">
		<comp>
			<xsl:copy-of select="@*[name()!='compCliticPos' and name()!='compCliticAttaches' and name()!='compPos' and name()!='compEitherRestricted']"/>
			<xsl:attribute name="compTypeOther">no</xsl:attribute>
			<xsl:attribute name="compNonfinite">no</xsl:attribute>
			<compProclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@compCliticPos='before' and @compCliticAttaches='edge'">yes</xsl:when>
						<xsl:when test="@compCliticPos='both' and @compCliticAttaches='edge'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</compProclitic>
			<compEnclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@compCliticPos='after' and @compCliticAttaches='edge'">yes</xsl:when>
						<xsl:when test="@compCliticPos='both' and @compCliticAttaches='edge'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</compEnclitic>
			<compPrefix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@compCliticPos='before' and @compCliticAttaches='head'">yes</xsl:when>
						<xsl:when test="@compCliticPos='both' and @compCliticAttaches='head'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</compPrefix>
			<compSuffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@compCliticPos='after' and @compCliticAttaches='head'">yes</xsl:when>
						<xsl:when test="@compCliticPos='both' and @compCliticAttaches='head'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</compSuffix>
			<compAttachesOther checked="no"/>
			<compBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@compPos"/>
				</xsl:call-template>
			</compBefore>
			<compAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@compPos"/>
				</xsl:call-template>
			</compAfter>
			<compBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@compPos"/>
				</xsl:call-template>
			</compBoth>
			<compOther checked="no"/>
			<xsl:apply-templates select="*" mode="comp"/>
			<compCliticExample/>
			<compAffixExample/>
			<compOtherExample/>
			<compExample/>
		</comp>
	</xsl:template>
	<xsl:template match="*" mode="comp">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="otherExample" mode="comp">
		<otherRestrictions/>
		<xsl:copy-of select="."/>
	</xsl:template>
	<!--
		coord:  remove or move some attributes, add checkboxes and examples
	-->
	<xsl:template match="coord">
		<coord>
			<xsl:copy-of select="@*[name()='checkedOff' or name()='conjWord' or name()='noConj']"/>
			<proclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@conjPos='before' or @conjPos='either'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</proclitic>
			<enclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@conjPos='after' or @conjPos='either'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</enclitic>
			<attachesOther>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@conjPos='other'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</attachesOther>
			<xsl:apply-templates select="*" mode="coord"/>
		</coord>
	</xsl:template>
	<xsl:template match="*" mode="coord">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="neither" mode="coord">
		<eitherOr/>
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="comparativeSentExample" mode="coord">
		<!-- skip it; it gets mapped in ip -->
	</xsl:template>
	<!--
		excl:  add checkboxes and map attributes
	-->
	<xsl:template match="excl">
		<excl>
			<xsl:copy-of select="@*[name()='checkedOff' or name()='exclM']"/>
			<exclMBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@exclMPos"/>
				</xsl:call-template>
			</exclMBefore>
			<exclMAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@exclMPos"/>
				</xsl:call-template>
			</exclMAfter>
			<exclMBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@exclMPos"/>
				</xsl:call-template>
			</exclMBoth>
			<exclMOther checked="no"/>
			<xsl:copy-of select="*"/>
		</excl>
	</xsl:template>
	<!--
		focus:  add checkboxes and examples
	-->
	<xsl:template match="focus">
		<focus>
			<xsl:copy-of select="@*[name()!='focusMarkerEither' and name()!='focusMarkerPos' and name()!='topicMarkerEither' and name()!='topicMarkerPos']"/>
			<topicMarkerBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@topicMarkerPos"/>
				</xsl:call-template>
			</topicMarkerBefore>
			<topicMarkerAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@topicMarkerPos"/>
				</xsl:call-template>
			</topicMarkerAfter>
			<topicMarkerBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@topicMarkerPos"/>
				</xsl:call-template>
			</topicMarkerBoth>
			<topicMarkerOther checked="no"/>
			<focusMarkerBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@focusMarkerPos"/>
				</xsl:call-template>
			</focusMarkerBefore>
			<focusMarkerAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@focusMarkerPos"/>
				</xsl:call-template>
			</focusMarkerAfter>
			<focusMarkerBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@focusMarkerPos"/>
				</xsl:call-template>
			</focusMarkerBoth>
			<focusMarkerOther checked="no"/>
			<xsl:copy-of select="topicExample"/>
			<xsl:copy-of select="topicMarkerExample"/>
			<topicMarkerCliticExample/>
			<topicMarkerAffixExample/>
			<xsl:copy-of select="focusExample"/>
			<xsl:copy-of select="focusMarkerExample"/>
			<focusMarkerCliticExample/>
			<focusMarkerAffixExample/>
		</focus>
	</xsl:template>
	<!--
		ip:  add many attributes and examples
	-->
	<xsl:template match="ip">
		<ip>
			<xsl:copy-of select="@*[name()!='antipassive' and name()!='causative' and name()!='copular' and name()!='existVerb' and name()!='negAux' and name()!='negAuxAffix' and name()!='negAuxRequiresAux' and name()!='negVAffix' and name()!='proDrop']"/>
			<xsl:attribute name="antipassive">
				<xsl:choose>
					<xsl:when test="starts-with(@antipassive,'yes')">yes</xsl:when>
					<xsl:otherwise>no</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="bodypartCompound">no</xsl:attribute>
			<xsl:attribute name="conditionWord">yes</xsl:attribute>
			<xsl:attribute name="consequence">no</xsl:attribute>
			<xsl:attribute name="consequencePos">unknown</xsl:attribute>
			<xsl:attribute name="copular">
				<xsl:choose>
					<xsl:when test="@copular='optional'">optional</xsl:when>
					<xsl:when test="@copular='noNeither'">no</xsl:when>
					<xsl:otherwise>yes</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="gap">
				<xsl:value-of select="//coord/@gap"/>
			</xsl:attribute>
			<xsl:attribute name="heartCompound">no</xsl:attribute>
			<xsl:attribute name="impPolite">no</xsl:attribute>
			<xsl:attribute name="subjunctiveCondWord">yes</xsl:attribute>
			<proDropYes>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@proDrop='yes'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</proDropYes>
			<proDropClitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@proDrop='yesClitic'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</proDropClitic>
			<proDropImp>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@proDrop='noImp'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</proDropImp>
			<proDropOther checked="no"/>
			<proDropNone>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@proDrop='no'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</proDropNone>
			<conditionProclitic checked="no"/>
			<conditionEnclitic checked="no"/>
			<conditionPrefix checked="no"/>
			<conditionSuffix checked="no"/>
			<conditionOther checked="no"/>
			<conditionWordBefore checked="no"/>
			<conditionWordAfter checked="no"/>
			<conditionWordBoth checked="no"/>
			<conditionWordOther checked="no"/>
			<subjunctiveCondProclitic checked="no"/>
			<subjunctiveCondEnclitic checked="no"/>
			<subjunctiveCondPrefix checked="no"/>
			<subjunctiveCondSuffix checked="no"/>
			<subjunctiveCondOther checked="no"/>
			<subjunctiveCondWordBefore checked="no"/>
			<subjunctiveCondWordAfter checked="no"/>
			<subjunctiveCondWordBoth checked="no"/>
			<subjunctiveCondWordOther checked="no"/>
			<existWord>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@existVerb='yes'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</existWord>
			<existVerb>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="contains(@existVerb,'yes')">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</existVerb>
			<existPosition checked="no"/>
			<existOther checked="no"/>
			<existNone>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@existVerb='no'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</existNone>
			<causativeAffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="contains(@causative,'yes')">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</causativeAffix>
			<causativeMake>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@causative='yesBoth'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</causativeMake>
			<causativeOther checked="no"/>
			<antipassiveErg>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@antipassive='yesErg'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</antipassiveErg>
			<antipassiveAgr>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@antipassive='yesAgr'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</antipassiveAgr>
			<antipassiveAffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@antipassive='yesAffix'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</antipassiveAffix>
			<antipassiveOther checked="no"/>
			<presentTense/>
			<pastTense/>
			<futureTense/>
			<nonPastTense/>
			<nonFutureTense/>
			<completiveAspect/>
			<contemplativeAspect/>
			<continuativeAspect/>
			<contrafactualAspect/>
			<habitualAspect/>
			<imperfectAspect/>
			<imperfectiveAspect/>
			<incompletiveAspect/>
			<perfectAspect/>
			<perfectiveAspect/>
			<potentialAspect/>
			<progressiveAspect/>
			<stativeAspect/>
			<unrealAspect/>
			<declarativeMood/>
			<indicativeMood/>
			<realisMood/>
			<imperativeMood/>
			<interrogativeMood/>
			<conditionalMood/>
			<subjunctiveMood/>
			<irrealisMood/>
			<finiteOther/>
			<nonfiniteOther/>
			<gerundOther/>
			<participleOther/>
			<antipassiveVoice/>
			<causativeVoice/>
			<passiveVoice/>
			<actorVoice/>
			<dativeVoice/>
			<goalVoice/>
			<instrumentalVoice/>
			<locativeVoice/>
			<objectVoice/>
			<firstSubjectPerson/>
			<firstObjectPerson/>
			<firstErgativePerson/>
			<firstExclusiveSubjectPerson/>
			<firstExclusiveObjectPerson/>
			<firstExclusiveErgativePerson/>
			<firstExclusiveAbsolutivePerson/>
			<firstInclusiveSubjectPerson/>
			<firstInclusiveObjectPerson/>
			<firstInclusiveErgativePerson/>
			<firstInclusiveAbsolutivePerson/>
			<secondSubjectPerson/>
			<secondObjectPerson/>
			<secondErgativePerson/>
			<secondAbsolutivePerson/>
			<thirdSubjectPerson/>
			<thirdObjectPerson/>
			<thirdErgativePerson/>
			<thirdAbsolutivePerson/>
			<singularSubjectNumber/>
			<singularObjectNumber/>
			<singularErgativeNumber/>
			<singularAbsolutiveNumber/>
			<dualSubjectNumber/>
			<dualObjectNumber/>
			<dualErgativeNumber/>
			<dualAbsolutiveNumber/>
			<pluralSubjectNumber/>
			<pluralObjectNumber/>
			<pluralErgativeNumber/>
			<pluralAbsolutiveNumber/>
			<masculineSubjectGender/>
			<masculineObjectGender/>
			<masculineErgativeGender/>
			<masculineAbsolutiveGender/>
			<feminineSubjectGender/>
			<feminineObjectGender/>
			<feminineErgativeGender/>
			<feminineAbsolutiveGender/>
			<neuterSubjectGender/>
			<neuterObjectGender/>
			<neuterErgativeGender/>
			<neuterAbsolutiveGender/>
			<animateSubjectAnimacy/>
			<animateObjectAnimacy/>
			<animateErgativeAnimacy/>
			<animateAbsolutiveAnimacy/>
			<inanimateSubjectAnimacy/>
			<inanimateObjectAnimacy/>
			<inanimateErgativeAnimacy/>
			<inanimateAbsolutiveAnimacy/>
			<humanSubjectAnimacy/>
			<humanObjectAnimacy/>
			<humanErgativeAnimacy/>
			<humanAbsolutiveAnimacy/>
			<nonhumanSubjectAnimacy/>
			<nonhumanObjectAnimacy/>
			<nonhumanErgativeAnimacy/>
			<nonhumanAbsolutiveAnimacy/>
			<xsl:copy-of select="proDropExample"/>
			<cliticPnExample/>
			<proDropOtherExample/>
			<xsl:copy-of select="impExample"/>
			<impPoliteExample/>
			<conditionalExample/>
			<conditionCliticExample/>
			<conditionAffixExample/>
			<conditionOtherExample/>
			<conditionWordExample/>
			<subjunctiveExample/>
			<subjunctiveCondCliticExample/>
			<subjunctiveCondAffixExample/>
			<subjunctiveCondOtherExample/>
			<subjunctiveCondWordExample/>
			<xsl:copy-of select="auxExample"/>
			<xsl:copy-of select="auxiliaryExample"/>
			<xsl:copy-of select="auxNonfiniteExample"/>
			<xsl:copy-of select="auxiliaryNonfiniteExample"/>
			<xsl:copy-of select="auxOtherExample"/>
			<xsl:copy-of select="auxiliaryOtherExample"/>
			<heartCompoundExample/>
			<bodypartCompoundExample/>
			<verbNCompoundExample/>
			<verbNCompoundSentExample/>
			<verbOtherCompoundExample/>
			<verbOtherCompoundSentExample/>
			<idiomExample/>
			<xsl:copy-of select="copularExample"/>
			<copularVerb/>
			<copularAffix/>
			<xsl:copy-of select="perceptionExample"/>
			<xsl:copy-of select="sameExample"/>
			<xsl:copy-of select="sameWordExample"/>
			<xsl:copy-of select="sameAffixExample"/>
			<xsl:copy-of select="compareNExample"/>
			<xsl:copy-of select="asExample"/>
			<xsl:copy-of select="compareAdjExample"/>
			<xsl:copy-of select="asWordExample"/>
			<xsl:copy-of select="comparativeExample"/>
			<xsl:copy-of select="comparativeWordExample"/>
			<xsl:copy-of select="comparativeAffixExample"/>
			<xsl:copy-of select="comparativeDegExample"/>
			<xsl:copy-of select="//coord/comparativeSentExample"/>
			<xsl:copy-of select="superlativeExample"/>
			<xsl:copy-of select="superlativeAffixExample"/>
			<xsl:copy-of select="superlativeDegExample"/>
			<xsl:copy-of select="existExample"/>
			<xsl:copy-of select="existWordExample"/>
			<xsl:copy-of select="existVerbExample"/>
			<existPositionExample/>
			<existOtherExample/>
			<xsl:copy-of select="motionExample"/>
			<xsl:copy-of select="diExample"/>
			<xsl:copy-of select="passiveExample"/>
			<xsl:copy-of select="passiveAgentPExample"/>
			<xsl:copy-of select="passiveAuxExample"/>
			<xsl:copy-of select="causativeAffixExample"/>
			<xsl:copy-of select="causativeExample"/>
			<causativeMakeExample/>
			<causativeOtherExample/>
			<xsl:copy-of select="antipassiveExample"/>
			<xsl:copy-of select="antipassiveAffixExample"/>
			<xsl:copy-of select="voiceExample"/>
			<xsl:copy-of select="auxCategory"/>
			<xsl:copy-of select="verbCategory"/>
			<xsl:copy-of select="ipContents1"/>
			<xsl:copy-of select="ipContents2"/>
			<xsl:copy-of select="ipContents3"/>
			<xsl:copy-of select="ipContents4"/>
			<xsl:copy-of select="ipContents5"/>
			<xsl:copy-of select="ipContents6"/>
			<xsl:copy-of select="ipContents7"/>
			<xsl:copy-of select="ipContents8"/>
			<xsl:copy-of select="ipContents9"/>
			<xsl:copy-of select="ipContents10"/>
			<xsl:copy-of select="ipAgrFeatFirstSubject"/>
			<xsl:copy-of select="ipAgrFeatFirstObject"/>
			<xsl:copy-of select="ipAgrFeatFirstErgative"/>
			<xsl:copy-of select="ipAgrFeatFirstAbsolutive"/>
			<xsl:copy-of select="ipAgrFeatFirstExclusiveSubject"/>
			<xsl:copy-of select="ipAgrFeatFirstExclusiveObject"/>
			<xsl:copy-of select="ipAgrFeatFirstExclusiveErgative"/>
			<xsl:copy-of select="ipAgrFeatFirstExclusiveAbsolutive"/>
			<xsl:copy-of select="ipAgrFeatFirstInclusiveSubject"/>
			<xsl:copy-of select="ipAgrFeatFirstInclusiveObject"/>
			<xsl:copy-of select="ipAgrFeatFirstInclusiveErgative"/>
			<xsl:copy-of select="ipAgrFeatFirstInclusiveAbsolutive"/>
			<xsl:copy-of select="ipAgrFeatSecondSubject"/>
			<xsl:copy-of select="ipAgrFeatSecondObject"/>
			<xsl:copy-of select="ipAgrFeatSecondErgative"/>
			<xsl:copy-of select="ipAgrFeatSecondAbsolutive"/>
			<xsl:copy-of select="ipAgrFeatThirdSubject"/>
			<xsl:copy-of select="ipAgrFeatThirdObject"/>
			<xsl:copy-of select="ipAgrFeatThirdErgative"/>
			<xsl:copy-of select="ipAgrFeatThirdAbsolutive"/>
			<xsl:copy-of select="ipAgrFeatSingularSubject"/>
			<xsl:copy-of select="ipAgrFeatSingularObject"/>
			<xsl:copy-of select="ipAgrFeatSingularErgative"/>
			<xsl:copy-of select="ipAgrFeatSingularAbsolutive"/>
			<xsl:copy-of select="ipAgrFeatDualSubject"/>
			<xsl:copy-of select="ipAgrFeatDualObject"/>
			<xsl:copy-of select="ipAgrFeatDualErgative"/>
			<xsl:copy-of select="ipAgrFeatDualAbsolutive"/>
			<xsl:copy-of select="ipAgrFeatPluralSubject"/>
			<xsl:copy-of select="ipAgrFeatPluralObject"/>
			<xsl:copy-of select="ipAgrFeatPluralErgative"/>
			<xsl:copy-of select="ipAgrFeatPluralAbsolutive"/>
			<xsl:copy-of select="ipAgrFeatMasculineSubject"/>
			<xsl:copy-of select="ipAgrFeatMasculineObject"/>
			<xsl:copy-of select="ipAgrFeatMasculineErgative"/>
			<xsl:copy-of select="ipAgrFeatMasculineAbsolutive"/>
			<xsl:copy-of select="ipAgrFeatFeminineSubject"/>
			<xsl:copy-of select="ipAgrFeatFeminineObject"/>
			<xsl:copy-of select="ipAgrFeatFeminineErgative"/>
			<xsl:copy-of select="ipAgrFeatFeminineAbsolutive"/>
			<xsl:copy-of select="ipAgrFeatNeuterSubject"/>
			<xsl:copy-of select="ipAgrFeatNeuterObject"/>
			<xsl:copy-of select="ipAgrFeatNeuterErgative"/>
			<xsl:copy-of select="ipAgrFeatNeuterAbsolutive"/>
			<xsl:copy-of select="ipAgrFeatAnimateSubject"/>
			<xsl:copy-of select="ipAgrFeatAnimateObject"/>
			<xsl:copy-of select="ipAgrFeatAnimateErgative"/>
			<xsl:copy-of select="ipAgrFeatAnimateAbsolutive"/>
			<xsl:copy-of select="ipAgrFeatMinusAnimateSubject"/>
			<xsl:copy-of select="ipAgrFeatMinusAnimateObject"/>
			<xsl:copy-of select="ipAgrFeatMinusAnimateErgative"/>
			<xsl:copy-of select="ipAgrFeatMinusAnimateAbsolutive"/>
			<xsl:copy-of select="ipAgrFeatHumanSubject"/>
			<xsl:copy-of select="ipAgrFeatHumanObject"/>
			<xsl:copy-of select="ipAgrFeatHumanErgative"/>
			<xsl:copy-of select="ipAgrFeatHumanAbsolutive"/>
			<xsl:copy-of select="ipAgrFeatMinusHumanSubject"/>
			<xsl:copy-of select="ipAgrFeatMinusHumanObject"/>
			<xsl:copy-of select="ipAgrFeatMinusHumanErgative"/>
			<xsl:copy-of select="ipAgrFeatMinusHumanAbsolutive"/>
			<xsl:copy-of select="ipInflFeatPresent"/>
			<xsl:copy-of select="ipInflFeatPast"/>
			<xsl:copy-of select="ipInflFeatFuture"/>
			<ipInflFeatNonPast/>
			<ipInflFeatNonFuture/>
			<xsl:copy-of select="ipInflFeatCompletive"/>
			<xsl:copy-of select="ipInflFeatContemplative"/>
			<xsl:copy-of select="ipInflFeatContinuative"/>
			<xsl:copy-of select="ipInflFeatContrafactual"/>
			<xsl:copy-of select="ipInflFeatHabitual"/>
			<ipInflFeatImperfect/>
			<xsl:copy-of select="ipInflFeatImperfective"/>
			<xsl:copy-of select="ipInflFeatIncompletive"/>
			<xsl:copy-of select="ipInflFeatPerfect"/>
			<xsl:copy-of select="ipInflFeatPerfective"/>
			<xsl:copy-of select="ipInflFeatPotential"/>
			<xsl:copy-of select="ipInflFeatProgressive"/>
			<xsl:copy-of select="ipInflFeatStative"/>
			<xsl:copy-of select="ipInflFeatUnreal"/>
			<xsl:copy-of select="ipInflFeatDeclarative"/>
			<ipInflFeatIndicative/>
			<xsl:copy-of select="ipInflFeatRealis"/>
			<xsl:copy-of select="ipInflFeatImperative"/>
			<xsl:copy-of select="ipInflFeatInterrogative"/>
			<ipInflFeatConditional/>
			<ipInflFeatSubjunctive/>
			<xsl:copy-of select="ipInflFeatIrrealis"/>
			<xsl:copy-of select="ipInflFeatAntipassive"/>
			<xsl:copy-of select="ipInflFeatCausative"/>
			<xsl:copy-of select="ipInflFeatFinite"/>
			<xsl:copy-of select="ipInflFeatMinusFinite"/>
			<xsl:copy-of select="ipInflFeatGerund"/>
			<xsl:copy-of select="ipInflFeatPassive"/>
			<xsl:copy-of select="ipInflFeatParticiple"/>
			<xsl:copy-of select="ipInflFeatActorVoice"/>
			<xsl:copy-of select="ipInflFeatDativeVoice"/>
			<xsl:copy-of select="ipInflFeatGoalVoice"/>
			<xsl:copy-of select="ipInflFeatInstrumentalVoice"/>
			<xsl:copy-of select="ipInflFeatLocativeVoice"/>
			<xsl:copy-of select="ipInflFeatObjectVoice"/>
		</ip>
	</xsl:template>
	<!--
		neg:  add attributes, checkboxes and examples
	-->
	<xsl:template match="neg">
		<neg>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="negAuxRequiresAux">
				<xsl:value-of select="//ip/@negAuxRequiresAux"/>
			</xsl:attribute>
			<xsl:attribute name="negFrontTwo">no</xsl:attribute>
			<xsl:attribute name="negIndef">yes</xsl:attribute>
			<xsl:attribute name="negTwoAllowed">yes</xsl:attribute>
			<xsl:attribute name="negVerbal">yes</xsl:attribute>
			<xsl:attribute name="npDegreeNeg">
				<xsl:value-of select="//qp/@npDegreeNeg"/>
			</xsl:attribute>
			<xsl:attribute name="npDegreeNegCooccur">
				<xsl:value-of select="//qp/@npDegreeNegCooccur"/>
			</xsl:attribute>
			<npDegreeNegProclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//qp/@npDegreeNegType='proclitic' or //qp/@npDegreeNegType='clitic'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</npDegreeNegProclitic>
			<npDegreeNegEnclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//qp/@npDegreeNegType='enclitic' or //qp/@npDegreeNegType='clitic'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</npDegreeNegEnclitic>
			<npDegreeNegPrefix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//qp/@npDegreeNegType='prefix' or //qp/@npDegreeNegType='affix'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</npDegreeNegPrefix>
			<npDegreeNegSuffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//qp/@npDegreeNegType='suffix' or //qp/@npDegreeNegType='affix'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</npDegreeNegSuffix>
			<npDegreeNegOther checked="no"/>
			<npDegreeNegWordBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="//qp/@npDegreeNegPos"/>
				</xsl:call-template>
			</npDegreeNegWordBefore>
			<npDegreeNegWordAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="//qp/@npDegreeNegPos"/>
				</xsl:call-template>
			</npDegreeNegWordAfter>
			<npDegreeNegWordBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="//qp/@npDegreeNegPos"/>
				</xsl:call-template>
			</npDegreeNegWordBoth>
			<npDegreeNegWordOther checked="no"/>
			<negTemporalTypeWord>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//advp/@negTemporalType='word'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negTemporalTypeWord>
			<negTemporalTypeAdverb>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//advp/@negTemporalType='adverb'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negTemporalTypeAdverb>
			<negTemporalTypeAdverbWord>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//advp/@negTemporalType='adverbWord'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negTemporalTypeAdverbWord>
			<negTemporalTypeAffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//advp/@negTemporalType='affix'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negTemporalTypeAffix>
			<negTemporalTypeVerb>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//advp/@negTemporalType='verb'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negTemporalTypeVerb>
			<negTemporalTypeOther checked="no"/>
			<negTemporalAdverbWordBefore>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//advp/@negTemporalWordPos='before'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negTemporalAdverbWordBefore>
			<negTemporalAdverbWordAfter>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//advp/@negTemporalWordPos='after'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negTemporalAdverbWordAfter>
			<negTemporalAdverbWordBoth checked="no"/>
			<negTemporalAdverbWordOther checked="no"/>
			<negLocativeTypeWord>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//advp/@negLocativeType='word'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negLocativeTypeWord>
			<negLocativeTypeAdverb>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//advp/@negLocativeType='adverb'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negLocativeTypeAdverb>
			<negLocativeTypeAdverbWord>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//advp/@negLocativeType='adverbWord'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negLocativeTypeAdverbWord>
			<negLocativeTypeAffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//advp/@negLocativeType='affix'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negLocativeTypeAffix>
			<negLocativeTypeVerb>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//advp/@negLocativeType='verb'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negLocativeTypeVerb>
			<negLocativeTypeOther checked="no"/>
			<negLocativeAdverbWordBefore>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//advp/@negLocativeWordPos='before'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negLocativeAdverbWordBefore>
			<negLocativeAdverbWordAfter>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//advp/@negLocativeWordPos='after'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negLocativeAdverbWordAfter>
			<negLocativeAdverbWordBoth checked="no"/>
			<negLocativeAdverbWordOther checked="no"/>
			<negAuxWord>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//ip/@negAux='yes'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negAuxWord>
			<negAuxAffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//ip/@negAuxAffix='yes'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negAuxAffix>
			<negVAffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="//ip/@negVAffix='yes'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</negVAffix>
			<negVerbalOther checked="no"/>
			<not>
				<xsl:value-of select="//qp/not"/>
			</not>
			<negCliticExample/>
			<negAffixExample/>
			<negOtherExample/>
			<negExample>
				<xsl:value-of select="//qp/negExample"/>
			</negExample>
			<negCooccurExample>
				<xsl:value-of select="//qp/negCooccurExample"/>
			</negCooccurExample>
			<npDegreeSubjExample>
				<xsl:value-of select="degreeSubjExample"/>
				<xsl:value-of select="determinerSubjExample"/>
			</npDegreeSubjExample>
			<negIndefExample>
				<xsl:value-of select="//pron/negIndefExample"/>
			</negIndefExample>
			<negIndefNPExample>
				<xsl:value-of select="//pron/negIndefNPExample"/>
			</negIndefNPExample>
			<negIndefSubjExample>
				<xsl:value-of select="pronounSubjExample"/>
			</negIndefSubjExample>
			<negTemporalExample>
				<xsl:value-of select="//advp/negTemporalExample"/>
			</negTemporalExample>
			<negTemporalAdverbAffixExample>
				<xsl:value-of select="//advp/negTemporalAdverbAffixExample"/>
			</negTemporalAdverbAffixExample>
			<negTemporalAdverbExample>
				<xsl:value-of select="//advp/negTemporalAdverbExample"/>
			</negTemporalAdverbExample>
			<negTemporalAdverbWordExample>
				<xsl:value-of select="//advp/negTemporalAdverbWordExample"/>
			</negTemporalAdverbWordExample>
			<negTemporalAdverbWordsExample>
				<xsl:value-of select="//advp/negTemporalAdverbWordsExample"/>
			</negTemporalAdverbWordsExample>
			<negTemporalAffixExample>
				<xsl:value-of select="//advp/negTemporalAffixExample"/>
			</negTemporalAffixExample>
			<negTemporalAffixVerbExample/>
			<negTemporalVerbExample>
				<xsl:value-of select="//advp/negTemporalVerbExample"/>
			</negTemporalVerbExample>
			<negTemporalOtherExample/>
			<xsl:copy-of select="advTemporalExample"/>
			<negLocativeExample>
				<xsl:value-of select="//advp/negLocativeExample"/>
			</negLocativeExample>
			<negLocativeAdverbAffixExample>
				<xsl:value-of select="//advp/negLocativeAdverbAffixExample"/>
			</negLocativeAdverbAffixExample>
			<negLocativeAdverbExample>
				<xsl:value-of select="//advp/negLocativeAdverbExample"/>
			</negLocativeAdverbExample>
			<negLocativeAdverbWordExample>
				<xsl:value-of select="//advp/negLocativeAdverbWordExample"/>
			</negLocativeAdverbWordExample>
			<negLocativeAdverbWordsExample>
				<xsl:value-of select="//advp/negLocativeAdverbWordsExample"/>
			</negLocativeAdverbWordsExample>
			<negLocativeAffixExample>
				<xsl:value-of select="//advp/negLocativeAffixExample"/>
			</negLocativeAffixExample>
			<negLocativeAffixVerbExample/>
			<negLocativeVerbExample>
				<xsl:value-of select="//advp/negLocativeVerbExample"/>
			</negLocativeVerbExample>
			<negLocativeOtherExample/>
			<xsl:copy-of select="advLocativeExample"/>
			<negAuxExample>
				<xsl:value-of select="//ip/negAuxExample"/>
			</negAuxExample>
			<negAuxAffixExample>
				<xsl:value-of select="//ip/negAuxAffixExample"/>
			</negAuxAffixExample>
			<negVerbExample>
				<xsl:value-of select="//ip/negVerbExample"/>
			</negVerbExample>
			<negVerbalOtherExample/>
			<xsl:copy-of select="auxExample"/>
			<xsl:copy-of select="auxAffixExample"/>
			<xsl:copy-of select="verbAffixExample"/>
			<negVerbalOtherSentExample/>
			<xsl:copy-of select="npiPronounExample"/>
			<xsl:copy-of select="npiDeterminerExample"/>
			<xsl:copy-of select="npiTemporalExample"/>
			<xsl:copy-of select="npiLocativeExample"/>
			<xsl:copy-of select="objectExample"/>
			<xsl:copy-of select="indirectObjectExample"/>
			<xsl:copy-of select="subjectObjectExample"/>
		</neg>
	</xsl:template>
	<!--
		np:  add attributes, delete two and add examples
	-->
	<xsl:template match="np">
		<np>
			<xsl:copy-of select="@*[name()!='caseWordPos' and name()!='caseWordEither' and name()!='caseCliticPos' and name()!='adjpAgree' and name()!='qpAgree' and name()!='agreeOther' and name()!='possMarked' and name()!='possCliticRequired' and name()!='artPos' and name()!='artEither' and name()!='artBothRequiredPos' and name()!='demPos' and name()!='demEither' and name()!='demBothRequiredPos' and name()!='demOrArtPos' and name()!='demOrArtEither' and name()!='demOrArtBothRequiredPos' and name()!='demAndArtDemPos' and name()!='demAndArtDemEither' and name()!='demAndArtDemBothRequiredPos' and name()!='demAndArtArtPos' and name()!='demAndArtArtEither' and name()!='demAndArtArtBothRequiredPos' and name()!='possCliticWord' and name()!='possCliticAffix' and name()!='possCliticPossPos' and name()!='qpPos' and name()!='qpEither' and name()!='adjpPos' and name()!='adjpEither']"/>
			<xsl:attribute name="agreeOther">
				<xsl:choose>
					<xsl:when test="@agreeOther='no'">no</xsl:when>
					<xsl:otherwise>yes</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="possMarked">
				<xsl:choose>
					<xsl:when test="@possMarked='no'">no</xsl:when>
					<xsl:when test="@possMarked='yesAffix'">yesAffix</xsl:when>
					<xsl:when test="@possCliticWord='yes'">yesWord</xsl:when>
					<xsl:when test="@possCliticAffix='suffix'">yesEnclitic</xsl:when>
					<xsl:when test="@possCliticAffix='prefix'">yesProclitic</xsl:when>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="possNP">yes</xsl:attribute>
			<xsl:attribute name="possPronPos">unknown</xsl:attribute>
			<xsl:attribute name="possPPPos">unknown</xsl:attribute>
			<xsl:attribute name="possWordRequired">
				<xsl:value-of select="@possCliticRequired"/>
			</xsl:attribute>
			<xsl:attribute name="possAbsolutive">no</xsl:attribute>
			<xsl:attribute name="adjPPart">no</xsl:attribute>
			<xsl:attribute name="ppComp">no</xsl:attribute>
			<xsl:attribute name="partNP">no</xsl:attribute>
			<agreeClass>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@agreeOther='yesClass'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</agreeClass>
			<agreeGender>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@agreeOther='yesGender'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</agreeGender>
			<agreeAnimacy>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@agreeOther='yesAnimacy'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</agreeAnimacy>
			<agreeOtherFeat checked="no"/>
			<caseWordBefore>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@caseWordPos='before' or @caseWordPos='either'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</caseWordBefore>
			<caseWordAfter>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@caseWordPos='after' or @caseWordPos='either'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</caseWordAfter>
			<caseWordBoth checked="no"/>
			<caseWordOther checked="no"/>
			<caseAttachesProclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@caseCliticPos='before' or @caseCliticPos='either'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</caseAttachesProclitic>
			<caseAttachesEnclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@caseCliticPos='after' or @caseCliticPos='either'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</caseAttachesEnclitic>
			<caseAttachesPrefix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@caseCliticPos='prefixN' or @caseCliticPos='eitherN'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</caseAttachesPrefix>
			<caseAttachesSuffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@caseCliticPos='suffixN' or @caseCliticPos='eitherN'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</caseAttachesSuffix>
			<caseAttachesOther checked="no"/>
			<artOnlyBefore>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@artPos='before' or @artPos='either'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</artOnlyBefore>
			<artOnlyAfter>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@artPos='after' or @artPos='either'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</artOnlyAfter>
			<artOnlyBoth checked="no"/>
			<artOnlyOther checked="no"/>
			<demOnlyBefore>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@demPos='before' or @demPos='either'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</demOnlyBefore>
			<demOnlyAfter>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@demPos='after' or @demPos='either'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</demOnlyAfter>
			<demOnlyBoth checked="no"/>
			<demOnlyOther checked="no"/>
			<demOrArtPosBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@demOrArtPos"/>
				</xsl:call-template>
			</demOrArtPosBefore>
			<demOrArtPosAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@demOrArtPos"/>
				</xsl:call-template>
			</demOrArtPosAfter>
			<demOrArtPosBoth checked="no"/>
			<demOrArtPosOther checked="no"/>
			<demAndArtDemBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@demAndArtDemPos"/>
				</xsl:call-template>
			</demAndArtDemBefore>
			<demAndArtDemAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@demAndArtDemPos"/>
				</xsl:call-template>
			</demAndArtDemAfter>
			<demAndArtDemBoth checked="no"/>
			<demAndArtDemOther checked="no"/>
			<demOrArtPosOther checked="no"/>
			<demAndArtArtBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@demAndArtArtPos"/>
				</xsl:call-template>
			</demAndArtArtBefore>
			<demAndArtArtAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@demAndArtArtPos"/>
				</xsl:call-template>
			</demAndArtArtAfter>
			<demAndArtArtBoth checked="no"/>
			<demAndArtArtOther checked="no"/>
			<possWordBefore checked="no"/>
			<possWordAfter checked="no"/>
			<possWordBoth checked="no"/>
			<possWordOther checked="no"/>
			<qpPosBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@qpPos"/>
				</xsl:call-template>
			</qpPosBefore>
			<qpPosAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@qpPos"/>
				</xsl:call-template>
			</qpPosAfter>
			<qpPosBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@qpPos"/>
				</xsl:call-template>
			</qpPosBoth>
			<qpPosOther checked="no"/>
			<adjBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@adjpPos"/>
				</xsl:call-template>
			</adjBefore>
			<adjAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@adjpPos"/>
				</xsl:call-template>
			</adjAfter>
			<adjBoth checked="no"/>
			<adjPosOther checked="no"/>
			<xsl:copy-of select="agreeNumberExample"/>
			<xsl:copy-of select="agreeClassExample"/>
			<xsl:copy-of select="agreeGenderExample"/>
			<xsl:copy-of select="agreeAnimacyExample"/>
			<agreeOtherExample/>
			<caseNPExample/>
			<xsl:copy-of select="nominative"/>
			<xsl:copy-of select="accusative"/>
			<xsl:copy-of select="ergative"/>
			<xsl:copy-of select="absolutive"/>
			<xsl:copy-of select="genitive"/>
			<xsl:copy-of select="dative"/>
			<xsl:copy-of select="ablative"/>
			<xsl:copy-of select="instrumental"/>
			<xsl:copy-of select="locative"/>
			<xsl:copy-of select="vocative"/>
			<xsl:copy-of select="oblique"/>
			<xsl:copy-of select="otherCase"/>
			<articleExample>
				<xsl:value-of select="articleExample"/>
				<xsl:text>&#xa;</xsl:text>
				<xsl:value-of select="articleSgExample"/>
			</articleExample>
			<xsl:copy-of select="articlePlExample"/>
			<articleIndefExample/>
			<articleIndefPlExample/>
			<articleNomExample/>
			<articlePlNomExample/>
			<articleIndefNomExample/>
			<articleIndefPlNomExample/>
			<articleAccExample/>
			<articlePlAccExample/>
			<articleIndefAccExample/>
			<articleIndefPlAccExample/>
			<articleGenExample/>
			<articlePlGenExample/>
			<articleIndefGenExample/>
			<articleIndefPlGenExample/>
			<articleErgExample/>
			<articlePlErgExample/>
			<articleIndefErgExample/>
			<articleIndefPlErgExample/>
			<articleAbsExample/>
			<articlePlAbsExample/>
			<articleIndefAbsExample/>
			<articleIndefPlAbsExample/>
			<articleDatExample/>
			<articlePlDatExample/>
			<articleIndefDatExample/>
			<articleIndefPlDatExample/>
			<demProximalExample>
				<xsl:value-of select="demonstrativeExample"/>
				<xsl:text>&#xa;</xsl:text>
				<xsl:value-of select="demonstrativeSgExample "/>
				<xsl:text>&#xa;</xsl:text>
				<xsl:value-of select="demonstrativePlExample  "/>
			</demProximalExample>
			<demMedialExample/>
			<demDistalExample/>
			<demProximalPlExample/>
			<demMedialPlExample/>
			<demDistalPlExample/>
			<!-- Should this map from something? -->
			<demProximalNomExample/>
			<demMedialNomExample/>
			<demDistalNomExample/>
			<demProximalPlNomExample/>
			<demMedialPlNomExample/>
			<demDistalPlNomExample/>
			<demProximalAccExample/>
			<demMedialAccExample/>
			<demDistalAccExample/>
			<demProximalPlAccExample/>
			<demMedialPlAccExample/>
			<demDistalPlAccExample/>
			<demProximalGenExample/>
			<demMedialGenExample/>
			<demDistalGenExample/>
			<demProximalPlGenExample/>
			<demMedialPlGenExample/>
			<demDistalPlGenExample/>
			<demProximalErgExample/>
			<demMedialErgExample/>
			<demDistalErgExample/>
			<demProximalPlErgExample/>
			<demMedialPlErgExample/>
			<demDistalPlErgExample/>
			<demProximalAbsExample/>
			<demMedialAbsExample/>
			<demDistalAbsExample/>
			<demProximalPlAbsExample/>
			<demMedialPlAbsExample/>
			<demDistalPlAbsExample/>
			<demProximalDatExample/>
			<demMedialDatExample/>
			<demDistalDatExample/>
			<demProximalPlDatExample/>
			<demMedialPlDatExample/>
			<demDistalPlDatExample/>
			<xsl:copy-of select="example"/>
			<xsl:copy-of select="possessorExample"/>
			<xsl:copy-of select="embeddedExample"/>
			<xsl:copy-of select="ppExample"/>
			<xsl:copy-of select="relClExample"/>
			<possMarkerAffix/>
			<possMarkerClitic/>
			<possMarkerWord/>
			<xsl:copy-of select="possAlienableAffixExample"/>
			<possAbsolutiveAffixExample/>
			<xsl:copy-of select="qpExample"/>
			<xsl:copy-of select="adjpExample"/>
			<xsl:copy-of select="partExample"/>
			<compBodyPartExample/>
			<compKinshipExample/>
			<compFoodExample/>
			<compMaterialExample/>
			<xsl:copy-of select="compExample"/>
			<xsl:copy-of select="compPPExample"/>
			<xsl:copy-of select="partHeadExample"/>
			<xsl:copy-of select="partHeadSentExample"/>
			<xsl:copy-of select="articleCategory"/>
			<xsl:copy-of select="demonstrativeCategory"/>
			<xsl:copy-of select="nounCategory"/>
			<xsl:copy-of select="npContents1"/>
			<xsl:copy-of select="npContents2"/>
			<xsl:copy-of select="npContents3"/>
			<xsl:copy-of select="npContents4"/>
			<xsl:copy-of select="npContents5"/>
			<xsl:copy-of select="npContents6"/>
			<xsl:copy-of select="npContents7"/>
			<xsl:copy-of select="npContents8"/>
			<xsl:copy-of select="npContents9"/>
			<xsl:copy-of select="npPossAgrPossFirst"/>
			<xsl:copy-of select="npPossAgrPossExclusive"/>
			<xsl:copy-of select="npPossAgrPossInclusive"/>
			<xsl:copy-of select="npPossAgrPossSecond"/>
			<xsl:copy-of select="npPossAgrPossThird"/>
			<xsl:copy-of select="npPossAgrPossSingular"/>
			<xsl:copy-of select="npPossAgrPossPlural"/>
			<xsl:copy-of select="npPossAgrPossDual"/>
			<xsl:copy-of select="npPossAgrPossMasculine"/>
			<xsl:copy-of select="npPossAgrPossFeminine"/>
			<xsl:copy-of select="npPossAgrPossNeuter"/>
			<xsl:copy-of select="npPossAgrPossAnimate"/>
			<xsl:copy-of select="npPossAgrPossInanimate"/>
			<xsl:copy-of select="npPossAgrPossHuman"/>
			<xsl:copy-of select="npPossAgrPossNonHuman"/>
		</np>
	</xsl:template>
	<!--
		pron:  add many attributes and examples
	-->
	<xsl:template match="pron">
		<pron>
			<xsl:attribute name="checkedOff">
				<xsl:value-of select="@checkedOff"/>
			</xsl:attribute>
			<xsl:attribute name="demAdjSame">no</xsl:attribute>
			<xsl:attribute name="demCase">
				<xsl:value-of select="@demCase"/>
			</xsl:attribute>
			<xsl:attribute name="demNumber">no</xsl:attribute>
			<xsl:attribute name="dependentPron">
				<xsl:value-of select="@dependentPron"/>
			</xsl:attribute>
			<xsl:attribute name="partitivePos">
				<xsl:value-of select="@partitivePos"/>
			</xsl:attribute>
			<xsl:attribute name="poss">
				<xsl:value-of select="@poss"/>
			</xsl:attribute>
			<xsl:attribute name="pronDepClassifier">
				<xsl:value-of select="@pronDepClassifier"/>
			</xsl:attribute>
			<xsl:attribute name="pronMod">
				<xsl:value-of select="@pronMod"/>
			</xsl:attribute>
			<xsl:attribute name="pronounClassifier">
				<xsl:value-of select="@pronounClassifier"/>
			</xsl:attribute>
			<xsl:attribute name="pronounExcl">no</xsl:attribute>
			<xsl:attribute name="pronounNumber">no</xsl:attribute>
			<xsl:attribute name="recip">
				<xsl:choose>
					<xsl:when test="@recip='verbal'">yesVerbal</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="@recip"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="refl">
				<xsl:value-of select="@refl"/>
			</xsl:attribute>
			<dependentTypeProclitic>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@dependentPos"/>
				</xsl:call-template>
			</dependentTypeProclitic>
			<dependentTypeEnclitic>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@dependentPos"/>
				</xsl:call-template>
			</dependentTypeEnclitic>
			<dependentTypePrefix checked="no"/>
			<dependentTypeSuffix checked="no"/>
			<dependentTypeOther checked="no"/>
			<possDistinct>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@possAffix='no' or @possAffix='both'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</possDistinct>
			<possAffixPron>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@possAffix='yes' or @possAffix='both'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</possAffixPron>
			<possAffixWord checked="no"/>
			<possPhrase checked="no"/>
			<possOther checked="no"/>
			<reflDistinct>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@reflAffix='noWord' or @reflAffix='some'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</reflDistinct>
			<reflAffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@reflAffix='yes' or @reflAffix='some'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</reflAffix>
			<reflNounPoss>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@reflAffix='noNoun'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</reflNounPoss>
			<reflQP>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@reflAffix='noQP'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</reflQP>
			<reflOther checked="no"/>
			<recipDistinct>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@recipAffix='noWord' or @recipAffix='some'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</recipDistinct>
			<recipAffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@recipAffix='yes' or @recipAffix='some'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</recipAffix>
			<recipNounPoss>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@recipAffix='noNoun'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</recipNounPoss>
			<recipQP>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@recipAffix='noQP'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</recipQP>
			<recipOther checked="no"/>
			<indefQWord checked="no"/>
			<indefQPhrase checked="no"/>
			<indefQOther checked="no"/>
			<indefTypeQPQBefore checked="no"/>
			<indefTypeQPQAfter checked="no"/>
			<indefTypeQPQBoth checked="no"/>
			<indefTypeQPQOther checked="no"/>
			<indefIntWord checked="no"/>
			<indefIntPhrase checked="no"/>
			<indefIntOther checked="no"/>
			<indefTypeIntBefore checked="no"/>
			<indefTypeIntAfter checked="no"/>
			<indefTypeIntBoth checked="no"/>
			<indefTypeIntOther checked="no"/>
			<personalFirstSgNoCaseExample>
				<xsl:value-of select="personalFirstNoCaseExample"/>
			</personalFirstSgNoCaseExample>
			<personalFirstPlNoCaseExample/>
			<personalFirstExclNoCaseExample/>
			<personalFirstInclNoCaseExample/>
			<personalSecondSgNoCaseExample>
				<xsl:value-of select="personalSecondNoCaseExample"/>
			</personalSecondSgNoCaseExample>
			<personalSecondPlNoCaseExample/>
			<personalThirdSgNoCaseExample>
				<xsl:value-of select="personalThirdNoCaseExample"/>
			</personalThirdSgNoCaseExample>
			<personalThirdPlNoCaseExample/>
			<personalFirstSgNomSubjectExample>
				<xsl:value-of select="personalFirstNomSubjectExample"/>
			</personalFirstSgNomSubjectExample>
			<personalFirstPlNomSubjectExample/>
			<personalFirstExclNomSubjectExample/>
			<personalFirstInclNomSubjectExample/>
			<personalSecondSgNomSubjectExample>
				<xsl:value-of select="personalSecondNomSubjectExample"/>
			</personalSecondSgNomSubjectExample>
			<personalSecondPlNomSubjectExample/>
			<personalThirdSgNomSubjectExample>
				<xsl:value-of select="personalThirdNomSubjectExample"/>
			</personalThirdSgNomSubjectExample>
			<personalThirdPlNomSubjectExample/>
			<personalFirstSgNomObjectExample>
				<xsl:value-of select="personalFirstNomObjectExample"/>
			</personalFirstSgNomObjectExample>
			<personalFirstPlNomObjectExample/>
			<personalFirstExclNomObjectExample/>
			<personalFirstInclNomObjectExample/>
			<personalSecondSgNomObjectExample>
				<xsl:value-of select="personalSecondNomObjectExample"/>
			</personalSecondSgNomObjectExample>
			<personalSecondPlNomObjectExample/>
			<personalThirdSgNomObjectExample>
				<xsl:value-of select="personalThirdNomObjectExample"/>
			</personalThirdSgNomObjectExample>
			<personalThirdPlNomObjectExample/>
			<personalFirstSgNomPossessorExample>
				<xsl:value-of select="personalFirstNomPossessorExample"/>
			</personalFirstSgNomPossessorExample>
			<personalFirstPlNomPossessorExample/>
			<personalFirstExclNomPossessorExample/>
			<personalFirstInclNomPossessorExample/>
			<personalSecondSgNomPossessorExample>
				<xsl:value-of select="personalSecondNomPossessorExample"/>
			</personalSecondSgNomPossessorExample>
			<personalSecondPlNomPossessorExample/>
			<personalThirdSgNomPossessorExample>
				<xsl:value-of select="personalThirdNomPossessorExample"/>
			</personalThirdSgNomPossessorExample>
			<personalThirdPlNomPossessorExample/>
			<personalFirstSgNomDativeExample>
				<xsl:value-of select="personalFirstNomDativeExample"/>
			</personalFirstSgNomDativeExample>
			<personalFirstPlNomDativeExample/>
			<personalFirstExclNomDativeExample/>
			<personalFirstInclNomDativeExample/>
			<personalSecondSgNomDativeExample>
				<xsl:value-of select="personalSecondNomDativeExample"/>
			</personalSecondSgNomDativeExample>
			<personalSecondPlNomDativeExample/>
			<personalThirdSgNomDativeExample>
				<xsl:value-of select="personalThirdNomDativeExample"/>
			</personalThirdSgNomDativeExample>
			<personalThirdPlNomDativeExample/>
			<personalFirstSgErgSubjectTransExample>
				<xsl:value-of select="personalFirstErgSubjectTransExample"/>
			</personalFirstSgErgSubjectTransExample>
			<personalFirstPlErgSubjectTransExample/>
			<personalFirstExclErgSubjectTransExample/>
			<personalFirstInclErgSubjectTransExample/>
			<personalSecondSgErgSubjectTransExample>
				<xsl:value-of select="personalSecondErgSubjectTransExample"/>
			</personalSecondSgErgSubjectTransExample>
			<personalSecondPlErgSubjectTransExample/>
			<personalThirdSgErgSubjectTransExample>
				<xsl:value-of select="personalThirdErgSubjectTransExample"/>
			</personalThirdSgErgSubjectTransExample>
			<personalThirdPlErgSubjectTransExample/>
			<personalFirstSgErgSubjectIntransExample>
				<xsl:value-of select="personalFirstErgSubjectIntransExample"/>
			</personalFirstSgErgSubjectIntransExample>
			<personalFirstPlErgSubjectIntransExample/>
			<personalFirstExclErgSubjectIntransExample/>
			<personalFirstInclErgSubjectIntransExample/>
			<personalSecondSgErgSubjectIntransExample>
				<xsl:value-of select="personalSecondErgSubjectIntransExample"/>
			</personalSecondSgErgSubjectIntransExample>
			<personalSecondPlErgSubjectIntransExample/>
			<personalThirdSgErgSubjectIntransExample>
				<xsl:value-of select="personalThirdErgSubjectIntransExample"/>
			</personalThirdSgErgSubjectIntransExample>
			<personalThirdPlErgSubjectIntransExample/>
			<personalFirstSgErgPossessorExample>
				<xsl:value-of select="personalFirstErgPossessorExample"/>
			</personalFirstSgErgPossessorExample>
			<personalFirstPlErgPossessorExample/>
			<personalFirstExclErgPossessorExample/>
			<personalFirstInclErgPossessorExample/>
			<personalSecondSgErgPossessorExample>
				<xsl:value-of select="personalSecondErgPossessorExample"/>
			</personalSecondSgErgPossessorExample>
			<personalSecondPlErgPossessorExample/>
			<personalThirdSgErgPossessorExample>
				<xsl:value-of select="personalThirdErgPossessorExample"/>
			</personalThirdSgErgPossessorExample>
			<personalThirdPlErgPossessorExample/>
			<personalFirstSgErgDativeExample>
				<xsl:value-of select="personalFirstErgDativeExample"/>
			</personalFirstSgErgDativeExample>
			<personalFirstPlErgDativeExample/>
			<personalFirstExclErgDativeExample/>
			<personalFirstInclErgDativeExample/>
			<personalSecondSgErgDativeExample>
				<xsl:value-of select="personalSecondErgDativeExample"/>
			</personalSecondSgErgDativeExample>
			<personalSecondPlErgDativeExample/>
			<personalThirdSgErgDativeExample>
				<xsl:value-of select="personalThirdErgDativeExample"/>
			</personalThirdSgErgDativeExample>
			<personalThirdPlErgDativeExample/>
			<personalFirstSgSplitSubjectExample>
				<xsl:value-of select="personalFirstSplitSubjectExample"/>
			</personalFirstSgSplitSubjectExample>
			<personalFirstPlSplitSubjectExample/>
			<personalFirstExclSplitSubjectExample/>
			<personalFirstInclSplitSubjectExample/>
			<personalSecondSgSplitSubjectExample>
				<xsl:value-of select="personalSecondSplitSubjectExample"/>
			</personalSecondSgSplitSubjectExample>
			<personalSecondPlSplitSubjectExample/>
			<personalThirdSgSplitSubjectExample>
				<xsl:value-of select="personalThirdSplitSubjectExample"/>
			</personalThirdSgSplitSubjectExample>
			<personalThirdPlSplitSubjectExample/>
			<personalFirstSgSplitObjectExample>
				<xsl:value-of select="personalFirstSplitObjectExample"/>
			</personalFirstSgSplitObjectExample>
			<personalFirstPlSplitObjectExample/>
			<personalFirstExclSplitObjectExample/>
			<personalFirstInclSplitObjectExample/>
			<personalSecondSgSplitObjectExample>
				<xsl:value-of select="personalSecondSplitObjectExample"/>
			</personalSecondSgSplitObjectExample>
			<personalSecondPlSplitObjectExample/>
			<personalThirdSgSplitObjectExample>
				<xsl:value-of select="personalThirdSplitObjectExample"/>
			</personalThirdSgSplitObjectExample>
			<personalThirdPlSplitObjectExample/>
			<personalFirstSgSplitPossessorExample>
				<xsl:value-of select="personalFirstSplitPossessorExample"/>
			</personalFirstSgSplitPossessorExample>
			<personalFirstPlSplitPossessorExample/>
			<personalFirstExclSplitPossessorExample/>
			<personalFirstInclSplitPossessorExample/>
			<personalSecondSgSplitPossessorExample>
				<xsl:value-of select="personalSecondSplitPossessorExample"/>
			</personalSecondSgSplitPossessorExample>
			<personalSecondPlSplitPossessorExample/>
			<personalThirdSgSplitPossessorExample>
				<xsl:value-of select="personalThirdSplitPossessorExample"/>
			</personalThirdSgSplitPossessorExample>
			<personalThirdPlSplitPossessorExample/>
			<personalFirstSgSplitDativeExample>
				<xsl:value-of select="personalFirstSplitDativeExample"/>
			</personalFirstSgSplitDativeExample>
			<personalFirstPlSplitDativeExample/>
			<personalFirstExclSplitDativeExample/>
			<personalFirstInclSplitDativeExample/>
			<personalSecondSgSplitDativeExample>
				<xsl:value-of select="personalSecondSplitDativeExample"/>
			</personalSecondSgSplitDativeExample>
			<personalSecondPlSplitDativeExample/>
			<personalThirdSgSplitDativeExample>
				<xsl:value-of select="personalThirdSplitDativeExample"/>
			</personalThirdSgSplitDativeExample>
			<personalThirdPlSplitDativeExample/>
			<personalFirstSgSplitErgExample>
				<xsl:value-of select="personalFirstSplitErgExample"/>
			</personalFirstSgSplitErgExample>
			<personalFirstPlSplitErgExample/>
			<personalFirstExclSplitErgExample/>
			<personalFirstInclSplitErgExample/>
			<personalSecondSgSplitErgExample>
				<xsl:value-of select="personalSecondSplitErgExample"/>
			</personalSecondSgSplitErgExample>
			<personalSecondPlSplitErgExample/>
			<personalThirdSgSplitErgExample>
				<xsl:value-of select="personalThirdSplitErgExample"/>
			</personalThirdSgSplitErgExample>
			<personalThirdPlSplitErgExample/>
			<personalFirstSgSplitAbsExample>
				<xsl:value-of select="personalFirstSplitAbsExample"/>
			</personalFirstSgSplitAbsExample>
			<personalFirstPlSplitAbsExample/>
			<personalFirstExclSplitAbsExample/>
			<personalFirstInclSplitAbsExample/>
			<personalSecondSgSplitAbsExample>
				<xsl:value-of select="personalSecondSplitAbsExample"/>
			</personalSecondSgSplitAbsExample>
			<personalSecondPlSplitAbsExample/>
			<personalThirdSgSplitAbsExample>
				<xsl:value-of select="personalThirdSplitAbsExample"/>
			</personalThirdSgSplitAbsExample>
			<personalThirdPlSplitAbsExample/>
			<personalDependentFirstSgNoCaseExample>
				<xsl:value-of select="personalDependentFirstNoCaseExample"/>
			</personalDependentFirstSgNoCaseExample>
			<personalDependentFirstPlNoCaseExample/>
			<personalDependentFirstExclNoCaseExample/>
			<personalDependentFirstInclNoCaseExample/>
			<personalDependentSecondSgNoCaseExample>
				<xsl:value-of select="personalDependentSecondNoCaseExample"/>
			</personalDependentSecondSgNoCaseExample>
			<personalDependentSecondPlNoCaseExample/>
			<personalDependentThirdSgNoCaseExample>
				<xsl:value-of select="personalDependentThirdNoCaseExample"/>
			</personalDependentThirdSgNoCaseExample>
			<personalDependentThirdPlNoCaseExample/>
			<personalDependentFirstSgNomSubjectExample>
				<xsl:value-of select="personalDependentFirstNomSubjectExample"/>
			</personalDependentFirstSgNomSubjectExample>
			<personalDependentFirstPlNomSubjectExample/>
			<personalDependentFirstExclNomSubjectExample/>
			<personalDependentFirstInclNomSubjectExample/>
			<personalDependentSecondSgNomSubjectExample>
				<xsl:value-of select="personalDependentSecondNomSubjectExample"/>
			</personalDependentSecondSgNomSubjectExample>
			<personalDependentSecondPlNomSubjectExample/>
			<personalDependentThirdSgNomSubjectExample>
				<xsl:value-of select="personalDependentThirdNomSubjectExample"/>
			</personalDependentThirdSgNomSubjectExample>
			<personalDependentThirdPlNomSubjectExample/>
			<personalDependentFirstSgNomObjectExample>
				<xsl:value-of select="personalDependentFirstNomObjectExample"/>
			</personalDependentFirstSgNomObjectExample>
			<personalDependentFirstPlNomObjectExample/>
			<personalDependentFirstExclNomObjectExample/>
			<personalDependentFirstInclNomObjectExample/>
			<personalDependentSecondSgNomObjectExample>
				<xsl:value-of select="personalDependentSecondNomObjectExample"/>
			</personalDependentSecondSgNomObjectExample>
			<personalDependentSecondPlNomObjectExample/>
			<personalDependentThirdSgNomObjectExample>
				<xsl:value-of select="personalDependentThirdNomObjectExample"/>
			</personalDependentThirdSgNomObjectExample>
			<personalDependentThirdPlNomObjectExample/>
			<personalDependentFirstSgNomPossessorExample>
				<xsl:value-of select="personalDependentFirstNomPossessorExample"/>
			</personalDependentFirstSgNomPossessorExample>
			<personalDependentFirstPlNomPossessorExample/>
			<personalDependentFirstExclNomPossessorExample/>
			<personalDependentFirstInclNomPossessorExample/>
			<personalDependentSecondSgNomPossessorExample>
				<xsl:value-of select="personalDependentSecondNomPossessorExample"/>
			</personalDependentSecondSgNomPossessorExample>
			<personalDependentSecondPlNomPossessorExample/>
			<personalDependentThirdSgNomPossessorExample>
				<xsl:value-of select="personalDependentThirdNomPossessorExample"/>
			</personalDependentThirdSgNomPossessorExample>
			<personalDependentThirdPlNomPossessorExample/>
			<personalDependentFirstSgNomDativeExample>
				<xsl:value-of select="personalDependentFirstNomDativeExample"/>
			</personalDependentFirstSgNomDativeExample>
			<personalDependentFirstPlNomDativeExample/>
			<personalDependentFirstExclNomDativeExample/>
			<personalDependentFirstInclNomDativeExample/>
			<personalDependentSecondSgNomDativeExample>
				<xsl:value-of select="personalDependentSecondNomDativeExample"/>
			</personalDependentSecondSgNomDativeExample>
			<personalDependentSecondPlNomDativeExample/>
			<personalDependentThirdSgNomDativeExample>
				<xsl:value-of select="personalDependentThirdNomDativeExample"/>
			</personalDependentThirdSgNomDativeExample>
			<personalDependentThirdPlNomDativeExample/>
			<personalDependentFirstSgErgSubjectTransExample>
				<xsl:value-of select="personalDependentFirstErgSubjectTransExample"/>
			</personalDependentFirstSgErgSubjectTransExample>
			<personalDependentFirstPlErgSubjectTransExample/>
			<personalDependentFirstExclErgSubjectTransExample/>
			<personalDependentFirstInclErgSubjectTransExample/>
			<personalDependentSecondSgErgSubjectTransExample>
				<xsl:value-of select="personalDependentSecondErgSubjectTransExample"/>
			</personalDependentSecondSgErgSubjectTransExample>
			<personalDependentSecondPlErgSubjectTransExample/>
			<personalDependentThirdSgErgSubjectTransExample>
				<xsl:value-of select="personalDependentThirdErgSubjectTransExample"/>
			</personalDependentThirdSgErgSubjectTransExample>
			<personalDependentThirdPlErgSubjectTransExample/>
			<personalDependentFirstSgErgSubjectIntransExample>
				<xsl:value-of select="personalDependentFirstErgSubjectIntransExample"/>
			</personalDependentFirstSgErgSubjectIntransExample>
			<personalDependentFirstPlErgSubjectIntransExample/>
			<personalDependentFirstExclErgSubjectIntransExample/>
			<personalDependentFirstInclErgSubjectIntransExample/>
			<personalDependentSecondSgErgSubjectIntransExample>
				<xsl:value-of select="personalDependentSecondErgSubjectIntransExample"/>
			</personalDependentSecondSgErgSubjectIntransExample>
			<personalDependentSecondPlErgSubjectIntransExample/>
			<personalDependentThirdSgErgSubjectIntransExample>
				<xsl:value-of select="personalDependentThirdErgSubjectIntransExample"/>
			</personalDependentThirdSgErgSubjectIntransExample>
			<personalDependentThirdPlErgSubjectIntransExample/>
			<personalDependentFirstSgErgPossessorExample>
				<xsl:value-of select="personalDependentFirstErgPossessorExample"/>
			</personalDependentFirstSgErgPossessorExample>
			<personalDependentFirstPlErgPossessorExample/>
			<personalDependentFirstExclErgPossessorExample/>
			<personalDependentFirstInclErgPossessorExample/>
			<personalDependentSecondSgErgPossessorExample>
				<xsl:value-of select="personalDependentSecondErgPossessorExample"/>
			</personalDependentSecondSgErgPossessorExample>
			<personalDependentSecondPlErgPossessorExample/>
			<personalDependentThirdSgErgPossessorExample>
				<xsl:value-of select="personalDependentThirdErgPossessorExample"/>
			</personalDependentThirdSgErgPossessorExample>
			<personalDependentThirdPlErgPossessorExample/>
			<personalDependentFirstSgErgDativeExample>
				<xsl:value-of select="personalDependentFirstErgDativeExample"/>
			</personalDependentFirstSgErgDativeExample>
			<personalDependentFirstPlErgDativeExample/>
			<personalDependentFirstExclErgDativeExample/>
			<personalDependentFirstInclErgDativeExample/>
			<personalDependentSecondSgErgDativeExample>
				<xsl:value-of select="personalDependentSecondErgDativeExample"/>
			</personalDependentSecondSgErgDativeExample>
			<personalDependentSecondPlErgDativeExample/>
			<personalDependentThirdSgErgDativeExample>
				<xsl:value-of select="personalDependentThirdErgDativeExample"/>
			</personalDependentThirdSgErgDativeExample>
			<personalDependentThirdPlErgDativeExample/>
			<personalDependentFirstSgSplitSubjectExample>
				<xsl:value-of select="personalDependentFirstSplitSubjectExample"/>
			</personalDependentFirstSgSplitSubjectExample>
			<personalDependentFirstPlSplitSubjectExample/>
			<personalDependentFirstExclSplitSubjectExample/>
			<personalDependentFirstInclSplitSubjectExample/>
			<personalDependentSecondSgSplitSubjectExample>
				<xsl:value-of select="personalDependentSecondSplitSubjectExample"/>
			</personalDependentSecondSgSplitSubjectExample>
			<personalDependentSecondPlSplitSubjectExample/>
			<personalDependentThirdSgSplitSubjectExample>
				<xsl:value-of select="personalDependentThirdSplitSubjectExample"/>
			</personalDependentThirdSgSplitSubjectExample>
			<personalDependentThirdPlSplitSubjectExample/>
			<personalDependentFirstSgSplitObjectExample>
				<xsl:value-of select="personalDependentFirstSplitObjectExample"/>
			</personalDependentFirstSgSplitObjectExample>
			<personalDependentFirstPlSplitObjectExample/>
			<personalDependentFirstExclSplitObjectExample/>
			<personalDependentFirstInclSplitObjectExample/>
			<personalDependentSecondSgSplitObjectExample>
				<xsl:value-of select="personalDependentSecondSplitObjectExample"/>
			</personalDependentSecondSgSplitObjectExample>
			<personalDependentSecondPlSplitObjectExample/>
			<personalDependentThirdSgSplitObjectExample>
				<xsl:value-of select="personalDependentThirdSplitObjectExample"/>
			</personalDependentThirdSgSplitObjectExample>
			<personalDependentThirdPlSplitObjectExample/>
			<personalDependentFirstSgSplitPossessorExample>
				<xsl:value-of select="personalDependentFirstSplitPossessorExample"/>
			</personalDependentFirstSgSplitPossessorExample>
			<personalDependentFirstPlSplitPossessorExample/>
			<personalDependentFirstExclSplitPossessorExample/>
			<personalDependentFirstInclSplitPossessorExample/>
			<personalDependentSecondSgSplitPossessorExample>
				<xsl:value-of select="personalDependentSecondSplitPossessorExample"/>
			</personalDependentSecondSgSplitPossessorExample>
			<personalDependentSecondPlSplitPossessorExample/>
			<personalDependentThirdSgSplitPossessorExample>
				<xsl:value-of select="personalDependentThirdSplitPossessorExample"/>
			</personalDependentThirdSgSplitPossessorExample>
			<personalDependentThirdPlSplitPossessorExample/>
			<personalDependentFirstSgSplitDativeExample>
				<xsl:value-of select="personalDependentFirstSplitDativeExample"/>
			</personalDependentFirstSgSplitDativeExample>
			<personalDependentFirstPlSplitDativeExample/>
			<personalDependentFirstExclSplitDativeExample/>
			<personalDependentFirstInclSplitDativeExample/>
			<personalDependentSecondSgSplitDativeExample>
				<xsl:value-of select="personalDependentSecondSplitDativeExample"/>
			</personalDependentSecondSgSplitDativeExample>
			<personalDependentSecondPlSplitDativeExample/>
			<personalDependentThirdSgSplitDativeExample>
				<xsl:value-of select="personalDependentThirdSplitDativeExample"/>
			</personalDependentThirdSgSplitDativeExample>
			<personalDependentThirdPlSplitDativeExample/>
			<personalDependentFirstSgSplitErgExample>
				<xsl:value-of select="personalDependentFirstSplitErgExample"/>
			</personalDependentFirstSgSplitErgExample>
			<personalDependentFirstPlSplitErgExample/>
			<personalDependentFirstExclSplitErgExample/>
			<personalDependentFirstInclSplitErgExample/>
			<personalDependentSecondSgSplitErgExample>
				<xsl:value-of select="personalDependentSecondSplitErgExample"/>
			</personalDependentSecondSgSplitErgExample>
			<personalDependentSecondPlSplitErgExample/>
			<personalDependentThirdSgSplitErgExample>
				<xsl:value-of select="personalDependentThirdSplitErgExample"/>
			</personalDependentThirdSgSplitErgExample>
			<personalDependentThirdPlSplitErgExample/>
			<personalDependentFirstSgSplitAbsExample>
				<xsl:value-of select="personalDependentFirstSplitAbsExample"/>
			</personalDependentFirstSgSplitAbsExample>
			<personalDependentFirstPlSplitAbsExample/>
			<personalDependentFirstExclSplitAbsExample/>
			<personalDependentFirstInclSplitAbsExample/>
			<personalDependentSecondSgSplitAbsExample>
				<xsl:value-of select="personalDependentSecondSplitAbsExample"/>
			</personalDependentSecondSgSplitAbsExample>
			<personalDependentSecondPlSplitAbsExample/>
			<personalDependentThirdSgSplitAbsExample>
				<xsl:value-of select="personalDependentThirdSplitAbsExample"/>
			</personalDependentThirdSgSplitAbsExample>
			<personalDependentThirdPlSplitAbsExample/>

			<possFirstSgExample>
				<xsl:value-of select="possExample"/>
			</possFirstSgExample>
			<possFirstPlExample/>
			<possFirstExclExample/>
			<possFirstInclExample/>
			<possSecondSgExample/>
			<possSecondPlExample/>
			<possThirdSgExample/>
			<possThirdPlExample/>
			<pronPossAffixExample/>
			<pronPossAffixWordExample/>
			<pronPossAffixWordAffixesExample/>
			<pronPossPhraseWordExample/>
			<reflVerbAffixExample/>
			<reflVerbSentExample/>
			<reflFirstSgExample>
				<xsl:value-of select="reflExample"/>
			</reflFirstSgExample>
			<reflFirstPlExample/>
			<reflFirstExclExample/>
			<reflFirstInclExample/>
			<reflSecondSgExample/>
			<reflSecondPlExample/>
			<reflThirdSgExample/>
			<reflThirdPlExample/>
			<reflSentExample>
				<xsl:value-of select="reflSentExample"/>
			</reflSentExample>
			<pronReflAffixExample/>
			<pronReflNounPossExample/>
			<pronReflQExample/>
			<recipVerbAffixExample/>
			<recipVerbSentExample/>
			<recipFirstPlExample>
				<xsl:value-of select="recipExample"/>
			</recipFirstPlExample>
			<recipFirstExclExample/>
			<recipFirstInclExample/>
			<recipSecondExample/>
			<recipThirdExample/>
			<pronRecipAffixExample/>
			<pronRecipNounPossExample/>
			<pronRecipQExample/>
			<recipSentExample>
				<xsl:value-of select="recipSentExample"/>
			</recipSentExample>
			<demProximalExample>
				<xsl:value-of select="demProximalExample"/>
			</demProximalExample>
			<demMedialExample>
				<xsl:value-of select="demMedialExample"/>
			</demMedialExample>
			<demDistalExample>
				<xsl:value-of select="demDistalExample"/>
			</demDistalExample>
			<demProximalPlExample/>
			<demMedialPlExample/>
			<demDistalPlExample/>
			<demProximalNomExample>
				<xsl:value-of select="demProximalNomExample"/>
			</demProximalNomExample>
			<demMedialNomExample>
				<xsl:value-of select="demMedialNomExample"/>
			</demMedialNomExample>
			<demDistalNomExample>
				<xsl:value-of select="demDistalNomExample"/>
			</demDistalNomExample>
			<demProximalPlNomExample/>
			<demMedialPlNomExample/>
			<demDistalPlNomExample/>
			<demProximalAccExample>
				<xsl:value-of select="demProximalAccExample"/>
			</demProximalAccExample>
			<demMedialAccExample>
				<xsl:value-of select="demMedialAccExample"/>
			</demMedialAccExample>
			<demDistalAccExample>
				<xsl:value-of select="demDistalAccExample"/>
			</demDistalAccExample>
			<demProximalPlAccExample/>
			<demMedialPlAccExample/>
			<demDistalPlAccExample/>
			<demProximalGenExample/>
			<demMedialGenExample/>
			<demDistalGenExample/>
			<demProximalPlGenExample/>
			<demMedialPlGenExample/>
			<demDistalPlGenExample/>
			<demProximalErgExample>
				<xsl:value-of select="demProximalErgExample"/>
			</demProximalErgExample>
			<demMedialErgExample>
				<xsl:value-of select="demMedialErgExample"/>
			</demMedialErgExample>
			<demDistalErgExample>
				<xsl:value-of select="demDistalErgExample"/>
			</demDistalErgExample>
			<demProximalPlErgExample/>
			<demMedialPlErgExample/>
			<demDistalPlErgExample/>
			<demProximalAbsExample>
				<xsl:value-of select="demProximalAbsExample"/>
			</demProximalAbsExample>
			<demMedialAbsExample>
				<xsl:value-of select="demMedialAbsExample"/>
			</demMedialAbsExample>
			<demDistalAbsExample>
				<xsl:value-of select="demDistalAbsExample"/>
			</demDistalAbsExample>
			<demProximalPlAbsExample/>
			<demMedialPlAbsExample/>
			<demDistalPlAbsExample/>
			<demProximalDatExample/>
			<demMedialDatExample/>
			<demDistalDatExample/>
			<demProximalPlDatExample/>
			<demMedialPlDatExample/>
			<demDistalPlDatExample/>
			<indefTypeQWordExample>
				<xsl:value-of select="indefExample"/>
			</indefTypeQWordExample>
			<indefTypeQPhraseExample>
				<xsl:value-of select="indefNPExample"/>
			</indefTypeQPhraseExample>
			<indefTypeQOtherExample/>
			<indefTypeIntWordExample/>
			<indefTypeIntPhraseExample/>
			<indefTypeIntOtherExample/>
			<standAloneNPExample>
				<xsl:value-of select="standAloneNPExample"/>
			</standAloneNPExample>
			<pronSentExample>
				<xsl:value-of select="pronSentExample"/>
			</pronSentExample>
			<pronRelClExample>
				<xsl:value-of select="pronRelClExample"/>
			</pronRelClExample>
			<partitiveExample>
				<xsl:value-of select="partitiveExample"/>
			</partitiveExample>
			<pronounCategory>
				<xsl:value-of select="pronounCategory"/>
			</pronounCategory>
		</pron>
	</xsl:template>
	<!--
		pp:  add attributes and change some names
	-->
	<xsl:template match="pp">
		<pp>
			<xsl:attribute name="checkedOff">
				<xsl:value-of select="@checkedOff"/>
			</xsl:attribute>
			<xsl:attribute name="pPos">
				<xsl:value-of select="@pPos"/>
			</xsl:attribute>
			<xsl:attribute name="pType">
				<xsl:value-of select="@pType"/>
			</xsl:attribute>
			<xsl:attribute name="attaches">
				<xsl:value-of select="@attaches"/>
			</xsl:attribute>
			<xsl:attribute name="modifiers">
				<xsl:value-of select="@modifiers"/>
			</xsl:attribute>
			<xsl:attribute name="ppClassifier">
				<xsl:value-of select="@ppClassifier"/>
			</xsl:attribute>
			<xsl:attribute name="bodyPart">no</xsl:attribute>
			<xsl:attribute name="alone">
				<xsl:value-of select="@alone"/>
			</xsl:attribute>
			<xsl:attribute name="locative">
				<xsl:value-of select="@locative"/>
			</xsl:attribute>
			<xsl:attribute name="ppComp">
				<xsl:value-of select="@ppComp"/>
			</xsl:attribute>
			<xsl:attribute name="tempComp">
				<xsl:value-of select="@tempComp"/>
			</xsl:attribute>
			<ppModifierDegree>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="contains(@modifierType,'degree') or contains(@modifierType,'all')">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</ppModifierDegree>
			<ppModifierOrdinal>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="contains(@modifierType,'rdinal') or contains(@modifierType,'all')">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</ppModifierOrdinal>
			<ppModifierManner>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="contains(@modifierType,'anner') or contains(@modifierType,'all')">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</ppModifierManner>
			<ppModifierLocative>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="contains(@modifierType,'ocative') or @modifierType='all4'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</ppModifierLocative>
			<ppModifierOther checked="no"/>
			<ppDegreePosBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@degreePos"/>
				</xsl:call-template>
			</ppDegreePosBefore>
			<ppDegreePosAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@degreePos"/>
				</xsl:call-template>
			</ppDegreePosAfter>
			<ppDegreePosBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@degreePos"/>
				</xsl:call-template>
			</ppDegreePosBoth>
			<ppDegreePosOther checked="no"/>
			<ppOrdinalPosBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@ordinalPos"/>
				</xsl:call-template>
			</ppOrdinalPosBefore>
			<ppOrdinalPosAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@ordinalPos"/>
				</xsl:call-template>
			</ppOrdinalPosAfter>
			<ppOrdinalPosBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@ordinalPos"/>
				</xsl:call-template>
			</ppOrdinalPosBoth>
			<ppOrdinalPosOther checked="no"/>
			<ppMannerPosBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@mannerPos"/>
				</xsl:call-template>
			</ppMannerPosBefore>
			<ppMannerPosAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@mannerPos"/>
				</xsl:call-template>
			</ppMannerPosAfter>
			<ppMannerPosBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@mannerPos"/>
				</xsl:call-template>
			</ppMannerPosBoth>
			<ppMannerPosOther checked="no"/>
			<ppLocativePosBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@locativePos"/>
				</xsl:call-template>
			</ppLocativePosBefore>
			<ppLocativePosAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@locativePos"/>
				</xsl:call-template>
			</ppLocativePosAfter>
			<ppLocativePosBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@locativePos"/>
				</xsl:call-template>
			</ppLocativePosBoth>
			<ppLocativePosOther checked="no"/>
			<ppExample>
				<xsl:value-of select="xxample"/>
				<xsl:text>&#xa;</xsl:text>
				<xsl:value-of select="ppExample"/>
			</ppExample>
			<degree/>
			<degreeWithPP/>
			<ordinal/>
			<ordinalWithPP/>
			<manner/>
			<mannerWithPP/>
			<locative/>
			<locativeWithPP/>
			<otherMod/>
			<otherModWithPP/>
			<locativePrepExample/>
			<locativePostExample/>
			<locativePrepPPExample/>
			<locativePostPPExample/>
			<bodyPartPrepExample/>
			<bodyPartPostExample/>
			<bodyPartPrepPPExample/>
			<bodyPartPostPPExample/>
			<genitiveP/>
			<dativeP/>
			<ablativeP/>
			<instrumentalP/>
			<vocativeP/>
			<obliqueP/>
			<aloneExample>
				<xsl:value-of select="aloneExample"/>
			</aloneExample>
			<locExample>
				<xsl:value-of select="locExample"/>
			</locExample>
			<compPPExample>
				<xsl:value-of select="compPPExample"/>
			</compPPExample>
			<tempExample>
				<xsl:value-of select="tempExample"/>
			</tempExample>
			<pCategory>
				<xsl:value-of select="pCategory"/>
			</pCategory>
		</pp>
	</xsl:template>
	<!--
		q:  mostly mapping attributes to checkboxes, but some new examples, too
	-->
	<xsl:template match="q">
		<q>
			<xsl:copy-of select="@checkedOff"/>
			<xsl:copy-of select="@contFront"/>
			<xsl:copy-of select="@embCont"/>
			<xsl:copy-of select="@embContAuxPos"/>
			<xsl:copy-of select="@embContAuxRequired"/>
			<xsl:copy-of select="@embContRequired"/>
			<xsl:copy-of select="@embContWord"/>
			<xsl:copy-of select="@embYN"/>
			<xsl:copy-of select="@embYNAuxPos"/>
			<xsl:copy-of select="@embYNWord"/>
			<xsl:copy-of select="@mainCont"/>
			<xsl:copy-of select="@mainContAuxPos"/>
			<xsl:copy-of select="@mainContAuxRequired"/>
			<xsl:copy-of select="@mainContRequired"/>
			<xsl:copy-of select="@mainContWord"/>
			<xsl:copy-of select="@mainYN"/>
			<xsl:copy-of select="@mainYNAuxPos"/>
			<xsl:copy-of select="@mainYNWord"/>
			<xsl:copy-of select="@whArtPos"/>
			<xsl:copy-of select="@whDegAdjPos"/>
			<xsl:copy-of select="@whDegQPos"/>
			<xsl:copy-of select="@whDemPos"/>
			<mainYNProclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mainYNCliticPos='before' and @mainYNCliticAttaches='edge'">yes</xsl:when>
						<xsl:when test="@mainYNCliticPos='both' and @mainYNCliticAttaches='edge'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mainYNProclitic>
			<mainYNEnclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mainYNCliticPos='after' and @mainYNCliticAttaches='edge'">yes</xsl:when>
						<xsl:when test="@mainYNCliticPos='both' and @mainYNCliticAttaches='edge'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mainYNEnclitic>
			<mainYNPrefix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mainYNCliticPos='before' and @mainYNCliticAttaches='head'">yes</xsl:when>
						<xsl:when test="@mainYNCliticPos='both' and @mainYNCliticAttaches='head'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mainYNPrefix>
			<mainYNSuffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mainYNCliticPos='after' and @mainYNCliticAttaches='head'">yes</xsl:when>
						<xsl:when test="@mainYNCliticPos='both' and @mainYNCliticAttaches='head'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mainYNSuffix>
			<mainYNCliticOther checked="no"/>
			<mainYNWordBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@mainYNPos"/>
				</xsl:call-template>
			</mainYNWordBefore>
			<mainYNWordAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@mainYNPos"/>
				</xsl:call-template>
			</mainYNWordAfter>
			<mainYNWordBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@mainYNPos"/>
				</xsl:call-template>
			</mainYNWordBoth>
			<mainYNWordOther checked="no"/>
			<embYNProclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@embYNCliticPos='before' and @embYNCliticAttaches='edge'">yes</xsl:when>
						<xsl:when test="@embYNCliticPos='both' and @embYNCliticAttaches='edge'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</embYNProclitic>
			<embYNEnclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@embYNCliticPos='after' and @embYNCliticAttaches='edge'">yes</xsl:when>
						<xsl:when test="@embYNCliticPos='both' and @embYNCliticAttaches='edge'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</embYNEnclitic>
			<embYNPrefix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@embYNCliticPos='before' and @embYNCliticAttaches='head'">yes</xsl:when>
						<xsl:when test="@embYNCliticPos='both' and @embYNCliticAttaches='head'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</embYNPrefix>
			<embYNSuffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@embYNCliticPos='after' and @embYNCliticAttaches='head'">yes</xsl:when>
						<xsl:when test="@embYNCliticPos='both' and @embYNCliticAttaches='head'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</embYNSuffix>
			<embYNCliticOther checked="no"/>
			<embYNWordBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@embYNPos"/>
				</xsl:call-template>
			</embYNWordBefore>
			<embYNWordAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@embYNPos"/>
				</xsl:call-template>
			</embYNWordAfter>
			<embYNWordBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@embYNPos"/>
				</xsl:call-template>
			</embYNWordBoth>
			<embYNWordOther checked="no"/>
			<mainContProclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mainContCliticPos='before' and @mainContCliticAttaches='edge'">yes</xsl:when>
						<xsl:when test="@mainContCliticPos='both' and @mainContCliticAttaches='edge'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mainContProclitic>
			<mainContBetweenProclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mainContCliticPos='before' and @mainContCliticAttaches='between'">yes</xsl:when>
						<xsl:when test="@mainContCliticPos='both' and @mainContCliticAttaches='between'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mainContBetweenProclitic>
			<mainContEnclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mainContCliticPos='after' and @mainContCliticAttaches='edge'">yes</xsl:when>
						<xsl:when test="@mainContCliticPos='both' and @mainContCliticAttaches='edge'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mainContEnclitic>
			<mainContBetweenEnclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mainContCliticPos='after' and @mainContCliticAttaches='between'">yes</xsl:when>
						<xsl:when test="@mainContCliticPos='both' and @mainContCliticAttaches='between'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mainContBetweenEnclitic>
			<mainContPrefix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mainContCliticPos='before' and @mainContCliticAttaches='head'">yes</xsl:when>
						<xsl:when test="@mainContCliticPos='both' and @mainContCliticAttaches='head'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mainContPrefix>
			<mainContSuffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mainContCliticPos='after' and @mainContCliticAttaches='head'">yes</xsl:when>
						<xsl:when test="@mainContCliticPos='both' and @mainContCliticAttaches='head'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mainContSuffix>
			<mainContCliticOther checked="no"/>
			<mainContWordBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@mainContPos"/>
				</xsl:call-template>
			</mainContWordBefore>
			<mainContWordAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@mainContPos"/>
				</xsl:call-template>
			</mainContWordAfter>
			<mainContWordBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@mainContPos"/>
				</xsl:call-template>
			</mainContWordBoth>
			<mainContWordOther checked="no"/>
			<mainContVSOAfterWh>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mainContVSOBeforeWh='no' or @mainContVSOBeforeWh='some'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mainContVSOAfterWh>
			<mainContVSOBeforeWh>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mainContVSOBeforeWh='yes' or @mainContVSOBeforeWh='some'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mainContVSOBeforeWh>
			<mainContVSOEnd>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@mainContVSOBeforeWh='noEnd'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</mainContVSOEnd>
			<mainContVSOOther checked="no"/>
			<embContProclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@embContCliticPos='before' and @embContCliticAttaches='edge'">yes</xsl:when>
						<xsl:when test="@embContCliticPos='both' and @embContCliticAttaches='edge'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</embContProclitic>
			<embContBetweenProclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@embContCliticPos='before' and @embContCliticAttaches='between'">yes</xsl:when>
						<xsl:when test="@embContCliticPos='both' and @embContCliticAttaches='between'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</embContBetweenProclitic>
			<embContEnclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@embContCliticPos='after' and @embContCliticAttaches='edge'">yes</xsl:when>
						<xsl:when test="@embContCliticPos='both' and @embContCliticAttaches='edge'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</embContEnclitic>
			<embContBetweenEnclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@embContCliticPos='after' and @embContCliticAttaches='between'">yes</xsl:when>
						<xsl:when test="@embContCliticPos='both' and @embContCliticAttaches='between'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</embContBetweenEnclitic>
			<embContPrefix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@embContCliticPos='before' and @embContCliticAttaches='head'">yes</xsl:when>
						<xsl:when test="@embContCliticPos='both' and @embContCliticAttaches='head'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</embContPrefix>
			<embContSuffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@embContCliticPos='after' and @embContCliticAttaches='head'">yes</xsl:when>
						<xsl:when test="@embContCliticPos='both' and @embContCliticAttaches='head'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</embContSuffix>
			<embContCliticOther checked="no"/>
			<embContWordBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@embContPos"/>
				</xsl:call-template>
			</embContWordBefore>
			<embContWordAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@embContPos"/>
				</xsl:call-template>
			</embContWordAfter>
			<embContWordBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@embContPos"/>
				</xsl:call-template>
			</embContWordBoth>
			<embContWordOther checked="no"/>
			<embContVSOAfterWh>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@embContVSOBeforeWh='no' or @embContVSOBeforeWh='some'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</embContVSOAfterWh>
			<embContVSOBeforeWh>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@embContVSOBeforeWh='yes' or @embContVSOBeforeWh='some'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</embContVSOBeforeWh>
			<embContVSOEnd>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@embContVSOBeforeWh='noEnd'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</embContVSOEnd>
			<embContVSOOther checked="no"/>
			<xsl:copy-of select="example"/>
			<mainYNCliticExample/>
			<mainYNAffixExample/>
			<mainYNWordExample/>
			<xsl:copy-of select="embYNExample"/>
			<embYNCliticExample/>
			<embYNAffixExample/>
			<embYNWordExample/>
			<xsl:copy-of select="who"/>
			<xsl:copy-of select="what"/>
			<xsl:copy-of select="why"/>
			<xsl:copy-of select="where"/>
			<xsl:copy-of select="when"/>
			<xsl:copy-of select="how"/>
			<xsl:copy-of select="howMany"/>
			<xsl:copy-of select="which"/>
			<xsl:copy-of select="whose"/>
			<xsl:copy-of select="other"/>
			<xsl:copy-of select="contentExample"/>
			<mainContCliticExample/>
			<mainContAffixExample/>
			<mainContWordExample/>
			<mainContSpecialConditions/>
			<xsl:copy-of select="embContentExample"/>
			<embContCliticExample/>
			<embContAffixExample/>
			<embContWordExample/>
			<embContSpecialConditions/>
			<xsl:copy-of select="whPronCategory"/>
		</q>
	</xsl:template>
	<!--
		qp:  major surgery...
	-->
	<xsl:template match="qp">
		<qp>
			<xsl:copy-of select="@*[name()='checkedOff' or name()='npDegreeClassifier' or name()='npDegree' or name()='determinerClassifier' or name()='quantifierClassifier' or name()='degree' or name()='degreeClassifier' or name()='numberClassifier']"/>
			<xsl:attribute name="cardinalHead">
				<xsl:choose>
					<xsl:when test="@cardinalHead='before'">initial</xsl:when>
					<xsl:otherwise>final</xsl:otherwise>
				</xsl:choose>

			</xsl:attribute>
			<xsl:attribute name="determiner">
				<xsl:choose>
					<xsl:when test="@determiner='yes' or @determiner='attaches'">yes</xsl:when>
					<xsl:when test="@determiner='some'">some</xsl:when>
					<xsl:otherwise>noQ</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="determinerType">
				<xsl:choose>
					<xsl:when test="@determiner='yes'">yes</xsl:when>
					<xsl:when test="@determiner='some'">some</xsl:when>
					<xsl:otherwise>no</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="partitive">no</xsl:attribute>
			<xsl:attribute name="partitivePPPos">unknown</xsl:attribute>
			<npDegreeTypeProclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@npDegreeType='proclitic' or @npDegreeType='clitic'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</npDegreeTypeProclitic>
			<npDegreeTypeEnclitic>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@npDegreeType='enclitic' or @npDegreeType='clitic'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</npDegreeTypeEnclitic>
			<npDegreeTypePrefix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@npDegreeType='prefix' or @npDegreeType='affix'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</npDegreeTypePrefix>
			<npDegreeTypeSuffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@npDegreeType='suffix' or @npDegreeType='affix'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</npDegreeTypeSuffix>
			<npDegreeTypeOther checked="no"/>
			<npDegreePosBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@npDegreePos"/>
				</xsl:call-template>
			</npDegreePosBefore>
			<npDegreePosAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@npDegreePos"/>
				</xsl:call-template>
			</npDegreePosAfter>
			<npDegreePosBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@npDegreePos"/>
				</xsl:call-template>
			</npDegreePosBoth>
			<npDegreePosOther checked="no"/>
			<determinerPosBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@determinerPos"/>
				</xsl:call-template>
			</determinerPosBefore>
			<determinerPosAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@determinerPos"/>
				</xsl:call-template>
			</determinerPosAfter>
			<determinerPosBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@determinerPos"/>
				</xsl:call-template>
			</determinerPosBoth>
			<determinerPosOther checked="no"/>
			<determinerTypeProclitic checked="no"/>
			<determinerTypeEnclitic checked="no"/>
			<determinerTypePrefix checked="no"/>
			<determinerTypeSuffix checked="no"/>
			<determinerTypeOther checked="no"/>
			<degreeBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@degreePos"/>
				</xsl:call-template>
			</degreeBefore>
			<degreeAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@degreePos"/>
				</xsl:call-template>
			</degreeAfter>
			<degreeBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@degreePos"/>
				</xsl:call-template>
			</degreeBoth>
			<degreeOther checked="no"/>
			<degreeTypePrefix checked="no"/>
			<degreeTypeSuffix checked="no"/>
			<degreeTypeOther checked="no"/>
			<ordinalAffix>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@ordinalFormation='affix' or @ordinalFormation='both'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</ordinalAffix>
			<ordinalIndependent>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@ordinalFormation='independent'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</ordinalIndependent>
			<ordinalWord>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@ordinalFormation='word' or @ordinalFormation='both'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</ordinalWord>
			<ordinalOther checked="no"/>
			<ordinalWordBefore>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@ordinalWordPos='before'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</ordinalWordBefore>
			<ordinalWordAfter>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@ordinalWordPos='after'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</ordinalWordAfter>
			<ordinalWordBoth checked="no"/>
			<ordinalWordOther checked="no"/>
			<ordinalBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@ordinalPos"/>
				</xsl:call-template>
			</ordinalBefore>
			<ordinalAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@ordinalPos"/>
				</xsl:call-template>
			</ordinalAfter>
			<ordinalBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@ordinalPos"/>
				</xsl:call-template>
			</ordinalBoth>
			<ordinalNumOther checked="no"/>
			<xsl:copy-of select="*[name()='all' or name()='almost' or name()='only']"/>
			<npDegreeCliticExample/>
			<npDegreeAffixExample/>
			<npDegreeOtherExample/>
			<xsl:copy-of select="*[name()='example']"/>
			<some/>
			<any/>
			<every/>
			<determinerExample/>
			<determinerCliticExample/>
			<determinerAffixExample/>
			<determinerOtherExample/>
			<many/>
			<much/>
			<few/>
			<otherQ/>
			<xsl:copy-of select="*[name()='degreeWordExample' or name()='degreeExample']"/>
			<degreeAttachesExample/>
			<degreeAttachesNPExample/>
			<cardinalNumbers1>
				<xsl:value-of select="cardinalNumbers1to10"/>
			</cardinalNumbers1>
			<cardinalNumbers2/>
			<cardinalNumbers3/>
			<cardinalNumbers4/>
			<cardinalNumbers5/>
			<cardinalNumbers6/>
			<cardinalNumbers7/>
			<cardinalNumbers8/>
			<cardinalNumbers9/>
			<cardinalNumbers10/>
			<cardinalNumbers11>
				<xsl:value-of select="cardinalNumbers11to20"/>
			</cardinalNumbers11>
			<cardinalNumbers12/>
			<cardinalNumbers13/>
			<cardinalNumbers14/>
			<cardinalNumbers15/>
			<cardinalNumbers16/>
			<cardinalNumbers17/>
			<cardinalNumbers18/>
			<cardinalNumbers19/>
			<cardinalNumbers20/>
			<cardinalNumbers30>
				<xsl:value-of select="cardinalNumbers30to100"/>
			</cardinalNumbers30>
			<cardinalNumbers40/>
			<cardinalNumbers50/>
			<cardinalNumbers60/>
			<cardinalNumbers70/>
			<cardinalNumbers80/>
			<cardinalNumbers90/>
			<cardinalNumbers100/>
			<ordinalNumbers1>
				<xsl:value-of select="ordinalNumbers"/>
			</ordinalNumbers1>
			<ordinalNumbers2/>
			<ordinalNumbers3/>
			<ordinalNumbers4/>
			<ordinalNumbers5/>
			<ordinalNumbers6/>
			<ordinalNumbers7/>
			<ordinalNumbers8/>
			<ordinalNumbers9/>
			<ordinalNumbers10/>
			<ordinalAffixExample/>
			<ordinalWordExample/>
			<xsl:copy-of select="ordinalExample"/>
			<ordinalCardinalExample/>
			<nextExample/>
			<lastExample/>
			<nextlastNPExample/>
			<xsl:copy-of select="cardinalCompoundExample"/>
			<partitiveQExample/>
			<partitiveOf/>
			<xsl:copy-of select="*[name()='cardinalNumberCategory' or name()='conjunctionCategory']"/>
		</qp>
	</xsl:template>
	<xsl:template match="@*" mode="qp">
		<xsl:copy-of select="."/>
	</xsl:template>
	<!--
		relcl:  map old attributes to checkboxes and add some new examples
	-->
	<xsl:template match="relcl">
		<relcl>
			<xsl:copy-of select="@*[name()!='compCP' and name()!='relCompEitherRestricted' and name()!='relCompPos' and name()!='relCompSame' and name()!='type']"/>
			<relTypeCPComp>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@compCP='yes'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</relTypeCPComp>
			<relTypeCPWh>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@compCP='yesBoth'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</relTypeCPWh>
			<relTypeCPRel>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@type='CP'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</relTypeCPRel>
			<relTypeIPRel>
				<xsl:attribute name="checked">
					<xsl:choose>
						<xsl:when test="@type='IP'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</relTypeIPRel>
			<relTypeIP checked="no"/>
			<relTypeOther checked="no"/>
			<relWordBefore>
				<xsl:call-template name="DoCheckboxBeforeMapping">
					<xsl:with-param name="attr" select="@relCompPos"/>
				</xsl:call-template>
			</relWordBefore>
			<relWordAfter>
				<xsl:call-template name="DoCheckboxAfterMapping">
					<xsl:with-param name="attr" select="@relCompPos"/>
				</xsl:call-template>
			</relWordAfter>
			<relWordBoth>
				<xsl:call-template name="DoCheckboxBothMapping">
					<xsl:with-param name="attr" select="@relCompPos"/>
				</xsl:call-template>
			</relWordBoth>
			<relWordOther checked="no"/>
			<xsl:copy-of select="example"/>
			<xsl:copy-of select="sentExample"/>
			<relCliticExample/>
			<relWordExample/>
			<relAffixExample/>
			<xsl:copy-of select="headlessExample"/>
		</relcl>
	</xsl:template>
	<!-- 
		DoCheckboxAfterMapping
	-->
	<xsl:template name="DoCheckboxAfterMapping">
		<xsl:param name="attr"/>
		<xsl:attribute name="checked">
			<xsl:choose>
				<xsl:when test="$attr='after' or $attr='either' or $attr='eitherOrBoth' or $attr='afterOrBoth'">yes</xsl:when>
				<xsl:otherwise>no</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>
	<!-- 
		DoCheckboxBeforeMapping
	-->
	<xsl:template name="DoCheckboxBeforeMapping">
		<xsl:param name="attr"/>
		<xsl:attribute name="checked">
			<xsl:choose>
				<xsl:when test="$attr='before' or $attr='either' or $attr='eitherOrBoth' or $attr='beforeOrBoth'">yes</xsl:when>
				<xsl:otherwise>no</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>
	<!-- 
		DoCheckboxBothMapping
	-->
	<xsl:template name="DoCheckboxBothMapping">
		<xsl:param name="attr"/>
		<xsl:attribute name="checked">
			<xsl:choose>
				<xsl:when test="$attr='eitherOrBoth' or $attr='afterOrBoth' or $attr='beforeOrBoth' or $attr='both'">yes</xsl:when>
				<xsl:otherwise>no</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>
</xsl:stylesheet>
