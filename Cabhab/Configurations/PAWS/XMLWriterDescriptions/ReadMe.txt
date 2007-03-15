This subdirectory contains section descriptions for the
Writer portion of PAWS.

Each Writer*.xml file contains the mark-up for a section in
the resulting paper.  The CreateWriterTransform.bat file is
applied to each one to produce a corresponding Writer*.xsl
transform.  This resulting transform is included in the
PAWSSKMasterWriterMapper.xsl transform that applies to the
answer file to produce an XLingPap compatible writer file.

You can use the CreateWriterTransforms.bat file to create
all of the transforms at one time.
