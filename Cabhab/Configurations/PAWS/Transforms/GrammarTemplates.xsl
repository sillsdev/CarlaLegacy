<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="templates">
	<xsl:text>
Let absolutive		be	&lt;head case&gt; = absolutive
Let absolutive_prefix   be      &lt;head type prefix absolutive&gt;   = +
								[absolutive]
Let absolutive_suffix   be      &lt;head type suffix absolutive&gt;   = +
								[absolutive]
Let -absolutive		be	[]
Let accusative		be	&lt;head case&gt; = accusative
Let -accusative		be	[]
Let accusative.or.genitive be   &lt;head case&gt; = {accusative genitive}
Let AdjP-final		be	&lt;head type AdjP-final&gt;		= +
				&lt;head type AdjP-initial&gt;	= -
Let AdjP-initial	be	&lt;head type AdjP-initial&gt;	= +
				&lt;head type AdjP-final&gt;		= -
Let AdvP-final		be	&lt;head type AdvP-final&gt;		= +
				&lt;head type AdvP-initial&gt;	= -
Let AdvP-initial	be	&lt;head type AdvP-initial&gt;	= +
				&lt;head type AdvP-final&gt;		= -
Let animate		be	&lt;head agr animate&gt;		= +
Let animate_absolutive	be	{ [head:[object:[head:[agr:[animate:+]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[animate:+]]]
															type:[transitive:-]]] }
Let animate_ergative	be	&lt;head subject head agr animate&gt; = +
											   &lt;head type transitive&gt; = +
Let animate_object	be	&lt;head object head agr animate&gt; = +
Let animate_subject	be	&lt;head subject head agr animate&gt; = +
Let -animate		be	&lt;head agr animate&gt;		= -
Let -animate_absolutive	be	{ [head:[object:[head:[agr:[animate:-]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[animate:-]]]
															type:[transitive:-]]] }
Let -animate_ergative	be	&lt;head subject head agr animate&gt; = -
											   &lt;head type transitive&gt; = +
Let -animate_object	be	&lt;head object head agr animate&gt;	= -
Let -animate_subject	be	&lt;head subject head agr animate&gt; = -
Let class_1		be	&lt;head agr class&gt;		= 1
Let class_2		be	&lt;head agr class&gt;		= 2
Let class_3		be	&lt;head agr class&gt;		= 3
Let class_4		be	&lt;head agr class&gt;		= 4
Let class_5		be	&lt;head agr class&gt;		= 5
Let class_6		be	&lt;head agr class&gt;		= 6
Let class_7		be	&lt;head agr class&gt;		= 7
Let class_8		be	&lt;head agr class&gt;		= 8
Let class_9		be	&lt;head agr class&gt;		= 9
Let class_10		be	&lt;head agr class&gt;		= 10
Let class_11		be	&lt;head agr class&gt;		= 11
Let class_12		be	&lt;head agr class&gt;		= 12
Let class_13		be	&lt;head agr class&gt;		= 13
Let class_14		be	&lt;head agr class&gt;		= 14
Let class_15		be	&lt;head agr class&gt;		= 15
Let class_16		be	&lt;head agr class&gt;		= 16
Let class_17		be	&lt;head agr class&gt;		= 17
Let class_18		be	&lt;head agr class&gt;		= 18
Let class_19		be	&lt;head agr class&gt;		= 19
Let class_20		be	&lt;head agr class&gt;		= 20
Let class_21		be	&lt;head agr class&gt;		= 21
Let class_22		be	&lt;head agr class&gt;		= 22
Let class_23		be	&lt;head agr class&gt;		= 23
Let class_24		be	&lt;head agr class&gt;		= 24
Let class_25		be	&lt;head agr class&gt;		= 25
Let class_26		be	&lt;head agr class&gt;		= 26
Let class_27		be	&lt;head agr class&gt;		= 27
Let class_28		be	&lt;head agr class&gt;		= 28
Let class_29		be	&lt;head agr class&gt;		= 29
Let class_30		be	&lt;head agr class&gt;		= 30
Let class_1_absolutive	be	{ [head:[object:[head:[agr:[class:1]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:1]]]
															type:[transitive:-]]] }
Let class_2_absolutive	be	{ [head:[object:[head:[agr:[class:2]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:2]]]
															type:[transitive:-]]] }
Let class_3_absolutive	be	{ [head:[object:[head:[agr:[class:3]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:3]]]
															type:[transitive:-]]] }
Let class_4_absolutive	be	{ [head:[object:[head:[agr:[class:4]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:4]]]
															type:[transitive:-]]] }
Let class_5_absolutive	be	{ [head:[object:[head:[agr:[class:5]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:5]]]
															type:[transitive:-]]] }
Let class_6_absolutive	be	{ [head:[object:[head:[agr:[class:6]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:6]]]
															type:[transitive:-]]] }
Let class_7_absolutive	be	{ [head:[object:[head:[agr:[class:7]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:7]]]
															type:[transitive:-]]] }
Let class_8_absolutive	be	{ [head:[object:[head:[agr:[class:8]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:8]]]
															type:[transitive:-]]] }
Let class_9_absolutive	be	{ [head:[object:[head:[agr:[class:9]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:9]]]
															type:[transitive:-]]] }
Let class_10_absolutive	be	{ [head:[object:[head:[agr:[class:10]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:10]]]
															type:[transitive:-]]] }
Let class_11_absolutive	be	{ [head:[object:[head:[agr:[class:11]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:11]]]
															type:[transitive:-]]] }
Let class_12_absolutive	be	{ [head:[object:[head:[agr:[class:12]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:12]]]
															type:[transitive:-]]] }
Let class_13_absolutive	be	{ [head:[object:[head:[agr:[class:13]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:13]]]
															type:[transitive:-]]] }
Let class_14_absolutive	be	{ [head:[object:[head:[agr:[class:14]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:14]]]
															type:[transitive:-]]] }
Let class_15_absolutive	be	{ [head:[object:[head:[agr:[class:15]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:15]]]
															type:[transitive:-]]] }
Let class_16_absolutive	be	{ [head:[object:[head:[agr:[class:16]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:16]]]
															type:[transitive:-]]] }
Let class_17_absolutive	be	{ [head:[object:[head:[agr:[class:17]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:17]]]
															type:[transitive:-]]] }
Let class_18_absolutive	be	{ [head:[object:[head:[agr:[class:18]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:18]]]
															type:[transitive:-]]] }
Let class_19_absolutive	be	{ [head:[object:[head:[agr:[class:19]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:19]]]
															type:[transitive:-]]] }
Let class_20_absolutive	be	{ [head:[object:[head:[agr:[class:20]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:20]]]
															type:[transitive:-]]] }
Let class_21_absolutive	be	{ [head:[object:[head:[agr:[class:21]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:21]]]
															type:[transitive:-]]] }
Let class_22_absolutive	be	{ [head:[object:[head:[agr:[class:22]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:22]]]
															type:[transitive:-]]] }
Let class_23_absolutive	be	{ [head:[object:[head:[agr:[class:23]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:23]]]
															type:[transitive:-]]] }
Let class_24_absolutive	be	{ [head:[object:[head:[agr:[class:24]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:24]]]
															type:[transitive:-]]] }
Let class_25_absolutive	be	{ [head:[object:[head:[agr:[class:25]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:25]]]
															type:[transitive:-]]] }
Let class_26_absolutive	be	{ [head:[object:[head:[agr:[class:26]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:26]]]
															type:[transitive:-]]] }
Let class_27_absolutive	be	{ [head:[object:[head:[agr:[class:27]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:27]]]
															type:[transitive:-]]] }
Let class_28_absolutive	be	{ [head:[object:[head:[agr:[class:28]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:28]]]
															type:[transitive:-]]] }
Let class_29_absolutive	be	{ [head:[object:[head:[agr:[class:29]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:29]]]
															type:[transitive:-]]] }
Let class_30_absolutive	be	{ [head:[object:[head:[agr:[class:30]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[class:30]]]
															type:[transitive:-]]] }
Let class_1_ergative	be	&lt;head subject head agr class&gt; = 1
											   &lt;head type transitive&gt; = +
Let class_2_ergative	be	&lt;head subject head agr class&gt; = 2
											   &lt;head type transitive&gt; = +
Let class_3_ergative	be	&lt;head subject head agr class&gt; = 3
											   &lt;head type transitive&gt; = +
Let class_4_ergative	be	&lt;head subject head agr class&gt; = 4
											   &lt;head type transitive&gt; = +
Let class_5_ergative	be	&lt;head subject head agr class&gt; = 5
											   &lt;head type transitive&gt; = +
Let class_6_ergative	be	&lt;head subject head agr class&gt; = 6
											   &lt;head type transitive&gt; = +
Let class_7_ergative	be	&lt;head subject head agr class&gt; = 7
											   &lt;head type transitive&gt; = +
Let class_8_ergative	be	&lt;head subject head agr class&gt; = 8
											   &lt;head type transitive&gt; = +
Let class_9_ergative	be	&lt;head subject head agr class&gt; = 9
											   &lt;head type transitive&gt; = +
Let class_10_ergative	be	&lt;head subject head agr class&gt; = 10
											   &lt;head type transitive&gt; = +
Let class_11_ergative	be	&lt;head subject head agr class&gt; = 11
											   &lt;head type transitive&gt; = +
Let class_12_ergative	be	&lt;head subject head agr class&gt; = 12
											   &lt;head type transitive&gt; = +
Let class_13_ergative	be	&lt;head subject head agr class&gt; = 13
											   &lt;head type transitive&gt; = +
Let class_14_ergative	be	&lt;head subject head agr class&gt; = 14
											   &lt;head type transitive&gt; = +
Let class_15_ergative	be	&lt;head subject head agr class&gt; = 15
											   &lt;head type transitive&gt; = +
Let class_16_ergative	be	&lt;head subject head agr class&gt; = 16
											   &lt;head type transitive&gt; = +
Let class_17_ergative	be	&lt;head subject head agr class&gt; = 17
											   &lt;head type transitive&gt; = +
Let class_18_ergative	be	&lt;head subject head agr class&gt; = 18
											   &lt;head type transitive&gt; = +
Let class_19_ergative	be	&lt;head subject head agr class&gt; = 19
											   &lt;head type transitive&gt; = +
Let class_20_ergative	be	&lt;head subject head agr class&gt; = 20
											   &lt;head type transitive&gt; = +
Let class_21_ergative	be	&lt;head subject head agr class&gt; = 21
											   &lt;head type transitive&gt; = +
Let class_22_ergative	be	&lt;head subject head agr class&gt; = 22
											   &lt;head type transitive&gt; = +
Let class_23_ergative	be	&lt;head subject head agr class&gt; = 23
											   &lt;head type transitive&gt; = +
Let class_24_ergative	be	&lt;head subject head agr class&gt; = 24
											   &lt;head type transitive&gt; = +
Let class_25_ergative	be	&lt;head subject head agr class&gt; = 25
											   &lt;head type transitive&gt; = +
Let class_26_ergative	be	&lt;head subject head agr class&gt; = 26
											   &lt;head type transitive&gt; = +
Let class_27_ergative	be	&lt;head subject head agr class&gt; = 27
											   &lt;head type transitive&gt; = +
Let class_28_ergative	be	&lt;head subject head agr class&gt; = 28
											   &lt;head type transitive&gt; = +
Let class_29_ergative	be	&lt;head subject head agr class&gt; = 29
											   &lt;head type transitive&gt; = +
Let class_30_ergative	be	&lt;head subject head agr class&gt; = 30
											   &lt;head type transitive&gt; = +
Let class_1_object	be	&lt;head object head agr class&gt;	= 1
Let class_2_object	be	&lt;head object head agr class&gt;	= 2
Let class_3_object	be	&lt;head object head agr class&gt;	= 3
Let class_4_object	be	&lt;head object head agr class&gt;	= 4
Let class_5_object	be	&lt;head object head agr class&gt;	= 5
Let class_6_object	be	&lt;head object head agr class&gt;	= 6
Let class_7_object	be	&lt;head object head agr class&gt;	= 7
Let class_8_object	be	&lt;head object head agr class&gt;	= 8
Let class_9_object	be	&lt;head object head agr class&gt;	= 9
Let class_10_object	be	&lt;head object head agr class&gt;	= 10
Let class_11_object	be	&lt;head object head agr class&gt;	= 11
Let class_12_object	be	&lt;head object head agr class&gt;	= 12
Let class_13_object	be	&lt;head object head agr class&gt;	= 13
Let class_14_object	be	&lt;head object head agr class&gt;	= 14
Let class_15_object	be	&lt;head object head agr class&gt;	= 15
Let class_16_object	be	&lt;head object head agr class&gt;	= 16
Let class_17_object	be	&lt;head object head agr class&gt;	= 17
Let class_18_object	be	&lt;head object head agr class&gt;	= 18
Let class_19_object	be	&lt;head object head agr class&gt;	= 19
Let class_20_object	be	&lt;head object head agr class&gt;	= 20
Let class_21_object	be	&lt;head object head agr class&gt;	= 21
Let class_22_object	be	&lt;head object head agr class&gt;	= 22
Let class_23_object	be	&lt;head object head agr class&gt;	= 23
Let class_24_object	be	&lt;head object head agr class&gt;	= 24
Let class_25_object	be	&lt;head object head agr class&gt;	= 25
Let class_26_object	be	&lt;head object head agr class&gt;	= 26
Let class_27_object	be	&lt;head object head agr class&gt;	= 27
Let class_28_object	be	&lt;head object head agr class&gt;	= 28
Let class_29_object	be	&lt;head object head agr class&gt;	= 29
Let class_30_object	be	&lt;head object head agr class&gt;	= 30
Let class_1_subject	be	&lt;head subject head agr class&gt;	= 1
Let class_2_subject	be	&lt;head subject head agr class&gt;	= 2
Let class_3_subject	be	&lt;head subject head agr class&gt;	= 3
Let class_4_subject	be	&lt;head subject head agr class&gt;	= 4
Let class_5_subject	be	&lt;head subject head agr class&gt;	= 5
Let class_6_subject	be	&lt;head subject head agr class&gt;	= 6
Let class_7_subject	be	&lt;head subject head agr class&gt;	= 7
Let class_8_subject	be	&lt;head subject head agr class&gt;	= 8
Let class_9_subject	be	&lt;head subject head agr class&gt;	= 9
Let class_10_subject	be	&lt;head subject head agr class&gt;	= 10
Let class_11_subject	be	&lt;head subject head agr class&gt;	= 11
Let class_12_subject	be	&lt;head subject head agr class&gt;	= 12
Let class_13_subject	be	&lt;head subject head agr class&gt;	= 13
Let class_14_subject	be	&lt;head subject head agr class&gt;	= 14
Let class_15_subject	be	&lt;head subject head agr class&gt;	= 15
Let class_16_subject	be	&lt;head subject head agr class&gt;	= 16
Let class_17_subject	be	&lt;head subject head agr class&gt;	= 17
Let class_18_subject	be	&lt;head subject head agr class&gt;	= 18
Let class_19_subject	be	&lt;head subject head agr class&gt;	= 19
Let class_20_subject	be	&lt;head subject head agr class&gt;	= 20
Let class_21_subject	be	&lt;head subject head agr class&gt;	= 21
Let class_22_subject	be	&lt;head subject head agr class&gt;	= 22
Let class_23_subject	be	&lt;head subject head agr class&gt;	= 23
Let class_24_subject	be	&lt;head subject head agr class&gt;	= 24
Let class_25_subject	be	&lt;head subject head agr class&gt;	= 25
Let class_26_subject	be	&lt;head subject head agr class&gt;	= 26
Let class_27_subject	be	&lt;head subject head agr class&gt;	= 27
Let class_28_subject	be	&lt;head subject head agr class&gt;	= 28
Let class_29_subject	be	&lt;head subject head agr class&gt;	= 29
Let class_30_subject	be	&lt;head subject head agr class&gt;	= 30
Let comp			be      &lt;head type comp&gt;        = +
Let comp_prefix		be	&lt;head type prefix comp&gt;          = +
Let comp_suffix		be	&lt;head type suffix comp&gt;          = +
Let completive		be	&lt;head infl aspect&gt; =  completive
Let compound            be      &lt;head type compound&gt;            = +
Let -compound           be      &lt;head type compound&gt;            = -
Let conjoins_DP         be      &lt;head type conjoins_DP&gt;         = +
Let conjoins_IP         be      &lt;head type conjoins_IP&gt;         = +
Let -conjoins_DP        be      &lt;head type conjoins_DP&gt;         = -
Let -conjoins_IP        be      &lt;head type conjoins_IP&gt;         = -
Let continuative	be	&lt;head infl aspect continuative&gt; = +
Let copular		be	&lt;head type copular&gt;		= +
Let copular_prefix      be      &lt;head type prefix copular&gt;      = +
								[copular]
Let copular_suffix      be      &lt;head type suffix copular&gt;      = +
								[copular]
Let CP-final		be	&lt;head type CP-final&gt;		= +
Let -CP-final           be      &lt;head type CP-final&gt;            = -
Let CP-initial          be      &lt;head type CP-initial&gt;          = +
Let -CP-initial         be      &lt;head type CP-initial&gt;          = -
Let CP-specifier-initial be	&lt;head type CP-specifier-initial&gt; = +
Let dative              be      &lt;head case&gt; = dative
Let declarative		be	&lt;head infl mood declarative&gt;    = +
Let ditransitive	be	&lt;head type ditransitive&gt;	= +
								&lt;head type transitive&gt;          = +
Let DP-final            be      &lt;head type DP-final&gt;            = +
Let -DP-final           be      &lt;head type DP-final&gt;            = -
Let DP-initial          be      &lt;head type DP-initial&gt;          = +
Let -DP-initial         be      &lt;head type DP-initial&gt;          = -
Let dual		be	&lt;head agr number&gt; = dual
Let dual_absolutive	be	{ [head:[object:[head:[agr:[number:dual]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[number:dual]]]
															type:[transitive:-]]] }
Let dual_ergative	be	&lt;head subject head agr number&gt; = dual
											   &lt;head type transitive&gt; = +
Let dual_object		be	&lt;head object head agr number&gt; = dual
Let dual_subject 	be	&lt;head subject head agr number&gt; = dual
Let embedded_CP         be      &lt;embedded cat&gt; = CP
Let embedded_IP         be      &lt;embedded cat&gt; = IP
Let embedded_IPpro-dropOrCP be  {[embedded: [cat:IP
											 head: [subject:[head:[type:[pro-drop:+]]]]]]
								 [embedded: [cat:CP
											 head: [subject:[head:[type:[pro-drop:-]]]]]] }
Let embedded_finite     be      &lt;embedded head infl finite&gt;          = +
								&lt;embedded head type question&gt;        = !-
Let embedded_nonfinite  be      &lt;embedded head infl finite&gt;          = -
								&lt;embedded head type question&gt;        = !-
Let embedded_perfective be      &lt;embedded head infl aspect perfective&gt; = +
Let embedded_pro-drop   be      &lt;embedded head subject head type pro-drop&gt; = +
Let embedded_question   be      &lt;embedded head type question&gt;        = +
Let embedded_question_allowed be &lt;embedded head type question&gt;       = {+/-}
Let embedded_subjunctive be     &lt;embedded head infl mood realis&gt;     = -
Let ergative		be	&lt;head case&gt; = ergative
Let ergative_prefix     be      &lt;head type prefix ergative&gt;     = +
								[ergative]
Let ergative_suffix     be      &lt;head type suffix ergative&gt;     = +
								[ergative]
Let -ergative		be	[]
Let exclusive		be	&lt;head agr person&gt; = first_exclusive
Let excl-initial		be	&lt;head type excl-initial&gt; = +
Let excl-final		be	&lt;head type excl-final&gt; = +
Let feminine		be	&lt;head agr gender&gt; = feminine
Let feminine_absolutive	be	{ [head:[object:[head:[agr:[gender:feminine]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[agr:[gender:feminine]]]
															type:[transitive:-]]] }
Let feminine_ergative	be	&lt;head subject head agr gender&gt; = feminine
											   &lt;head type transitive&gt; = +
Let feminine_object	be	&lt;head object head agr gender&gt; = feminine
Let feminine_subject	be	&lt;head subject head agr gender&gt; = feminine
Let finite              be      &lt;head infl finite&gt;               = +
Let -finite             be      &lt;head infl finite&gt;               = -
Let first		be	&lt;head agr person&gt; = first
Let first_exclusive     be      &lt;head agr person&gt; = first_exclusive
Let first_exclusive_absolutive	be	{ [head:[object:[head:[agr:[person:first_exclusive]]]
																		 type:[transitive:+]]]
															  [head:[subject:[head:[agr:[person:first_exclusive]]]
																		type:[transitive:-]]] }
Let first_exclusive_ergative	be	&lt;head subject head agr person&gt; = first_exclusive
													 &lt;head type transitive&gt; = +
Let first_exclusive_subject be  &lt;head subject head agr person&gt; = first_exclusive
Let first_exclusive_object  be  &lt;head object head agr person&gt; = first_exclusive
Let first_inclusive     be      &lt;head agr person&gt; = first_inclusive
Let first_inclusive_absolutive	be	{ [head:[object:[head:[agr:[person:first_inclusive]]]
																		 type:[transitive:+]]]
															  [head:[subject:[head:[agr:[person:first_inclusive]]]
																		type:[transitive:-]]] }
Let first_inclusive_ergative	be	&lt;head subject head agr person&gt; = first_inclusive
													 &lt;head type transitive&gt; = +
Let first_inclusive_subject be  &lt;head subject head agr person&gt; = first_inclusive
Let first_inclusive_object be   &lt;head object head agr person&gt; = first_inclusive
Let first_absolutive	be	{ [head:[object:[head:[agr:[person:first]]]
													  type:[transitive:+]]]
													 [head:[subject:[head:[agr:[person:first]]]
																type:[transitive:-]]] }
Let first_ergative	be	&lt;head subject head agr person&gt; = first
											&lt;head type transitive&gt; = +
Let first_object	be	&lt;head object head agr person&gt; = first
Let first_subject	be	&lt;head subject head agr person&gt; = first
Let focus		be	&lt;head type focus&gt; = +
Let focus-initial		be	&lt;head type focus-initial&gt; = +
Let focus-final		be	&lt;head type focus-final&gt; = +
Let future		be	&lt;head infl tense&gt; = future
Let genitive		be	&lt;head case&gt; = genitive
Let genitive_prefix     be      &lt;head type prefix genitive&gt;     = +
								[genitive]
Let genitive_suffix     be      &lt;head type suffix genitive&gt;     = +
								[genitive]
Let -genitive		be	[]
Let habitual		be	&lt;head infl aspect habitual&gt;     = +
Let human               be      &lt;head type human&gt;               = +
Let human_absolutive	be	{ [head:[object:[head:[type:[human:+]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[type:[human:+]]]
															type:[transitive:-]]] }
Let human_ergative	be	&lt;head subject head type human&gt; = +
											   &lt;head type transitive&gt; = +
Let human_object	be	&lt;head object head type human&gt; = +
Let human_subject	be	&lt;head subject head type human&gt; = +
Let -human              be      &lt;head type human&gt;               = -
Let -human_absolutive	be	{ [head:[object:[head:[type:[human:-]]]
															type:[transitive:+]]]
												 [head:[subject:[head:[type:[human:-]]]
															type:[transitive:-]]] }
Let -human_ergative	be	&lt;head subject head type human&gt; = -
											   &lt;head type transitive&gt; = +
Let -human_object	be	&lt;head object head type human&gt;	= -
Let -human_subject	be	&lt;head subject head type human&gt; = -
Let imperative		be	&lt;head infl mood imperative&gt;     = +
Let imperfective	be	&lt;head infl aspect imperfective&gt; = +
Let inclusive		be	&lt;head agr person&gt; = first_inclusive
Let incompletive	be	&lt;head infl aspect incompletive&gt; = +
Let indefinite          be      &lt;head type indefinite&gt;          = +
								&lt;head type relative&gt;            = -
Let infinitive          be      &lt;head infl finite&gt;              = -
Let instrumental        be      &lt;head case&gt; = instrumental
Let interrogative	be	&lt;head infl mood interrogative&gt;  = +
				&lt;head type question&gt; 		= +
Let -interrogative  	be	&lt;head type question&gt;		= -
								&lt;head infl mood interrogative&gt;  = -
Let intransitive	be	&lt;head type transitive&gt;		= -
Let irrealis		be	&lt;head infl mood realis&gt;         = -
Let locative		be	&lt;head type locative&gt;		= +
Let manner		be	&lt;head type manner&gt;		= +
Let masculine		be	&lt;head agr gender&gt; = masculine
Let masculine_absolutive	be	{ [head:[object:[head:[agr:[gender:masculine]]]
													  type:[transitive:+]]]
													 [head:[subject:[head:[agr:[gender:masculine]]]
																type:[transitive:-]]] }
Let masculine_ergative	be	&lt;head subject head agr gender&gt; = masculine
											&lt;head type transitive&gt; = +
Let masculine_object	be	&lt;head object head agr gender&gt; = masculine
Let masculine_subject	be	&lt;head subject head agr gender&gt; = masculine
Let mass                be      &lt;head type mass&gt;                = +
Let modifies_Adj	be	&lt;head type modifies_Adj&gt;	= +
Let modifies_Adv	be	&lt;head type modifies_Adv temporal&gt; = +
				&lt;head type modifies_Adv locative&gt; = +
				&lt;head type modifies_Adv manner&gt; = +
				&lt;head type modifies_Adv reason&gt; = +
Let modifies_Adv-reason be	&lt;head type modifies_Adv reason&gt;	= -
				&lt;head type modifies_Adv locative&gt; = +
				&lt;head type modifies_Adv manner&gt; = +
				&lt;head type modifies_Adv temporal&gt; = +
Let modifies_locative	be	&lt;head type modifies_Adv locative&gt; = +
Let modifies_manner	be	&lt;head type modifies_Adv manner&gt;	= +
Let modifies_NP		be	&lt;head type modifies_NP&gt;		= +
Let modifies_PP		be	&lt;head type modifies_PP&gt;		= +
Let modifies_Q 		be	&lt;head type modifies_Q&gt;		= +
Let modifies_reason	be	&lt;head type modifies_Adv reason&gt;	= +
Let modifies_temporal	be	&lt;head type modifies_Adv temporal&gt; = +
Let motion		be	&lt;head type motion&gt;		= +
Let negative		be	&lt;head type negative&gt;            = +
Let negative_prefix   be      &lt;head type prefix negative&gt;   = +
								[negative]
Let negative_suffix   be      &lt;head type suffix negative&gt;   = +
								[negative]
Let negative-polarity		be	&lt;head type negative-polarity&gt;            = +
								[negative]
Let negative-polarity_prefix   be      &lt;head type prefix negative-polarity&gt;   = +
				[negative_prefix]
Let negative-polarity_suffix   be      &lt;head type suffix negative-polarity&gt;   = +
				[negative_suffix]
Let neuter		be	&lt;head agr gender&gt; = neuter
Let neuter_absolutive	be	{ [head:[object:[head:[agr:[gender:neuter]]]
													  type:[transitive:+]]]
													 [head:[subject:[head:[agr:[gender:neuter]]]
																type:[transitive:-]]] }
Let neuter_ergative	be	&lt;head subject head agr gender&gt; = neuter
											&lt;head type transitive&gt; = +
Let neuter_object	be	&lt;head object head agr gender&gt; = neuter
Let neuter_subject	be	&lt;head subject head agr gender&gt; = neuter
Let nominative		be	&lt;head case&gt; = nominative
Let -nominative		be	[]
Let nominative.or.accusative be &lt;head case&gt; = {nominative accusative}
Let nominative.or.genitive   be &lt;head case&gt; = {nominative genitive}
Let oblique             be      &lt;head type oblique&gt;             = +
Let participle          be      &lt;head type participle&gt;          = +
Let partitive		be	&lt;head type partitive&gt;		= +
Let passive		be	&lt;head type passive&gt;		= +
Let passive.optional	be	&lt;head type passive&gt;		= {+ -}
Let past		be	&lt;head infl tense&gt;          =  past
Let perfective		be	&lt;head infl aspect perfective&gt;   = +
Let plural		be	&lt;head agr number&gt; = plural
Let plural_absolutive	be	{ [head:[object:[head:[agr:[number:plural]]]
													  type:[transitive:+]]]
													 [head:[subject:[head:[agr:[number:plural]]]
																type:[transitive:-]]] }
Let plural_ergative	be	&lt;head subject head agr number&gt; = plural
											&lt;head type transitive&gt; = +
Let plural_object	 be	&lt;head object head agr number&gt; = plural
Let plural_subject	be	&lt;head subject head agr number&gt; = plural
Let poss_class_1        be	&lt;head possessor head agr class&gt; = 1
Let poss_class_2        be	&lt;head possessor head agr class&gt; = 2
Let poss_class_3        be	&lt;head possessor head agr class&gt; = 3
Let poss_class_4        be	&lt;head possessor head agr class&gt; = 4
Let poss_class_5        be	&lt;head possessor head agr class&gt; = 5
Let poss_class_6        be	&lt;head possessor head agr class&gt; = 6
Let poss_class_7        be	&lt;head possessor head agr class&gt; = 7
Let poss_class_8        be	&lt;head possessor head agr class&gt; = 8
Let poss_class_9        be	&lt;head possessor head agr class&gt; = 9
Let poss_class_10       be	&lt;head possessor head agr class&gt; = 10
Let poss_class_11       be	&lt;head possessor head agr class&gt; = 11
Let poss_class_12       be	&lt;head possessor head agr class&gt; = 12
Let poss_class_13       be	&lt;head possessor head agr class&gt; = 13
Let poss_class_14       be	&lt;head possessor head agr class&gt; = 14
Let poss_class_15       be	&lt;head possessor head agr class&gt; = 15
Let poss_class_16       be	&lt;head possessor head agr class&gt; = 16
Let poss_class_17       be	&lt;head possessor head agr class&gt; = 17
Let poss_class_18       be	&lt;head possessor head agr class&gt; = 18
Let poss_class_19       be	&lt;head possessor head agr class&gt; = 19
Let poss_class_20       be	&lt;head possessor head agr class&gt; = 20
Let poss_class_21       be	&lt;head possessor head agr class&gt; = 21
Let poss_class_22       be	&lt;head possessor head agr class&gt; = 22
Let poss_class_23       be	&lt;head possessor head agr class&gt; = 23
Let poss_class_24       be	&lt;head possessor head agr class&gt; = 24
Let poss_class_25       be	&lt;head possessor head agr class&gt; = 25
Let poss_class_26       be	&lt;head possessor head agr class&gt; = 26
Let poss_class_27       be	&lt;head possessor head agr class&gt; = 27
Let poss_class_28       be	&lt;head possessor head agr class&gt; = 28
Let poss_class_29       be	&lt;head possessor head agr class&gt; = 29
Let poss_class_30       be	&lt;head possessor head agr class&gt; = 30
Let poss_animate        be	&lt;head possessor head agr animate&gt; = +
Let poss_dual		be	&lt;head possessor head agr number&gt; = dual
Let poss_exclusive	be	&lt;head possessor head agr person&gt; = first_exclusive
Let poss_feminine	be	&lt;head possessor head agr gender&gt; = feminine
Let poss_first		be	&lt;head possessor head agr person&gt; = first
Let poss_human          be	&lt;head possessor head type human&gt; = +
Let poss_inanimate      be	&lt;head possessor head agr animate&gt; = -
Let poss_inclusive	be	&lt;head possessor head agr person&gt; = first_inclusive
Let poss_masculine	be	&lt;head possessor head agr gender&gt; = masculine
Let poss_neuter  	be	&lt;head possessor head agr gender&gt; = neuter
Let poss_nonhuman       be	&lt;head possessor head type human&gt; = -
Let poss_plural		be	&lt;head possessor head agr number&gt; = plural
Let poss_second		be	&lt;head possessor head agr person&gt; = second
Let poss_singular	be	&lt;head possessor head agr number&gt; = singular
Let poss_third		be	&lt;head possessor head agr person&gt; = third
Let poss_prefix         be      &lt;head type prefix poss&gt;         = +
Let poss_suffix         be      &lt;head type suffix poss&gt;         = +
Let possessed		be	&lt;head type possessed&gt;           = +
Let possessive          be      &lt;head type possessive&gt;          = +
Let potential		be	&lt;head infl aspect potential&gt;    = +
Let present		be	&lt;head infl tense&gt;       =  present
Let progressive		be	&lt;head infl aspect progressive&gt;  = +
Let proper          be      &lt;head type proper&gt;          = +
Let PP          be      &lt;head type PP&gt;          = +
Let P_prefix            be      &lt;head type prefix P&gt;            = +
Let P_suffix            be      &lt;head type suffix P&gt;            = +
Let question		be	&lt;head type question&gt;		= +
Let -question		be	&lt;head type question&gt;		= -
Let QP-final		be	&lt;head type QP-final&gt;		= +
				&lt;head type QP-initial&gt;		= -
Let QP-initial		be	&lt;head type QP-initial&gt;		= +
				&lt;head type QP-final&gt;		= -
Let quantifier		be	&lt;head type quantifier&gt;		= +
Let quantifier_prefix   be      &lt;head type prefix quantifier&gt;   = +
								[quantifier]
Let quantifier_suffix   be      &lt;head type suffix quantifier&gt;   = +
								[quantifier]
Let reason		be	&lt;head type reason&gt;		= +
Let realis		be	&lt;head infl mood realis&gt;         = +
Let reciprocal 		be	&lt;head type reciprocal&gt;		= +
Let reflexive		be	&lt;head type reflexive&gt;		= +
Let relative		be	&lt;head type relative&gt;		= +
Let relative_prefix		be	&lt;head type prefix relative&gt;		= +
Let relative_suffix		be	&lt;head type suffix relative&gt;		= +
Let +root		be	&lt;head type root&gt;		= +
Let -root		be	&lt;head type root&gt;		= -
Let second		be	&lt;head agr person&gt; = second
Let second_absolutive	be	{ [head:[object:[head:[agr:[person:second]]]
													  type:[transitive:+]]]
													 [head:[subject:[head:[agr:[person:second]]]
																type:[transitive:-]]] }
Let second_ergative	be	&lt;head subject head agr person&gt; = second
											&lt;head type transitive&gt; = +
Let second_object	be	&lt;head object head agr person&gt; = second
Let second_subject	be	&lt;head subject head agr person&gt; = second
Let sentential		be	&lt;head type sentential&gt;		= +
Let sentential_with_object be   &lt;head type sentential_with_object&gt; = +
Let singular		be	&lt;head agr number&gt; = singular
Let singular_absolutive	be	{ [head:[object:[head:[agr:[number:singular]]]
													  type:[transitive:+]]]
													 [head:[subject:[head:[agr:[number:singular]]]
																type:[transitive:-]]] }
Let singular_ergative	be	&lt;head subject head agr number&gt; = singular
											&lt;head type transitive&gt; = +
Let singular_object	be	&lt;head object head agr number&gt; = singular
Let singular_subject	be	&lt;head subject head agr number&gt; = singular
Let stand-alone         be      &lt;head type stand-alone&gt;         = +
Let stative		be	&lt;head infl aspect stative&gt;      = +
Let subjunctive         be      &lt;head infl mood realis&gt;         = -
Let takes_Adv           be      &lt;head type takes_Adv&gt;           = +
Let takes_DP            be      &lt;head type takes_DP&gt;            = +
Let temporal		be	&lt;head type temporal&gt;		= +
Let third		be	&lt;head agr person&gt; = third
Let third_absolutive	be	{ [head:[object:[head:[agr:[person:third]]]
													  type:[transitive:+]]]
													 [head:[subject:[head:[agr:[person:third]]]
																type:[transitive:-]]] }
Let third_ergative	be	&lt;head subject head agr person&gt; = third
											&lt;head type transitive&gt; = +
Let third_object	be	&lt;head object head agr person&gt; = third
Let third_subject	be	&lt;head subject head agr person&gt; = third
Let topic		be	&lt;head type topic&gt; = +
Let topic-initial		be	&lt;head type topic-initial&gt; = +
Let topic-final		be	&lt;head type topic-final&gt; = +
Let transitive		be	&lt;head type transitive&gt;		= +
Let wh			be	&lt;head type wh&gt;			= +
Let -wh			be	&lt;head type wh&gt; 			= -
Let whQ		be      &lt;head type whQ&gt;        = +
Let whQ_prefix		be	&lt;head type prefix whQ&gt;          = +
Let whQ_suffix		be	&lt;head type suffix whQ&gt;          = +
Let YNQ			be      &lt;head type YNQ&gt;        = +
Let YNQ_prefix		be	&lt;head type prefix YNQ&gt;          = +
Let YNQ_suffix		be	&lt;head type suffix YNQ&gt;          = +


Let Adj			be	&lt;cat&gt; = !Adj
				&lt;head type ordinal&gt;		= !-
				&lt;head type wh&gt;			= !-
				&lt;head type sentential&gt;          = !-
								&lt;head type relative&gt;            = !-
				&lt;head type clausal-comp&gt; = !-
								&lt;head type focusmarked&gt;         = -

Let Adv			be	&lt;cat&gt; = !Adv
				&lt;head type wh&gt;			= !-
								&lt;head type manner&gt;              = !-
								&lt;head type takes_Adv&gt;           = !-
								&lt;head type takes_DP&gt;            = !-
				&lt;head type sentential&gt;          = !-
								&lt;embedded&gt;      = !none
</xsl:text>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
								&lt;head type negative-polarity&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let Art			be	&lt;cat&gt; = !Art
				&lt;head type wh&gt;			= !-
								&lt;head type focusmarked&gt;         = -
</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//np/@case)!='ergative' and normalize-space(//np/@artCase)='yes'">
<xsl:text>
								&lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:text>

Let Aux			be	&lt;cat&gt; = !Aux
				&lt;head type passive&gt;		= !-
				&lt;head type negative&gt;		= !-
				&lt;head type participle&gt;		= -
				&lt;head infl finite&gt;              = !+

Let C			be	&lt;cat&gt; = !C
				&lt;head type question&gt;		= !-
				&lt;head type relative&gt;		= !-
								&lt;embedded&gt;      = !none
</xsl:text>
<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@mainContVSOBeforeWh)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@mainContVSOBeforeWh)='some' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@embContVSOBeforeWh)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@embContVSOBeforeWh)='some'">
<xsl:text>
					&lt;head type CP-specifier-initial&gt;      = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let Conj                be      &lt;cat&gt; = !Conj

Let Deg                 be      &lt;cat&gt; = !Deg
								&lt;head type modifies_Adj&gt;        = !-
								&lt;head type modifies_Adv temporal&gt; = !-
								&lt;head type modifies_Adv locative&gt; = !-
								&lt;head type modifies_Adv manner&gt; = !-
								&lt;head type modifies_Adv reason&gt; = !-
								&lt;head type modifies_NP&gt;         = !-
								&lt;head type modifies_PP&gt;         = !-
								&lt;head type modifies_Q&gt;          = !-
								&lt;head type quantifier&gt;          = !-
								&lt;head type wh&gt;                  = !-
								&lt;head type relative&gt;            = !-
								&lt;head type focusmarked&gt;         = -

Let Dem                 be      &lt;cat&gt; = !Dem
								&lt;head type wh&gt;                  = !-
								&lt;head agr person&gt; = !third
								&lt;head type relative&gt;            = !-
								&lt;head type temporal&gt;            = !-
								&lt;head type focusmarked&gt;         = -
</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//np/@case)!='ergative' and normalize-space(//np/@artCase)='yes'">
<xsl:text>
								&lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:text>

Let Det                 be      &lt;cat&gt; = !Det
								&lt;head type wh&gt;                  = !-
								&lt;head agr person&gt; = !third
								&lt;head type relative&gt;            = !-
								&lt;head type focusmarked&gt;         = -
</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//np/@case)!='ergative' and normalize-space(//np/@artCase)='yes'">
<xsl:text>
								&lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:text>

Let Excl                be      &lt;cat&gt; = Excl

Let Greet                be      &lt;cat&gt; = Greet

Let Intj                be      &lt;cat&gt; = Intj

Let N                   be      &lt;cat&gt; = !N
								&lt;head agr person&gt; = !third
								&lt;head possessor head agr&gt; = !none
								&lt;head agr animate&gt;              = !-
								&lt;head type human&gt;               = !-
								&lt;head type wh&gt;                  = -
								&lt;head type reciprocal&gt;          = !-
								&lt;head type reflexive&gt;          = !-
								&lt;head type sentential&gt;          = !-
								&lt;head type proper&gt;              = !-
								&lt;head type relative&gt;            = !-
								&lt;head type mass&gt;                = !-
								&lt;head type temporal&gt;            = !-
								&lt;head embedded&gt;      = !none
								&lt;head type focusmarked&gt;         = -
</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//np/@case)!='ergative'">
<xsl:text>
								&lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<xsl:text>
								&lt;head agr number&gt;            = !singular
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<xsl:text>
								&lt;head agr gender&gt;            = !masculine
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
<xsl:text>
								&lt;head type possessed&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
								&lt;head type negative-polarity&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/@pType)!='word' and normalize-space(//pp/@attaches)='head'">
<xsl:text>
							   &lt;head type PP&gt;      = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let Num                 be      &lt;cat&gt; = !Num
								&lt;head type ordinal&gt;             = !-
								&lt;head type wh&gt;                  = !-
								&lt;head agr number&gt; = !plural
								&lt;head type relative&gt;            = !-
								&lt;head type focusmarked&gt;         = -
</xsl:text>
<xsl:if test="normalize-space(//np/@qpeitherRestrictedNumPos)='after'">
<xsl:text>
								&lt;head type DP-final&gt;            = !+
								&lt;head type DP-initial&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@qpeitherRestrictedNumPos)='before'">
<xsl:text>
								&lt;head type DP-final&gt;            = !-
								&lt;head type DP-initial&gt;            = !+
</xsl:text>
</xsl:if>
<xsl:text>

Let ordinal             be      &lt;cat&gt; = Adj
								&lt;head type ordinal&gt;             = +
								&lt;head agr number&gt; = !plural
								&lt;head type focusmarked&gt;         = -

Let P                   be      &lt;cat&gt; = !P
								&lt;head type passive&gt;             = !-
								&lt;head type wh&gt;                  = -
								&lt;head type partitive&gt;           = !-
								&lt;head type temporal&gt;            = !-
				&lt;head type locative&gt;            = !-
								&lt;head sentential&gt;      = !-

Let Poss                be      &lt;cat&gt; = Poss
								[genitive]

Let Poss_ergative       be      &lt;cat&gt; = Poss
								[ergative]

Let Poss_absolutive     be      &lt;cat&gt; = Poss
								[absolutive]

Let Pron                be      &lt;cat&gt; = !Pron
								&lt;head type wh&gt;                  = !-
								&lt;head agr animate&gt;             = !+
								&lt;head type human&gt;               = !+
								&lt;head type reciprocal&gt;          = !-
								&lt;head type reflexive&gt;          = !-
								&lt;head type posessive&gt;          = !-
								&lt;head type relative&gt;            = !-
								&lt;head type temporal&gt;            = !-
								&lt;head type focusmarked&gt;         = -
</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//np/@case)!='ergative'">
<xsl:text>
								&lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<xsl:text>
								&lt;head agr number&gt;            = !singular
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<xsl:text>
								&lt;head agr gender&gt;            = !masculine
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
								&lt;head type negative-polarity&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let PropN		be	&lt;cat&gt; = N
				&lt;head agr animate&gt;		= !+
								&lt;head type human&gt;               = !+
				&lt;head agr person&gt; = !third
								&lt;head possessor head agr&gt; = !none
				&lt;head type wh&gt;			= -
				&lt;head type proper&gt;		= +
								&lt;head type reciprocal&gt;          = !-
								&lt;head type reflexive&gt;          = !-
								&lt;head type sentential&gt;          = !-
								&lt;head type relative&gt;            = !-
								&lt;head type mass&gt;                = !-
								&lt;head type temporal&gt;            = !-
								&lt;head type focusmarked&gt;         = -
</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//np/@case)!='ergative'">
<xsl:text>
								&lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<xsl:text>
								&lt;head agr number&gt;            = !singular
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<xsl:text>
								&lt;head agr gender&gt;            = !masculine
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
<xsl:text>
								&lt;head type possessed&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
								&lt;head type negative-polarity&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let Q                   be      &lt;cat&gt; = !Q
								&lt;head type wh&gt;                  = !-
								&lt;head type focusmarked&gt;         = -

Let V                   be      &lt;cat&gt; = !V
								&lt;head type passive&gt;             = !-
								&lt;head type sentential&gt;          = !-
								&lt;head type sentential_with_object&gt;          = !-
								&lt;head type copular&gt;             = !-
								&lt;head type motion&gt;              = !-
								&lt;head type reciprocal&gt;          = !-
								&lt;head type reflexive&gt;           = !-
								&lt;head infl finite&gt;              = !+
								&lt;head type negative&gt;            = !-
								&lt;head type participle&gt;          = !-
								&lt;head infl mood realis&gt;         = !+
								&lt;head infl mood imperative&gt;         = !-
								&lt;head embedded&gt;      = !none
								&lt;head type focusmarked&gt;         = -
</xsl:text>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
								&lt;head type negative-polarity&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/@mainContCliticAttaches)='head' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/@embContCliticAttaches)='head'">
<xsl:text>
							   &lt;head type whQ&gt;      = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/@mainYNCliticAttaches)='head' or normalize-space(//q/@embYNWord)='no' and normalize-space(//q/@embYNCliticAttaches)='head'">
<xsl:text>
							   &lt;head type YNQ&gt;      = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/@type)='IP'">
<xsl:text>
							   &lt;head type relative&gt;      = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/@compCliticAttaches)='head'">
<xsl:text>
							   &lt;head type comp&gt;      = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let makeAdj		be	&lt;cat&gt; = Adj
				&lt;head type ordinal&gt;		= !-
				&lt;head type wh&gt;			= !-
				&lt;head type sentential&gt;          = !-
								&lt;head type relative&gt;            = !-
				&lt;head type clausal-comp&gt; = !-
								&lt;head type focusmarked&gt;         = -

Let makeAdv		be	&lt;cat&gt; = Adv
				&lt;head type wh&gt;			= !-
								&lt;head type manner&gt;              = !-
								&lt;head type takes_Adv&gt;           = !-
								&lt;head type takes_DP&gt;            = !-
				&lt;head type sentential&gt;          = !-
								&lt;head embedded&gt;      = !none
</xsl:text>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
								&lt;head type negative-polarity&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let makeArt		be	&lt;cat&gt; = Art
				&lt;head type wh&gt;			= !-
								&lt;head type focusmarked&gt;         = -
</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//np/@case)!='ergative' and normalize-space(//np/@artCase)='yes'">
<xsl:text>
								&lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:text>

Let makeAux		be	&lt;cat&gt; = Aux
				&lt;head type passive&gt;		= !-
				&lt;head type negative&gt;		= !-
				&lt;head type participle&gt;		= -
				&lt;head infl finite&gt;              = !+

Let makeC		be	&lt;cat&gt; = C
				&lt;head type question&gt;		= !-
				&lt;head type relative&gt;		= !-
								&lt;head embedded&gt;      = !none
</xsl:text>
<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@mainContVSOBeforeWh)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@mainContVSOBeforeWh)='some' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@embContVSOBeforeWh)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@embContVSOBeforeWh)='some'">
<xsl:text>
					&lt;head type CP-specifier-initial&gt;      = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let makeConj            be      &lt;cat&gt; = Conj

Let makeDeg             be      &lt;cat&gt; = Deg
								&lt;head type modifies_Adj&gt;        = !-
								&lt;head type modifies_Adv temporal&gt; = !-
								&lt;head type modifies_Adv locative&gt; = !-
								&lt;head type modifies_Adv manner&gt; = !-
								&lt;head type modifies_Adv reason&gt; = !-
								&lt;head type modifies_NP&gt;         = !-
								&lt;head type modifies_PP&gt;         = !-
								&lt;head type modifies_Q&gt;          = !-
								&lt;head type quantifier&gt;          = !-
								&lt;head type wh&gt;                  = !-
								&lt;head type relative&gt;            = !-
								&lt;head type focusmarked&gt;         = -

Let makeDem             be      &lt;cat&gt; = Dem
								&lt;head type wh&gt;                  = !-
								&lt;head agr person&gt; = !third
								&lt;head type relative&gt;            = !-
								&lt;head type temporal&gt;            = !-
								&lt;head type focusmarked&gt;         = -
</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//np/@case)!='ergative' and normalize-space(//np/@artCase)='yes'">
<xsl:text>
								&lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
								&lt;head type negative-polarity&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let makeExcl  be    &lt;cat&gt; = Excl

Let makeFocusM  be    &lt;cat&gt; = FocusM

Let makeGreet  be    &lt;cat&gt; = Greet

Let makeInitialConj  be    &lt;cat&gt; = InitConj

Let makeIntj  be    &lt;cat&gt; = Intj

Let makeN               be      &lt;cat&gt; = N
								&lt;head agr person&gt; = !third
								&lt;head possessor head agr&gt; = !none
								&lt;head agr animate&gt;             = !-
								&lt;head type human&gt;               = !-
								&lt;head type wh&gt;                  = -
								&lt;head type reciprocal&gt;          = !-
								&lt;head type reflexive&gt;          = !-
								&lt;head type sentential&gt;          = !-
								&lt;head type proper&gt;              = !-
								&lt;head type relative&gt;            = !-
								&lt;head type mass&gt;                = !-
								&lt;head type temporal&gt;            = !-
								&lt;head type focusmarked&gt;         = -
</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//np/@case)!='ergative'">
<xsl:text>
								&lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<xsl:text>
								&lt;head agr number&gt;            = !singular
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<xsl:text>
								&lt;head agr gender&gt;            = !masculine
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
<xsl:text>
								&lt;head type possessed&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
								&lt;head type negative-polarity&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let makeNum             be      &lt;cat&gt; = Num
								&lt;head type ordinal&gt;             = !-
								&lt;head type wh&gt;                  = !-
								&lt;head agr number&gt; = !plural
								&lt;head type relative&gt;            = !-
								&lt;head type focusmarked&gt;         = -
</xsl:text>
<xsl:if test="normalize-space(//np/@qpeitherRestrictedNumPos)='after'">
<xsl:text>
								&lt;head type DP-final&gt;            = !+
								&lt;head type DP-initial&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@qpeitherRestrictedNumPos)='before'">
<xsl:text>
								&lt;head type DP-final&gt;            = !-
								&lt;head type DP-initial&gt;            = !+
</xsl:text>
</xsl:if>
<xsl:text>

Let makeP               be      &lt;cat&gt; = P
								&lt;head type passive&gt;             = !-
								&lt;head type wh&gt;                  = -
								&lt;head type partitive&gt;           = !-
				&lt;head type temporal&gt;            = !-
								&lt;head type sentential&gt;          = !-

Let makePron            be      &lt;cat&gt; = Pron
								&lt;head type wh&gt;                  = !-
								&lt;head agr animate&gt;             = !+
								&lt;head type human&gt;               = !+
								&lt;head type reciprocal&gt;          = !-
								&lt;head type reflexive&gt;          = !-
								&lt;head type posessive&gt;          = !-
								&lt;head type relative&gt;            = !-
								&lt;head type temporal&gt;            = !-
								&lt;head type focusmarked&gt;         = -
</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//np/@case)!='ergative'">
<xsl:text>
								&lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<xsl:text>
								&lt;head agr number&gt;            = !singular
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<xsl:text>
								&lt;head agr gender&gt;            = !masculine
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
								&lt;head type negative-polarity&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let makeQ                   be  &lt;cat&gt; = Q
								&lt;head type wh&gt;                  = !-
								&lt;head type focusmarked&gt;         = -

Let makeTopicM  be    &lt;cat&gt; = TopicM

Let makeV               be      &lt;cat&gt; = V
								&lt;head type passive&gt;             = !-
								&lt;head type sentential&gt;          = !-
								&lt;head type sentential_with_object&gt;          = !-
								&lt;head type copular&gt;             = !-
								&lt;head type motion&gt;              = !-
								&lt;head type reciprocal&gt;          = !-
								&lt;head infl finite&gt;              = !+
								&lt;head type negative&gt;            = !-
								&lt;head type participle&gt;          = !-
								&lt;head infl mood realis&gt;         = !+
								&lt;head infl mood imperative&gt;         = !-
								&lt;embedded&gt;      = !none
								&lt;head type focusmarked&gt;         = -
</xsl:text>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
								&lt;head type negative-polarity&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/@mainContCliticAttaches)='head' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/@embContCliticAttaches)='head'">
<xsl:text>
							   &lt;head type whQ&gt;      = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/@mainYNCliticAttaches)='head' or normalize-space(//q/@embYNWord)='no' and normalize-space(//q/@embYNCliticAttaches)='head'">
<xsl:text>
							   &lt;head type YNQ&gt;      = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/@type)='IP'">
<xsl:text>
							   &lt;head type relative&gt;      = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/@compCliticAttaches)='head'">
<xsl:text>
							   &lt;head type comp&gt;      = !-
</xsl:text>
</xsl:if>

















































































	<xsl:if test="normalize-space(//qp/cardinalNumberCategory)!=''">
Let <xsl:value-of select="//qp/cardinalNumberCategory" /> be [Num]</xsl:if>



	<xsl:if test="normalize-space(//qp/conjunctionCategory)!='' or normalize-space(//coord/conjunctionCategory)!=''">
Let <xsl:value-of select="//qp/conjunctionCategory" />
<xsl:value-of select="//coord/conjunctionCategory" /> be [Conj]</xsl:if>





	<xsl:if test="normalize-space(//advp/adverbCategory)!=''">
Let <xsl:value-of select="//advp/adverbCategory" /> be [Adv]</xsl:if>



	<xsl:if test="normalize-space(//adjp/adjectiveCategory)!=''">
Let <xsl:value-of select="//adjp/adjectiveCategory" /> be [Adj]</xsl:if>



	<xsl:if test="normalize-space(//np/articleCategory)!=''">
Let <xsl:value-of select="//np/articleCategory" /> be [Art]</xsl:if>



	<xsl:if test="normalize-space(//np/demonstrativeCategory)!=''">
Let <xsl:value-of select="//np/demonstrativeCategory" /> be [Dem]</xsl:if>



	<xsl:if test="normalize-space(//np/nounCategory)!=''">
Let <xsl:value-of select="//np/nounCategory" /> be [N]</xsl:if>



	<xsl:if test="normalize-space(//np/propAnimate1Category)!=''">
Let <xsl:value-of select="//np/propAnimate1Category" /> be [PropN]</xsl:if>



	<xsl:if test="normalize-space(//np/propAnimate2Category)!=''">
Let <xsl:value-of select="//np/propAnimate2Category" /> be [PropN]</xsl:if>



	<xsl:if test="normalize-space(//np/propInanimateCategory)!=''">
Let <xsl:value-of select="//np/propInanimateCategory" /> be [PropN]</xsl:if>



	<xsl:if test="normalize-space(//np/propInanimateCategory)!=''">
<xsl:text>
									   &lt;head agr animate&gt; = -
</xsl:text>
</xsl:if>
	<xsl:if test="normalize-space(//pron/pronounCategory)!=''">
Let <xsl:value-of select="//pron/pronounCategory" /> be [Pron]</xsl:if>



	<xsl:if test="normalize-space(//pp/pCategory)!=''">
Let <xsl:value-of select="//pp/pCategory" /> be [P]</xsl:if>



	<xsl:if test="normalize-space(//ip/auxCategory)!=''">
Let <xsl:value-of select="//ip/auxCategory" /> be [Aux]</xsl:if>



	<xsl:if test="normalize-space(//ip/verbCategory)!=''">
Let <xsl:value-of select="//ip/verbCategory" /> be [V]</xsl:if>



	<xsl:if test="normalize-space(//q/whPronCategory)!=''">
Let <xsl:value-of select="//q/whPronCategory" /> be [Pron]</xsl:if>






	<xsl:if test="normalize-space(//pp/@checkedOff)!='yes'">
<xsl:text>
rule {S option testing - first eight sections}
S = AdvP / AdjP / QP / DP / PP
	&lt;S option&gt; = testing
</xsl:text>
</xsl:if>



	<xsl:if test="normalize-space(//focus/@topic)='no'">
<xsl:text>
rule {S option start.symbol  - PPs optional}
S = (PP_1) {IP / CP} (PP_2)
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;S option&gt; = start.symbol
</xsl:text>
</xsl:if>



	<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicPos)='before'">
<xsl:text>
rule {S option start.topicinit  - PPs optional, topic initial}
S = (TopicP) (PP_1) {IP / CP} (PP_2)
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;S option&gt; = start.topicinit
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicPos)='after'">
<xsl:text>
rule {S option start.topicinit  - PPs optional, topic final}
S = (PP_1) {IP / CP} (PP_2) (TopicP)
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;S option&gt; = start.topicfin
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//neg/@advVerbRequired)!='yes' and normalize-space(//focus/@topic)='no'">
<xsl:text>
rule {S option start.initial - AdvP or DP initial}
S = {AdvP / DP} {IP / CP}
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;AdvP head type manner&gt; = -
	&lt;DP head type temporal&gt; = +
	&lt;IP head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;IP head type negative&gt; &lt;= &lt;AdvP head type negative&gt;
	&lt;CP head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;CP head type negative&gt; &lt;= &lt;AdvP head type negative&gt;
	&lt;S option&gt; = start.initial
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//neg/@advVerbRequired)!='yes' and normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicPos)='before'">
<xsl:text>
rule {S option start.initial.topicinit - AdvP or DP initial, topic initial}
S = (TopicP) {AdvP / DP} {IP / CP}
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;AdvP head type manner&gt; = -
	&lt;DP head type temporal&gt; = +
	&lt;IP head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;IP head type negative&gt; &lt;= &lt;AdvP head type negative&gt;
	&lt;CP head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;CP head type negative&gt; &lt;= &lt;AdvP head type negative&gt;
	&lt;S option&gt; = start.initial.topicinit
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//neg/@advVerbRequired)!='yes' and normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicPos)='after'">
<xsl:text>
rule {S option start.initial.topicfin - AdvP or DP initial, topic final}
S = {AdvP / DP} {IP / CP} (TopicP)
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;AdvP head type manner&gt; = -
	&lt;DP head type temporal&gt; = +
	&lt;IP head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;IP head type negative&gt; &lt;= &lt;AdvP head type negative&gt;
	&lt;CP head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;CP head type negative&gt; &lt;= &lt;AdvP head type negative&gt;
	&lt;S option&gt; = start.initial.topicfin
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//neg/@advVerbRequired)!='yes' and normalize-space(//focus/@topic)='no'">
<xsl:text>
rule {S option start.final - AdvP or DP final}
S = {IP / CP} {AdvP / DP}
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;AdvP head type manner&gt; = -
	&lt;DP head type temporal&gt; = +
	&lt;IP head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;IP head type negative&gt; &lt;= &lt;AdvP head type negative&gt;
	&lt;CP head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;CP head type negative&gt; &lt;= &lt;AdvP head type negative&gt;
	&lt;S option&gt; = start.final
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//neg/@advVerbRequired)!='yes' and normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicPos)='before'">
<xsl:text>
rule {S option start.final.topicinit - AdvP or DP final, topic initial}
S = (TopicP) {IP / CP} {AdvP / DP}
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;AdvP head type manner&gt; = -
	&lt;DP head type temporal&gt; = +
	&lt;IP head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;IP head type negative&gt; &lt;= &lt;AdvP head type negative&gt;
	&lt;CP head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;CP head type negative&gt; &lt;= &lt;AdvP head type negative&gt;
	&lt;S option&gt; = start.final.topicinit
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//neg/@advVerbRequired)!='yes' and normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicPos)='after'">
<xsl:text>
rule {S option start.final.topicfin - AdvP or DP final, topic final}
S = {IP / CP} {AdvP / DP} (TopicP)
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;AdvP head type manner&gt; = -
	&lt;DP head type temporal&gt; = +
	&lt;IP head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;IP head type negative&gt; &lt;= &lt;AdvP head type negative&gt;
	&lt;CP head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;CP head type negative&gt; &lt;= &lt;AdvP head type negative&gt;
	&lt;S option&gt; = start.final.topicfin
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//focus/@topic)='no'">
<xsl:text>
rule {S option start.negVrequired.initial - neg V required, AdvP or DP initial}
S = {AdvP / DP} {IP / CP}
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;S head adverbial&gt; = &lt;AdvP&gt;
	&lt;S head adverbial&gt; = &lt;DP&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;AdvP head type manner&gt; = -
	&lt;DP head type temporal&gt; = +
	&lt;S head&gt; == [adverbial:[head:[type:[negative:+]]]] -&gt;  | if adverbial negative, verb must be
					 [type:[negative:+]]
	&lt;S option&gt; = start.negVrequired.initial
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicPos)='before'">
<xsl:text>
rule {S option start.negVrequired.initial.topicinit - neg V required, AdvP or DP initial, topic initial}
S = (TopicP) {AdvP / DP} {IP / CP}
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;S head adverbial&gt; = &lt;AdvP&gt;
	&lt;S head adverbial&gt; = &lt;DP&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;AdvP head type manner&gt; = -
	&lt;DP head type temporal&gt; = +
	&lt;S head&gt; == [adverbial:[head:[type:[negative:+]]]] -&gt;  | if adverbial negative, verb must be
					 [type:[negative:+]]
	&lt;S option&gt; = start.negVrequired.initial.topicinit
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicPos)='after'">
<xsl:text>
rule {S option start.negVrequired.initial.topicfin - neg V required, AdvP or DP initial, topic final}
S = {AdvP / DP} {IP / CP} (TopicP)
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;S head adverbial&gt; = &lt;AdvP&gt;
	&lt;S head adverbial&gt; = &lt;DP&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;AdvP head type manner&gt; = -
	&lt;DP head type temporal&gt; = +
	&lt;S head&gt; == [adverbial:[head:[type:[negative:+]]]] -&gt;  | if adverbial negative, verb must be
					 [type:[negative:+]]
	&lt;S option&gt; = start.negVrequired.initial.topicfin
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//focus/@topic)='no'">
<xsl:text>
rule {S option start.negVrequired.final - neg V required, AdvP or DP final}
S = {IP / CP} {AdvP / DP}
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;S head adverbial&gt; = &lt;AdvP&gt;
	&lt;S head adverbial&gt; = &lt;DP&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;AdvP head type manner&gt; = -
	&lt;DP head type temporal&gt; = +
	&lt;S head&gt; == [adverbial:[head:[type:[negative:+]]]] -&gt;  | if adverbial negative, verb must be
					 [type:[negative:+]]
	&lt;S option&gt; = start.negVrequired.final
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//focus/@topic)='no' and normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicPos)='before'">
<xsl:text>
rule {S option start.negVrequired.final.topicinit - neg V required, AdvP or DP final, topic initial}
S = (TopicP) {IP / CP} {AdvP / DP}
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;S head adverbial&gt; = &lt;AdvP&gt;
	&lt;S head adverbial&gt; = &lt;DP&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;AdvP head type manner&gt; = -
	&lt;DP head type temporal&gt; = +
	&lt;S head&gt; == [adverbial:[head:[type:[negative:+]]]] -&gt;  | if adverbial negative, verb must be
					 [type:[negative:+]]
	&lt;S option&gt; = start.negVrequired.final.topicinit
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//focus/@topic)='no' and normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicPos)='after'">
<xsl:text>
rule {S option start.negVrequired.final.topicfin - neg V required, AdvP or DP final, topic final}
S = {IP / CP} {AdvP / DP} (TopicP)
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;S head adverbial&gt; = &lt;AdvP&gt;
	&lt;S head adverbial&gt; = &lt;DP&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;AdvP head type manner&gt; = -
	&lt;DP head type temporal&gt; = +
	&lt;S head&gt; == [adverbial:[head:[type:[negative:+]]]] -&gt;  | if adverbial negative, verb must be
					 [type:[negative:+]]
	&lt;S option&gt; = start.negVrequired.final.topicfin
</xsl:text>
</xsl:if>










	<xsl:text>
rule {S option greeting}
S = Greet (DP)
	&lt;S head&gt; = &lt;Greet head&gt;
	&lt;DP head type temporal&gt; = -
	&lt;DP head type locative&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type topic&gt; = -
	&lt;DP head type focus&gt; = -
	&lt;DP head type negative&gt; = -
	&lt;S option&gt; = greet
</xsl:text>
	<xsl:text>
rule {S option interjection}
S = Intj / Adj
	&lt;S head&gt; = &lt;Intj head&gt;
	&lt;S head&gt; = &lt;Adj head&gt;
	&lt;S option&gt; = interjection
</xsl:text>
	<xsl:if test="normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/@exclMPos)='before' or normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/@exclMPos)='either'">
<xsl:text>
rule {S option excl.init}
S = Excl AdjP
	&lt;S head&gt; = &lt;AdjP head&gt;
	&lt;Excl head type excl-initial&gt; = +
	&lt;S option&gt; = excl.init
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/@exclMPos)='after' or normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/@exclMPos)='either'">
<xsl:text>
rule {S option excl.fin}
S = AdjP Excl
	&lt;S head&gt; = &lt;AdjP head&gt;
	&lt;Excl head type excl-final&gt; = +
	&lt;S option&gt; = excl.fin
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/@exclMPos)='both'">
<xsl:text>
rule {S option excl.both}
S = Excl_1 AdjP Excl_2
	&lt;S head&gt; = &lt;AdjP head&gt;
	&lt;Excl_1 head type excl-initial&gt; = +
	&lt;Excl_2 head type excl-final&gt; = +
	&lt;S option&gt; = excl.both
</xsl:text>
</xsl:if>





</xsl:template>
</xsl:stylesheet>