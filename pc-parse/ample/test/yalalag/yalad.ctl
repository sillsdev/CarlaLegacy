\_sh v3.0  400  text

\id yalad.ctl   Analysis Data Control File

\ca |                      DEFINE CATEGORIES (\ca)
Adj         | Adjective
Adv	    | Adverb
Conj	    | Conjunction
Det	    | Determiner
NP          | noun requiring dependent person suffix
N           | noun
NumA        | number (lacking aspect)
Num         | number (completed)
VA          | verb (lacking aspect)
V           | verb (completed)
Prep        | preposition
Prn         | Pronoun
Prt         | particle (takes no affixes)
PPrt        | particle that can take dependent pronouns
Q           | question word
Qnt         | quantifier

\ap |                      DEFINE ALLOMORPH PROPERTIES (\ap)
|
takes.class1    | takes a class 1 verb root
takes.class2    | takes a class 2 verb root
takes.laryngealizes | takes a verb root that laryngealizes
takes.null.Pot  | takes a null potential - used in Caus prefix
takes.under.ao  | only attaches to a root that is underlyingly ao final
takes.under.o   | only attaches to a root that is underlyingly oV
						|                                       initial
takes.colonx.Poss   | requires the :x form of the Possessive prefix

\mp class1          | is a class 1 verb root
class2          | is a class 2 verb root
can.take.group.2.pns| can take, but does not require, group 2 pronouns
can.take.kw.C.with.Pl.pfx     | the root can (but does not have to)
				  | take the kw- form of C when Pl.pfx
				  | is also present
laryngealizes   | verb root laryngealizes 1s
takes.group.2.pns       | takes group 2 pronouns
takes.kw.C.with.Pl.pfx  | the root requires the kw-
				  | form of the C when Pl.pfx is
				  | also present
takes.null.H    | takes a null in habitual
takes.null.P    | takes a null in potential
takes.null.S    | takes a null in stative
takes.p.C               | takes the p form of the completive
takes.kw.C               | takes the kw form of the completive
takes.kw.P               | takes the kw form of the potential
takes.colon.Caus    | takes the fortifying form of the Causative
takes.colons.Caus   | takes the :s         form of the Causative
takes.ch.Caus   | takes the ch         form of the Causative
takes.k.Caus    | takes the k          form of the Causative
takes.l.Caus    | takes the l          form of the Causative
takes.colonl.Caus   | takes the :l         form of the Causative
takes.s.Caus    | takes the s          form of the Causative
takes.kw.Caus    | takes the kw          form of the Causative
takes.x.Caus    | takes the x          form of the Causative
under.ao                | root is underlyingly ao final
under.o         | root is underlyingly oV initial
vi                      | is an intransitive verb
vt                      | is a    transitive verb
vbt                     | is a  bitransitive verb

\ccl finalcategory
|                      DEFINE CATEGORY CLASSES (\ccl)
Q V Prn Prt PPrt N NP Num Adj Adv Det Conj Qnt Prep

\mcl Pronoun
|                      DEFINE MORPHEME CLASSES (\mcl)
		 1s             | 1st singular dependent pronoun
		 1pi            | 1st plural inclusive dependent pronoun
		 1pe            | 1st plural exclusive dependent pronoun
		 2s             | 2nd singular dependent pronoun
		 2p             | 2nd plural  dependent pronoun
		 3r             | 3rd respect dependent pronoun
		 3f             | 3rd familar dependent pronoun
		 3a             | 3rd animate dependent pronoun
		 3i             | 3rd inanimate dependent pronoun

\mcl 1s,2s-or-3r
		 1s             | 1st singular dependent pronoun
		 2s             | 2nd singular dependent pronoun
		 3r             | 3rd respect dependent pronoun

\mcl 1s-or-3r
		 1s             | 1st singular dependent pronoun
		 3r             | 3rd respect dependent pronoun

\mcl 1s-or-2s
		 1s             | 1st singular dependent pronoun
		 2s             | 2nd singular dependent pronoun

\mcl Non-3i-pronouns
		 1s             | 1st singular dependent pronoun
		 1pi            | 1st plural inclusive dependent pronoun
		 1pe            | 1st plural exclusive dependent pronoun
		 2s             | 2nd singular dependent pronoun
		 2p             | 2nd plural  dependent pronoun
		 3r             | 3rd respect dependent pronoun
		 3f             | 3rd familar dependent pronoun
		 3a             | 3rd animate dependent pronoun
|        PL             | Plural | Removed because plural is a root
								 | as of 9602.07

\mcl Non-2s-pronouns
1s
1pi
1pe
2p
3r
3f
3a
3i

\mcl 3pronouns
3r
3f
3a
3i

\mcl Come.B
		 Come.B.P       | Come to base in Potential
		 Come.B.H       | Come to base in Habitual
		 Come.B.C       | Come to base in Completive
		 Come.B.S       | Come to base in Stative

\mcl Go.NB
		 Go.NB.PH       | Go to non-base in Potential or Habitual
		 Go.NB.C        | Go to non-base in Completive
		 Go.NB.S        | Go to non-base in Stative
		 Go.NB.PH.PL    | Go to non-base in Potential or Habitual with Plural

\mcl Modal
		[Come.B]
		[Go.NB]

\mcl C-or-Modal
		C               | Completive
		[Modal]         | Modal

\mcl C-or-Inf
		C               | Completive
		Inf             | Infinitive

\mcl C,Inf-or-Modal
		C               | Completive
		Inf             | Infinitive
		[Modal]         | Modal

\mcl P-or-Rep
		P               | Potential
		Int.P           | Interrogative in the Potential
		Rep             | Repetitive

\mcl P
		P               | Potential
		Int.P           | Interrogative in the Potential

\mcl P-or-Modal
		P               | Potential
		[Modal]         | Modal

\mcl P,C-or-Modal
		P               | Potential
		C               | Completive
		[Modal]         | Modal

\mcl P,H-or-Modal
		P               | Potential
		H               | Habitual
		[Modal]         | Modal

\mcl P,H,S-or-Modal
		P               | Potential
		H               | Habitual
		S               | Stative
		[Modal]         | Modal

\mcl H-or-S
		H               | Habitual
		S               | Stative

\mcl H-or-Rep
		H               | Habitual
		Rep             | Repetitive

\mcl H,S-or-Rep
		H               | Habitual
		S               | Stative
		Rep             | Repetitive

\mcl H,S,Rep-or-Pl.pfx
[H,S-or-Rep]
Pl.pfx

\mcl C,S-or-Modal
		C               | Completive
		S               | Stative
		[Modal]         | Modal

\mcl Imperatives
		Imp.Pl          | Imperative Plural
		Hort            | Hortatory

\mcl motion.root | ir, venir, venir.PL
ir
venir
venir.PL
venir.a'

\mcl motion.root.or.Rep | Used to eliminate n- stative with Rep
[motion.root]
Rep

\mcl Adv | Adverbs which can occur in free pronouns
de.veras
nada.mas
Dub

\mcl Interrogatives
Int.P
Int.C

\scl V | front  back
|                      DEFINE STRING CLASSES (\scl)
|         | Vowels
i     o   | high
					e     a   | low
					i'    o'  | high  and constricted glottis
					e'    a'  | low   and constricted glottis
‚ ¡ ¢ £  

\scl V-rd
i e   a   i' e'    a'

\scl V-rd-cg
i e   a

\scl V-rd+cg
i' e'    a'

\scl V-bk
i e       i' e'
¡ ‚

\scl V+bk
o a         o' a'

\scl V-hi
e   a      e'    a'

\scl V+hi-cg
i   o

\scl V-hi+bk
a            a'

\scl V-hi-cg
e    a

\scl V-hi+cg
e'    a'
		| Consonants

\scl C | lab   alv   pal   vel lab-vel uvular
| in the practical orthography (f = fortis, l = lenis):
|                lab   alv   pal   vel lab-vel uvular glottal
|
|       Stops f:  p     t           k    kw              '
|             l:  b     d           g     w
|
|       affr  f:              ch
|             l:
|
|       fric  f:        s           x
|             l:        z     ll    xh           j
|
|       nas   f:  m     nn
|             l:        n
|
|       lat   f:        l
|             l:        r
|
|
|       glides                y
|
				  p     t           k    kw             | stops
							  ch                        | affricates
						s           x            j      | fricatives
				  m     n                               | nasal
						l                               | lateral
							  y                         | glides
		:       | length mark prefix to indicate fortis segments
				| ll is a lenis palatal fricative, but we're trying it
				|    as the lenis counterpart of ch; hence orthographic ll
				|    is written as ch

\scl C-lenis
p t k ch s x j n l y

\scl labial
p kw

\scl C,-son
p t k kw ch s x j

\scl C,+son
m n l   | note that /y/ does not pattern here for Possessive


\maxnull 2
\maxp 4
\maxi 0
\maxs 6
\maxr 1
\cat suffix


\co \ft NON_FINAL_COMPOUND_FT
		IF   (current property is compound.only)
		THEN (right   type     is root)


				Morpheme Co-occurrence Constraints (\mcc)

\mcc Hort +/ ~_ ... 3r
\mcc [Interrogatives] +/ _ ... [Pronoun]

\pt PREFIX_CATEGORY_ST
| ========================================================
|                             PREFIXES
|
|                     Prefix Tests (\pt)
|
| For prefixes, categories are propagated leftward:
	   left fromcategory is current tocategory

\pt SEC_ST

\pt PREFIX_ORDER_ST
	   left orderclass < current orderclass
				| ensure proper class connections

\pt CLASS1_VERB_ST
		IF   (left    property is takes.class1)
		THEN (current property is class1)
				| ensure proper class connections

\pt CLASS2_VERB_ST
IF   (left    property is takes.class2)
THEN (   (current property is class2)
	  OR (    (left morphname is C)
		  AND (   (current property is takes.kw.C)
			   OR (current morphname is Pl.pfx)
			  )
		 )
	 )
				| only certain forms allow a null stative

\pt NULL_STATIVE_ST
		IF   (left morphname is S)
		THEN (    (current property is takes.null.S)
			  IFF (left allomorph is 0) )
				| only certain forms allow a null potential

\pt NULL_POTENTIAL_ST
		IF   (left morphname is P)
		THEN (    (   (current property is takes.null.P)
				   OR (current property is takes.null.Pot)
				  )
			  IFF (left allomorph is 0) )
				| only certain forms allow a null habitual

\pt NULL_HABITUAL_ST
		IF   (left morphname is H)
		THEN (    (current property is takes.null.H)
			  IFF (left allomorph is 0) )
				| exceptional kw allomorphy of Potential: only occurs with
				| underlyingly oV initial roots

\pt UNDER_O_ST
		IF   (left    property is takes.under.o)
		THEN (current property is under.o)

\pt NO_REPEATING_PREFIXES_ST
	  NOT (left morphname is current morphname)

\st SUFFIX_CATEGORY_ST
| \rt NO_COMPOUND_ST
|        (IF       (left    property is no.compound)
|         THEN NOT (current type is root)
|        )
|    AND (IF       (current property is no.compound)
|         THEN NOT (left    type is root)
|        )
|
|                     Root Adhoc Pairs (\rah)
|                     Root Adhoc Pairs (\rah)|\rah be CAUS
|
| ========================================================
|                             SUFFIXES
|
|                     Suffix Tests (\st)
| For suffixes, there are now two cases:
|     (1) the fromcategory of the first suffix after a root
|         must match the tocategory of the word's first
|         morpheme (which could be a prefix or the root).
|     (2) the fromcategory of the other suffixes matches the
|         tocategory of the preceding suffix.
		(    (left type is root)
		 AND (current fromcategory is INITIAL tocategory)
		)
	 OR (    (left type is suffix)
		 AND (left tocategory is current fromcategory)
		)

\st SUFFIX_ORDER_ST
		(left orderclass < current orderclass)
				| the 2s morpheme has an allomorph (o') that follows the
				| low unrounded /a/ only when that /a/ belongs to a root
				| that is underlyingly ao final

\st UNDER_ao_ST
			(current property is takes.under.ao)
		IFF (    (current morphname is 2s)
			 AND (left    property  is under.ao))
				| the pronominal augment only occurs with verbs that are
				| tagged as taking the second group of pronouns

\st GROUP_2_PN_ST
		IF   (current morphname is pna)
		THEN (FOR_SOME_LEFT (   (LEFT property is takes.group.2.pns)
							 OR (LEFT property is can.take.group.2.pns)
							)
			 )
				| only (bi-)transitive verbs can have pronominal suffixes
				| when in the imperative

\st IMPERATIVE_ST
		IF   (    (current morphname is member [Pronoun])
			  AND (FOR_SOME_LEFT (LEFT morphname is member [Imperatives])))
		THEN (FOR_SOME_LEFT (   (LEFT property  is vt)
							 OR (LEFT property  is vbt)
							 OR (LEFT morphname is Caus)
							)
			 )

\st LARYNGEALIZES_ST
	(IF   (current property is takes.laryngealizes)
	 THEN (left    property is       laryngealizes)
		)
		 AND
	(IF   (    (left    property is       laryngealizes)
		   AND (current morphname is 1s)
			  )
	 THEN (current property is takes.laryngealizes)
		)

\rt ROOT_CATEGORY_ST
|                     Prefix Adhoc Pairs (\pah)
|
|
| ========================================================
|                             ROOTS
|
|                     Compound Root Categories (\cr)
|
|
|                     Root Tests (\rt)
|
| The root category must match the fromcategory of the
|     nearest prefix (if any):
		IF   (left type is prefix)
		THEN (current tocategory is left fromcategory)
				| only certain forms allow a null stative
				| (see prefix test)

\rt NULL_STATIVE_ST
				| only certain forms allow a null potential
				| (see prefix test)

\rt NULL_POTENTIAL_ST
				| only certain forms allow a null habitual
				| (see prefix test)

\rt NULL_HABITUAL_ST
				| ensure proper class connections
				| (see prefix test)

\rt CLASS1_VERB_ST
				| ensure proper class connections
				| (see prefix test)

\rt CLASS2_VERB_ST
				| exceptional kw allomorphy of Potential: only occurs with
				| underlyingly oV initial roots

\rt UNDER_O_ST
				| some roots exceptionally take p allomorph of completive

\rt TAKES_p_C_ST
		IF   (    (current property  is takes.p.C)
			  AND (left    morphname is C)
			 )
		THEN (left allomorph is "p")
				| some roots exceptionally take kw allomorph of completive

\rt TAKES_kw_C_ST
		IF   (    (current property  is takes.kw.C)
			  AND (left    morphname is C)
			 )
		THEN (left allomorph is "kw")
				| some root allomorphs exceptionally take :x allomorph of Poss

\rt TAKES_:x_POSS_ST
		IF   (left morphname is Poss)
		THEN (    (current property  is takes.colonx.Poss)
			  IFF (left    property  is takes.colonx.Poss)
			 )
						| ensure that the correct form of the Causative goes
						| with the root

\rt CAUSATIVE_ST
		IF   (left morphname is Caus)
		THEN (    (    (left    allomorph is ":")
				   IFF (current property  is takes.colon.Caus)
				  )
			  AND (    (left    allomorph is ":s")
				   IFF (current property  is takes.colons.Caus)
				  )
			  AND (    (left    allomorph is "ch")
				   IFF (current property  is takes.ch.Caus)
				  )
			  AND (    (left    allomorph is "k")
				   IFF (current property  is takes.k.Caus)
				  )
			  AND (    (left    allomorph is "l")
				   IFF (current property  is takes.l.Caus)
				  )
			  AND (    (left    allomorph is ":l")
				   IFF (current property  is takes.colonl.Caus)
				  )
			  AND (    (left    allomorph is "s")
				   IFF (current property  is takes.s.Caus)
				  )
			  AND (    (left    allomorph is "kw")
				   IFF (current property  is takes.kw.Caus)
				  )
			  AND (    (left    allomorph is "x")
				   IFF (current property  is takes.x.Caus)
				  )
			 )
					| some roots allomorphs do not compound

\ft FINAL_CATEGORY_FT
|                     Suffix Adhoc Pairs (\sah)
|
|
| ========================================================
|                             FINAL TESTS (\ft)
|
| The word's finalcategory may be in one of two places:
|     (1) If there are no suffixes (i.e. the root is the last
|         morpheme) the tocategory of the first morpheme
|         (prefix or root) must be a finalcategory.
|     (2) If there are suffixes, the tocategory of the last
|         morpheme must be a finalcategory.
	   (    FINAL type is root
		AND INITIAL tocategory is member [finalcategory]
	   )
	OR (    FINAL type is suffix
		AND FINAL tocategory is member [finalcategory]
	   )
				| Can only get two or more pronouns on a non-intransitive
				| verb

\ft TRANSITIVITY_FT
		IF   (    (current morphname is member [Pronoun])
			  AND (right   morphname is member [Pronoun])
			 )
		THEN (FOR_SOME_LEFT (   (LEFT property  is vt)
							 OR (LEFT property  is vbt)
							 OR (LEFT morphname is Caus)
							 OR (LEFT morphname is Plural)
							)
			 )
						| if a root requires group 2 pronouns, make
						| sure that if there are pronouns, there is also
						| the pronominal augment

\ft GROUP_2_PN_FT
		IF   (    (current morphname is member [Pronoun])
			  AND (FOR_SOME_LEFT (LEFT property is takes.group.2.pns))
			 )
		THEN (FOR_SOME_LEFT (LEFT morphname is pna))
						| Roots in non-final position in a compound
						| lose primary stress (??).  This is
						| represented in the orthography via a shortened form.
						| In such cases the root allomorph is labeled with the
						| property "compound.only".

\ft NUMBERS_WITH_PRONOUNS_FT | Check for validity of a number word with a pronoun
| When there's a number root with a pronoun
IF   (    (current tocategory is NumA)
	  AND (current type is root)
	  AND (FOR_SOME_RIGHT (RIGHT morphname is member [Pronoun]))
	 )
			| then it must be preceded by Potential
			| or Stative aspect (i.e. is a cardinal
			| form (Potential) or is a grouping
			| (Stative)).
THEN (   (left morphname is P)
	  OR (left morphname is S)
	 )

\ft Root_takes_kw_C_WITH_Pl.pfx_FT | Some roots require kw- form of C with as- Pl.pfx
| When have a root requiring kw- form of
			| C with Pl.pfx
IF   (    (right   property is takes.kw.C.with.Pl.pfx)
	  AND (current morphname is Pl.pfx)
	  AND (left    morphname is C)
	 )
THEN        | then C must be kw-
	 (left allomorph is "kw")

\ft kw_C_WITH_Pl.pfx_FT | Ensure proper use of kw- form of C with as- Pl.pfx
| when have C-Pl.pfx and C is kw-
IF   (    (left    morphname is C)
	  AND (left    allomorph is "kw")
	  AND (current morphname is Pl.pfx)
	 )
THEN        | the root has to have one of 2 properties
	 (   (right property is takes.kw.C.with.Pl.pfx)
	  OR (right property is can.take.kw.C.with.Pl.pfx)
	 )
