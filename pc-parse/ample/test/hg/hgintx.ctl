\id HGticf.sfm - text input control file for Huallaga Quechua, SRMc, 25-May-88

\co		WORD FORMATION CHARACTERS

\wfc	' ~

\co		FIELDS TO EXCLUDE

\excl	\id			| identification field at beginning of file

\co		FORMAT MARKER CHARACTER

\format		\

\co		BAR CODES DEFINITION

\co\barchar	|		'|' would comment out any barcodes!!!
\barcodes	bdefhijmrsuvyz

\co		AMBIGUITY MARKER CHARACTER

\ambig		%

\co		ORTHOGRAPHY INPUT CHANGES

\ch	"aa" > "a:"		| for long vowels
\ch	"ee" > "i:"
\ch	"ii" > "i:"
\ch	"oo" > "u:"
\ch	"uu" > "u:"
\ch	"qeki" > "qiki"		| for cases like wawqeki
\ch	"~n" > "n~"		| in case somebody happens to put ~ before n
\scl sib s c			| for spanish loans like hwista and hwis
\ch	"hw" > "f"   / ~[sib]_
