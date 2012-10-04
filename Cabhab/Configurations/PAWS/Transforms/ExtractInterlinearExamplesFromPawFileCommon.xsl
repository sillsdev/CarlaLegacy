<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<!-- ignore these -->
	<xsl:template match="leftOffAt | language"/>

	<!-- ignore the non-interlinear examples -->
	<xsl:template match="*" mode="interlinear"/>
	<xsl:template match="text()" mode="interlinear"/>

	<!-- process all the interlinears -->
	<xsl:template match="adjp/adjectivePhraseExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="advcl/tempSentExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="advp/locativePhraseExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="advp/mannerDegreePhraseExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="advp/negLocativeAdverbWordsExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="advp/negLocativeExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="advp/negTemporalAdverbWordsExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="advp/negTemporalExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="advp/reasonExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="advp/reasonSentExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="advp/temporalPhraseExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="comp/DPCPExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="comp/causeExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="comp/finiteExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="comp/finiteOrNonfiniteExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="comp/nonfiniteCPOrProDropExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="comp/nonfiniteExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="comp/nonfiniteProDropExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="comp/otherExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="comp/quotationExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="comp/raisingExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="coord/adjExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="coord/appositiveExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="coord/comparativeSentExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="coord/coordppExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="coord/dpExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="coord/listExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="coord/sentExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="coord/vpExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="excl/exclExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="excl/greetExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="excl/intjExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="focus/focusExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="focus/topicExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/antipassiveExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/asExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/auxExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/auxNonfiniteExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/auxOtherExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/causativeExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/cliticPnExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/comparativeExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/copularExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/diExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/existExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/impExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/motionExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/passiveExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/perceptionExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/proDropExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/sameExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/superlativeExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="ip/voiceExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="neg/advLocativeExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="neg/advTemporalExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="neg/auxAffixExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="neg/auxExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="neg/degreeSubjExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="neg/determinerSubjExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="neg/indirectObjectExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="neg/objectExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="neg/pronounSubjExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="neg/subjectObjectExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="neg/verbAffixExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/adjpExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/agreeAnimacyExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/agreeClassExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/agreeGenderExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/agreeNumberExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/compExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/compPPExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/embeddedExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/example" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/partExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/partHeadExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/partHeadSentExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/ppExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/qpExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="np/relClExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="pp/aloneExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="pp/compPPExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="pp/example" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="pp/locExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="pp/ppExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="pp/tempExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="pron/indefNPExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="pron/negIndefNPExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="pron/partitiveExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="pron/pronRelClExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="pron/recipSentExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="pron/reflSentExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="pron/sentExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="pron/standAloneNPExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="prop/example" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="prop/ppExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="prop/relClExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="q/contentExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="q/embContentExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="q/embYNExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="q/example" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="qp/cardinalCompoundExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="qp/degreeExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="qp/determinerNPExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="qp/determinerNegNPExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="qp/example" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="qp/negCooccurExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="qp/negExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="qp/ordinalExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="relcl/example" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="relcl/headlessExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="relcl/sentExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="typology/classifierAgrExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="typology/classifierTypeExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="typology/example" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="typology/experiencerExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="typology/experiencerIntExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="typology/experiencerPnExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="typology/experiencerPnIntExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="typology/intExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="typology/intPnExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="typology/pnExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="typology/pnExperiencerExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<xsl:template match="typology/pnIntExample" mode="interlinear">
		<xsl:call-template name="OutputInterlinearContent"/>
	</xsl:template>
	<!--
	OutputInterlinearContent
-->
	<xsl:template name="OutputInterlinearContent">
		<xsl:if test="string-length(normalize-space(.)) &gt; 0">
			<xsl:text>
\p
\t </xsl:text>
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>