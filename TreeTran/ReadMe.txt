============================================================================

This folder contains the source code and release files for TreeTran (a tool for visual selection and testing of transfer rules for machine translation):

1. Executable program file
2. Documentation
3. Source code files for the TreeTran namespace
4. Source code files for the TreeTranViewer namespace
5. Source code files for the TreeTranEngine namespace
6. Data files

2007-May-12 David Bullock (bullockd@u.washington.edu)

============================================================================

1. Executable program file:

- TreeTran.exe = The TreeTran program.

============================================================================

2. Documentation:

- TreeTranThesis.pdf = Describes the TreeTran program. Section 4.1 can be read as a user's guide.

============================================================================

3. Source code files for the TreeTran namespace (which provides windows to contain the TreeTranViewer controls):

- TreeTranMain.cs = Implements the main entry point for the TreeTran.exe program.

- TreeTranForm.cs and .resx = Implements the main TreeTran form, an MDI-parent form that contains the RuleForm and ParseForm.

- RuleForm.cs and .resx = Implements an MDI-child form that displays a RuleListViewer, a FindPatternViewer and a ReplacePatternViewer.

- ParseForm.cs and .resx = Implements an MDI-child form that displays a ParseListViewer and a ParseTreeViewer.

- HelpForm.cs and .resx = Implements a form that displays user-help documentation.

- AssemblyInfo.cs = Defines the assembly attributes for the TreeTran.exe program.

- TreeTranIcon.ico = Icon for the TreeTran.exe program.

- TreeTran.sln = Visual Studio solution file for TreeTran.

- TreeTran.csproj = Visual Studio project file for TreeTran.

============================================================================

4. Source code files for the TreeTranViewer namespace (which implements most of the user-interface functionality and makes the calls to the TreeTranEngine):

- RuleListViewer.cs and .resx = Implements a control that allows the user to view and edit a list of transfer rules.

- RuleListViewerItem.cs = Represents a list item in the RuleListViewer control.

- FindPatternViewer.cs and .resx = Implements a control that allows the user to view and edit the find-pattern tree of a transfer rule.

- ReplacePatternViewer.cs and .resx = Implements a control that allows the user to view and edit the replace-pattern tree of a transfer rule.

- ParseListViewer.cs and .resx = Implements a control that allows the user to view and edit a list of parses.

- ParseListViewerItem.cs = Represents a list item in the ParseListViewer control.

- ParseTreeViewer.cs and .resx = Implements a control that allows the user to view and edit a parse tree.

- FeaturesForm.cs and .resx = Implements a form that allows the user to view and edit the list of features on a node in a parse tree or transfer rule.

- TransferForm.cs and .resx = Implements a form that reads parse trees from an input file, applies a set of transfer rules, and writes the modified parse trees to an output file.

- TreeViewer.cs and .resx = Implements a control that displays nodes in a tree. (The ParseTreeViewer, FindPatternViewer and ReplacePatternViewer are all derived from this control.)

- TreeViewerNode.cs and .resx = Represents a node in the TreeViewer control.

- TreeViewerNodeCollection.cs = Implements a collection of TreeViewerNode items.

- TreeViewerNodeEventArgs.cs = Represents event data for node-specific events raised by the TreeViewer control. This file also defines the TreeViewerNodeEventHandler delegate for event-handler methods that pass a TreeViewerNodeEventArgs argument.

- RuleIcon.ico = Icon for items in the RuleListViewer.

- ParseIcon.ico = Icon for items in the ParseListViewer.

============================================================================

5. Source code files for the TreeTranEngine namespace (which implements all of the transfer algorithms as well as classes to read and write rule and parse files):

- TreeTransfer.cs = Represents the properties and methods used to apply a tree-transfer rule to a parse tree.

- FindAlgorithm.cs = Implements an algorithm to find a branch of the parse tree that matches the find-pattern tree.

- MatchAlgorithm.cs = Implements an algorithm to compare a branch of the parse tree against the find-pattern tree and produce a list of matching nodes.

- ReplaceAlgorithm.cs = Implements an algorithm to replace a branch of the parse tree, using the replace-pattern tree and the list of matching nodes.

- ParseReader.cs = Implements an XML reader for XAMPLE parse-tree data.

- ParseWriter.cs = Implements an XML writer for XAMPLE parse-tree data.

- ParseXml.cs = Defines XML string constants that are used by the ParseReader and ParseWriter classes.

- RuleReader.cs = Implements an XML reader for tree-transfer rule data.

- RuleWriter.cs = Implements an XML writer for tree-transfer rule data.

- RuleXml.cs = Defines XML string constants that are used by the RuleReader and RuleWriter classes.

- SyntaxNode.cs = Represents a node in a parse tree.

- SyntaxNodeCollection.cs = Implements a collection of SyntaxNode items.

- SyntaxFeature.cs = Represents a SyntaxNode feature as a name-value pair.

- SyntaxFeatureCollection.cs = Implements a collection of SyntaxFeature items.

- SyntaxNodePair.cs = Represents a pair of SyntaxNode objects: a node in the parse tree and the matching node from the find-pattern tree.

- SyntaxNodePairStack.cs = Implements a stack of SyntaxNodePair items.

- SyntaxNodeTriple.cs = Represents a triple of SyntaxNode objects: a new node in the replaced branch of the parse tree and the corresponding nodes from the find and replace patterns.

- SyntaxNodeTripleStack.cs = Implements a stack of SyntaxNodeTriple items.

- TransferRule.cs = Represents a transfer rule: the rule name, the root node of the find-pattern tree and the root node of the replace-pattern tree.

- TransferRuleCollection.cs = Implements a collection of TransferRule items.

- TreeTranEngineString.cs = Defines string constants that are used by the TreeTranEngine namespace.

============================================================================

6. Data files:

- TreeTransferRules.xml = Example tree-transfer rules (the evaluation data described in TreeTranThesis.pdf).

- PhillipBest.xml and SashaBest.xml = Example parse-tree input (the evaluation data described in TreeTranThesis.pdf).

- xample.dtd and pcpatr.dtd = Specifies the XML format that the TreeTran program uses to read and write parse-trees. Note that the program can read both the older XML format (without an <Input> tag) and the newer XML format (which includes an <Input> tag), but the program only writes the older XML format.

============================================================================
