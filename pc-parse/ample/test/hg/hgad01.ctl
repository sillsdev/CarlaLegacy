\id HGAD01.CTL - analysis data control file, SRMc, 3-Jun-88
ap	| Allomorph Property
ca	| Category
ccl	| Category Class
ft	| Final Test
maxi	| Maximum Number of Infixes
maxp	| Maximum Number of Prefixes
maxr	| Maximum Number of (Compound) Roots
maxs	| Maximum Number of Suffixes
mcc	| Morpheme Co-occurrence Constraint
mcl	| Morpheme Class
mp	| Morpheme Property
sah	| Suffix Adhoc Pair
scl	| String Class
st	| Suffix Successor Test
\begin

\co
\co			DEFINE STRING CLASSES
\co
\scl	V	a  e  i  o  u			| Vowels
\co
\co			DEFINE ALLOMORPH PROPERTIES
\co
\ap morphlowered
\ap foreshortened
\co
\co			DEFINE MORPHEME PROPERTIES
\co
\mp underlong
\mp foreshortens
\mp PMlowered
\mp Mlowers
\mp AMlowers
\co
\co			DEFINE CATEGORIES
\co
\ca V2
\ca V1
\ca N2
\ca N1
\ca R2
\ca R1
\ca V0
\ca N0
\ca R0
\ca NOSUFF
\ca ONEV
\ca ONSHEV
\ca SOUND
\co
\co		WORD FINAL CATEGORIES
\co
\ccl finalcategories	V0 N0 R0 NOSUFF ONEV ONSHEV SOUND
\co
\co    ****************************************
\co    *********** Quechua Tests **************
\co    ****************************************
\co
\co                      SUFFIX SUCCESSOR TESTS
\co
\st CATEGORY_ST
		(left tocategory is current fromcategory)
	OR  ((left tocategory is V2) AND (current fromcategory is V1))

\st ORDER_ST
		(current orderclass = 0)
	OR  (left orderclass <= current orderclass)

\st FORESHORTEN_ST
	IF  (left property is underlong)
	THEN
		(	(current property is foreshortens)
		IFF (left property is foreshortened)
		)

\st MLOWERS_ST
	IF  (current property is Mlowers)
	THEN
		(FOR_ALL_LEFT
		(
		IF  (LEFT property is PMlowered)
		THEN (LEFT property is morphlowered)
		)
		)
\co
\co                      FINAL TESTS
\co
\ft CATEGORY_FT
	FINAL tocategory is member finalcategories

\ft MLOWERED_FT
	IF  (current property is morphlowered)
	THEN (FOR_SOME_RIGHT (RIGHT property is Mlowers))

\ft ORDER_FT
	IF  (    (current orderclass = 0)
		AND (FOR_SOME_LEFT  (LEFT  orderclass ~= 0))
		AND (FOR_SOME_RIGHT (RIGHT orderclass ~= 0))
		)
	THEN (LEFT orderclass <= RIGHT orderclass)

\co
\co 			MORPHEME CO-OCCURRENCE CONSTRAINTS
\co
\mcl	Poss	3P 2P 1P 12P
\co
\mcc	PLIMPF	/ _ IMPFV
\mcc	PLDIR	/ IN _ / OUT _ / UP _ / DWN _ / RECIP _ / REF _
\mcc	2O	/ _... 2 / _... 2P / _... 2PST / _... INF / _... AG
\mcc	PRT	/ ~_... [Poss]
\mcc	PST	/ _... 3 / _... 1 / _... 12 / _... 1PRS2
\mcc	NMN	/ ~_... [Poss]
\mcc	FUT	/ 2 ..._ / 1FUT ..._ / 12FUT ..._ / 3FUT ..._ / 1FUT2 ..._
\mcc	CND	/ 1 ..._ / 2 ..._ / 3 ..._
\mcc	*sha	/ _... AFAR
\co
\co			SUFFIX ADHOC PAIRS
\sah DUR 3
\sah DO NMN
\sah 3P SUP
\sah 3P 3P
\sah 3 CONJ
\sah 3P CONJ
\sah DUR IN
\sah DUR 1
\sah DUR 12
\sah DUR 1PRS2
\sah PST PRF
\sah INF DIS
\sah INF DEF
\sah PNCT IMPFV
\sah 3 TOP
\sah BEN REF
\sah PASS REF
\sah BEC AG
\sah VRBL AG
\sah BCM2 AG
\sah PRT GEN
\sah PRT INST
\sah PST PST
\co
\co			MAXIMUM NUMBER OF AFFIXES AND ROOTS
\co
\maxp 0
\maxi 0
\maxr 1
