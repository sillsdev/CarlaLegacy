// Welcome.js

// variables used throughout functions below
var attr;

function Initialize() {
}

function ButtonNew() {
	window.external.CreateNewLanguage();
}

function ButtonFindAnswer() {
	var sFound;
	window.external.FindAnswerFile();
	sFound = window.external.OutValue;
	if (sFound == "true") {
		window.external.GetAnswerValue("//leftOffAt");
		var sTemp = window.external.OutValue;
		window.navigate(sTemp);
	}
}

function ButtonQuit() {
	window.external.QuitFromNewLanguagePage();
}

function Refresh() {
	var valArray = new Array();
}