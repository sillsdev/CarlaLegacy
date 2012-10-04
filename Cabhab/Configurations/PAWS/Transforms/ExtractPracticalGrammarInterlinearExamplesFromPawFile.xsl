<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="text" encoding="UTF-8"/>

	<xsl:template match="/">
		<xsl:text>\id Extracted interlinear examples from PAWS practical grammar
</xsl:text>
		<xsl:apply-templates mode="typology"/>
		<xsl:apply-templates mode="n"/>
		<xsl:apply-templates mode="prop"/>
		<xsl:apply-templates mode="pron"/>
		<xsl:apply-templates mode="adjp"/>
		<xsl:apply-templates mode="np"/>
		<xsl:apply-templates mode="v"/>
		<xsl:apply-templates mode="advp"/>
		<xsl:apply-templates mode="pp"/>
		<xsl:apply-templates mode="excl"/>
		<xsl:apply-templates mode="ip"/>
		<xsl:apply-templates mode="focus"/>
		<xsl:apply-templates mode="ques"/>
		<xsl:apply-templates mode="neg"/>
		<xsl:apply-templates mode="coord"/>
		<xsl:apply-templates mode="comp"/>
		<xsl:apply-templates mode="advcl"/>
		<xsl:apply-templates mode="relcl"/>
	</xsl:template>

	<xsl:template match="*" mode="typology">
		<xsl:text>
\g intro and typology</xsl:text>
		<xsl:apply-templates select="typology/example" mode="interlinear"/>
		<xsl:apply-templates select="typology/classifierTypeExample" mode="interlinear"/>
		<xsl:apply-templates select="typology/classifierAgrExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="n">
		<xsl:text>

\g noun</xsl:text>
		<xsl:apply-templates select="np/agreeNumberExample" mode="interlinear"/>
		<xsl:apply-templates select="np/agreeAnimacyExample" mode="interlinear"/>
		<xsl:apply-templates select="np/agreeClassExample" mode="interlinear"/>
		<xsl:apply-templates select="np/agreeGenderExample" mode="interlinear"/>
		<xsl:apply-templates select="typology/example" mode="interlinear"/>
		<xsl:apply-templates select="typology/pnExample" mode="interlinear"/>
		<xsl:apply-templates select="typology/intExample" mode="interlinear"/>
		<xsl:apply-templates select="typology/intPnExample" mode="interlinear"/>
		<xsl:apply-templates select="typology/experiencerExample" mode="interlinear"/>
		<xsl:apply-templates select="typology/experiencerPnExample" mode="interlinear"/>
		<xsl:apply-templates select="np/compExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="prop">
		<xsl:text>

\g prop</xsl:text>
		<xsl:apply-templates select="prop/example" mode="interlinear"/>
		<xsl:apply-templates select="prop/ppExample" mode="interlinear"/>
		<xsl:apply-templates select="prop/relClExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="pron">
		<xsl:text>

\g pron</xsl:text>
		<xsl:apply-templates select="pron/reflSentExample" mode="interlinear"/>
		<xsl:apply-templates select="pron/recipSentExample" mode="interlinear"/>
		<xsl:apply-templates select="pron/indefNPExample" mode="interlinear"/>
		<xsl:apply-templates select="pron/negIndefNPExample" mode="interlinear"/>
		<xsl:apply-templates select="pron/standAloneNPExample" mode="interlinear"/>
		<xsl:apply-templates select="pron/sentExample" mode="interlinear"/>
		<xsl:apply-templates select="pron/sentExample" mode="interlinear"/>
		<xsl:apply-templates select="pron/pronRelClExample" mode="interlinear"/>
		<xsl:apply-templates select="pron/partitiveExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="adjp">
		<xsl:text>

\g adjp</xsl:text>
		<xsl:apply-templates select="adjp/adjectivePhraseExample" mode="interlinear"/>
		<xsl:apply-templates select="adjp/adjectivePhraseExample" mode="interlinear"/>
		<xsl:apply-templates select="qp/cardinalCompoundExample" mode="interlinear"/>
		<xsl:apply-templates select="qp/ordinalExample" mode="interlinear"/>
		<xsl:apply-templates select="qp/example" mode="interlinear"/>
		<xsl:apply-templates select="qp/negExample" mode="interlinear"/>
		<xsl:apply-templates select="qp/negCooccurExample" mode="interlinear"/>
		<xsl:apply-templates select="qp/determinerNPExample" mode="interlinear"/>
		<xsl:apply-templates select="qp/determinerNegNPExample" mode="interlinear"/>
		<xsl:apply-templates select="qp/degreeExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="np">
		<xsl:text>

\g np</xsl:text>
		<xsl:apply-templates select="np/example" mode="interlinear"/>
		<xsl:apply-templates select="np/embeddedExample" mode="interlinear"/>
		<xsl:apply-templates select="np/ppExample" mode="interlinear"/>
		<xsl:apply-templates select="np/relClExample" mode="interlinear"/>
		<xsl:apply-templates select="np/qpExample" mode="interlinear"/>
		<xsl:apply-templates select="np/adjpExample" mode="interlinear"/>
		<xsl:apply-templates select="np/compPPExample" mode="interlinear"/>
		<xsl:apply-templates select="np/partExample" mode="interlinear"/>
		<xsl:apply-templates select="np/partHeadExample" mode="interlinear"/>
		<xsl:apply-templates select="np/partHeadSentExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="v">
		<xsl:text>

\g v</xsl:text>
		<xsl:apply-templates select="ip/impExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/impExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/proDropExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/cliticPnExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/auxExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/auxNonfiniteExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/auxOtherExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="advp">
		<xsl:text>

\g advp</xsl:text>
		<xsl:apply-templates select="advp/temporalPhraseExample" mode="interlinear"/>
		<xsl:apply-templates select="advp/negTemporalAdverbWordsExample" mode="interlinear"/>
		<xsl:apply-templates select="advp/negLocativeExample" mode="interlinear"/>
		<xsl:apply-templates select="advp/mannerDegreePhraseExample" mode="interlinear"/>
		<xsl:apply-templates select="advp/reasonSentExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="pp">
		<xsl:text>

\g pp</xsl:text>
		<xsl:apply-templates select="pp/example" mode="interlinear"/>
		<xsl:apply-templates select="pp/ppExample" mode="interlinear"/>
		<xsl:apply-templates select="pp/aloneExample" mode="interlinear"/>
		<xsl:apply-templates select="pp/locExample" mode="interlinear"/>
		<xsl:apply-templates select="pp/compPPExample" mode="interlinear"/>
		<xsl:apply-templates select="pp/tempExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="excl">
		<xsl:text>

\g excl</xsl:text>
		<xsl:apply-templates select="excl/greetExample" mode="interlinear"/>
		<xsl:apply-templates select="excl/intjExample" mode="interlinear"/>
		<xsl:apply-templates select="excl/exclExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="ip">
		<xsl:text>

\g ip</xsl:text>
		<xsl:apply-templates select="ip/copularExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/perceptionExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/sameExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/asExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/comparativeExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/superlativeExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/existExample" mode="interlinear"/>
		<xsl:apply-templates select="typology/intExample" mode="interlinear"/>
		<xsl:apply-templates select="typology/pnIntExample" mode="interlinear"/>
		<xsl:apply-templates select="typology/experiencerIntExample" mode="interlinear"/>
		<xsl:apply-templates select="typology/experiencerPnIntExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/motionExample" mode="interlinear"/>
		<xsl:apply-templates select="typology/example" mode="interlinear"/>
		<xsl:apply-templates select="typology/pnExample" mode="interlinear"/>
		<xsl:apply-templates select="typology/experiencerExample" mode="interlinear"/>
		<xsl:apply-templates select="typology/pnExperiencerExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/diExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/passiveExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/antipassiveExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/voiceExample" mode="interlinear"/>
		<xsl:apply-templates select="ip/causativeExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="focus">
		<xsl:text>

\g focus</xsl:text>
		<xsl:apply-templates select="focus/topicExample" mode="interlinear"/>
		<xsl:apply-templates select="focus/focusExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="ques">
		<xsl:text>

\g ques</xsl:text>
		<xsl:apply-templates select="q/example" mode="interlinear"/>
		<xsl:apply-templates select="q/embYNExample" mode="interlinear"/>
		<xsl:apply-templates select="q/contentExample" mode="interlinear"/>
		<xsl:apply-templates select="q/embContentExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="neg">
		<xsl:text>

\g neg</xsl:text>
		<xsl:apply-templates select="neg/auxExample" mode="interlinear"/>
		<xsl:apply-templates select="neg/auxAffixExample" mode="interlinear"/>
		<xsl:apply-templates select="neg/verbAffixExample" mode="interlinear"/>
		<xsl:apply-templates select="advp/negTemporalAdverbWordsExample" mode="interlinear"/>
		<xsl:apply-templates select="advp/negTemporalExample" mode="interlinear"/>
		<xsl:apply-templates select="neg/advTemporalExample" mode="interlinear"/>
		<xsl:apply-templates select="advp/negLocativeAdverbWordsExample" mode="interlinear"/>
		<xsl:apply-templates select="advp/negLocativeExample" mode="interlinear"/>
		<xsl:apply-templates select="neg/advLocativeExample" mode="interlinear"/>
		<xsl:apply-templates select="qp/negExample" mode="interlinear"/>
		<xsl:apply-templates select="qp/negCooccurExample" mode="interlinear"/>
		<xsl:apply-templates select="neg/degreeSubjExample" mode="interlinear"/>
		<xsl:apply-templates select="qp/determinerNegNPExample" mode="interlinear"/>
		<xsl:apply-templates select="neg/determinerSubjExample" mode="interlinear"/>
		<xsl:apply-templates select="pron/negIndefNPExample" mode="interlinear"/>
		<xsl:apply-templates select="neg/pronounSubjExample" mode="interlinear"/>
		<xsl:apply-templates select="neg/objectExample" mode="interlinear"/>
		<xsl:apply-templates select="neg/indirectObjectExample" mode="interlinear"/>
		<xsl:apply-templates select="neg/subjectObjectExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="coord">
		<xsl:text>

\g coord</xsl:text>
		<xsl:apply-templates select="coord/sentExample" mode="interlinear"/>
		<xsl:apply-templates select="coord/vpExample" mode="interlinear"/>
		<xsl:apply-templates select="coord/dpExample" mode="interlinear"/>
		<xsl:apply-templates select="coord/coordppExample" mode="interlinear"/>
		<xsl:apply-templates select="coord/adjExample" mode="interlinear"/>
		<xsl:apply-templates select="coord/listExample" mode="interlinear"/>
		<xsl:apply-templates select="coord/appositiveExample" mode="interlinear"/>
		<xsl:apply-templates select="coord/comparativeSentExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="comp">
		<xsl:text>

\g comp</xsl:text>
		<xsl:apply-templates select="comp/finiteExample" mode="interlinear"/>
		<xsl:apply-templates select="comp/finiteOrNonfiniteExample" mode="interlinear"/>
		<xsl:apply-templates select="comp/nonfiniteExample" mode="interlinear"/>
		<xsl:apply-templates select="comp/nonfiniteProDropExample" mode="interlinear"/>
		<xsl:apply-templates select="comp/nonfiniteCPOrProDropExample" mode="interlinear"/>
		<xsl:apply-templates select="comp/DPCPExample" mode="interlinear"/>
		<xsl:apply-templates select="comp/raisingExample" mode="interlinear"/>
		<xsl:apply-templates select="comp/causeExample" mode="interlinear"/>
		<xsl:apply-templates select="comp/quotationExample" mode="interlinear"/>
		<xsl:apply-templates select="comp/otherExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="advcl">
		<xsl:text>

\g advcl</xsl:text>
		<xsl:apply-templates select="advcl/tempSentExample" mode="interlinear"/>
		<xsl:apply-templates select="advp/reasonExample" mode="interlinear"/>
	</xsl:template>

	<xsl:template match="*" mode="relcl">
		<xsl:text>

\g relcl</xsl:text>
		<xsl:apply-templates select="relcl/example" mode="interlinear"/>
		<xsl:apply-templates select="relcl/sentExample" mode="interlinear"/>
		<xsl:apply-templates select="relcl/headlessExample" mode="interlinear"/>
	</xsl:template>
	<xsl:include href="ExtractInterlinearExamplesFromPawFileCommon.xsl"/>
</xsl:stylesheet>
