Log Browser ver 0.2a 03/05/2001
Changes:
	- modified script to handle analysis failures as is new log format.
	- fixed error that occurred when single quote is used on rule comment
	- minor adjustments to layout and display features.

Log Browser ver 0.1a 27/04/2001

Usage: <path>logbrowser.hta -g <filename> -l <filename>

	-g		location and filename of a pcpatr grammar file
	-l		location and filename of a pcpatr log output file

Description:

Log Browser is a simple browser application designed specifically for
viewing xml-formatted PCPATR log files. It is a HTML Application (.hta) which means
that it runs within a special Internet Explorer window. It is necessary therefore
to have IE 5.5 and also the Msxml3.dll installed on the user's computer.

Information in the log file is displayed in an organized, readable format. Each analyzed
sentence is selectable for a dropdown list box. The nodes and leafs in each analysis
are arranged in an Explorer-like tree diagram. Clicking on any node or leaf results
in the feature structure and either the grammar rule or, in the case of a leaf, the
lexical feature structure being displayed on the right-side windows of the browser.
In case of multiple parses of a given sentence the tree diagram normally displays only
the unique branches of each parse. The non-unique branches are available, only
collapsed. The text is also displayed in interlinear format at the bottom of the screen.

The user specifies the PCPATR output log file and the associated grammar file in one
of two ways; using the command line options described in the usage section above, or by
by typing or selecting the file name for the appropriate text box under the Files
tab. Once the log file is loaded the program will automatically switch to the Browser
tab. By clicking on the Files tab it is possible to change or reload either file.
Unfortunately, I have not found a way to persist the user's file choices from one
session to the next, nor even to insert the command line values into the text boxes.
I recomment using the command line options within a Windows program shortcut as a way
to keep from having to type in the filenames for each session.

Similarly, I have not found a way to user to set persistant options for things like
character styles for the various elements in the analysis tree. However, it is possible to
specify the styles for three elements - catagory labels, glosses, and vernacular words - by
modifying the logbrowser.css file in the css subfolder in the program main folder.

Known bugs:

-	When the tree diagram is first created, the feature for multiple parses mentioned above
	does not work properly. Some non-unique nodes that should be hidden are not. Also, the
	(+) and (-) symbols which indicate if a node's discendant are expanded or collapsed do
	not initialize properly. Clicking on any symbol will, of course, toggle its state and
	thereafter it will display properly.

-	Not necessary a bug: Initial loading of log files and the transformation of the xml into
	NW tree diagrams are slow. XSLT is designed to be easy, not fast.