/* CMDDATA.C - messages to support the CMD.H user interface
 ***************************************************************************
 * Copyright 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "cmd.h"

/*NumberedMessage sCmdInputTooLong_g		= { WARNING_MSG, 100,*/
/*    "Input line too long -- ignoring after first %d characters" };*/
NumberedMessage sCmdAmbiguous_g		= { ERROR_MSG,   101,
	"Ambiguous command: %s" };
NumberedMessage sCmdInvalid_g		= { ERROR_MSG,   102,
	"Invalid command: %s" };
NumberedMessage sCmdMissingKeyword_g	= { ERROR_MSG,   103,
	"Missing keyword in %s command" };
NumberedMessage sCmdMissingArgument_g	= { ERROR_MSG,   104,
	"Missing argument in %s command" };
NumberedMessage sCmdAmbiguousKeyword_g	= { ERROR_MSG,   105,
	"Ambiguous keyword in %s command: %s" };
NumberedMessage sCmdBadKeyword_g	= { ERROR_MSG,   106,
	"Invalid keyword in %s command: %s" };
NumberedMessage sCmdBadArgument_g	= { ERROR_MSG,   107,
	"Invalid argument in %s command: %s" };
NumberedMessage sCmdMissingInputFile_g	= { ERROR_MSG,   108,
	"Missing input file argument in %s command" };
NumberedMessage sCmdBadInputFile_g	= { ERROR_MSG,   109,
	"Cannot open input file %s in %s command" };
NumberedMessage sCmdBadOutputFile_g	= { ERROR_MSG,   110,
	"Cannot open output file %s in %s command" };
NumberedMessage sCmdTooDeepTake_g	= { ERROR_MSG,   111,
	"TAKE files nested too deeply" };
NumberedMessage sCmdErrorInTake_g	= { ERROR_MSG,   112,
	"TAKE file aborted due to invalid command: %s" };
NumberedMessage sCmdNoLogFile_g		= { ERROR_MSG,   113,
	"No log file was open" };
NumberedMessage sCmdClosingLog_g	= { WARNING_MSG, 114,
	"Closing the existing log file %s" };
NumberedMessage sCmdMissingEditFile_g	= { ERROR_MSG,   115,
	"Missing filename for EDIT command" };
NumberedMessage sCmdMissingDirectory_g	= { ERROR_MSG,   116,
	"Missing pathname for CD command" };
NumberedMessage sCmdInvalidDirectory_g	= { ERROR_MSG,   117,
	"Bad pathname for CD command" };
NumberedMessage sCmdMissingOutputFile_g	= { ERROR_MSG,   118,
	"Missing output file argument in %s command" };
