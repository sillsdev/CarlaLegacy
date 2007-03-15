This subdirectory contains section descriptions for the
Grammar portion of PAWS.

Each Grammar*.xml file contains the mark-up for a section in
the resulting PC-PATR grammar file.  The
CreateGrammarTransform.bat file is applied to each one to
produce a corresponding Grammar*.xsl transform.  This
resulting transform is included in the
PAWSSKMasterGrammarMapper.xsl transform that applies to the
answer file to produce the PC-PATR grammar file.

You can use the CreateGrammarTransforms.bat file to create
all of the transforms at one time.
