<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="pp">
<xsl:text>
rule {PP option conj - conjoined PPs}
PP = (InitConj) PP_1 Conj PP_2
	&lt;PP head&gt; = &lt;PP_1 head&gt;
	&lt;PP conjoined&gt; = +
	&lt;PP_1 conjoined&gt; = -	|limit recursion
	&lt;PP option&gt; = conj
</xsl:text>
	<xsl:text>
rule {PP option 0 - no modifiers}
PP = P'
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;PP option&gt; = 0
</xsl:text>
	<xsl:if test="//pp/@modifiers='yes' and //pp/@modifierType='degree' and //pp/@degreePos='before' or //pp/@modifiers='yes' and //pp/@modifierType='degree' and //pp/@degreePos='either' or //pp/@modifiers='yes' and //pp/@modifierType='degree' and //pp/@degreePos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degree' and //pp/@degreePos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='before' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='either' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='before' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='either' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@degreePos='before' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@degreePos='either' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@degreePos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@degreePos='beforeOrBoth'">
<xsl:text>
rule {PP option 1a - degree word before}
PP = Deg P'
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;Deg head type modifies_PP&gt; = +
	&lt;Deg head type PP-initial&gt; = +
	&lt;PP option&gt; = 1a
</xsl:text>
</xsl:if>

































































































	<xsl:if test="//pp/@modifiers='yes' and //pp/@modifierType='degree' and //pp/@degreePos='after' or //pp/@modifiers='yes' and //pp/@modifierType='degree' and //pp/@degreePos='either' or //pp/@modifiers='yes' and //pp/@modifierType='degree' and //pp/@degreePos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degree' and //pp/@degreePos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='after' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='either' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='after' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='either' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@degreePos='after' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@degreePos='either' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@degreePos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@degreePos='afterOrBoth'">
<xsl:text>
rule {PP option 1b - degree word after}
PP = P' Deg
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;Deg head type modifies_PP&gt; = +
	&lt;Deg head type PP-final&gt; = +
	&lt;PP option&gt; = 1b
</xsl:text>
</xsl:if>

































































































	<xsl:if test="//pp/@modifiers='yes' and //pp/@modifierType='degree' and //pp/@degreePos='both' or //pp/@modifiers='yes' and //pp/@modifierType='degree' and //pp/@degreePos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degree' and //pp/@degreePos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degree' and //pp/@degreePos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='both' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='both' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@degreePos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@degreePos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@degreePos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@degreePos='beforeOrBoth'">
<xsl:text>
rule {PP option 1c - degree word both sides}
PP = Deg_1 P' Deg_2
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;Deg_1 head type modifies_PP&gt; = +
	&lt;Deg_1 head type PP-initial&gt; = +
	&lt;Deg_2 head type modifies_PP&gt; = +
	&lt;Deg_2 head type PP-final&gt; = +
	&lt;PP option&gt; = 1c
</xsl:text>
</xsl:if>

































































































	<xsl:if test="//pp/@modifiers='yes' and //pp/@modifierType='manner' and //pp/@mannerPos='before' or //pp/@modifiers='yes' and //pp/@modifierType='manner' and //pp/@mannerPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='manner' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='manner' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@mannerPos='before' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@mannerPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@mannerPos='before' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@mannerPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@mannerPos='before' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@mannerPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@mannerPos='beforeOrBoth'">
<xsl:text>
rule {PP option 2a - adverbial before}
PP = AdvP P'
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;AdvP head type manner&gt; = +
	&lt;AdvP head type PP-initial&gt; = +
	&lt;PP option&gt; = 2a
</xsl:text>
</xsl:if>

































































































	<xsl:if test="//pp/@modifiers='yes' and //pp/@modifierType='manner' and //pp/@mannerPos='after' or //pp/@modifiers='yes' and //pp/@modifierType='manner' and //pp/@mannerPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='manner' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='manner' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@mannerPos='after' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@mannerPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@mannerPos='after' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@mannerPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@mannerPos='after' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@mannerPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@mannerPos='afterOrBoth'">
<xsl:text>
rule {PP option 2b - adverbial after}
PP = P' AdvP
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;AdvP head type manner&gt; = +
	&lt;AdvP head type PP-final&gt; = +
	&lt;PP option&gt; = 2b
</xsl:text>
</xsl:if>

































































































	<xsl:if test="//pp/@modifiers='yes' and //pp/@modifierType='manner' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='manner' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='manner' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='manner' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@mannerPos='beforeOrBoth'">
<xsl:text>
rule {PP option 2c - adverbial both sides}
PP = AdvP_1 P' AdvP_2
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;AdvP_1 head type manner&gt; = +
	&lt;AdvP_1 head type PP-initial&gt; = +
	&lt;AdvP_2 head type manner&gt; = +
	&lt;AdvP_2 head type PP-final&gt; = +
	&lt;PP option&gt; = 2c
</xsl:text>
</xsl:if>

































































































	<xsl:if test="//pp/@modifiers='yes' and //pp/@modifierType='ordinal' and //pp/@ordinalPos='before' or //pp/@modifiers='yes' and //pp/@modifierType='ordinal' and //pp/@ordinalPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='ordinal' and //pp/@ordinalPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='ordinal' and //pp/@ordinalPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='before' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@ordinalPos='before' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@ordinalPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@ordinalPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@ordinalPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='before' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth'">
<xsl:text>
rule {PP option 3a - ordinal before}
PP = AdjP P'
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;AdjP head type ordinal&gt; = +
	&lt;AdjP head type PP-initial&gt; = +
	&lt;PP option&gt; = 3a
</xsl:text>
</xsl:if>

































































































	<xsl:if test="//pp/@modifiers='yes' and //pp/@modifierType='ordinal' and //pp/@ordinalPos='after' or //pp/@modifiers='yes' and //pp/@modifierType='ordinal' and //pp/@ordinalPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='ordinal' and //pp/@ordinalPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='ordinal' and //pp/@ordinalPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='after' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@ordinalPos='after' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@ordinalPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@ordinalPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@ordinalPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='after' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='either' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth'">
<xsl:text>
rule {PP option 3b - ordinal after}
PP = P' AdjP
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;AdjP head type ordinal&gt; = +
	&lt;AdjP head type PP-final&gt; = +
	&lt;PP option&gt; = 3b
</xsl:text>
</xsl:if>

































































































	<xsl:if test="//pp/@modifiers='yes' and //pp/@modifierType='ordinal' and //pp/@ordinalPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='ordinal' and //pp/@ordinalPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='ordinal' and //pp/@ordinalPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='ordinal' and //pp/@ordinalPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@ordinalPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@ordinalPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@ordinalPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@ordinalPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth'">
<xsl:text>
rule {PP option 3c - ordinal both sides}
PP = AdjP_1 P' AdjP_2
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;AdjP_1 head type ordinal&gt; = +
	&lt;AdjP_1 head type PP-initial&gt; = +
	&lt;AdjP_2 head type ordinal&gt; = +
	&lt;AdjP_2 head type PP-final&gt; = +
	&lt;PP option&gt; = 3c
</xsl:text>
</xsl:if>

































































































	<xsl:if test="//pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='both' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='both' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='both' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='eitherOrboth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='eitherOrboth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='both' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndManner' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='beforeOrBoth'">
<xsl:text>
rule {PP option 4a - degree word or adverbial both sides}
PP = {Deg_1 / AdvP_1} P' {Deg_2 / AdvP_2}
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;Deg_1 head type modifies_PP&gt; = +
	&lt;Deg_1 head type PP-initial&gt; = +
	&lt;AdvP_1 head type manner&gt; = +
	&lt;AdvP_1 head type PP-initial&gt; = +
	&lt;Deg_2 head type modifies_PP&gt; = +
	&lt;Deg_2 head type PP-final&gt; = +
	&lt;AdvP_2 head type manner&gt; = +
	&lt;AdvP_2 head type PP-final&gt; = +
	&lt;PP option&gt; = 4a
</xsl:text>
</xsl:if>

































































































































	<xsl:if test="//pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='both' and //pp/@ordinalPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='afterOrBoth' and //pp/@ordinalPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='eitherOrBoth' and //pp/@ordinalPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='beforeOrBoth' and //pp/@ordinalPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='both' and //pp/@ordinalPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='afterOrBoth' and //pp/@ordinalPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='eitherOrBoth' and //pp/@ordinalPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='beforeOrBoth' and //pp/@ordinalPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='both' and //pp/@ordinalPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='afterOrBoth' and //pp/@ordinalPos='eitherOrboth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='eitherOrBoth' and //pp/@ordinalPos='eitherOrboth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='beforeOrBoth' and //pp/@ordinalPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='both' and //pp/@ordinalPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='afterOrBoth' and //pp/@ordinalPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='eitherOrBoth' and //pp/@ordinalPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='degreeAndOrdinal' and //pp/@degreePos='beforeOrBoth' and //pp/@ordinalPos='beforeOrBoth'">
<xsl:text>
rule {PP option 4b - degree word or ordinal both sides}
PP = {Deg_1 / AdjP_1} P' {Deg_2 / AdjP_2}
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;Deg_1 head type modifies_PP&gt; = +
	&lt;Deg_1 head type PP-initial&gt; = +
	&lt;AdjP_1 head type ordinal&gt; = +
	&lt;AdjP_1 head type PP-initial&gt; = +
	&lt;Deg_2 head type modifies_PP&gt; = +
	&lt;Deg_2 head type PP-final&gt; = +
	&lt;AdjP_2 head type ordinal&gt; = +
	&lt;AdjP_2 head type PP-final&gt; = +
	&lt;PP option&gt; = 4b
</xsl:text>
</xsl:if>

































































































































	<xsl:if test="//pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='both' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='afterOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='eitherOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='beforeOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='both' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='afterOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='eitherOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='beforeOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='both' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='afterOrBoth' and //pp/@mannerPos='eitherOrboth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='eitherOrBoth' and //pp/@mannerPos='eitherOrboth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='beforeOrBoth' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='both' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='afterOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='eitherOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='mannerAndOrdinal' and //pp/@ordinalPos='beforeOrBoth' and //pp/@mannerPos='beforeOrBoth'">
<xsl:text>
rule {PP option 4c - ordinal or adverbial both sides}
PP = {AdjP_1 / AdvP_1} P' {AdjP_2 / AdvP_2}
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;AdjP_1 head type ordinal&gt; = +
	&lt;AdjP_1 head type PP-initial&gt; = +
	&lt;AdvP_1 head type manner&gt; = +
	&lt;AdvP_1 head type PP-initial&gt; = +
	&lt;AdjP_2 head type ordinal&gt; = +
	&lt;AdjP_2 head type PP-final&gt; = +
	&lt;AdvP_2 head type manner&gt; = +
	&lt;AdvP_2 head type PP-final&gt; = +
	&lt;PP option&gt; = 4c
</xsl:text>
</xsl:if>

































































































































	<xsl:if test="//pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='both' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='both' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='both' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='both' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='both' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='both' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='both' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='both' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='both' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='afterOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='both' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='both' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='both' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='both' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='eitherOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='both' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='both' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='both' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='both' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='afterOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='eitherOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='both' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='afterOrBoth' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='eitherOrBoth' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='beforeOrBoth' or //pp/@modifiers='yes' and //pp/@modifierType='all' and //pp/@ordinalPos='beforeOrBoth' and //pp/@degreePos='beforeOrBoth' and //pp/@mannerPos='beforeOrBoth'">
<xsl:text>
rule {PP option 4d - degree word or ordinal or adverbial both sides}
PP = {Deg_1 / AdjP_2 / AdvP_1} P' {Deg_2 / AdjP_2 / AdvP_2}
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;Deg_1 head type modifies_PP&gt; = +
	&lt;Deg_1 head type PP-initial&gt; = +
	&lt;AdjP_1 head type ordinal&gt; = +
	&lt;AdjP_1 head type PP-initial&gt; = +
	&lt;AdvP_1 head type manner&gt; = +
	&lt;AdvP_1 head type PP-initial&gt; = +
	&lt;Deg_2 head type modifies_PP&gt; = +
	&lt;Deg_2 head type PP-final&gt; = +
	&lt;AdjP_2 head type ordinal&gt; = +
	&lt;AdjP_2 head type PP-final&gt; = +
	&lt;AdvP_2 head type manner&gt; = +
	&lt;AdvP_2 head type PP-final&gt; = +
	&lt;PP option&gt; = 4d
</xsl:text>
</xsl:if>


































































































































































































































































































































































































































































































































































































































































	<xsl:if test="//np/@case!='ergative' and //pp/@pPos='before' and //pp/@pType='word' or //np/@case!='ergative' and //pp/@pPos='both' and //pp/@pType='word'">
<xsl:text>
rule {PBar option 1a - prepositions, accusative DP complement}
P' = P DP
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P' head object&gt; = &lt;DP&gt;
	&lt;P head type PP-initial&gt; = +
	&lt;DP head case&gt; = accusative
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type wh&gt; = &lt;DP head type wh&gt;	| wh for pied-piping
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;P' head type suffix poss&gt; &lt;= &lt;DP head type suffix poss&gt;
	&lt;P' option&gt; = 1a
</xsl:text>
</xsl:if>













	<xsl:if test="//np/@case='ergative' and //pp/@pPos='before' and //pp/@pType='word' or //np/@case='split' and //pp/@pPos='before' and //pp/@pType='word' or //np/@case='ergative' and //pp/@pPos='both' and //pp/@pType='word' or //np/@case='split' and //pp/@pPos='both' and //pp/@pType='word'">
<xsl:text>
rule {PBar option 1aA - prepositions, absolutive DP complement}
P' = P DP
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P' head object&gt; = &lt;DP&gt;
	&lt;P head type PP-initial&gt; = +
	&lt;DP head case&gt; = absolutive
	&lt;P' head type absolutive_PP&gt; = +        | for restricting w/ possessor
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type wh&gt; = &lt;DP head type wh&gt;	| wh for pied-piping
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;P' head type suffix poss&gt; &lt;= &lt;DP head type suffix poss&gt;
	&lt;P' option&gt; = 1aA
</xsl:text>
</xsl:if>

























	<xsl:if test="//np/@case='ergative' and //pp/@pPos='before' and //pp/@pType='word' or //np/@case='split' and //pp/@pPos='before' and //pp/@pType='word' or //np/@case='ergative' and //pp/@pPos='both' and //pp/@pType='word' or //np/@case='split' and //pp/@pPos='both' and //pp/@pType='word'">
<xsl:text>
rule {PBar option 1aE - prepositions, ergative DP complement}
P' = P DP
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P' head object&gt; = &lt;DP&gt;
	&lt;P head type PP-initial&gt; = +
	&lt;DP head case&gt; = ergative
	&lt;P' head type ergative_PP&gt; = +        | for restricting w/ possessor
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type wh&gt; = &lt;DP head type wh&gt;	| wh for pied-piping
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;P' head type suffix poss&gt; &lt;= &lt;DP head type suffix poss&gt;
	&lt;P' option&gt; = 1aE
</xsl:text>
</xsl:if>

























	<xsl:if test="//np/@case='nominative' and //pp/@pPos='before' and //pp/@pType='word' or //np/@possCaseErg='genitive' and //pp/@pPos='before' and //pp/@pType='word' or //np/@case='nominative' and //pp/@pPos='both' and //pp/@pType='word' or //np/@possCaseErg='genitive' and //pp/@pPos='both' and //pp/@pType='word'">
<xsl:text>
rule {PBar option 1aG - prepositions, genitive DP complement}
P' = P DP
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P' head object&gt; = &lt;DP&gt;
	&lt;P head type PP-initial&gt; = +
	&lt;DP head case&gt; = genitive
	&lt;P' head type genitive_PP&gt; = +        | for restricting w/ possessor
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type wh&gt; = &lt;DP head type wh&gt;	| wh for pied-piping
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;P' head type suffix poss&gt; &lt;= &lt;DP head type suffix poss&gt;
	&lt;P' option&gt; = 1aG
</xsl:text>
</xsl:if>

























	<xsl:if test="//np/@case!='ergative' and //pp/@pPos='after' and //pp/@pType='word' or //np/@case!='ergative' and //pp/@pPos='both' and //pp/@pType='word'">
<xsl:text>
rule {PBar option 1b - postpositions, accusative DP complement}
P' = DP P
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P' head object&gt; = &lt;DP&gt;
	&lt;P head type PP-final&gt; = +
	&lt;DP head case&gt; = accusative
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type wh&gt; = &lt;DP head type wh&gt;	| wh for pied-piping
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;P' head type prefix poss&gt; &lt;= &lt;DP head type prefix poss&gt;
	&lt;P' option&gt; = 1b
</xsl:text>
</xsl:if>













	<xsl:if test="//np/@case='ergative' and //pp/@pPos='after' and //pp/@pType='word' or //np/@case='split' and //pp/@pPos='after' and //pp/@pType='word' or //np/@case='ergative' and //pp/@pPos='both' and //pp/@pType='word' or //np/@case='split' and //pp/@pPos='both' and //pp/@pType='word'">
<xsl:text>
rule {PBar option 1bA - postpositions, absolutive DP complement}
P' = DP P
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P' head object&gt; = &lt;DP&gt;
	&lt;P head type PP-final&gt; = +
	&lt;DP head case&gt; = absolutive
	&lt;P' head type absolutive_PP&gt; = +        | for restricting w/ possessor
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type wh&gt; = &lt;DP head type wh&gt;	| wh for pied-piping
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;P' head type prefix poss&gt; &lt;= &lt;DP head type prefix poss&gt;
	&lt;P' option&gt; = 1bA
</xsl:text>
</xsl:if>

























	<xsl:if test="//np/@case='ergative' and //pp/@pPos='after' and //pp/@pType='word' or //np/@case='split' and //pp/@pPos='after' and //pp/@pType='word'">
<xsl:text>
rule {PBar option 1bE - postpositions, ergative DP complement}
P' = DP P
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P' head object&gt; = &lt;DP&gt;
	&lt;P head type PP-final&gt; = +
	&lt;DP head case&gt; = ergative
	&lt;P' head type ergative_PP&gt; = +        | for restricting w/ possessor
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type wh&gt; = &lt;DP head type wh&gt;	| wh for pied-piping
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;P' head type prefix poss&gt; &lt;= &lt;DP head type prefix poss&gt;
	&lt;P' option&gt; = 1bE
</xsl:text>
</xsl:if>













	<xsl:if test="//np/@case='nominative' and //pp/@pPos='after' and //pp/@pType='word' or //np/@possCaseErg='genitive' and //pp/@pPos='after' and //pp/@pType='word' or //np/@case='nominative' and //pp/@pPos='both' and //pp/@pType='word' or //np/@possCaseErg='genitive' and //pp/@pPos='both' and //pp/@pType='word'">
<xsl:text>
rule {PBar option 1bG - postpositions, genitive DP complement}
P' = DP P
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P' head object&gt; = &lt;DP&gt;
	&lt;P head type PP-final&gt; = +
	&lt;DP head case&gt; = genitive
	&lt;P' head type genitive_PP&gt; = +        | for restricting w/ possessor
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type wh&gt; = &lt;DP head type wh&gt;	| wh for pied-piping
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;P' head type prefix poss&gt; &lt;= &lt;DP head type prefix poss&gt;
	&lt;P' option&gt; = 1bG
</xsl:text>
</xsl:if>

























	<xsl:if test="//pp/@pPos='before' and //pp/@pType='word' and //pp/@locative='yes' or //pp/@pPos='both' and //pp/@pType='word' and //pp/@locative='yes'">
<xsl:text>
rule {PBar option 2a - prepositions, locative AdvP complement}
P' = P AdvP
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P head type PP-initial&gt; = +
	&lt;AdvP head type locative&gt; = +
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type suffix poss&gt; &lt;= &lt;AdvP head type suffix poss&gt;
	&lt;P' option&gt; = 2a
</xsl:text>
</xsl:if>













	<xsl:if test="//pp/@pPos='after' and //pp/@pType='word' and //pp/@locative='yes' or //pp/@pPos='both' and //pp/@pType='word' and //pp/@locative='yes'">
<xsl:text>
rule {PBar option 2b - postpositions, locative AdvP complement}
P' = AdvP P
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P head type PP-final&gt; = +
	&lt;AdvP head type locative&gt; = +
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type prefix poss&gt; &lt;= &lt;AdvP head type prefix poss&gt;
	&lt;P' option&gt; = 2b
</xsl:text>
</xsl:if>













	<xsl:if test="//pp/@pPos='before' and //pp/@pType='word' and //pp/@ppComp='yes' or //pp/@pPos='both' and //pp/@pType='word' and //pp/@ppComp='yes'">
<xsl:text>
rule {PBar option 3a - prepositions, locative PP complement}
P' = P PP
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P head type PP-initial&gt; = +
	&lt;P head type locative&gt; = +
	&lt;PP head type locative&gt; = +
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type suffix poss&gt; &lt;= &lt;PP head type suffix poss&gt;
	&lt;P' option&gt; = 3a
</xsl:text>
</xsl:if>













	<xsl:if test="//pp/@pPos='after' and //pp/@pType='word' and //pp/@ppComp='yes' or //pp/@pPos='both' and //pp/@pType='word' and //pp/@ppComp='yes'">
<xsl:text>
rule {PBar option 3b - postpositions, locative PP complement}
P' = PP P
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P head type PP-final&gt; = +
	&lt;P head type locative&gt; = +
	&lt;PP head type locative&gt; = +
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type prefix poss&gt; &lt;= &lt;PP head type prefix poss&gt;
	&lt;P' option&gt; = 3b
</xsl:text>
</xsl:if>













	<xsl:if test="//pp/@pPos='before' and //pp/@pType='word' and //pp/@sentComp='yes' or //pp/@pPos='both' and //pp/@pType='word' and //pp/@sentComp='yes'">
<xsl:text>
rule {PBar option 4a - prepositions, IP complement }
P' = P IP
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P head type PP-initial&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head infl mood imperative&gt; = -
	&lt;IP head type copular&gt; = -
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type sentential&gt; = +
	&lt;P head type temporal&gt; = +           | assuming only temporals take IPs
	&lt;P' option&gt; = 4a
</xsl:text>
</xsl:if>













	<xsl:if test="//pp/@pPos='after' and //pp/@pType='word' and //pp/@sentComp='yes' or //pp/@pPos='both' and //pp/@pType='word' and //pp/@sentComp='yes'">
<xsl:text>
rule {PBar option 4b - postpositions, IP complement}
P' = IP P
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P head type PP-final&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head infl mood imperative&gt; = -
	&lt;IP head type copular&gt; = -
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type sentential&gt; = +
	&lt;P head type temporal&gt; = +           | assuming only temporals take IPs
	&lt;P' option&gt; = 4b
</xsl:text>
</xsl:if>













	<xsl:if test="//pp/@pPos='before' and //pp/@pType='word' and //pp/@sentComp='yes' or //pp/@pPos='both' and //pp/@pType='word' and //pp/@sentComp='yes'">
<xsl:text>
rule {PBar option 4apart - prepositions, Participle complement}
P' = P VP
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P head type PP-initial&gt; = +
	&lt;VP head type participle&gt; = +
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type sentential&gt; = +
	&lt;P head type temporal&gt; = +           | assuming only temporals take VPs
	&lt;P' option&gt; = 4apart
</xsl:text>
</xsl:if>













	<xsl:if test="//pp/@pPos='after' and //pp/@pType='word' and //pp/@sentComp='yes' or //pp/@pPos='both' and //pp/@pType='word' and //pp/@sentComp='yes'">
<xsl:text>
rule {PBar option 4bpart - postpositions, Participle complement}
P' = VP P
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P head type PP-final&gt; = +
	&lt;VP head type participle&gt; = +
	&lt;P' head type stranded&gt; = -		| not missing a complement
	&lt;P' head type sentential&gt; = +
	&lt;P head type temporal&gt; = +           | assuming only temporals take IPs
	&lt;P' option&gt; = 4bpart
</xsl:text>
</xsl:if>













	<xsl:if test="//pp/@alone='yes'">
<xsl:text>
rule {PBar option 5 - prepositions or postpositions with no complement}
P' = P
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P' head type stranded&gt; = +		| missing a complement
	&lt;P' option&gt; = 5
</xsl:text>
</xsl:if>



	<xsl:if test="//pp/@pPos!='after' and //pp/@pType!='word' and //pp/@attaches='edge'">
<xsl:text>
rule {PBar option 5a - P_prefix}
P' = DP
		&lt;P' head&gt; = &lt;DP head&gt;
	&lt;P' head object&gt; = &lt;DP&gt;
	&lt;DP head type prefix P&gt; = +
	&lt;P' head type stranded&gt; = -
	&lt;P' option&gt; = 5a
</xsl:text>
</xsl:if>







	<xsl:if test="//pp/@pPos!='before' and //pp/@pType!='word' and //pp/@attaches='edge'">
<xsl:text>
rule {PBar option 5b - P_suffix}
P' = DP
		&lt;P' head&gt; = &lt;DP head&gt;
	&lt;P' head object&gt; = &lt;DP&gt;
	&lt;DP head type suffix P&gt; = +
	&lt;P' head type stranded&gt; = -
	&lt;P' option&gt; = 5b
</xsl:text>
</xsl:if>







	<xsl:if test="//pp/@pType!='word' and //pp/@attaches='head'">
<xsl:text>
rule {PBar option 5aN - PP affix on N}
P' = DP
		&lt;P' head&gt; = &lt;DP head&gt;
	&lt;P' head object&gt; = &lt;DP&gt;
	&lt;DP head type PP&gt; = +
	&lt;P' head type stranded&gt; = -
	&lt;P' option&gt; = 5aN
</xsl:text>
</xsl:if>





	<xsl:if test="//pp/@pPos!='after' and //pp/@pType!='word' and //pp/@attaches='edge' and //pp/@IPComp='yes'">
<xsl:text>
rule {PBar option 6a - P_prefix, IP complement}
P' = IP
		&lt;P' head&gt; = &lt;IP head&gt;
	&lt;IP head type prefix P&gt; = +
	&lt;P' head type stranded&gt; = -
	&lt;P' head type sentential&gt; = +
	&lt;P' option&gt; = 6a
</xsl:text>
</xsl:if>









	<xsl:if test="//pp/@pPos!='before' and //pp/@pType!='word' and //pp/@attaches='edge' and //pp/@IPComp='yes'">
<xsl:text>
rule {PBar option 6b - P_suffix, IP complement}
P' = IP
		&lt;P' head&gt; = &lt;IP head&gt;
	&lt;IP head type suffix P&gt; = +
	&lt;P' head type stranded&gt; = -
	&lt;P' head type sentential&gt; = +
	&lt;P' option&gt; = 6b
</xsl:text>
</xsl:if>









	<xsl:if test="//pp/@pPos!='after' and //pp/@pType!='word' and //pp/@attaches='edge' and //pp/@IPComp='yes'">
<xsl:text>
rule {PBar option 7a - P_prefix, Participle complement}
P' = VP
		&lt;P' head&gt; = &lt;VP head&gt;
	&lt;VP head type prefix P&gt; = +
	&lt;VP head type participle&gt; = +
	&lt;P' head type stranded&gt; = -
	&lt;P' head type sentential&gt; = +
	&lt;P' option&gt; = 7a
</xsl:text>
</xsl:if>









	<xsl:if test="//pp/@pPos!='before' and //pp/@pType!='word' and //pp/@attaches='edge' and //pp/@IPComp='yes'">
<xsl:text>
rule {PBar option 7b - P_suffix, VP complement}
P' = VP
		&lt;P' head&gt; = &lt;VP head&gt;
	&lt;VP head type prefix P&gt; = +
	&lt;VP head type participle&gt; = +
	&lt;P' head type stranded&gt; = -
	&lt;P' head type sentential&gt; = +
	&lt;P' option&gt; = 7b
</xsl:text>
</xsl:if>









</xsl:template>
</xsl:stylesheet>
