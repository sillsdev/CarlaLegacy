<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to convert PAWS answer file from dbversion 9b to 10
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
	<xsl:template match="/paws[@dbversion='9b']">
		<paws dbversion="10">
			<xsl:apply-templates select="@*[name()!='dbversion']"/>
			<xsl:apply-templates/>
		</paws>
	</xsl:template>
	<!--
		typology:  add examples
	-->
	<xsl:template match="typology">
		<typology>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="typology"/>
		</typology>
	</xsl:template>
	<xsl:template match="*" mode="typology">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="classOtherExample" mode="typology">
		<xsl:copy-of select="."/>
		<classifierHumanExample/>
		<classifierAnimalExample/>
		<classifierBirdExample/>
		<classifierBoatExample/>
		<classifierClothingExample/>
		<classifierTreeExample/>
		<classifierLongThinExample/>
		<classifierLongWavyExample/>
		<classifierFlatExample/>
		<classifierCylindricalExample/>
		<classifierMechanicalExample/>
		<classifierGenericExample/>
		<classifierOtherExample/>
	</xsl:template>
	<xsl:template match="classifierAgrExample" mode="typology">
		<xsl:copy-of select="."/>
		<classifierSpecificExample/>
	</xsl:template>
	<!--
		qp:  add checkbox and examples
	-->
	<xsl:template match="qp">
		<qp>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="qp"/>
		</qp>
	</xsl:template>
	<xsl:template match="*" mode="qp">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="ordinalNumOther" mode="qp">
		<xsl:copy-of select="."/>
		<ordinalNumNowhere checked="no"/>
	</xsl:template>
	<xsl:template match="cardinalNumbers100" mode="qp">
		<xsl:copy-of select="."/>
		<cardinalExample/>
	</xsl:template>
	<xsl:template match="partitiveQExample" mode="qp">
		<xsl:copy-of select="."/>
		<partitiveConstruction/>
	</xsl:template>
	<!--
		advp:  add checkboxes
	-->
	<xsl:template match="advp">
		<advp>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="advp"/>
		</advp>
	</xsl:template>
	<xsl:template match="*" mode="advp">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="temporalIndefQOther" mode="advp">
		<xsl:copy-of select="."/>
		<temporalIndefTypeQNone checked="no"/>
	</xsl:template>
	<xsl:template match="temporalIndefIntOther" mode="advp">
		<xsl:copy-of select="."/>
		<temporalIndefTypeIntNone checked="no"/>
	</xsl:template>
	<xsl:template match="locativeIndefQOther" mode="advp">
		<xsl:copy-of select="."/>
		<locativeIndefTypeQNone checked="no"/>
	</xsl:template>
	<xsl:template match="locativeIndefIntOther" mode="advp">
		<xsl:copy-of select="."/>
		<locativeIndefTypeIntNone checked="no"/>
	</xsl:template>
	<!--
		np:  add attributes, example and checkboxes
	-->
	<xsl:template match="np">
		<np>
			<xsl:copy-of select="@*[name()!='agreeOther' and name()!='casewordPos']"/>
			<xsl:attribute name="classifierPresent">no</xsl:attribute>
			<xsl:attribute name="classifierPresentDem">no</xsl:attribute>
			<xsl:attribute name="classifierPresentDemBoth">no</xsl:attribute>
			<xsl:attribute name="classifierPresentQ">no</xsl:attribute>
			<xsl:attribute name="classifierPresentAdj">no</xsl:attribute>
			<classifierSpecificPosBeforeBoth checked="no"/>
			<classifierSpecificPosAfterBoth checked="no"/>
			<classifierSpecificPosAfterQBeforeN checked="no"/>
			<classifierSpecificPosAfterNBeforeQ checked="no"/>
			<classifierSpecificPosPrefixQ checked="no"/>
			<classifierSpecificPosSuffixQ checked="no"/>
			<classifierSpecificPosOther checked="no"/>
			<xsl:apply-templates mode="np"/>
		</np>
	</xsl:template>
	<xsl:template match="*" mode="np">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="agreeClass" mode="np">
		<xsl:copy-of select="."/>
		<agreeClassifier checked="no"/>
	</xsl:template>
	<xsl:template match="agreeOtherFeat" mode="np">
		<xsl:copy-of select="."/>
		<agreeOtherNone>
			<xsl:attribute name="checked">
				<xsl:choose>
					<xsl:when test="../@agreeOther='no'">
						<xsl:text>yes</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>no</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</agreeOtherNone>
	</xsl:template>
	<xsl:template match="demAndArtArtOther" mode="np">
		<xsl:copy-of select="."/>
		<classifierSpecificDemPosBeforeBoth checked="no"/>
		<classifierSpecificDemPosAfterBoth checked="no"/>
		<classifierSpecificDemPosAfterDemBeforeN checked="no"/>
		<classifierSpecificDemPosAfterNBeforeDem checked="no"/>
		<classifierSpecificDemPosPrefixDem checked="no"/>
		<classifierSpecificDemPosSuffixDem checked="no"/>
		<classifierSpecificDemPosOther checked="no"/>
		<classifierSpecificDemBothPosBeforeBoth checked="no"/>
		<classifierSpecificDemBothPosAfterBoth checked="no"/>
		<classifierSpecificDemBothPosAfterDemBeforeN checked="no"/>
		<classifierSpecificDemBothPosAfterNBeforeDem checked="no"/>
		<classifierSpecificDemBothPosPrefixDem checked="no"/>
		<classifierSpecificDemBothPosSuffixDem checked="no"/>
		<classifierSpecificDemBothPosOther checked="no"/>
	</xsl:template>
	<xsl:template match="qpPosOther" mode="np">
		<xsl:copy-of select="."/>
		<classifierSpecificQPosBeforeBoth checked="no"/>
		<classifierSpecificQPosAfterBoth checked="no"/>
		<classifierSpecificQPosAfterQBeforeN checked="no"/>
		<classifierSpecificQPosAfterNBeforeQ checked="no"/>
		<classifierSpecificQPosPrefixQ checked="no"/>
		<classifierSpecificQPosSuffixQ checked="no"/>
		<classifierSpecificQPosOther checked="no"/>
	</xsl:template>
	<xsl:template match="adjPosOther" mode="np">
		<xsl:copy-of select="."/>
		<classifierSpecificAdjPosBeforeBoth checked="no"/>
		<classifierSpecificAdjPosAfterBoth checked="no"/>
		<classifierSpecificAdjPosAfterAdjBeforeN checked="no"/>
		<classifierSpecificAdjPosAfterNBeforeAdj checked="no"/>
		<classifierSpecificAdjPosPrefixAdj checked="no"/>
		<classifierSpecificAdjPosSuffixAdj checked="no"/>
		<classifierSpecificAdjPosOther checked="no"/>
	</xsl:template>
	<xsl:template match="agreeClassExample" mode="np">
		<xsl:copy-of select="."/>
		<agreeClassifierExample/>
	</xsl:template>
	<xsl:template match="demOrArtPosOther[preceding-sibling::demOrArtPosOther]" mode="np"/>
	<!--
		prop:  add attribute
	-->
	<xsl:template match="prop">
		<prop>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="pnDeterminer">none</xsl:attribute>
			<xsl:apply-templates mode="prop"/>
		</prop>
	</xsl:template>
	<xsl:template match="*" mode="prop">
		<xsl:copy-of select="."/>
	</xsl:template>
	<!--
		pron:  add attributes example and checkboxes
	-->
	<xsl:template match="pron">
		<pron>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="classifierNoN">no</xsl:attribute>
			<xsl:apply-templates mode="pron"/>
		</pron>
	</xsl:template>
	<xsl:template match="*" mode="pron">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="indefQOther" mode="pron">
		<xsl:copy-of select="."/>
		<pronIndefTypeQNone checked="no"/>
	</xsl:template>
	<xsl:template match="indefIntOther" mode="pron">
		<xsl:copy-of select="."/>
		<pronIndefTypeIntNone checked="no"/>
	</xsl:template>
	<xsl:template match="partitiveExample" mode="pron">
		<xsl:copy-of select="."/>
		<classifierNoNExample/>
	</xsl:template>
	<!--
		ip:  add attribute example and features
	-->
	<xsl:template match="ip">
		<ip>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="applicative">no</xsl:attribute>
			<xsl:apply-templates mode="ip"/>
		</ip>
	</xsl:template>
	<xsl:template match="*" mode="ip">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="nonFutureTense" mode="ip">
		<xsl:copy-of select="."/>
		<otherTense/>
	</xsl:template>
	<xsl:template match="progressiveAspect" mode="ip">
		<xsl:copy-of select="."/>
		<purposiveAspect/>
	</xsl:template>
	<xsl:template match="unrealAspect" mode="ip">
		<xsl:copy-of select="."/>
		<otherAspect/>
	</xsl:template>
	<xsl:template match="irrealisMood" mode="ip">
		<xsl:copy-of select="."/>
		<otherMood/>
		<witnessEvident/>
		<nonwitnessEvident/>
		<firsthandEvident/>
		<secondhandEvident/>
		<thirdhandEvident/>
		<visualEvident/>
		<auditoryEvident/>
		<olfactoryEvident/>
		<inferentialEvident/>
		<reportativeEvident/>
		<hearsayEvident/>
		<quotativeEvident/>
		<assumedEvident/>
		<otherEvident/>
	</xsl:template>
	<xsl:template match="antipassiveVoice" mode="ip">
		<xsl:copy-of select="."/>
		<applicativeVoice/>
	</xsl:template>
	<xsl:template match="objectVoice" mode="ip">
		<xsl:copy-of select="."/>
		<otherVoice/>
	</xsl:template>
	<xsl:template match="causativeOtherExample" mode="ip">
		<xsl:copy-of select="."/>
		<applicativeExample/>
	</xsl:template>
	<xsl:template match="ipInflFeatNonFuture" mode="ip">
		<xsl:copy-of select="."/>
		<ipInflFeatOtherTense checked="no"/>
	</xsl:template>
	<xsl:template match="ipInflFeatProgressive" mode="ip">
		<xsl:copy-of select="."/>
		<ipInflFeatPurposive checked="no"/>
	</xsl:template>
	<xsl:template match="ipInflFeatUnreal" mode="ip">
		<xsl:copy-of select="."/>
		<ipInflFeatOtherAspect checked="no"/>
	</xsl:template>
	<xsl:template match="ipInflFeatIrrealis" mode="ip">
		<xsl:copy-of select="."/>
		<ipInflFeatOtherMood checked="no"/>
	</xsl:template>
	<xsl:template match="ipInflFeatAntipassive" mode="ip">
		<xsl:copy-of select="."/>
		<ipInflFeatApplicative checked="no"/>
	</xsl:template>
	<xsl:template match="ipInflFeatParticiple" mode="ip">
		<xsl:copy-of select="."/>
		<ipInflFeatWitness checked="no"/>
		<ipInflFeatNonwitness checked="no"/>
		<ipInflFeatFirsthand checked="no"/>
		<ipInflFeatSecondhand checked="no"/>
		<ipInflFeatThirdhand checked="no"/>
		<ipInflFeatVisual checked="no"/>
		<ipInflFeatAuditory checked="no"/>
		<ipInflFeatOlfactory checked="no"/>
		<ipInflFeatInferential checked="no"/>
		<ipInflFeatReportative checked="no"/>
		<ipInflFeatHearsay checked="no"/>
		<ipInflFeatQuotative checked="no"/>
		<ipInflFeatAssumed checked="no"/>
		<ipInflFeatOtherEvident checked="no"/>
	</xsl:template>
	<xsl:template match="ipInflFeatObjectVoice" mode="ip">
		<xsl:copy-of select="."/>
		<ipInflFeatOtherVoice checked="no"/>
	</xsl:template>
	<!--
		coord:  add examples
	-->
	<xsl:template match="coord">
		<coord>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="coord"/>
		</coord>
	</xsl:template>
	<xsl:template match="*" mode="coord">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="and" mode="coord">
		<xsl:copy-of select="."/>
		<andThen/>
	</xsl:template>
	<xsl:template match="sentExample" mode="coord">
		<xsl:copy-of select="."/>
		<sentSeqExample/>
	</xsl:template>
</xsl:stylesheet>
