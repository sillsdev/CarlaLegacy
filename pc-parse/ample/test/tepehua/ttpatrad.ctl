\_sh v3.0  400  text

\id ttpatrad.ctl analysis data J.Watters August 24, 1994
 Used with PcPatr word building mechanism

\begin

\co                      DEFINE STRING CLASSES (\scl)
\scl V a e i o u
\scl C b c d f g h k l m n p q r s š t w y z © £ †
\scl alvcont s š £
\scl fric s š £ h
\scl nasal m n
\scl -back c l m n p  r s š t w y © £
\scl +back k q
\scl -cont  t k q c ©
\scl -cont,+cg p† t† k† † c† ©†
\scl +cont s š l £ h
\scl son m n l £ †
\scl -oral h † [V]  | no oral stricture
\scl strid s c

\co                      DEFINE MORPHEME CLASSES (\mcl)
\mcl 2SUB 2SG 2SGPFV 2PLSUB 2SUBFUT 2PLSUBFUT
\mcl POS 1POS 2POS 3POS 1POS.PL2 2POS.PL2
\mcl Perfective 2SGPFV PFV 1PL 2OBJ
\mcl Plural 1PL 2PLSUB 3SUB,PL
\mcl NSSWdFinal PF IMPF 2PLSUB 2OBJ 1PL | "No stress shift and stressless word-final" for verb roots that retain final short vowel only imm. preceding these suffixes which are "stressless" when word-final or preceding a clitic.
\mcl StresslessWdFinal PFV [NSSWdFinal]  |"Stressless word-final" including the stress-shifting PFV
\mcl Enclitic ya todavía

\co                      DEFINE ALLOMORPH PROPERTIES (\ap)
\ap compound
\ap glottalized
\ap drops.n
\ap deletes.n
\ap n.deleted
\ap deletes.q
\ap q.deleted
\ap irr.plural       |to handle the smallish set of Ns taking -na for plural
\ap final.short.V
\ap follows.short.V
\ap kh.metathesis
\ap q.harmony | (historical) presence of q in stem triggers k>q in prefix
\ap q.initial | underlying q (surface † in 2SUB) causes lak > lah
\ap MSyllVFinal |monosyllabic, vowel-final verb roots require nV (not n) for INF

\co                      DEFINE MORPHEME PROPERTIES (\mp)
\mp Pglottalized		|potentially glottalized
\mp takes.INCH
\mp glottalized.num
\mp vi | intransitive verb
\mp vt |   transitive verb

\co                      DEFINE CATEGORIES (\ca)
\ca V    | verb
\ca N
\ca ADJ
\ca ADV
\ca PART
\ca INCH
\ca NUM


\co ========================================================
\co                             PREFIXES

\maxp 8         | maximum number of prefixes

\co                     Prefix Tests (\pt)

\pt PREFIX_CATEGORY_ST
 (left fromcategory is current tocategory)

\co order class test. Prefixes of order class -10 can occur in alternate orders. Otherwise order class strictly increases left to right.
\pt PREFIX_ORDER_ST
	  (left orderclass < current orderclass)
	OR (	(left orderclass = current orderclass)
		AND (current orderclass = -10)	)

\pt Q_HARMONY_ST
	  (current property is q.harmony)
IFF (left property is q.harmony)

\co                     Prefix Adhoc Pairs (\pah)

\co ========================================================
\co                             ROOTS

\maxr 3         | maximum number of roots

\co                     Compound Root Categories (\cr)
\cr V V
\cr V INCH
\cr INCH V
\cr ADV V
\cr ADV V
\co  \cr N VA    |body-part forms to prefix file; other N-V compounds listed
\co  \cr N VOA  |same as above
\cr N INCH
\cr N N
\cr N ADJ
\cr NUM NUM  |two-digit numbers (eleven = "ten-one")

\co                     Root Tests (\rt)

\co q-final roots drop the "q" when immediately preceding the /'a/ allomorphs of the IMPF and FUT.
\rt Q_DELETION_ST
	  (current property is deletes.q)
IFF (left property is q.deleted)

\co                     Root Adhoc Pairs (\rah)

\co ========================================================
\co                             SUFFIXES

\maxs 10

\co                     Suffix Tests (\st)

\co Allomorphs of NOM and of 2SG cause a preceding "n" to be dropped.
\st N_DELETEION_ST
IF        (current property is drops.n)
THEN  (left property is n.deleted)

\co suffix order class
\st SUFFIX_ORDER_ST
	  left orderclass < current orderclass

\co q-final roots drop the "q" when immediately preceding the /'a/ allomorphs of the IMPF and FUT.
\st Q_DELETION_ST
\co  see root test version      (current property is deletes.q)
							  IFF (left property is q.deleted)

\co The null allomorph of 2SGSUB follows roots and suffxes which end in a short vowel (whether because the underlying form ends in a short vowel or a final "n" was deleted).
\st NULL_2SGSUB_ST
IF	 (current property is follows.short.V)
THEN (left property is final.short.V)


\co For suffixes, categories are propogated rightward:
\st SUFFIX_CATEGORY_ST
left tocategory is current fromcategory

\co 2nd person suffixes require the glottalized form of all previous allomorphs
\st GLOTTALIZED_ST
		IF   (current morphname is member [2SUB])
		THEN (FOR_ALL_LEFT
				(IF   LEFT property is Pglottalized
				 THEN LEFT property is glottalized
				)
			 )

\co Null infinitive only goes on intransitive V-final roots
\st NULL_INFINITIVE_ST
IF       (     (current morphname is INF)
		   AND (current allomorph is 0)
		  )
THEN (       (left type is root)
		   AND (left property is vi) | tocategory is VA)
		   AND (left property is final.short.V)
		  )

\co                     Suffix Adhoc Pairs (\sah)

\co ========================================================
\co                             FINAL TESTS (\ft)

\ft COMPOUND_ROOT_FT
	IF (current property is compound)
	THEN (right type is root)

\co checks whether inchoative is a possible reading for ta- by looking at the following verb root
\ft INCH_CHECK_FT
IF (current morphname is INCH)
THEN (right property is takes.INCH)

\co verb and suffixes with final "n" drop the "n" when immediately preceding n-deleting phonemes or preceding NOM or 2SGSUB.
\ft N_DELETEION_FT
IF	(current property is n.deleted)
THEN ( (right property is deletes.n)
		OR (right property is drops.n))

\ft PREFIX_ROOT_FT
IF   (    (current type is prefix)
		AND (right type is root)
	   )
THEN  (current fromcategory is FINAL tocategory)

\co glottalized allomorphs require a 2nd person suffix
\ft GLOTTALIZED_FT
	IF (current property is glottalized)
	THEN
		(FOR_SOME_RIGHT
			(RIGHT morphname is member [2SUB]))

\co                 Morpheme Co-occurrence Constraints (\mcc)

\patr ShowAllFeatures	off
\patr TreeStyle		full
