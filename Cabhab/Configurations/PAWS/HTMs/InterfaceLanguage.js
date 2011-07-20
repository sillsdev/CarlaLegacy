// InterfaceLanguage.js

// variables used throughout functions below
var attr;

function Initialize() {
	window.external.GetInterfaceLanguage();
	attr = window.external.OutValue;
	if (attr == "en")
	InterfaceLangEn.checked = true; else
	InterfaceLangEs.checked = true;

	Return.style.display = "";

	Refresh()
}
function RInterfaceLang(radio) {
	radio.checked = true;
	saveData();
	Refresh();
}

function saveData() {
	var sTemp;

	//TODO: figure what to do if any of these are missing!
	sTemp = "en" // use default if all else fails...
	if (InterfaceLangEn.checked)
	sTemp = "en";
	if (InterfaceLangEs.checked)
	sTemp = "es";

	window.external.SetInterfaceLanguage(sTemp);
}

function copyFiles() {
	var sTemp;

	sTemp = "en" // use default if all else fails...
	if (InterfaceLangEn.checked)
	sTemp = "en";
	if (InterfaceLangEs.checked)
	sTemp = "es";

	window.external.CopyFiles("Localizations/" + sTemp + "/HTMs", "HTMs");
	window.external.CopyFiles("Localizations/" + sTemp + "/XmlPageDescriptions", "XmlPageDescriptions");
	window.external.CopyFile("Localizations/" + sTemp + "/LocalizedItems_" + sTemp + ".xml", "LocalizedItems.xml");
	window.external.SaveInterfaceLanguage();
}

function Refresh() {
	var valArray = new Array();
}