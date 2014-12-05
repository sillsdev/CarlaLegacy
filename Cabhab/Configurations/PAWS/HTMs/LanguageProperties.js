// LanguageProperties.js

// variables used throughout functions below
var attr;

function Initialize() {
	window.external.GetAnswerValue("//language/langNames/langName[@lang='en']");
	LangPropLangNameEn.value = window.external.OutValue;
	window.external.GetAnswerValue("//language/langNames/langName[@lang='es']");
	LangPropLangNameEs.value = window.external.OutValue;
	window.external.GetAnswerValue("//language/langNames/langName[@lang='fr']");
	LangPropLangNameFr.value = window.external.OutValue;
	window.external.GetAnswerValue("//language/langAbbr");
	LangPropLangAbbr.value = window.external.OutValue;

	window.external.GetAnswerValue("//language/font/fontName");
	LangPropFont.value = window.external.OutValue;
	window.external.GetAnswerValue("//language/font/@rtl");
	attr = window.external.OutValue;
	if (attr == "False")
	LangPropRTLLTR.checked = true; else
	LangPropRTLRTL.checked = true;

	ShowBackNextButtons.style.display = "none";
	Return.style.display = "";

	Refresh()
}
function RLangPropRTL(radio) {
	radio.checked = true;
	saveData();
	Refresh();
}

function saveData() {
	var sTemp;
	window.external.SetAnswerValue("//language/langNames/langName[@lang='en']", LangPropLangNameEn.value);
	window.external.SetAnswerValue("//language/langNames/langName[@lang='es']", LangPropLangNameEs.value);
	window.external.SetAnswerValue("//language/langNames/langName[@lang='fr']", LangPropLangNameFr.value);
	window.external.SetAnswerValue("//language/langAbbr", LangPropLangAbbr.value);

	//TODO: figure what to do if any of these are missing!
	sTemp = "False" // use default if all else fails...
	if (LangPropRTLLTR.checked)
	sTemp = "False";
	if (LangPropRTLRTL.checked)
	sTemp = "True";

	window.external.SetAnswerValue("//language/font/@rtl", sTemp);

	window.external.LanguageNameChanged();
	window.external.SaveData();
}
function ButtonLangPropFont() {
	saveData();
	window.external.ChangeFontInfo();
	Initialize();
}
function ButtonNext() {
	saveData();
	window.navigate("LanguageFilesNewMode");
}
function Refresh() {
	var valArray = new Array();
}
