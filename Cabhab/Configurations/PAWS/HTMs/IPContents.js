// IPContents.js

// variables used throughout functions below
var attr;
var sImg;
var sTemp;
var xpath;

function Initialize() {
	displayStatus(IPContentsOverviewStatus, "ipContents1");
	displayStatus(IPContentsFeaturesStatus, "ipContents2");
	displayStatus(IPContentsProDropStatus, "ipContents3");
	displayStatus(IPContentsAuxStatus, "ipContents4");
	displayStatus(IPContentsIntransStatus, "ipContents5");
	displayStatus(IPContentsTransStatus, "ipContents6");
	displayStatus(IPContentsPassiveStatus, "ipContents7");
	displayStatus(IPContentsCatMapStatus, "ipContents8");
	displayStatus(IPContentsTestingStatus, "ipContents9");

	displayOutputGrammarItems();

	window.external.SetLeftOffAt("IPContents.htm");
}
function displayOutputGrammarItems() {
	window.external.GetAnswerValue("/paws/@outputGrammar");
	attr = window.external.OutValue;

	if (attr == "False") {
		IPContentsCatMapRow.style.display = "none";
		IPContentsTestingRow.style.display = "none";
	}
}
function displayStatus(idOfItem, strElem) {
	window.external.GetAnswerValue("//ip/" + strElem + "/@checkedOff");
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
	xpath = "//ip/" + strElem + "/@checkedOff";
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