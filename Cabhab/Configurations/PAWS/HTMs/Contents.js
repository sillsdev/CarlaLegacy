// Contents.js

// variables used throughout functions below
var attr;
var sImg;
var sTemp;
var xpath;

function Initialize() {
	displayStatus(ContentsOverallTypologyQuestionsStatus, "typology");
	displayStatus(ContentsQuantifiersStatus, "qp");
	displayStatus(ContentsAdverbsStatus, "advp");
	displayStatus(ContentsAdjectivesStatus, "adjp");
	displayStatus(ContentsSimpleNPStatus, "np");
	displayStatus(ContentsProperNamesStatus, "prop");
	displayStatus(ContentsPronounsStatus, "pron");
	displayStatus(ContentsPrepositionsStatus, "pp");
	displayStatus(ContentsSingleClausesStatus, "ip");
	displayStatus(ContentsCompsStatus, "comp");
	displayStatus(ContentsQuestionsStatus, "q");
	displayStatus(ContentsRelClStatus, "relcl");
	displayStatus(ContentsAdvClsStatus, "advcl");
	displayStatus(ContentsNegativeStatus, "neg");
	displayStatus(ContentsCoordStatus, "coord");
	displayStatus(ContentsFocusStatus, "focus");
	displayStatus(ContentsExclamationsStatus, "excl");

	displayCheckBoxValue(OutputGrammar, "/paws/@outputGrammar");
	displayCheckBoxValue(OutputWriter, "/paws/@outputWriter");
	displayCheckBoxValue(OutputWriterPractical, "/paws/@outputWriterPractical");
	displayCheckBoxValue(OutputWriterPracticalSpanish, "/paws/@outputWriterPracticalSpanish");

	window.external.SetLeftOffAt("Contents.htm");
	Refresh();
}
function displayCheckBoxValue(checkboxID, xpath) {
	window.external.GetAnswerValue(xpath);
	sTemp = checkboxID.value = window.external.OutValue;
	if (sTemp == "True")
	checkboxID.checked = true; else
	checkboxID.checked = false;
}
function displayStatus(idOfItem, strElem) {
	window.external.GetAnswerValue("//" + strElem + "/@checkedOff");
	attr = window.external.OutValue;
	sImg = "&nbsp;&nbsp;<img src='";
	if (attr == "no") {
		sImg = sImg + "UnCheckedOff.GIF'>";
	} else {
		sImg = sImg + "CheckedOff.GIF'>";
	}
	idOfItem.innerHTML = sImg;
}
function saveData() {
	window.external.SetAnswerValue("/paws/@outputGrammar", OutputGrammar.value);

	window.external.SetAnswerValue("/paws/@outputWriter", OutputWriter.value);

	window.external.SetAnswerValue("/paws/@outputWriterPractical", OutputWriterPractical.value);

	window.external.SetAnswerValue("/paws/@outputWriterPracticalSpanish", OutputWriterPracticalSpanish.value);

	window.external.SaveData();
}
function SetOutputViaDescription(item) {
	switch (item) {
		case "grammar":
		if (OutputGrammar.checked) {
			OutputGrammar.checked = false;
		} else {
			OutputGrammar.checked = true;
		}
		break;
		case "writer":
		if (OutputWriter.checked) {
			OutputWriter.checked = false;
		} else {
			OutputWriter.checked = true;
		}
		break;
		case "writerPractical":
		if (OutputWriterPractical.checked) {
			OutputWriterPractical.checked = false;
		} else {
			OutputWriterPractical.checked = true;
		}
		break;
		case "writerPracticalSpanish":
		if (OutputWriterPracticalSpanish.checked) {
			OutputWriterPracticalSpanish.checked = false;
		} else {
			OutputWriterPracticalSpanish.checked = true;
		}
		break;
	}
	SetOutput(item);
}
function SetOutput(item) {
	switch (item) {
		case "grammar":
		if (OutputGrammar.checked) {
			OutputGrammar.value = "True";
		} else {
			OutputGrammar.value = "False";
		}
		break;
		case "writer":
		if (OutputWriter.checked) {
			OutputWriter.value = "True";
		} else {
			OutputWriter.value = "False";
		}
		break;
		case "writerPractical":
		if (OutputWriterPractical.checked) {
			OutputWriterPractical.value = "True";
		} else {
			OutputWriterPractical.value = "False";
		}
		break;
		case "writerPracticalSpanish":
		if (OutputWriterPracticalSpanish.checked) {
			OutputWriterPracticalSpanish.value = "True";
		} else {
			OutputWriterPracticalSpanish.value = "False";
		}
		break;
	}
	saveData();
	Refresh();
}
function StatusClicked(idOfItem, strElem) {
	xpath = "//" + strElem + "/@checkedOff";
	window.external.GetAnswerValue(xpath);
	attr = window.external.OutValue;
	sImg = "&nbsp;&nbsp;<img src='";
	if (attr == "no") {
		sImg = sImg + "CheckedOff.GIF'>";
		sTemp = "yes";
	} else {
		sImg = sImg + "UnCheckedOff.GIF'>";
		sTemp = "no";
	}
	window.external.SetAnswerValue(xpath, sTemp);
	idOfItem.innerHTML = sImg;
}
function Refresh() {

	if (! OutputWriter.checked && ! OutputWriterPractical.checked && ! OutputWriterPracticalSpanish.checked) {
		OutputWriter.checked = true;
	}

	if (OutputGrammar.checked) {
		InstructionsAddFeatures.style.display = "";
		InstructionsSaveResultsParser.style.display = "";
		InstructionsSaveResultsWriterOnly.style.display = "none";
		InstructionsMakeChanges.style.display = "";
	} else {
		InstructionsAddFeatures.style.display = "none";
		InstructionsSaveResultsParser.style.display = "none";
		InstructionsSaveResultsWriterOnly.style.display = "";
		InstructionsMakeChanges.style.display = "none";
	}
}