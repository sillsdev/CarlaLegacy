<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="templates">
<xsl:text>
Let actorVoice   	            be	&lt;head infl voice&gt;   = actor
Let dativeVoice   	            be	&lt;head infl voice&gt;   = dative
Let goalVoice   	            be	&lt;head infl voice&gt;   = goal
Let instrumentalVoice   	be	&lt;head infl voice&gt;   = instrumental
Let locativeVoice   	be	&lt;head infl voice&gt;   = locative
Let objectVoice   	            be	&lt;head infl voice&gt;   = object

Let ablative			be	&lt;head case&gt; = ablative
Let absolutive			be	&lt;head case&gt; = absolutive
Let -absolutive			be	&lt;head case&gt; ={ergative genitive dative}
Let absolutive.or.dative		be	&lt;head case&gt; ={absolutive dative}
Let absolutive.or.ergative	be	&lt;head case&gt; ={absolutive ergative}
Let absolutive.or.genitive	be	&lt;head case&gt; ={absolutive genitive}
Let absolutive_prefix   	be	&lt;head type prefix case&gt;   = absolutive
                                                         [absolutive]
Let absolutive_suffix   	be	&lt;head type suffix case&gt;   = absolutive
                                                         [absolutive]
Let accusative			be	&lt;head case&gt; = accusative
Let -accusative			be	&lt;head case&gt; = {nominative genitive dative}
Let accusative.or.dative 	         be	&lt;head case&gt; = {accusative dative} 
Let accusative.or.genitive 	be	&lt;head case&gt; = {accusative genitive} 
Let accusative.or.nominative 	be	&lt;head case&gt; = {accusative nominative} 
Let AdjP-final			be	&lt;head type AdjP-final&gt;	      = +
                                        &lt;head type AdjP-initial&gt;	      = -
Let AdjP-initial		be	&lt;head type AdjP-initial&gt;	      = +
                                        &lt;head type AdjP-final&gt;	      = -
Let AdvP-final			be	&lt;head type AdvP-final&gt;	      = +
                                        &lt;head type AdvP-initial&gt;	      = -
Let AdvP-initial		be	&lt;head type AdvP-initial&gt;	      = +
                                        &lt;head type AdvP-final&gt;	      = -
Let -alone                      be      &lt;head type stand-alone&gt;	      = -
Let animate			be	&lt;head agr animacy&gt;	      = animate
Let animate_absolutive  	be	{ [head:[object:[head:[agr:[animacy:animate]]]
                                        	 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[animacy:animate]]]
                                                 type:[transitive:-]]] }
Let animate_ergative		be	&lt;head subject head agr animacy&gt; = animate
                                        &lt;head type transitive&gt;	      = +
Let animate_object		be	&lt;head object head agr animacy&gt;  = animate
Let animate_subject		be	&lt;head subject head agr animacy&gt; = animate
Let -animate			be	&lt;head agr animacy&gt; = inanimate
Let -animate_absolutive  	be	{ [head:[object:[head:[agr:[animacy:inanimate]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[animacy:inanimate]]]
                                                 type:[transitive:-]]] }
Let -animate_ergative		be	&lt;head subject head agr animacy&gt; = inanimate
                                        &lt;head type transitive&gt;	      = +
Let -animate_object		be	&lt;head object head agr animacy&gt;  = inanimate
Let -animate_subject		be      &lt;head subject head agr animacy&gt; = inanimate
Let antipassive		be      &lt;head infl valence &gt;	= antipassive
Let applicative		be      &lt;head infl valence &gt;	= applicative
Let assumed               	        be      &lt;head infl evidentiality&gt;  = assumed
Let auditory               	        be      &lt;head infl evidentiality&gt;  = auditory
Let case_prefix_ablative	be      &lt;head type prefix case&gt;	= ablative
Let case_prefix_absolutive	be      &lt;head type prefix case&gt;	= absolutive
Let case_prefix_absolutive.or.dative 	be      &lt;head type prefix case&gt;	= {absolutive dative}
Let case_prefix_accusative	be      &lt;head type prefix case&gt;	= accusative
Let case_prefix_accusative.or.dative 	be      &lt;head type prefix case&gt;	= {accusative dative}
Let case_prefix_dative	            be      &lt;head type prefix case&gt;	= dative
Let case_prefix_ergative	be      &lt;head type prefix case&gt;	= ergative
Let case_prefix_genitive	be      &lt;head type prefix case&gt;	= genitive
Let case_prefix_instrumental	be      &lt;head type prefix case&gt;	= instrumental
Let case_prefix_locative   	be      &lt;head type prefix case&gt;	= locative
Let case_prefix_nominative	be      &lt;head type prefix case&gt;	= nominative
Let case_prefix_oblique   	be      &lt;head type prefix case&gt;	= oblique
Let case_prefix_vocative	be      &lt;head type prefix case&gt;	= vocative
Let case_suffix_ablative	            be      &lt;head type suffix case&gt;	= ablative
Let case_suffix_absolutive	be      &lt;head type suffix case&gt;	= absolutive
Let case_suffix_absolutive.or.dative 	be      &lt;head type suffix case&gt;	= {absolutive dative}
Let case_suffix_accusative	be      &lt;head type suffix case&gt;	= accusative
Let case_suffix_accusative.or.dative 	be      &lt;head type suffix case&gt;	= {accusative dative}
Let case_suffix_dative	            be      &lt;head type suffix case&gt;	= dative
Let case_suffix_ergative	be      &lt;head type suffix case&gt;	= ergative
Let case_suffix_genitive   	be      &lt;head type suffix case&gt;	= genitive
Let case_suffix_instrumental	be      &lt;head type suffix case&gt;	= instrumental
Let case_suffix_locative   	be      &lt;head type suffix case&gt;	= locative
Let case_suffix_nominative	be      &lt;head type suffix case&gt;	= nominative
Let case_suffix_oblique   	be      &lt;head type suffix case&gt;	= oblique
Let case_suffix_vocative	be      &lt;head type suffix case&gt;	= vocative
Let causative			be      &lt;head infl valence &gt;	= causative
Let class_animal			be      &lt;head agr class&gt;		      = animal
Let class_bird			be      &lt;head agr class&gt;		      = bird
Let class_boat			be      &lt;head agr class&gt;		      = boat
Let class_clothing			be      &lt;head agr class&gt;		      = clothing
Let class_cylindrical			be      &lt;head agr class&gt;		      = cylindrical
Let class_flat       			be      &lt;head agr class&gt;		      = flat
Let class_generic			be      &lt;head agr class&gt;		      = generic
Let class_human			be      &lt;head agr class&gt;		      = human
Let class_insect			be      &lt;head agr class&gt;		      = insect
Let class_liquid			be      &lt;head agr class&gt;		      = liquid
Let class_mechanical			be      &lt;head agr class&gt;		      = mechanical
Let class_round			be      &lt;head agr class&gt;		      = round
Let class_cylinder		                   be      &lt;head agr class&gt;		      = cylinder
Let class_sphere			be      &lt;head agr class&gt;		      = sphere
Let class_thin			be      &lt;head agr class&gt;		      = thin
Let class_tree			be      &lt;head agr class&gt;		      = tree
Let class_wavy			be      &lt;head agr class&gt;		      = wavy
Let class_wood			be      &lt;head agr class&gt;		      = wood
Let class_other			be      &lt;head agr class&gt;		      = other
Let class_1			be      &lt;head agr class&gt;		      = 1
Let class_2			be      &lt;head agr class&gt;		      = 2
Let class_3			be      &lt;head agr class&gt;		      = 3
Let class_4			be      &lt;head agr class&gt;		      = 4
Let class_5			be      &lt;head agr class&gt;		      = 5
Let class_6			be      &lt;head agr class&gt;		      = 6
Let class_7			be      &lt;head agr class&gt;		      = 7
Let class_8			be      &lt;head agr class&gt;		      = 8
Let class_9			be      &lt;head agr class&gt;		      = 9
Let class_10			be      &lt;head agr class&gt;		      = 10
Let class_11			be      &lt;head agr class&gt;		      = 11
Let class_12			be      &lt;head agr class&gt;		      = 12
Let class_13			be      &lt;head agr class&gt;		      = 13
Let class_14			be      &lt;head agr class&gt;		      = 14
Let class_15			be      &lt;head agr class&gt;		      = 15
Let class_16			be      &lt;head agr class&gt;		      = 16
Let class_17			be      &lt;head agr class&gt;		      = 17
Let class_18			be      &lt;head agr class&gt;		      = 18
Let class_19			be      &lt;head agr class&gt;		      = 19
Let class_20			be      &lt;head agr class&gt;		      = 20
Let class_21			be      &lt;head agr class&gt;		      = 21
Let class_22			be      &lt;head agr class&gt;		      = 22
Let class_23			be      &lt;head agr class&gt;		      = 23
Let class_24			be      &lt;head agr class&gt;		      = 24
Let class_25			be      &lt;head agr class&gt;		      = 25
Let class_animal_absolutive			be       { [head:[object:[head:[agr:[class:animal]]]
                                                                                             type:[transitive:+]]]
                                                                                             [head:[subject:[head:[agr:[class:animal]]]
                                                                                               type:[transitive:-]]] }
Let class_insect_absolutive			be       { [head:[object:[head:[agr:[class:insect]]]
                                                                                               type:[transitive:+]]]
                                                                                               [head:[subject:[head:[agr:[class:insect]]]
                                                                                               type:[transitive:-]]] }
Let class_liquid_absolutive			be       { [head:[object:[head:[agr:[class:liquid]]]
                                                                                               type:[transitive:+]]]
                                                                                               [head:[subject:[head:[agr:[class:liquid]]]
                                                                                               type:[transitive:-]]] }
Let class_round_absolutive			be       { [head:[object:[head:[agr:[class:round]]]
                                                                                               type:[transitive:+]]]
                                                                                               [head:[subject:[head:[agr:[class:round]]]
                                                                                               type:[transitive:-]]] }
Let class_cylinder_absolutive			be       { [head:[object:[head:[agr:[class:cylinder]]]
                                                                                               type:[transitive:+]]]
                                                                                               [head:[subject:[head:[agr:[class:cylinder]]]
                                                                                               type:[transitive:-]]] }
Let class_sphere_absolutive			be       { [head:[object:[head:[agr:[class:sphere]]]
                                                                                               type:[transitive:+]]]
                                                                                               [head:[subject:[head:[agr:[class:sphere]]]
                                                                                               type:[transitive:-]]] }
Let class_tree_absolutive			be       { [head:[object:[head:[agr:[class:tree]]]
                                                                                               type:[transitive:+]]]
                                                                                               [head:[subject:[head:[agr:[class:tree]]]
                                                                                               type:[transitive:-]]] }
Let class_wood_absolutive			be       { [head:[object:[head:[agr:[class:wood]]]
                                                                                               type:[transitive:+]]]
                                                                                               [head:[subject:[head:[agr:[class:wood]]]
                                                                                               type:[transitive:-]]] }
Let class_other_absolutive			be       { [head:[object:[head:[agr:[class:other]]]
                                                                                               type:[transitive:+]]]
                                                                                               [head:[subject:[head:[agr:[class:other]]]
                                                                                               type:[transitive:-]]] }
Let class_1_absolutive          be      { [head:[object:[head:[agr:[class:1]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:1]]]
                                                 type:[transitive:-]]] }
Let class_2_absolutive          be      { [head:[object:[head:[agr:[class:2]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:2]]]
                                                 type:[transitive:-]]] }
Let class_3_absolutive          be      { [head:[object:[head:[agr:[class:3]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:3]]]
                                                 type:[transitive:-]]] }
Let class_4_absolutive          be      { [head:[object:[head:[agr:[class:4]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:4]]]
                                                 type:[transitive:-]]] }
Let class_5_absolutive          be      { [head:[object:[head:[agr:[class:5]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:5]]]
                                                 type:[transitive:-]]] }
Let class_6_absolutive          be      { [head:[object:[head:[agr:[class:6]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:6]]]
                                                 type:[transitive:-]]] }
Let class_7_absolutive          be	{ [head:[object:[head:[agr:[class:7]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:7]]]
                                                 type:[transitive:-]]] }
Let class_8_absolutive          be      { [head:[object:[head:[agr:[class:8]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:8]]]
                                                 type:[transitive:-]]] }
Let class_9_absolutive          be	{ [head:[object:[head:[agr:[class:9]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:9]]]
                                                 type:[transitive:-]]] }
Let class_10_absolutive         be      { [head:[object:[head:[agr:[class:10]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:10]]]
                                                 type:[transitive:-]]] }
Let class_11_absolutive        	be      { [head:[object:[head:[agr:[class:11]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:11]]]
                                                 type:[transitive:-]]] }
Let class_12_absolutive         be      { [head:[object:[head:[agr:[class:12]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:12]]]
                                                 type:[transitive:-]]] }
Let class_13_absolutive         be   	{ [head:[object:[head:[agr:[class:13]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:13]]]
                                                 type:[transitive:-]]] }
Let class_14_absolutive         be      { [head:[object:[head:[agr:[class:14]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:14]]]
                                                 type:[transitive:-]]] }
Let class_15_absolutive         be      { [head:[object:[head:[agr:[class:15]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:15]]]
                                                 type:[transitive:-]]] }
Let class_16_absolutive         be      { [head:[object:[head:[agr:[class:16]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:16]]]
                                                 type:[transitive:-]]] }
Let class_17_absolutive         be      { [head:[object:[head:[agr:[class:17]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:17]]]
                                                 type:[transitive:-]]] }
Let class_18_absolutive         be      { [head:[object:[head:[agr:[class:18]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:18]]]
                                                 type:[transitive:-]]] }
Let class_19_absolutive         be      { [head:[object:[head:[agr:[class:19]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:19]]]
                                                 type:[transitive:-]]] }
Let class_20_absolutive         be      { [head:[object:[head:[agr:[class:20]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:20]]]
                                                 type:[transitive:-]]] }
Let class_21_absolutive         be      { [head:[object:[head:[agr:[class:21]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:21]]]
                                                 type:[transitive:-]]] }
Let class_22_absolutive         be      { [head:[object:[head:[agr:[class:22]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:22]]]
                                                 type:[transitive:-]]] }
Let class_23_absolutive         be      { [head:[object:[head:[agr:[class:23]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:23]]]
                                                 type:[transitive:-]]] }
Let class_24_absolutive         be      { [head:[object:[head:[agr:[class:24]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:24]]]
                                                 type:[transitive:-]]] }
Let class_25_absolutive         be      { [head:[object:[head:[agr:[class:25]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[class:25]]]
                                                 type:[transitive:-]]] }
Let class_animal_ergative		be	&lt;head subject head agr class&gt;	= animal
                                        &lt;head type transitive&gt;		= +
Let class_insect_ergative		be	&lt;head subject head agr class&gt;	= insect
                                        &lt;head type transitive&gt;		= +
Let class_liquid_ergative		be	&lt;head subject head agr class&gt;	= liquid
                                        &lt;head type transitive&gt;		= +
Let class_round_ergative		be	&lt;head subject head agr class&gt;	= round
                                        &lt;head type transitive&gt;		= +
Let class_cylinder_ergative		be	&lt;head subject head agr class&gt;	= cylinder
                                        &lt;head type transitive&gt;		= +
 Let class_sphere_ergative		be	&lt;head subject head agr class&gt;	= sphere
                                        &lt;head type transitive&gt;		= +
Let class_tree_ergative		be	&lt;head subject head agr class&gt;	= tree
                                        &lt;head type transitive&gt;		= +
Let class_wood_ergative		be	&lt;head subject head agr class&gt;	= wood
                                        &lt;head type transitive&gt;		= +
Let class_other_ergative		be	&lt;head subject head agr class&gt;	= other
                                        &lt;head type transitive&gt;		= +
Let class_1_ergative		be	&lt;head subject head agr class&gt;	= 1
                                        &lt;head type transitive&gt;		= +
Let class_2_ergative		be      &lt;head subject head agr class&gt;	= 2
                                        &lt;head type transitive&gt;		= +
Let class_3_ergative		be      &lt;head subject head agr class&gt;	= 3
                                        &lt;head type transitive&gt;		= +
Let class_4_ergative		be	&lt;head subject head agr class&gt;	= 4
                                        &lt;head type transitive&gt;		= +
Let class_5_ergative		be      &lt;head subject head agr class&gt;	= 5
                                        &lt;head type transitive&gt;		= +
Let class_6_ergative		be      &lt;head subject head agr class&gt;	= 6
                                        &lt;head type transitive&gt;		= +
Let class_7_ergative		be      &lt;head subject head agr class&gt;	= 7
                                        &lt;head type transitive&gt;		= +
Let class_8_ergative		be      &lt;head subject head agr class&gt;	= 8
                                        &lt;head type transitive&gt;		= +
Let class_9_ergative		be      &lt;head subject head agr class&gt;	= 9
                                        &lt;head type transitive&gt;		= +
Let class_10_ergative 		be      &lt;head subject head agr class&gt;	= 10
                                        &lt;head type transitive&gt;		= +
Let class_11_ergative 		be      &lt;head subject head agr class&gt;	= 11
                                        &lt;head type transitive&gt;		= +
Let class_12_ergative 		be      &lt;head subject head agr class&gt;	= 12
                                        &lt;head type transitive&gt;		= +
Let class_13_ergative 		be      &lt;head subject head agr class&gt;	= 13
                                        &lt;head type transitive&gt;		= +
Let class_14_ergative 		be      &lt;head subject head agr class&gt;	= 14
                                        &lt;head type transitive&gt;		= +
Let class_15_ergative 		be	&lt;head subject head agr class&gt;	= 15
                                        &lt;head type transitive&gt;		= +
Let class_16_ergative 		be	&lt;head subject head agr class&gt;	= 16
                                        &lt;head type transitive&gt;		= +
Let class_17_ergative 		be      &lt;head subject head agr class&gt;	= 17
                                        &lt;head type transitive&gt;		= +
Let class_18_ergative 		be      &lt;head subject head agr class&gt;	= 18
                                        &lt;head type transitive&gt;		= +
Let class_19_ergative 		be      &lt;head subject head agr class&gt;	= 19
                                        &lt;head type transitive&gt;		= +
Let class_20_ergative 		be      &lt;head subject head agr class&gt;	= 20
                                        &lt;head type transitive&gt;		= +
Let class_21_ergative 		be      &lt;head subject head agr class&gt;	= 21
                                        &lt;head type transitive&gt;		= +
Let class_22_ergative 		be      &lt;head subject head agr class&gt;	= 22
                                        &lt;head type transitive&gt;		= +
Let class_23_ergative 		be      &lt;head subject head agr class&gt;	= 23
                                        &lt;head type transitive&gt;		= +
Let class_24_ergative 		be      &lt;head subject head agr class&gt;	= 24
                                        &lt;head type transitive&gt;		= +
Let class_25_ergative 		be      &lt;head subject head agr class&gt;	= 25
                                         &lt;head type transitive&gt;	= +
Let class_animal_object		be	&lt;head object head agr class&gt;	= animal
Let class_insect_object		be	&lt;head object head agr class&gt;	= insect
Let class_liquid_object		be	&lt;head object head agr class&gt;	= liquid
Let class_round_object		be	&lt;head object head agr class&gt;	= round
Let class_cylinder_object		be	&lt;head object head agr class&gt;	= cylinder
Let class_sphere_object		be	&lt;head object head agr class&gt;	= sphere
Let class_tree_object		be	&lt;head object head agr class&gt;	= tree
Let class_wood_object		be	&lt;head object head agr class&gt;	= wood
Let class_other_object		be	&lt;head object head agr class&gt;	= other
Let class_1_object		be      &lt;head object head agr class&gt;	= 1
Let class_2_object		be      &lt;head object head agr class&gt;      = 2
Let class_3_object		be      &lt;head object head agr class&gt;      = 3
Let class_4_object		be      &lt;head object head agr class&gt;      = 4
Let class_5_object		be      &lt;head object head agr class&gt;      = 5
Let class_6_object		be      &lt;head object head agr class&gt;      = 6
Let class_7_object		be      &lt;head object head agr class&gt;      = 7
Let class_8_object		be      &lt;head object head agr class&gt;      = 8
Let class_9_object		be      &lt;head object head agr class&gt;      = 9
Let class_10_object		be      &lt;head object head agr class&gt;      = 10
Let class_11_object		be      &lt;head object head agr class&gt;      = 11
Let class_12_object		be      &lt;head object head agr class&gt;      = 12
Let class_13_object		be      &lt;head object head agr class&gt;      = 13
Let class_14_object		be      &lt;head object head agr class&gt;      = 14
Let class_15_object		be      &lt;head object head agr class&gt;      = 15
Let class_16_object		be      &lt;head object head agr class&gt;      = 16
Let class_17_object		be      &lt;head object head agr class&gt;      = 17
Let class_18_object		be      &lt;head object head agr class&gt;      = 18
Let class_19_object		be      &lt;head object head agr class&gt;      = 19
Let class_20_object		be      &lt;head object head agr class&gt;      = 20
Let class_21_object		be      &lt;head object head agr class&gt;      = 21
Let class_22_object		be      &lt;head object head agr class&gt;      = 22
Let class_23_object		be      &lt;head object head agr class&gt;      = 23
Let class_24_object		be      &lt;head object head agr class&gt;      = 24
Let class_25_object		be      &lt;head object head agr class&gt;      = 25
Let class_animal_subject		be	&lt;head subject head agr class&gt;	= animal
Let class_insect_subject		be	&lt;head subject head agr class&gt;	= insect
Let class_liquid_subject		be	&lt;head subject head agr class&gt;	= liquid
Let class_round_subject		be	&lt;head subject head agr class&gt;	= round
Let class_cylinder_subject		be	&lt;head subject head agr class&gt;	= cylinder
Let class_sphere_subject		be	&lt;head subject head agr class&gt;	= sphere
Let class_tree_subject		be	&lt;head subject head agr class&gt;	= tree
Let class_wood_subject		be	&lt;head subject head agr class&gt;	= wood
Let class_other_subject		be	&lt;head subject head agr class&gt;	= other
Let class_1_subject		be      &lt;head subject head agr class&gt;     = 1
Let class_2_subject		be      &lt;head subject head agr class&gt;     = 2
Let class_3_subject		be      &lt;head subject head agr class&gt;     = 3
Let class_4_subject		be      &lt;head subject head agr class&gt;     = 4
Let class_5_subject		be      &lt;head subject head agr class&gt;     = 5
Let class_6_subject		be      &lt;head subject head agr class&gt;     = 6
Let class_7_subject		be      &lt;head subject head agr class&gt;     = 7
Let class_8_subject		be      &lt;head subject head agr class&gt;     = 8
Let class_9_subject		be      &lt;head subject head agr class&gt;     = 9
Let class_10_subject		be      &lt;head subject head agr class&gt;     = 10
Let class_11_subject		be      &lt;head subject head agr class&gt;     = 11
Let class_12_subject		be      &lt;head subject head agr class&gt;     = 12
Let class_13_subject		be      &lt;head subject head agr class&gt;     = 13
Let class_14_subject		be      &lt;head subject head agr class&gt;     = 14
Let class_15_subject		be      &lt;head subject head agr class&gt;     = 15
Let class_16_subject		be      &lt;head subject head agr class&gt;     = 16
Let class_17_subject		be      &lt;head subject head agr class&gt;     = 17
Let class_18_subject		be      &lt;head subject head agr class&gt;     = 18
Let class_19_subject		be      &lt;head subject head agr class&gt;     = 19
Let class_20_subject		be      &lt;head subject head agr class&gt;     = 20
Let class_21_subject		be      &lt;head subject head agr class&gt;     = 21
Let class_22_subject		be      &lt;head subject head agr class&gt;     = 22
Let class_23_subject		be      &lt;head subject head agr class&gt;     = 23
Let class_24_subject		be      &lt;head subject head agr class&gt;     = 24
Let class_25_subject		be      &lt;head subject head agr class&gt;     = 25
Let comma	                be      &lt;head type comma&gt;			= +
Let comp	                be      &lt;head type comp&gt;			= +
Let comp_prefix                 be      &lt;head type prefix comp&gt;		= +
Let comp_suffix	                be      &lt;head type suffix comp&gt;		= +
Let comparative_prefix                 be      &lt;head type prefix comparative&gt;		= +
Let comparative_suffix	                be      &lt;head type suffix comparative&gt;		= +
Let comparative			be      &lt;head type comparative&gt;		 = +
Let compareAdj			be      &lt;head type compareAdj&gt;		 = +
Let compareN			be      &lt;head type compareN&gt;		 = +
Let completive	                be      &lt;head infl aspect&gt; = completive
Let compound                    be      &lt;head type compound&gt;		= +
Let -compound                   be      &lt;head type compound&gt;		= -
Let conditional		be      &lt;head infl mood&gt;  = conditional
Let conditional_prefix                 be      &lt;head type prefix conditional&gt;		= +
Let conditional_suffix	                be      &lt;head type suffix conditional&gt;		= +
Let conj_prefix                 be      &lt;head type prefix conj&gt;		= +
Let conj_prefix_neg                 be      &lt;head conj head infl polarity&gt;		= negative
Let conj_prefix_pl                be      &lt;head conj head agr number&gt;		= plural
Let conj_suffix	                be      &lt;head type suffix conj&gt;		= +
Let conj_suffix_neg                 be      &lt;head conj head infl polarity&gt; = negative
Let conj_suffix_pl                be      &lt;head conj head agr number&gt;		= plural
Let conjoins_DP                 be      &lt;head type conjoins_DP&gt;		= +
Let conjoins_IP                 be      &lt;head type conjoins_IP&gt;		= +
Let -conjoins_DP                be      &lt;head type conjoins_DP&gt;		= -
Let -conjoins_IP                be      &lt;head type conjoins_IP&gt;		= -
Let contemplative	        be      &lt;head infl aspect &gt; = contemplative
Let continuative	        be      &lt;head infl aspect &gt; = continuative
Let contrafactual	        be      &lt;head infl aspect &gt;	= contrafactual
Let copular                     be      &lt;head type copular&gt;		= +
Let copular_prefix              be      &lt;head type prefix copular&gt;	= +
					      [copular]
Let copular_suffix              be      &lt;head type suffix copular&gt;	= +
                                              [copular]
Let CP-final	                be      &lt;head type CP-final&gt;		= +
                                        &lt;head type CP-initial&gt;		= -
Let -CP-final                   be      &lt;head type CP-final&gt;		= -
Let CP-initial                  be      &lt;head type CP-initial&gt;		= +
                                        &lt;head type CP-final&gt;		= -
Let -CP-initial	be      &lt;head type CP-initial&gt;		= -
Let CP-specifier-initial	be      &lt;head type CP-specifier-initial&gt;	= +
Let dative			be      &lt;head case&gt; = dative
Let -dative			be      &lt;head case&gt; = {nominative accusative genitive}
Let -dativeErg		be      &lt;head case&gt; = {ergative absolutive genitive}
Let dative.or.absolutive	be      &lt;head case&gt; = {dative absolutive}
Let dative.or.ergative	be      &lt;head case&gt; = {dative ergative}
Let dative.or.accusative	be      &lt;head case&gt; = {dative accusative}
Let dative.or.genitive	be      &lt;head case&gt; = {dative genitive}
Let dative.or.nominative	be      &lt;head case&gt; = {dative nominative}
Let declarative	be                      &lt;head infl mood &gt;	= declarative
Let definite                  be      &lt;head type definite&gt;          = +
Let ditransitive		be      &lt;head type ditransitive&gt;		= +
                                        &lt;head type transitive&gt;		= +
Let DP-final			be      &lt;head type DP-final&gt;		= +
                                        &lt;head type DP-initial&gt;            = -
Let -DP-final			be      &lt;head type DP-final&gt;		= -
Let DP-initial			be      &lt;head type DP-initial&gt;		= +
                                        &lt;head type DP-final&gt;		= -
Let -DP-initial			be      &lt;head type DP-initial&gt;		= -
Let dual			be      &lt;head agr number&gt; = dual
Let dual_absolutive		be      { [head:[object:[head:[agr:[number:dual]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[number:dual]]]
                                                 type:[transitive:-]]] }
Let dual_ergative		be      &lt;head subject head agr number&gt; = dual
                                        &lt;head type transitive&gt;		= +
Let dual_object			be      &lt;head object head agr number&gt; = dual
Let dual_subject		be      &lt;head subject head agr number&gt; = dual
Let embedded_CP			be      &lt;embedded cat&gt; = CP
Let embedded_causative_IP            be      &lt;head infl valence &gt; = causative
                                                                              [embedded: [cat:IP
                                                                                                      head:[infl:[finite:-]]
                                                                                                                 subject:[head:[type:[pro-drop:+]]]]]                                                                                                  
Let embedded_causative_VP            be      &lt;head infl valence &gt; = causative
                                                                                [embedded: [cat:VP
                                                                                                        head: [infl:[finite:-]]]]
Let embedded_IP			be      &lt;embedded cat&gt; = IP
Let embedded_IPpro-dropOrCP	be	{[embedded: [cat:IP
                                                     head: [subject:[head:[type:[pro-drop:+]]]]]]
                                                                             [embedded: [cat:CP
                                                     head: [subject:[head:[type:[pro-drop:-]]]]]] }
Let embedded_finite		be      &lt;embedded head infl finite&gt;        = +
                                        &lt;embedded head type question&gt;      = !-
Let embedded_-finite		be      &lt;embedded head infl finite&gt;        = -
                                        &lt;embedded head type question&gt;      = !-
Let embedded_perfective		be      &lt;embedded head infl aspect &gt; = perfective
Let embedded_pro-drop		be      &lt;embedded head subject head type pro-drop&gt; = +
Let embedded_question		be      &lt;embedded head type question&gt;      = +
Let embedded_-question		be      &lt;embedded head type question&gt;      = -
Let embedded_question_allowed	be	{[embedded: [head: [type: [question:+]]]]
                                                                                [embedded: [head: [type: [question:-]]]]} 
Let embedded_raising                       be      {[embedded: [cat:IP
                                                                                                     head: [subject:[head:[type:[pro-drop:+]]]]]]
                                                                             [embedded: [cat:IP
                                                                                                     head: [subject:[head:[type:[pro-drop:-]]]
                                                                                                                  infl:[finite:+]]]]}
Let embedded_subjunctive	be      &lt;embedded head infl mood &gt; = irrealis
Let emphatic			be      &lt;head type emphatic&gt;		 = +
Let equalAdj			be      &lt;head type equalAdj&gt;		 = +
Let equalN			            be      &lt;head type equalN&gt;		 = +
Let ergative			            be      &lt;head case&gt; = ergative
Let -ergative			be      &lt;head case&gt; = {absolutive genitive dative}
Let ergative.or.absolutive	be      &lt;head case&gt; = {ergative absolutive}
Let ergative.or.dative	be      &lt;head case&gt; = {ergative dative}
Let ergative.or.genitive	be      &lt;head case&gt; = {ergative genitive}
Let ergative_prefix   	be	&lt;head type prefix ergative&gt;   = +
                                                         [ergative]
Let ergative_suffix   	be	&lt;head type suffix ergative&gt;   = +
                                                         [ergative]
Let exclusive			be      &lt;head agr person&gt; = first_exclusive
Let excl-initial		be      &lt;head type excl-initial&gt;           = +
Let excl-final	                be      &lt;head type excl-final&gt;		 = +
Let exist                     be      &lt;head type existential&gt;		= +
Let experiencer                     be      &lt;head subject head case&gt;		= dative
Let feminine	                be      &lt;head agr gender&gt; = feminine
Let feminine_absolutive		be      { [head:[object:[head:[agr:[gender:feminine]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[gender:feminine]]]
                                                 type:[transitive:-]]] }
Let feminine_ergative	        be      &lt;head subject head agr gender&gt; = feminine
                                        &lt;head type transitive&gt; = +
Let feminine_object	        be      &lt;head object head agr gender&gt; = feminine
Let feminine_subject	        be      &lt;head subject head agr gender&gt; = feminine
Let finite                      be      &lt;head infl finite&gt;                 = +
Let -finite                     be      &lt;head infl finite&gt;                 = -
Let first			be      &lt;head agr person&gt; = first
Let first_exclusive		be      &lt;head agr person&gt; = first_exclusive
Let first_exclusive_absolutive  be      { [head:[object:[head:[agr:[person:first_exclusive]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[person:first_exclusive]]]
                                                 type:[transitive:-]]] }
Let first_exclusive_ergative    be      &lt;head subject head agr person&gt; = first_exclusive
                                        &lt;head type transitive&gt; = +
Let first_exclusive_subject	be      &lt;head subject head agr person&gt; = first_exclusive
Let first_exclusive_object	be      &lt;head object head agr person&gt; = first_exclusive
Let first_inclusive		be      &lt;head agr person&gt; = first_inclusive
Let first_inclusive_absolutive	be      { [head:[object:[head:[agr:[person:first_inclusive]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[person:first_inclusive]]]
                                                 type:[transitive:-]]] }
Let first_inclusive_ergative    be      &lt;head subject head agr person&gt; = first_inclusive
                                        &lt;head type transitive&gt; = +
Let first_inclusive_subject     be      &lt;head subject head agr person&gt; = first_inclusive
Let first_inclusive_object	be      &lt;head object head agr person&gt; = first_inclusive
Let first_absolutive		be      { [head:[object:[head:[agr:[person:first]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[person:first]]]
                                                 type:[transitive:-]]] }
Let first_ergative	        be      &lt;head subject head agr person&gt; = first
                                        &lt;head type transitive&gt; = +
Let first_object	        be      &lt;head object head agr person&gt; = first
Let first_subject		be      &lt;head subject head agr person&gt; = first
Let firsthand               	        be      &lt;head infl evidentiality&gt;  = firsthand
Let focus			be      &lt;head type focus&gt; = +
Let focus-initial		be      &lt;head type focus-initial&gt; = +
Let focus-final			be      &lt;head type focus-final&gt; = +
Let future			be      &lt;head infl tense&gt; = future
Let -future			be      &lt;head infl tense&gt; = nonfuture
Let generic			            be      &lt;head type generic&gt; = +
Let genitive			            be      &lt;head case&gt; = genitive
Let -genitive			be      &lt;head case&gt; = {nominative accusative}
Let genitive.or.accusative	be      &lt;head case&gt; = {genitive accusative}
Let genitive.or.dative	            be      &lt;head case&gt; = {genitive dative}
Let genitive.or.nominative	be      &lt;head case&gt; = {genitive nominative}
Let genitive_prefix   	be	&lt;head type prefix genitive&gt;   = +
                                                      [genitive]
Let genitive_suffix   	be	&lt;head type suffix genitive&gt;   = +
                                                      [genitive]
Let gerund			be      &lt;head type gerund&gt;	= +
Let habitual			be      &lt;head infl aspect&gt;     = habitual
Let hearsay               	        be      &lt;head infl evidentiality&gt;  = hearsay
Let human			be      &lt;head agr animacy &gt;  = human
Let human_absolutive		be      { [head:[object:[head:[agr:[animacy:human]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[animacy:human]]]
                                                 type:[transitive:-]]] }
Let human_ergative	        be      &lt;head subject head agr animacy &gt;  = human
                                        &lt;head type transitive&gt; = +
Let human_object	        be      &lt;head object head agr animacy &gt;  = human
Let human_subject		be      &lt;head subject head agr animacy &gt;  = human
Let -human			be      &lt;head agr animacy &gt;  = nonhuman
Let -human_absolutive           be      { [head:[object:[head:[agr:[animacy:nonhuman]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[animacy:nonhuman]]]
                                                 type:[transitive:-]]] }
Let -human_ergative	        be      &lt;head subject head agr animacy &gt;  = nonhuman
                                        &lt;head type transitive&gt; = +
Let -human_object	        be      &lt;head object head agr animacy &gt;  = nonhuman
Let -human_subject		be      &lt;head subject head agr animacy &gt;  = nonhuman
Let imperative		be      &lt;head infl mood &gt;     = imperative
Let imperfect			be      &lt;head infl aspect&gt;     = imperfect
Let imperfective		be      &lt;head infl aspect &gt;     = imperfective
Let inclusive			be      &lt;head agr person&gt; = first_inclusive
Let incompletive		be      &lt;head infl aspect &gt;     = incompletive 
Let indefinite                  be      &lt;head type definite&gt;          = -
                                        &lt;head type relative&gt;            = -
Let indicative       	be                      &lt;head infl mood &gt;	= indicative
Let inferential               	        be      &lt;head infl evidentiality&gt;  = inferential
Let infinitive                  be      &lt;head infl finite&gt;              = -
Let instrumental		be      &lt;head case&gt; = instrumental
Let interrogative		be      &lt;head infl mood &gt;  = interrogative
                                        &lt;head type question&gt;           = +
Let -interrogative	        be      &lt;head type question&gt;           = -
Let intransitive		be      &lt;head type transitive&gt;	= -
Let irrealis			be      &lt;head infl mood &gt;  = irrealis
Let locative			be      &lt;head type locative&gt;	= +
Let locative_case            be      &lt;head case&gt;   = locative
Let manner			be      &lt;head type manner&gt;           = +
Let masculine			be      &lt;head agr gender&gt; = masculine
Let masculine_absolutive	be      { [head:[object:[head:[agr:[gender:masculine]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[gender:masculine]]]
                                                 type:[transitive:-]]] }
Let masculine_ergative          be      &lt;head subject head agr gender&gt; = masculine
                                        &lt;head type transitive&gt; = +
Let masculine_object	        be      &lt;head object head agr gender&gt; = masculine
Let masculine_subject		be      &lt;head subject head agr gender&gt; = masculine
Let mass                        be      &lt;head type mass&gt;     = +
Let modifies_Adj		be      &lt;head type modifies_Adj&gt; = +
Let modifies_Adv		be      &lt;head type modifies_Adv temporal&gt; = +
                                        &lt;head type modifies_Adv locative&gt; = +
                                        &lt;head type modifies_Adv manner&gt; = +
                                        &lt;head type modifies_Adv reason&gt; = +
Let modifies_Adv-reason         be      &lt;head type modifies_Adv reason&gt; = -
                                        &lt;head type modifies_Adv locative&gt; = +
                                        &lt;head type modifies_Adv manner&gt; = +
                                        &lt;head type modifies_Adv temporal&gt; = +
Let modifies_locative	        be      &lt;head type modifies_Adv locative&gt; = +
Let modifies_manner		be      &lt;head type modifies_Adv manner&gt; = +
Let modifies_NP			be      &lt;head type modifies_NP&gt; = +
Let modifies_PP			be      &lt;head type modifies_PP&gt; = +
Let modifies_Q			be      &lt;head type modifies_Q&gt;	= +
Let modifies_reason		be      &lt;head type modifies_Adv reason&gt; = +
Let modifies_temporal		be      &lt;head type modifies_Adv temporal&gt; = +
Let motion			be      &lt;head type motion&gt; = +
Let negative			be      &lt;head infl polarity &gt;  = negative
Let negative_prefix		be      &lt;head type prefix negative&gt;   = +
						 [negative]
Let negative_suffix             be      &lt;head type suffix negative&gt;   = +
                                                 [negative]
Let negative-polarity	        be      &lt;head type negative-polarity&gt;            = +
                                                 [negative]
Let negative-polarity_prefix    be      &lt;head type prefix negative-polarity&gt;   = +
						 [negative_prefix]
Let negative-polarity_suffix    be      &lt;head type suffix negative-polarity&gt;   = +
                                                 [negative_suffix]
Let neuter	                be      &lt;head agr gender&gt; = neuter
Let neuter_absolutive		be      { [head:[object:[head:[agr:[gender:neuter]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[gender:neuter]]]
                                                 type:[transitive:-]]] }
Let neuter_ergative	        be      &lt;head subject head agr gender&gt; = neuter
                                        &lt;head type transitive&gt; = +
Let neuter_object	        be      &lt;head object head agr gender&gt; = neuter
Let neuter_subject		be      &lt;head subject head agr gender&gt; = neuter
Let nominative			be      &lt;head case&gt; = nominative
Let -nominative			be      &lt;head case&gt; = {accusative genitive}
Let nominative.or.accusative	be      &lt;head case&gt; = {nominative accusative}
Let nominative.or.genitive	be      &lt;head case&gt; = {nominative genitive}
Let nonwitness               	        be      &lt;head infl evidentiality&gt;  = nonwitness
Let oblique                     be      &lt;head type oblique&gt;             = +
Let oblique_case                     be      &lt;head case&gt;             = oblique
Let olfactory               	        be      &lt;head infl evidentiality&gt;  = olfactory
Let participle                  be      &lt;head type participle&gt;          = +
Let partitive			be      &lt;head type partitive&gt;	= +
Let passive			be      &lt;head infl valence &gt;	= passive
Let passive.optional		be      &lt;head infl valence &gt;	= {passive active}
Let past			be      &lt;head infl tense&gt;          =  past
Let -past			be      &lt;head infl tense&gt;          =  nonpast
Let perception                                   be      &lt;head type perception&gt;		= +
Let perfect	                                    be      &lt;head infl aspect &gt;	= perfect
Let perfective		be      &lt;head infl aspect &gt;	= perfective
Let plural			be      &lt;head agr number&gt; = plural
Let plural_absolutive		be      { [head:[object:[head:[agr:[number:plural]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[number:plural]]]
                                                 type:[transitive:-]]] }
Let plural_ergative	        be      &lt;head subject head agr number&gt; = plural
                                        &lt;head type transitive&gt; = +
Let plural_object		be      &lt;head object head agr number&gt; = plural
Let plural_subject		be      &lt;head subject head agr number&gt; = plural
Let poss_class_animal		be      &lt;head possessor head agr class&gt;		      = animal
Let poss_class_insect		be      &lt;head possessor head agr class&gt;		      = insect
Let poss_class_liquid		be      &lt;head possessor head agr class&gt;		      = liquid
Let poss_class_round		be      &lt;head possessor head agr class&gt;		      = round
Let poss_class_cylinder	be      &lt;head possessor head agr class&gt;		      = cylinder
Let poss_class_sphere		be      &lt;head possessor head agr class&gt;		      = sphere
Let poss_class_tree		be      &lt;head possessor head agr class&gt;		      = tree
Let poss_class_wood		be      &lt;head possessor head agr class&gt;		      = wood
Let poss_class_other		be      &lt;head possessor head agr class&gt;		      = other
Let poss_class_1		be      &lt;head possessor head agr class&gt; = 1
Let poss_class_2		be      &lt;head possessor head agr class&gt; = 2
Let poss_class_3		be      &lt;head possessor head agr class&gt; = 3
Let poss_class_4		be      &lt;head possessor head agr class&gt; = 4
Let poss_class_5		be      &lt;head possessor head agr class&gt; = 5
Let poss_class_6		be      &lt;head possessor head agr class&gt; = 6
Let poss_class_7		be      &lt;head possessor head agr class&gt; = 7
Let poss_class_8		be      &lt;head possessor head agr class&gt; = 8
Let poss_class_9		be      &lt;head possessor head agr class&gt; = 9
Let poss_class_10		be      &lt;head possessor head agr class&gt; = 10
Let poss_class_11		be      &lt;head possessor head agr class&gt; = 11
Let poss_class_12		be      &lt;head possessor head agr class&gt; = 12
Let poss_class_13		be      &lt;head possessor head agr class&gt; = 13
Let poss_class_14		be      &lt;head possessor head agr class&gt; = 14
Let poss_class_15		be      &lt;head possessor head agr class&gt; = 15
Let poss_class_16		be      &lt;head possessor head agr class&gt; = 16
Let poss_class_17		be      &lt;head possessor head agr class&gt; = 17
Let poss_class_18		be      &lt;head possessor head agr class&gt; = 18
Let poss_class_19		be      &lt;head possessor head agr class&gt; = 19
Let poss_class_20		be      &lt;head possessor head agr class&gt; = 20
Let poss_class_21		be      &lt;head possessor head agr class&gt; = 21
Let poss_class_22		be      &lt;head possessor head agr class&gt; = 22
Let poss_class_23		be      &lt;head possessor head agr class&gt; = 23
Let poss_class_24		be      &lt;head possessor head agr class&gt; = 24
Let poss_class_25		be      &lt;head possessor head agr class&gt; = 25
Let poss_animate		be      &lt;head possessor head agr animacy&gt; = animate
Let poss_cooccur			be      &lt;head type cooccur&gt;	       = +
Let poss_dual			be      &lt;head possessor head agr number&gt; = dual
Let poss_exclusive		be      &lt;head possessor head agr person&gt; = first_exclusive
Let poss_feminine		be      &lt;head possessor head agr gender&gt; = feminine
Let poss_first			be      &lt;head possessor head agr person&gt; = first
Let poss_human			be      &lt;head possessor head agr animacy &gt; = human
Let poss_inanimate		be      &lt;head possessor head agr animacy&gt; = animate
Let poss_inclusive		be      &lt;head possessor head agr person&gt; = first_inclusive
Let poss_masculine		be      &lt;head possessor head agr gender&gt; = masculine
Let poss_neuter			be      &lt;head possessor head agr gender&gt; = neuter
Let poss_nonhuman		be      &lt;head possessor head agr animacy&gt; =  human
Let poss_plural			be      &lt;head possessor head agr number&gt; = plural
Let poss_second			be      &lt;head possessor head agr person&gt; = second
Let poss_singular		be      &lt;head possessor head agr number&gt; = singular
Let poss_third			be      &lt;head possessor head agr person&gt; = third 
Let poss_prefix			be      &lt;head type prefix poss&gt;	       = +
Let poss_suffix			be      &lt;head type suffix poss&gt;	       = +
Let possessed			be      &lt;head type possessed&gt;	       = +
Let possessive			be      &lt;head type possessive&gt;	       = +
Let potential			be      &lt;head infl aspect &gt;     = potential
Let present			be      &lt;head infl tense&gt;       =  present
Let progressive			be      &lt;head infl aspect &gt;     = progressive
Let proper			be      &lt;head type proper&gt;	       = +
Let PP				be      &lt;head type PP&gt;		       = +
Let PP-final			be      &lt;head type PP-final&gt;	       = +
                                                         &lt;head type PP-initial&gt;	       = -
Let    PP-initial			be      &lt;head type PP-initial&gt;	       = +
                                                                  &lt;head type PP-final&gt;	       = -
Let P_prefix			be      &lt;head type prefix P&gt;	       = +
Let P_suffix			be      &lt;head type suffix P&gt;	       = +
Let purposive		be      &lt;head infl aspect&gt;     = purposive
Let question			be      &lt;head type question&gt;	       = +
Let -question			be      &lt;head type question&gt;	       = -
Let QP-final			be      &lt;head type QP-final&gt;	       = +
                                                       &lt;head type QP-initial&gt;	       = -
Let QP-initial			be      &lt;head type QP-initial&gt;	       = +
                                                                   &lt;head type QP-final&gt;	       = -
Let quantifier	                be      &lt;head type quantifier&gt;	       = +
Let quantifier_prefix		be      &lt;head type prefix quantifier&gt;    = +
						 [quantifier]
Let quantifier_suffix           be      &lt;head type suffix quantifier&gt;    = +
                                                 [quantifier]
Let quotative               	        be      &lt;head infl evidentiality&gt;  = quotative
Let reason	                be      &lt;head type reason&gt;	       = +
Let realis			be      &lt;head infl mood &gt;     = realis
Let reciprocal			be      &lt;head type reciprocal&gt;	       = +
Let reflexive			be      &lt;head type reflexive&gt;	       = +
Let relative			be      &lt;head type relative&gt;	       = +
Let relative_prefix		be      &lt;head type prefix relative&gt;      = +
Let relative_suffix		be      &lt;head type suffix relative&gt;      = +
Let reportative               	        be      &lt;head infl evidentiality&gt;  = reportative
Let root			be      &lt;head type root&gt;		       = +
Let +root			be      &lt;head type root&gt;		       = +
Let -root			be      &lt;head type root&gt;		       = -
Let second			be      &lt;head agr person&gt; = second
Let second_absolutive		be      { [head:[object:[head:[agr:[person:second]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[person:second]]]
                                                 type:[transitive:-]]] }
Let second_ergative		be      &lt;head subject head agr person&gt; = second
                                        &lt;head type transitive&gt;	       = +
Let second_object		be      &lt;head object head agr person&gt; = second
Let second_subject		be      &lt;head subject head agr person&gt; = second
Let secondhand               	        be      &lt;head infl evidentiality&gt;  = secondhand
Let sentential			be      &lt;head type sentential&gt;	       = +
Let sentential_with_object	be      &lt;head type sentential_with_object&gt; = +
Let singular			be      &lt;head agr number&gt; = singular
Let singular_absolutive		be      { [head:[object:[head:[agr:[number:singular]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[number:singular]]]
                                                 type:[transitive:-]]] }
Let singular_ergative	        be      &lt;head subject head agr number&gt; = singular
                                        &lt;head type transitive&gt;	       = +
Let singular_object	        be      &lt;head object head agr number&gt; = singular
Let singular_subject		be      &lt;head subject head agr number&gt; = singular
Let stand-alone			be      &lt;head type stand-alone&gt;          = +
Let stative			be      &lt;head infl aspect&gt;  = stative
Let subjunctive		be      &lt;head infl mood&gt;  = subjunctive
Let subjunctive_conditional	be      &lt;head type subjunctive_conditional&gt;  = +
Let subjunctive_conditional_prefix                 be      &lt;head type prefix subjunctive_conditional&gt;		= +
Let subjunctive_conditional_suffix	                be      &lt;head type suffix subjunctive_conditional&gt;		= +
Let superlative_prefix                 be      &lt;head type prefix superlative&gt;		= +
Let superlative_suffix	                be      &lt;head type suffix superlative&gt;		= +
Let takes_Adv			be      &lt;head type takes_Adv&gt;	       = +
Let takes_DP			be      &lt;head type takes_DP&gt;	       = +
Let temporal			be      &lt;head type temporal&gt; = +
Let third			be      &lt;head agr person&gt; = third
Let third_absolutive		be      { [head:[object:[head:[agr:[person:third]]]
                                                 type:[transitive:+]]]
                                          [head:[subject:[head:[agr:[person:third]]]
                                                 type:[transitive:-]]] }
Let third_ergative	        be      &lt;head subject head agr person&gt; = third
                                        &lt;head type transitive&gt; = +
Let third_object		be      &lt;head object head agr person&gt; = third
Let third_subject		be      &lt;head subject head agr person&gt; = third
Let thirdhand               	        be      &lt;head infl evidentiality&gt;  = thirdhand
Let topic			be      &lt;head type topic&gt; = +
Let topic-initial		be      &lt;head type topic-initial&gt;	       = +
Let topic-final			be      &lt;head type topic-final&gt;	       = +
Let transitive			be      &lt;head type transitive&gt;	       = +
Let unreal               	        be      &lt;head infl aspect&gt;  = unreal
Let visual               	        be      &lt;head infl evidentiality&gt;  = visual
Let vocative               	        be      &lt;head case&gt;  = vocative
Let witness               	        be      &lt;head infl evidentiality&gt;  = witness
Let wh				be      &lt;head type wh&gt;		       = +
Let -wh				be      &lt;head type wh&gt;		       = -
Let whQ				be      &lt;head type whQ&gt;		       = +
Let whQ_prefix			be      &lt;head type prefix whQ&gt;	       = +
Let whQ_suffix			be      &lt;head type suffix whQ&gt;	       = +
Let YNQ				be      &lt;head type YNQ&gt;		       = +
Let YNQ_prefix			be      &lt;head type prefix YNQ&gt;	       = +
Let YNQ_suffix			be      &lt;head type suffix YNQ&gt;	       = +
 
        
Let Adj	                        be      &lt;cat&gt; = !Adj
                                        &lt;head type ordinal&gt;	       = !-
                                        &lt;head type wh&gt;		       = !-
                                        &lt;head type sentential&gt;	       = !-
                                        &lt;head type clausal-comp&gt;	       = !-
                                        &lt;head type focusmarked&gt;	       = -
                                        &lt;head type gerund&gt;      	       = -
                                        &lt;head type participle&gt;	       = -
                                        &lt;head type comma&gt;		       = !-
                                        &lt;head type topic&gt;		       = !-
                                        &lt;head type prefix conj&gt;	      = !-
                                        &lt;head type suffix conj&gt;	       = !-
                                        
Let Adv                          be     &lt;cat&gt; = !Adv
                                        &lt;head type wh&gt;                   = !-
                                        &lt;head type manner&gt;	       = !-
                                        &lt;head type existential&gt;	       = !-
                                        &lt;head type takes_Adv&gt;	       = !-
                                        &lt;head type takes_DP&gt;	       = !-
                                        &lt;head type sentential&gt;	       = !-
                                        &lt;embedded cat&gt;		       = !none
                                        &lt;head type gerund&gt;      	       = -
                                        &lt;head type participle&gt;	       = -
                                        &lt;head type comma&gt;		       = !-
                                        &lt;head type prefix conj&gt;	      = !-
                                        &lt;head type suffix conj&gt;	       = !-
</xsl:text>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
                                        &lt;head type negative-polarity&gt;    = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let Art                           be     &lt;cat&gt; = !Art
                                         &lt;head type wh&gt;			= !-
                                         &lt;head type focusmarked&gt;		= -
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type topic&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//typology/@case)!='ergative' and normalize-space(//np/@artCase)='yes'">
<xsl:text>
                                         &lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possCooccur)='some'">
<xsl:text>
                                          &lt;head type cooccur&gt;            = !-
   </xsl:text>
</xsl:if>
<xsl:text>

Let Aux	                          be     &lt;cat&gt; = !Aux
                                          &lt;head infl valence&gt;		= !active
                                         &lt;head infl polarity&gt;		= !positive
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type existential&gt;		= -
                                         &lt;head infl finite&gt;		= !+
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type topic&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         
Let C				  be     &lt;cat&gt; = !C
                                         &lt;head type question&gt;		= !-
                                         &lt;head type relative&gt;		= !-
                                         &lt;embedded cat&gt;			= !none
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
   </xsl:text>
<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@mainContVSOBeforeWh)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@mainContVSOBeforeWh)='some' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@embContVSOBeforeWh)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@embContVSOBeforeWh)='some'">
<xsl:text>
                                         &lt;head type CP-specifier-initial&gt; = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let Case                        be     &lt;cat&gt; = !Case
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-

Let Class                        be     &lt;cat&gt; = !Class
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-

Let Cond                          be     &lt;cat&gt; = !Cond
                                          &lt;head infl mood&gt;	       = !conditional
                                          &lt;head type subjunctive_conditional&gt;	 = !-
                                          &lt;head type comma&gt;		 = !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-


Let Conj                          be     &lt;cat&gt; = !Conj
                                          &lt;head infl polarity&gt;	       = !positive
                                          &lt;head agr number&gt;	       = !singular
                                          &lt;head type comma&gt;		 = !-
                                         &lt;head type comparative&gt;		 = !-
                                         &lt;head type compareAdj&gt;		 = !-
                                         &lt;head type compareN&gt;		 = !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                        
Let Conseq                         be     &lt;cat&gt; = !Conseq
                                        &lt;head type comma&gt;		 = !-
                                        &lt;head type prefix conj&gt;	      = !-
                                        &lt;head type suffix conj&gt;	       = !-
                                        

Let Deg                           be     &lt;cat&gt; = !Deg
                                         &lt;head type modifies_Adj&gt;		 = !-
                                         &lt;head type modifies_Adv temporal&gt; = !-
                                         &lt;head type modifies_Adv locative&gt; = !-
                                         &lt;head type modifies_Adv manner&gt;	 = !-
                                         &lt;head type modifies_Adv reason&gt;	 = !-
                                         &lt;head type modifies_NP&gt;		 = !-
                                         &lt;head type modifies_PP&gt;		 = !-
                                         &lt;head type modifies_Q&gt;		 = !-
                                         &lt;head type quantifier&gt;		 = !-
                                         &lt;head type wh&gt;			 = !-
                                         &lt;head type relative&gt;		 = !-
                                         &lt;head type focusmarked&gt;		 = -
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		 = -
                                         &lt;head type comma&gt;		 = !-
                                         &lt;head type topic&gt;		 = !-
                                         &lt;head type comparative&gt;		 = !-
                                         &lt;head type equalAdj&gt;		 = !-
                                         &lt;head type equalN&gt;	            	 = !-
                                         &lt;head type superlative&gt;		 = !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         &lt;head infl polarity&gt;                            =!positive
                                         
Let Dem                            be    &lt;cat&gt; = !Dem
                                         &lt;head type wh&gt;			= !-
                                         &lt;head agr person&gt;		= !third
                                         &lt;head type relative&gt;		= !-
                                         &lt;head type temporal&gt;		= !-
                                         &lt;head type focusmarked&gt;		= -
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type emphatic&gt;		= !-
                                         &lt;head type pronoun&gt;		= -
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type topic&gt;		= !-		
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//typology/@case)!='ergative' and normalize-space(//np/@artCase)='yes'">
<xsl:text>
                                         &lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possCooccur)='some'">
<xsl:text>
                                         &lt;head type cooccur&gt;            = !-
   </xsl:text>
</xsl:if>
<xsl:text>

Let Det                            be    &lt;cat&gt; = !Det
                                         &lt;head type wh&gt;			= !-
                                         &lt;head agr person&gt;		= !third
                                         &lt;head type relative&gt;		= !-
                                         &lt;head type focusmarked&gt;		= -
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type topic&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
   </xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//typology/@case)!='ergative' and normalize-space(//np/@artCase)='yes'">
<xsl:text>
                                         &lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:text>

Let Excl                           be    &lt;cat&gt; = Excl
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         
Let Greet                          be    &lt;cat&gt; = Greet
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         
Let Intj                           be    &lt;cat&gt; = Intj
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         
Let N                              be    &lt;cat&gt; = !N
                                         &lt;head agr person&gt;		= !third
                                         &lt;head agr animacy&gt;		= !inanimate
                                         &lt;head possessor head agr person&gt;		= !none
                                         &lt;head type prefix case&gt;		= !none
                                         &lt;head type suffix case&gt;		= !none
                                         &lt;head type wh&gt;			= -
                                         &lt;head type reciprocal&gt;		= !-
                                         &lt;head type reflexive&gt;		= !-
                                         &lt;head type sentential&gt;		= !-
                                         &lt;head type proper&gt;		= !-
                                         &lt;head type relative&gt;		= !-
                                         &lt;head type mass&gt;			= !-
                                         &lt;head type temporal&gt;		= !-
                                         &lt;head embedded cat&gt;			= !none
                                         &lt;head type focusmarked&gt;		= -
                                         &lt;head type generic&gt;      	       = !-
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type topic&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='no' and normalize-space(//typology/@case)!='ergative'">
<xsl:text>
                                         &lt;head case&gt;            = !none
   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//typology/@case)!='ergative'">
<xsl:text>
                                         &lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<xsl:text>
                                         &lt;head agr number&gt;      = !singular
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<xsl:text>
                                         &lt;head agr gender&gt;      = !masculine
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
<xsl:text>
                                         &lt;head type possessed&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
                                         &lt;head type negative-polarity&gt;    = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/@pType)!='word' and normalize-space(//pp/@attaches)='head'">
<xsl:text>
                                         &lt;head type PP&gt;			= !-
</xsl:text>
</xsl:if>
<xsl:text>
                
                Let Neg                           be     &lt;cat&gt; = !Neg
                                                              &lt;head infl polarity&gt;	 = negative
                                                              &lt;head type comma&gt;	 = !-
                                                              &lt;head type topic&gt;		 = !-
                                                              &lt;head type prefix conj&gt;	 = !-
                                                              &lt;head type suffix conj&gt;	  = !-
                                                              
                Let Num                            be    &lt;cat&gt; = !Num
                                         &lt;head type ordinal&gt;		= !-
                                         &lt;head type wh&gt;			= !-
                                         &lt;head agr number&gt;		= !plural
                                         &lt;head type relative&gt;		= !-
		&lt;head type focusmarked&gt;		= -
		&lt;head type gerund&gt;      	       = -
		&lt;head type participle&gt;		= -
                                         &lt;head type quantifier&gt;		= +
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type topic&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
		</xsl:text>
<xsl:if test="normalize-space(//np/@qpeitherRestrictedNumPos)='after'">
<xsl:text>
                                         &lt;head type DP-final&gt;		= !+
                                         &lt;head type DP-initial&gt;           = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@qpeitherRestrictedNumPos)='before'">
<xsl:text>
                                         &lt;head type DP-final&gt;		= !-
                                         &lt;head type DP-initial&gt;           = !+
</xsl:text>
</xsl:if>
<xsl:text>

Let ordinal                        be    &lt;cat&gt; = Num
                                         &lt;head type ordinal&gt;		= +
                                         &lt;head agr number&gt;		= !plural
                                         &lt;head type focusmarked&gt;		= -
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type topic&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         
Let P                              be    &lt;cat&gt; = !P
                                         &lt;head infl valence&gt;		= !active
                                         &lt;head type wh&gt;			= -
                                         &lt;head type partitive&gt;		= !-
                                         &lt;head type temporal&gt;		= !-
                                         &lt;head type sentential&gt;		= !-
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         
Let Poss                           be    &lt;cat&gt; = Poss
                                         [genitive]
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         
Let Poss_ergative                  be    &lt;cat&gt; = Poss
                                         [ergative]
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         
Let Poss_absolutive                be    &lt;cat&gt; = Poss
                                         [absolutive]
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         
Let Pron                           be    &lt;cat&gt; = !Pron
                                         &lt;head type wh&gt;			= !-
                                         &lt;head agr animacy&gt;		= !animate
                                         &lt;head type reciprocal&gt;		= !-
                                         &lt;head type reflexive&gt;		= !-
                                         &lt;head type possessive&gt;		= !-
                                         &lt;head type relative&gt;		= !-
                                         &lt;head type temporal&gt;		= !-
                                         &lt;head type focusmarked&gt;		= -
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type pronoun&gt;		= !+
                                         &lt;head type emphatic&gt;		= !-
                                         &lt;head type locative&gt;		= !-
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type topic&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
		</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//typology/@case)!='ergative'">
<xsl:text>
                                         &lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<xsl:text>
                                         &lt;head agr number&gt;      = !singular
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<xsl:text>
                                         &lt;head agr gender&gt;      = !masculine
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
                                         &lt;head type negative-polarity&gt;    = !-
</xsl:text>
</xsl:if>
<xsl:text>
                
Let PropN	                   be    &lt;cat&gt; = N
                                         &lt;head agr animacy&gt;		= !animate
                                         &lt;head agr person&gt;		= !third
                                         &lt;head possessor head agr person&gt;		= !none
                                         &lt;head type prefix case&gt;		= !none
                                         &lt;head type suffix case&gt;		= !none
                                         &lt;head type wh&gt;			= -
                                         &lt;head type proper&gt;		= +
                                         &lt;head type reciprocal&gt;		= !-
                                         &lt;head type reflexive&gt;		= !-
                                         &lt;head type sentential&gt;		= !-
                                         &lt;head type relative&gt;		= !-
                                         &lt;head type mass&gt;			= !-
                                         &lt;head type temporal&gt;		= !-
                                         &lt;head type focusmarked&gt;		= -
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type topic&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
		</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='no' and normalize-space(//typology/@case)!='ergative'">
<xsl:text>
                                         &lt;head case&gt;            = !none
   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//typology/@case)!='ergative'">
<xsl:text>
                                         &lt;head case&gt;             = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<xsl:text>
                                         &lt;head agr number&gt;       = !singular
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<xsl:text>
                                         &lt;head agr gender&gt;       = !masculine
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
<xsl:text>
                                         &lt;head type possessed&gt;            = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
                                         &lt;head type negative-polarity&gt;    = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let Q                              be    &lt;cat&gt; = !Q
                                         &lt;head type wh&gt;			= !-
                                         &lt;head type focusmarked&gt;		= -
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type quantifier&gt;		= +
                                         &lt;head type comma&gt;		= !- 
                                         &lt;head type topic&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type modifies_NP&gt;		 = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         
Let V                              be    &lt;cat&gt; = !V
                                         &lt;head infl valence&gt;		= !active
                                         &lt;head type sentential&gt;		= !-
                                         &lt;head type sentential_with_object&gt; = !-
                                         &lt;head type copular&gt;		= !-
                                         &lt;head type existential&gt;		= !-
                                         &lt;head type perception&gt;		= !-
                                         &lt;head type motion&gt;               = !-
                                         &lt;head type reciprocal&gt;		= !-
                                         &lt;head type reflexive&gt;		= !-
                                         &lt;head infl finite&gt;		= !+
                                         &lt;head infl polarity&gt;		= !positive
                                         &lt;head type gerund&gt;      	       = !-
                                         &lt;head type participle&gt;		= !-
                                         &lt;head infl mood&gt; 		= !realis
                                         &lt;head infl mood&gt;                = !declarative
                                         &lt;head embedded cat&gt;			= !none
                                         &lt;head type focusmarked&gt;		= -
                                         &lt;head type pronoun-fronted&gt;      = !-
                                         &lt;head infl voice&gt;		= !actor
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type topic&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         &lt;head type prefix conditional&gt;	      = !-
                                         &lt;head type suffix conditional&gt;	       = !-
                                         &lt;head type prefix subjunctive_conditional&gt;	      = !-
                                         &lt;head type suffix subjunctive_conditional&gt;	       = !-
		</xsl:text>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
                                         &lt;head type negative-polarity&gt;    = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/@mainContCliticAttaches)='head' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/@embContCliticAttaches)='head'">
<xsl:text>
                                         &lt;head type whQ&gt;			= !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/@mainYNCliticAttaches)='head' or normalize-space(//q/@embYNWord)='no' and normalize-space(//q/@embYNCliticAttaches)='head'">
<xsl:text>
                                         &lt;head type YNQ&gt;			= !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//relcl/@type)='IP'">
<xsl:text>
                                         &lt;head type relative&gt;		= !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/@compCliticAttaches)='head'">
<xsl:text>
                                         &lt;head type comp&gt;			= !-
</xsl:text>
</xsl:if>
<xsl:text>
			
		           
Let makeAdj			   be    &lt;cat&gt; = Adj
                                         &lt;head type ordinal&gt;		= !-
                                         &lt;head type wh&gt;			= !-
                                         &lt;head type sentential&gt;		= !-
                                         &lt;head type clausal-comp&gt;		= !-
                                         &lt;head type focusmarked&gt;		= -
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type pronoun&gt;		= -
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type topic&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         
Let makeAdv	                   be	 &lt;cat&gt; = Adv
                                         &lt;head type wh&gt;			= !-
                                         &lt;head type manner&gt;		= !-
                                         &lt;head type existential&gt;	       = !-
                                         &lt;head type takes_Adv&gt;		= !-
                                         &lt;head type takes_DP&gt;		= !-
                                         &lt;head type sentential&gt;		= !-
                                         &lt;head embedded cat&gt;			= !none
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type pronoun&gt;		= -
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
		</xsl:text>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
                                         &lt;head type negative-polarity&gt;    = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let makeArt                        be    &lt;cat&gt; = Art
                                         &lt;head type wh&gt;			= !-
                                         &lt;head type focusmarked&gt;		= -
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type pronoun&gt;		= -
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type topic&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
		</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//typology/@case)!='ergative' and normalize-space(//np/@artCase)='yes'">
<xsl:text>
                                         &lt;head case&gt;           = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possCooccur)='some'">
<xsl:text>
      &lt;head type cooccur&gt;            = !-
   </xsl:text>
</xsl:if>
<xsl:text>

Let makeAux	                   be    &lt;cat&gt; = Aux
                                         &lt;head infl valence&gt;		= !active
                                         &lt;head infl polarity&gt;		= !positive
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type existential&gt;		= -
                                         &lt;head infl finite&gt;		= !+
                                         &lt;head type pronoun&gt;		= -
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         
Let makeC	                   be    &lt;cat&gt; = C
                                         &lt;head type question&gt;		= !-
                                         &lt;head type relative&gt;		= !-
                                         &lt;head embedded cat&gt;			= !none
                                         &lt;head type pronoun&gt;	        = -
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
   </xsl:text>
<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@mainContVSOBeforeWh)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@mainContVSOBeforeWh)='some' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@embContVSOBeforeWh)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@embContVSOBeforeWh)='some'">
<xsl:text>
                                         &lt;head type CP-specifier-initial&gt; = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let makeCase                        be     &lt;cat&gt; = Case
                                             &lt;head type comma&gt;		= !-
                                             &lt;head type prefix conj&gt;	      = !-
                                             &lt;head type suffix conj&gt;	       = !-

Let makeClass                        be     &lt;cat&gt; = Class
                                                  &lt;head type comma&gt;		= !-
                                                 &lt;head type prefix conj&gt;	      = !-
                                                 &lt;head type suffix conj&gt;	       = !-

Let makeCond                          be     &lt;cat&gt; = Cond
                                          &lt;head infl mood&gt;	       = !conditional
                                          &lt;head type subjunctive_conditional&gt;	 = !-
                                          &lt;head type comma&gt;		 = !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-


Let makeConj                       be    &lt;cat&gt; = Conj
                                         &lt;head infl polarity&gt;	       = !positive
                                         &lt;head agr number&gt;	       = !singular
                                         &lt;head type pronoun&gt;		= -
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type comparative&gt;		 = !-
                                         &lt;head type compareAdj&gt;		 = !-
                                         &lt;head type compareN&gt;	          	 = !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
       
Let makeConseq                         be     &lt;cat&gt; = Conseq
                                          &lt;head type comma&gt;		 = !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
       
       
Let makeDeg                        be    &lt;cat&gt; = Deg
                                         &lt;head type modifies_Adj&gt;		= !-
                                         &lt;head type modifies_Adv temporal&gt; = !-
                                         &lt;head type modifies_Adv locative&gt; = !-
                                         &lt;head type modifies_Adv manner&gt;	= !-
                                         &lt;head type modifies_Adv reason&gt;	= !-
                                         &lt;head type modifies_NP&gt;		= !-
                                         &lt;head type modifies_PP&gt;		= !-
                                         &lt;head type modifies_Q&gt;		= !-
                                         &lt;head type quantifier&gt;		= !-
                                         &lt;head type wh&gt;			= !-
                                         &lt;head type relative&gt;		= !-
                                         &lt;head type focusmarked&gt;		= -
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type pronoun&gt;		= -
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type topic&gt;		= !-
                                         &lt;head type comparative&gt;		 = !-
                                         &lt;head type equalAdj&gt;		 = !-
                                         &lt;head type equalN&gt;	            	 = !-
                                         &lt;head type superlative&gt;		 = !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
                                         &lt;head infl polarity&gt;                            =!positive
                                         
Let makeDem                        be    &lt;cat&gt; = Dem
                                         &lt;head type wh&gt;			= !-
                                         &lt;head agr person&gt;		= !third
                                         &lt;head type relative&gt;		= !-
                                         &lt;head type temporal&gt;		= !-
                                         &lt;head type focusmarked&gt;		= -
                                         &lt;head type gerund&gt;      	       = -
                                         &lt;head type participle&gt;		= -
                                         &lt;head type pronoun&gt;		= -
                                         &lt;head type emphatic&gt;		= !-
                                         &lt;head type comma&gt;		= !-
                                         &lt;head type topic&gt;		= !-
                                         &lt;head type prefix conj&gt;	      = !-
                                         &lt;head type suffix conj&gt;	       = !-
		</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//typology/@case)!='ergative' and normalize-space(//np/@artCase)='yes'">
<xsl:text>
                                         &lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possCooccur)='some'">
<xsl:text>
      &lt;head type cooccur&gt;            = !-
   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
                                         &lt;head type negative-polarity&gt;    = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let makeDet                         be    &lt;cat&gt; = Det
                                          &lt;head type wh&gt;                  = !-
                                          &lt;head agr person&gt; = !third
                                          &lt;head type relative&gt;            = !-
                                          &lt;head type focusmarked&gt;         = -
                                          &lt;head type gerund&gt;      	       = -
                                          &lt;head type participle&gt;		= -
                                          &lt;head type pronoun&gt;		= -
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type topic&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
		</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//typology/@case)!='ergative' and normalize-space(//np/@artCase)='yes'">
<xsl:text>
                                          &lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:text>

Let makeExcl                        be    &lt;cat&gt; = Excl
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
                                          
Let makeFocusM                      be    &lt;cat&gt; = FocusM
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
                                          
Let makeGreet                       be    &lt;cat&gt; = Greet
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
                                          
Let makeIndef                       be    &lt;cat&gt; = Indef
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
                                          
Let makeInitialConj                 be    &lt;cat&gt; = InitConj
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
                                          
Let makeIntj                        be    &lt;cat&gt; = Intj
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
                                          
Let makeN                           be    &lt;cat&gt; = N
                                          &lt;head agr person&gt;		= !third
                                          &lt;head agr animacy&gt;		= !inanimate
                                          &lt;head possessor head agr person&gt;		= !none
                                          &lt;head type prefix case&gt;		= !none
                                          &lt;head type suffix case&gt;		= !none
                                          &lt;head type wh&gt;                  = -
                                          &lt;head type reciprocal&gt;          = !-
                                          &lt;head type reflexive&gt;		= !-
                                          &lt;head type sentential&gt;          = !-
                                          &lt;head type proper&gt;              = !-
                                          &lt;head type relative&gt;            = !-
                                          &lt;head type mass&gt;                = !-
                                          &lt;head type temporal&gt;            = !-
                                          &lt;head type focusmarked&gt;         = -
                                          &lt;head type generic&gt;      	       = !-
                                          &lt;head type gerund&gt;      	       = -
                                          &lt;head type participle&gt;		= -
                                          &lt;head type pronoun&gt;		= -
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type topic&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
		</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='no' and normalize-space(//typology/@case)!='ergative'">
<xsl:text>
      &lt;head case&gt;            = !none
   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//typology/@case)!='ergative'">
<xsl:text>
                                          &lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<xsl:text>
                                          &lt;head agr number&gt;      = !singular
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<xsl:text>
                                          &lt;head agr gender&gt;      = !masculine
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
<xsl:text>
                                          &lt;head type possessed&gt;           = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
                                          &lt;head type negative-polarity&gt;   = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let makeNeg                           be     &lt;cat&gt; = Neg
                                                        &lt;head infl polarity&gt;	 = negative
                                                        &lt;head type comma&gt;	 = !-
                                                        &lt;head type topic&gt;		 = !-
                                                        &lt;head type prefix conj&gt;	 = !-
                                                        &lt;head type suffix conj&gt;	  = !-


Let makeNum                          be   &lt;cat&gt; = Num
                                          &lt;head type ordinal&gt;             = !-
                                          &lt;head type wh&gt;                  = !-
                                          &lt;head agr number&gt;		= !plural
                                          &lt;head type relative&gt;            = !-
                                          &lt;head type focusmarked&gt;         = -
                                          &lt;head type gerund&gt;      	       = -
                                          &lt;head type participle&gt;		= -
                                          &lt;head type quantifier&gt;		= +
                                          &lt;head type pronoun&gt;		= -
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type topic&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
		</xsl:text>
<xsl:if test="normalize-space(//np/@qpeitherRestrictedNumPos)='after'">
<xsl:text>
                                          &lt;head type DP-final&gt;            = !+
                                          &lt;head type DP-initial&gt;          = !-
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@qpeitherRestrictedNumPos)='before'">
<xsl:text>
                                          &lt;head type DP-final&gt;            = !-
                                          &lt;head type DP-initial&gt;          = !+
</xsl:text>
</xsl:if>
<xsl:text>

Let makeP                            be   &lt;cat&gt; = P
                                          &lt;head infl valence&gt;             = !active
                                          &lt;head type wh&gt;                  = -
                                          &lt;head type partitive&gt;           = !-
                                          &lt;head type temporal&gt;            = !-
                                          &lt;head type sentential&gt;          = !-
                                          &lt;head type gerund&gt;      	       = -
                                          &lt;head type participle&gt;		= -
                                          &lt;head type pronoun&gt;		= -
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
                                          
Let makePron                         be   &lt;cat&gt; = Pron
                                          &lt;head type wh&gt;                  = !-
                                          &lt;head agr animacy&gt;		= !animate
                                          &lt;head type reciprocal&gt;          = !-
                                          &lt;head type reflexive&gt;		= !-
                                          &lt;head type possessive&gt;          = !-
                                          &lt;head type relative&gt;            = !-
                                          &lt;head type temporal&gt;            = !-
                                          &lt;head type focusmarked&gt;         = -
                                          &lt;head type gerund&gt;      	       = -
                                          &lt;head type participle&gt;		= -
                                          &lt;head type pronoun&gt;		= +
                                          &lt;head type emphatic&gt;		= !-
                                          &lt;head type locative&gt;		= !- 
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type topic&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
		</xsl:text>
<xsl:if test="normalize-space(//np/@caseDefault)='nominative' and normalize-space(//typology/@case)!='ergative'">
<xsl:text>
                                          &lt;head case&gt;            = !nominative
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<xsl:text>
                                          &lt;head agr number&gt;      = !singular
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<xsl:text>
                                          &lt;head agr gender&gt;      = !masculine
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
                                          &lt;head type negative-polarity&gt;    = !-
</xsl:text>
</xsl:if>
<xsl:text>

Let makeQ                            be   &lt;cat&gt; = Q
                                          &lt;head type wh&gt;                  = !-
                                          &lt;head type focusmarked&gt;         = -
                                          &lt;head type gerund&gt;      	       = -
                                          &lt;head type participle&gt;		= -
                                          &lt;head type quantifier&gt;		= +
                                          &lt;head type pronoun&gt;		= -
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type topic&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
                                          &lt;head type modifies_NP&gt;		        = !-
                                          
Let makeTopicM                       be   &lt;cat&gt; = TopicM
                                          &lt;head type pronoun&gt;		= -
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
                                          
Let makeV                            be   &lt;cat&gt; = V
                                          &lt;head infl valence&gt;             = !active
                                          &lt;head type sentential&gt;          = !-
                                          &lt;head type sentential_with_object&gt; = !-
                                          &lt;head type copular&gt;             = !-
                                          &lt;head type existential&gt;		= !-
                                          &lt;head type perception&gt;		= !-
                                          &lt;head type motion&gt;              = !-
                                          &lt;head type reciprocal&gt;          = !-
                                          &lt;head infl finite&gt;              = !+
                                          &lt;head infl polarity&gt;            = !positive
                                          &lt;head type gerund&gt;      	       = !-
                                          &lt;head type participle&gt;          = !-
                                          &lt;head infl mood&gt;         = !declarative
                                          &lt;embedded cat&gt;			= !none
                                          &lt;head type focusmarked&gt;         = -
                                          &lt;head type pronoun-fronted&gt;     = !-
                                          &lt;head infl voice&gt;		= !actor
                                          &lt;head type comma&gt;		= !-
                                          &lt;head type topic&gt;		= !-
                                          &lt;head type prefix conj&gt;	      = !-
                                          &lt;head type suffix conj&gt;	       = !-
                                          &lt;head type prefix conditional&gt;	      = !-
                                          &lt;head type suffix conditional&gt;	       = !-
                                          &lt;head type prefix subjunctive_conditional&gt;	      = !-
                                          &lt;head type suffix subjunctive_conditional&gt;	       = !-
		</xsl:text>
<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='yes'">
<xsl:text>
                                                                 &lt;head type negative-polarity&gt;        = !-
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
	
		
	
              <xsl:if test="normalize-space(//np/classifierCategory)!=''">
Let <xsl:value-of select="//np/classifierCategory" /> be [Class]</xsl:if>
                     
                     
              
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
                                       &lt;head agr animacy&gt; = inanimate
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
	
		
	
           <xsl:if test="normalize-space(//neg/@advVerbRequired)!='yes'">
<xsl:text>
rule {S option start.symbol  - optional elements initial}
S = (Conj) (PP_1) ((AdvP_2) AdvP_1)  (PP_2) {IP / CP} 
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;S head type topic&gt; = -
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;Conj head type conjoins_IP&gt; = +
	&lt;AdvP_1 head type manner&gt; = -
	&lt;AdvP_2 head type manner&gt; = -
	&lt;S head adverbial&gt; &lt;= &lt;AdvP_1&gt;
	&lt;S head&gt; == [type:[locative:+          | keep locative inside VP within AdvP_1
	                         verbheaded:-]] -&gt; ~[adverbial:[head:[type:[motion:+]]]]
	&lt;S option&gt; = start.symbol
</xsl:text>
</xsl:if>
	
	           
	
	<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicPos)='before' and normalize-space(//neg/@advVerbRequired)!='yes'">
<xsl:text>
rule {S option start.topicinit  - topic initial, optional elements initial}
S = (Conj) (PP_1) ((AdvP_2) AdvP_1) TopicP  (PP_2)  {IP / CP}
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;S head topicP&gt; = &lt;TopicP&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;Conj head type conjoins_IP&gt; = +
	&lt;AdvP_1 head type manner&gt; = -
	&lt;AdvP_2 head type manner&gt; = -
	&lt;S head type topic&gt; &lt;= +
	|      &lt;TopicP head type comma&gt; = +         | activate this constraint if/when you make comma a word-formation character
	&lt;S head adverbial&gt; &lt;= &lt;AdvP_1&gt;
	&lt;S head&gt; == [type:[locative:+          | keep locative inside VP within AdvP_1 
	                         verbheaded:-]] -&gt; ~[adverbial:[head:[type:[motion:+]]]]
	&lt;S option&gt; = start.topicinit
</xsl:text>
</xsl:if>
	
	
	
	
	 
	 
	
	<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicPos)='after' and normalize-space(//neg/@advVerbRequired)!='yes'">
<xsl:text>
rule {S option start.topicfin  - optional elements initial, topic final}
S = (Conj) (PP_1) ((AdvP_2) AdvP_1) (PP_2) {IP / CP}  TopicP 
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;S head topicP&gt; = &lt;TopicP&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head fronted cat&gt; = none
	&lt;CP head type root&gt; = +
	&lt;Conj head type conjoins_IP&gt; = +
	&lt;AdvP_1 head type manner&gt; = -
	&lt;AdvP_2 head type manner&gt; = -
	&lt;S head type topic&gt; &lt;= +
	|      &lt;IP head type comma&gt; = +         | activate this constraint if/when you make comma a word-formation character
	|      &lt;CP head type comma&gt; = +         | activate this constraint if/when you make comma a word-formation character
	&lt;S head adverbial&gt; &lt;= &lt;AdvP_1&gt;
	&lt;S head&gt; == [type:[locative:+          | keep locative inside VP within AdvP_1
	                         verbheaded:-]] -&gt; ~[adverbial:[head:[type:[motion:+]]]]
	&lt;S option&gt; = start.topicfin
</xsl:text>
</xsl:if>
	
	
	
	
	 
	  
	

           <xsl:if test="normalize-space(//neg/@advVerbRequired)='yes'">
<xsl:text>
rule {S option start.NegVAdvRequired  - optional elements initial}
S = (Conj) (PP_1) ((AdvP_2) AdvP_1)  (PP_2) {IP / CP} 
        &lt;S head&gt; = &lt;IP head&gt;
        &lt;S head&gt; = &lt;CP head&gt;
        &lt;S head type topic&gt; = -
        &lt;IP head type root&gt; = +
        &lt;IP head type question&gt; = -
        &lt;IP head fronted cat&gt; = none
        &lt;CP head type root&gt; = +
        &lt;Conj head type conjoins_IP&gt; = +
        &lt;AdvP_1 head type manner&gt; = -
        &lt;AdvP_2 head type manner&gt; = -
        &lt;S head adverbial&gt; &lt;= &lt;AdvP_1&gt;
        &lt;S head&gt; == [type:[locative:+          | keep locative inside VP within AdvP_1
                                 verbheaded:-]] -&gt; ~[adverbial:[head:[type:[motion:+]]]]
        &lt;S head&gt; == [adverbial:[head:[infl:[polarity:negative]]]] -&gt;  | if adverbial negative, verb must be 
                          [infl:[polarity:negative]]
        &lt;S option&gt; = start.NegVAdvRequired
</xsl:text>
</xsl:if>
        
        
        

           <xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicPos)='before' and normalize-space(//neg/@advVerbRequired)='yes'">
<xsl:text>
rule {S option start.topicinit.NegVAdvRequired  - topic initial, optional elements initial}
S = (Conj) (PP_1) ((AdvP_2) AdvP_1) TopicP  (PP_2)  {IP / CP}
        &lt;S head&gt; = &lt;IP head&gt;
        &lt;S head&gt; = &lt;CP head&gt;
        &lt;S head topicP&gt; = &lt;TopicP&gt;
        &lt;IP head type root&gt; = +
        &lt;IP head type question&gt; = -
        &lt;IP head fronted cat&gt; = none
        &lt;CP head type root&gt; = +
        &lt;Conj head type conjoins_IP&gt; = +
        &lt;AdvP_1 head type manner&gt; = -
        &lt;AdvP_2 head type manner&gt; = -
	&lt;S head type topic&gt; &lt;= +
	|      &lt;TopicP head type comma&gt; = +         | activate this constraint if/when you make comma a word-formation character
	&lt;S head adverbial&gt; &lt;= &lt;AdvP_1&gt;
        &lt;S head&gt; == [type:[locative:+          | keep locative inside VP within AdvP_1
                                 verbheaded:-]] -&gt; ~[adverbial:[head:[type:[motion:+]]]]
        &lt;S head&gt; == [adverbial:[head:[infl:[polarity:negative]]]] -&gt;  | if adverbial negative, verb must be 
                          [infl:[polarity:negative]]
        &lt;S option&gt; = start.topicinit.NegVAdvRequired
</xsl:text>
</xsl:if>
        
        
           
        
           
        
           

        <xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicPos)='after' and normalize-space(//neg/@advVerbRequired)='yes'">
<xsl:text>
rule {S option start.topicfin.NegVAdvRequired  - optional elements initial, topic final}
S = (Conj) (PP_1) ((AdvP_2) AdvP_1) (PP_2) {IP / CP}  TopicP 
        &lt;S head&gt; = &lt;IP head&gt;
        &lt;S head&gt; = &lt;CP head&gt;
        &lt;S head topicP&gt; = &lt;TopicP&gt;
        &lt;IP head type root&gt; = +
        &lt;IP head type question&gt; = -
        &lt;IP head fronted cat&gt; = none
        &lt;CP head type root&gt; = +
        &lt;Conj head type conjoins_IP&gt; = +
        &lt;AdvP_1 head type manner&gt; = -
        &lt;AdvP_2 head type manner&gt; = -
	&lt;S head type topic&gt; &lt;= +
	|      &lt;IP head type comma&gt; = +         | activate this constraint if/when you make comma a word-formation character
	|      &lt;CP head type comma&gt; = +         | activate this constraint if/when you make comma a word-formation character
	&lt;S head adverbial&gt; &lt;= &lt;AdvP_1&gt;
        &lt;S head&gt; == [type:[locative:+          | keep locative inside VP within AdvP_1
                                 verbheaded:-]] -&gt; ~[adverbial:[head:[type:[motion:+]]]]
        &lt;S head&gt; == [adverbial:[head:[infl:[polarity:negative]]]] -&gt;  | if adverbial negative, verb must be 
                          [infl:[polarity:negative]]
        &lt;S option&gt; = start.topicfin.NegVAdvRequired
</xsl:text>
</xsl:if>
        
        
           
        
           
        
           
           
<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//coord/@conjWord)!='no'">
<xsl:text>
rule {S option conjoinedS containing a topic}
S = S_1 Conj S_2
        &lt;S head&gt; = &lt;S_2 head&gt;
        {&lt;S_1 head type topic&gt; = +
        /&lt;S_2 head type topic&gt; = +
        }
        &lt;Conj head type conjoins_IP&gt; = +
        &lt;S_2 head type verbheaded&gt; = +
        &lt;S conjoined&gt; = +
        &lt;S_1 conjoined&gt; = -	|limit recursion
        &lt;S head type prefix&gt; = &lt;S_1 head type prefix&gt;
        &lt;S option&gt; = conjoinedS
</xsl:text>
</xsl:if>
           
                      

      
   
   <xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/proclitic/@checked)='yes'">
<xsl:text>
      rule {S option conjPrefix - conjoined S  containing a topic}
      S = S_1  S_2
      &lt;S head&gt; = &lt;S_2 head&gt;
      {&lt;S_1 head type topic&gt; = +
      /&lt;S_2 head type topic&gt; = +
      }
      &lt;S conjoined&gt; = +
      &lt;S_1 conjoined&gt; = -	|limit recursion
      &lt;S_2 head type prefix conj&gt; = +
      &lt;S head type prefix&gt; &lt;= &lt;S_1 head type prefix&gt;
      &lt;S option&gt; = conjPrefix
   </xsl:text>
</xsl:if>
   
      
      
      
      
      
   
   <xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/enclitic/@checked)='yes'">
<xsl:text>
      rule {S option conjSuffix - conjoined S  containing a topic}
      S = S_1  S_2
      &lt;S head&gt; = &lt;S_2 head&gt;
      {&lt;S_1 head type topic&gt; = +
      /&lt;S_2 head type topic&gt; = +
      }
      &lt;S conjoined&gt; = +
      &lt;S_1 conjoined&gt; = -	|limit recursion
      &lt;S_1 head type suffix conj&gt; = +
      &lt;S head type prefix&gt; &lt;= &lt;S_1 head type prefix&gt;
      &lt;S option&gt; = conjSuffix
   </xsl:text>
</xsl:if>
   
      
      
      
      
      
   
   <xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/attachesOther/@checked)='yes' or normalize-space(//focus/@topic)='yes' and normalize-space(//coord/@noConj)='yes'">
<xsl:text>
      rule {S option conjNone - conjoined S  containing a topic}
      S = S_1  S_2
      &lt;S head&gt; = &lt;S_2 head&gt;
      {&lt;S_1 head type topic&gt; = +
      /&lt;S_2 head type topic&gt; = +
      }
      &lt;S conjoined&gt; = +
      &lt;S_1 conjoined&gt; = -	|limit recursion
      &lt;S_2 head type prefix conj&gt; = -
      &lt;S_1 head type suffix conj&gt; = -
      &lt;S_1 head type comma&gt; = -
      &lt;S head type prefix&gt; &lt;= &lt;S_1 head type prefix&gt;
      &lt;S option&gt; = conjNone
   </xsl:text>
</xsl:if>
   
      
      
      
      
          
          
      
      
      
   
   
	
	<xsl:text>
rule {S option greeting}
S = Greet (DP) 
	&lt;S head&gt; = &lt;Greet head&gt;
	&lt;DP head type temporal&gt; = -
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type locative&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type topic&gt; = -
	&lt;DP head type focus&gt; = -
	&lt;DP head infl polarity&gt; = positive
	&lt;S option&gt; = greet
</xsl:text>
	<xsl:text>
rule {S option interjection}
S = Intj / Adj 
	&lt;S head&gt; = &lt;Intj head&gt;
	&lt;S head&gt; = &lt;Adj head&gt;
	&lt;S option&gt; = interjection
</xsl:text>
	<xsl:if test="normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/exclMBefore/@checked)='yes'">
<xsl:text>
rule {S option excl.init}
S = Excl AdjP 
	&lt;S head&gt; = &lt;AdjP head&gt;
	&lt;Excl head type excl-initial&gt; = +
	&lt;S option&gt; = excl.init
</xsl:text>
</xsl:if>
	
		
		
		
	
	<xsl:if test="normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/exclMAfter/@checked)='yes'">
<xsl:text>
rule {S option excl.fin}
S = AdjP Excl
	&lt;S head&gt; = &lt;AdjP head&gt;
	&lt;Excl head type excl-final&gt; = +
	&lt;S option&gt; = excl.fin
</xsl:text>
</xsl:if>
	
		
		
		
	
	<xsl:if test="normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/exclMBoth/@checked)='yes'">
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
