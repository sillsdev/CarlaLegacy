// PAWSFiles.js

function Initialize() {
	var sAnswer;
	var sTemp;
	var index;

	window.external.GetAnswerValue("//language/answerFile");
	sAnswer = FileLocAnswer.value = window.external.OutValue;

	window.external.GetAnswerValue("//language/grammarFile");
	sTemp = FileLocGrammar.value = window.external.OutValue;
	if (sTemp == "") {
		index = sAnswer.lastIndexOf(".paw");
		if (index > - 1) {
			sTemp = sAnswer.substr(0, index) + ".grm";
			window.external.SetAnswerValue("//language/grammarFile", sTemp);
			FileLocGrammar.value = sTemp;
		}
	}

	window.external.GetAnswerValue("//language/writerFile");
	sTemp = FileLocWriter.value = window.external.OutValue;
	if (sTemp == "") {
		index = sAnswer.lastIndexOf(".paw");
		if (index > - 1) {
			sTemp = sAnswer.substr(0, index) + ".xml";
			window.external.SetAnswerValue("//language/writerFile", sTemp);
			FileLocWriter.value = sTemp;
		}
	}

	window.external.GetAnswerValue("//language/writerPracticalFile");
	sTemp = FileLocWriterPractical.value = window.external.OutValue;
	if (sTemp == "") {
		index = sAnswer.lastIndexOf(".paw");
		if (index > - 1) {
			sTemp = sAnswer.substr(0, index) + "WriterPractical.xml";
			window.external.SetAnswerValue("//language/writerPracticalFile", sTemp);
			FileLocWriterPractical.value = sTemp;
		}
	}

	window.external.GetAnswerValue("//language/writerPracticalSpanishFile");
	sTemp = FileLocWriterPracticalSpanish.value = window.external.OutValue;
	if (sTemp == "") {
		index = sAnswer.lastIndexOf(".paw");
		if (index > - 1) {
			sTemp = sAnswer.substr(0, index) + "WriterPracticalSpanish.xml";
			window.external.SetAnswerValue("//language/writerPracticalSpanishFile", sTemp);
			FileLocWriterPracticalSpanish.value = sTemp;
		}
	}

	window.external.GetAnswerValue("//language/exampleFilesPath");
	sTemp = FileLocExampleFiles.value = window.external.OutValue;
	if (sTemp == "") {
		index = sAnswer.lastIndexOf("\\");
		if (index > - 1) {
			sTemp = sAnswer.substr(0, index);
			window.external.SetAnswerValue("//language/exampleFilesPath", sTemp);
			FileLocExampleFiles.value = sTemp;
		}
	}


	window.external.GetAnswerValue("//language/textSFM");
	FileTextSFM.value = window.external.OutValue;

	displayCheckBoxValue(OutputGrammar, "/paws/@outputGrammar");
	/*displayCheckBoxValue(OutputWriter, "/paws/@outputWriter");*/
	displayCheckBoxValue(OutputWriterPractical, "/paws/@outputWriterPractical");
	displayCheckBoxValue(OutputWriterPracticalSpanish, "/paws/@outputWriterPracticalSpanish");

	ShowBackNextButtons.style.display = "none";
	Return.style.display = "";

	Refresh()
}
function displayCheckBoxValue(checkboxID, xpath) {
	window.external.GetAnswerValue(xpath);
	sTemp = checkboxID.value = window.external.OutValue;
	if (sTemp == "True")
	checkboxID.checked = true; else
	checkboxID.checked = false;
}
function saveData() {
	window.external.SetAnswerValue("//language/answerFile", FileLocAnswer.value);

	window.external.SetAnswerValue("//language/grammarFile", FileLocGrammar.value);

	window.external.SetAnswerValue("//language/writerFile", FileLocWriter.value);

	window.external.SetAnswerValue("//language/writerPracticalFile", FileLocWriterPractical.value);

	window.external.SetAnswerValue("//language/writerPracticalSpanishFile", FileLocWriterPracticalSpanish.value);

	window.external.SetAnswerValue("//language/exampleFilesPath", FileLocExampleFiles.value);

	window.external.SetAnswerValue("//language/textSFM", FileTextSFM.value);

	window.external.SetAnswerValue("/paws/@outputGrammar", OutputGrammar.value);

	/*window.external.SetAnswerValue("/paws/@outputWriter", OutputWriter.value);*/

	window.external.SetAnswerValue("/paws/@outputWriterPractical", OutputWriterPractical.value);

	window.external.SetAnswerValue("/paws/@outputWriterPracticalSpanish", OutputWriterPracticalSpanish.value);

	window.external.SaveData();

	window.external.InitAnswerTransforms()
}
function Refresh() {
	var valArray = new Array();

	/*if (! OutputWriter.checked && ! OutputWriterPractical.checked && ! OutputWriterPracticalSpanish.checked) {
		OutputWriter.checked = true;
	}*/
	if (! OutputWriterPractical.checked && ! OutputWriterPracticalSpanish.checked) {
		OutputWriterPractical.checked = true;
	}if (OutputGrammar.checked) {
		BrowseForGrammar.style.display = "";
		BrowseForGrammarDir.style.display = "";
	} else {
		BrowseForGrammar.style.display = "none";
		BrowseForGrammarDir.style.display = "none";
	}

	/*if (OutputWriter.checked) {
		BrowseForWriter.style.display = "";
	} else {
		BrowseForWriter.style.display = "none";
	}*/

	if (OutputWriterPractical.checked) {
		BrowseForWriterPractical.style.display = "";
	} else {
		BrowseForWriterPractical.style.display = "none";
	}

	if (OutputWriterPracticalSpanish.checked) {
		BrowseForWriterPracticalSpanish.style.display = "";
	} else {
		BrowseForWriterPracticalSpanish.style.display = "none";
	}
}
function ButtonFileLocAnswer() {
	var result;
	window.external.FileBrowse(FileLocAnswer.value, "PAWS Starter Kit (*.paw)|*.paw|" + "All Files (*.*)|*.*");
	result = window.external.OutValue;
	if (result != "Cancel") {
		FileLocAnswer.value = result;
		saveData();
	}
}
function ButtonFileLocGrammar() {
	var result;
	window.external.FileBrowse(FileLocGrammar.value, "PC-PATR Grammar  (*.grm)|*.grm|" + "All Files (*.*)|*.*");
	result = window.external.OutValue;
	if (result != "Cancel") {
		FileLocGrammar.value = result;
		saveData();
	}
}
function ButtonFileLocWriter() {
	var result;
	window.external.FileBrowse(FileLocWriter.value, "Writer File  (*.xml)|*.xml|" + "All Files (*.*)|*.*");
	result = window.external.OutValue;
	if (result != "Cancel") {
		FileLocWriter.value = result;
		saveData();
	}
}
function ButtonFileLocWriterPractical() {
	var result;
	window.external.FileBrowse(FileLocWriterPractical.value, "Writer File  (*.xml)|*.xml|" + "All Files (*.*)|*.*");
	result = window.external.OutValue;
	if (result != "Cancel") {
		FileLocWriterPractical.value = result;
		saveData();
	}
}
function ButtonFileLocWriterPracticalSpanish() {
	var result;
	window.external.FileBrowse(FileLocWriterPracticalSpanish.value, "Writer File  (*.xml)|*.xml|" + "All Files (*.*)|*.*");
	result = window.external.OutValue;
	if (result != "Cancel") {
		FileLocWriterPracticalSpanish.value = result;
		saveData();
	}
}
function ButtonFileLocExampleFiles() {
	var result;
	window.external.DirectoryBrowse(FileLocExampleFiles.value, "Example files directory");
	result = window.external.OutValue;
	if (result != "Cancel") {
		FileLocExampleFiles.value = result;
		saveData();
	}
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
		/*case "writer":
		if (OutputWriter.checked) {
			OutputWriter.checked = false;
		} else {
			OutputWriter.checked = true;
		}
		break;*/
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
		/*case "writer":
		if (OutputWriter.checked) {
			OutputWriter.value = "True";
		} else {
			OutputWriter.value = "False";
		}
		break;*/
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
function ButtonBack() {
	window.navigate("LanguagePropertiesNewMode");
}

function ButtonNext() {
	saveData();
	window.navigate("Contents.htm");
}