// NPContents.js

// variables used throughout functions below
var attr;
var sImg;
var sTemp;
var xpath;

function Initialize() {
	displayStatus(NPContentsOverviewStatus, "npContents1");
	displayStatus(NPContentsAgreementStatus, "npContents2");
	displayStatus(NPContentsArticleStatus, "npContents3");
	displayStatus(NPContentsPossessorsStatus, "npContents4");
	displayStatus(NPContentsQPStatus, "npContents5");
	displayStatus(NPContentsAdjPStatus, "npContents6");
	displayStatus(NPContentsCompoundsStatus, "npContents7");
	displayStatus(NPContentsCatMapStatus, "npContents8");
	displayStatus(NPContentsTestingStatus, "npContents9");

	displayOutputGrammarItems();

	window.external.SetLeftOffAt("NPContents.htm");
}
function displayOutputGrammarItems() {
	window.external.GetAnswerValue("/paws/@outputGrammar");
	attr = window.external.OutValue;

	if (attr == "False") {
		NPContentsCatMapRow.style.display = "none";
		NPContentsTestingRow.style.display = "none";
	}
}
function displayStatus(idOfItem, strElem) {
	window.external.GetAnswerValue("//np/" + strElem + "/@checkedOff");
	attr = window.external.OutValue;
	sImg = "&nbsp;&nbsp;<img src='";
	if (attr == "no") {
		sImg = sImg + "UnCheckedOff.GIF'>";
	} else {
		sImg = sImg + "CheckedOff.GIF'>";
	}
	idOfItem.innerHTML = sImg;
}
function StatusClicked(idOfItem, strElem) {
	xpath = "//np/" + strElem + "/@checkedOff";
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