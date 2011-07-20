// About,js

function Initialize() {
	var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
	xmlDoc.async = "false";
	//xmlDoc.onreadystatechange=verify;
	xmlDoc.load("../paws.xml");
	//xmlObj=xmlDoc.documentElement;

	var versions = xmlDoc.getElementsByTagName("version");
	var versionNumberNode = versions[0].childNodes[0];
	var versionNumber = versionNumberNode.nodeValue;
	var version = document.getElementById("PAWSVersionNumber");
	version.innerText = version.textContent = versionNumber;

	/* window.external.GetLeftOffAt(); */
}

/*
function verify()
{
// 0 Object is not initialized
// 1 Loading object is loading data
// 2 Loaded object has loaded data
// 3 Data from object can be worked with
// 4 Object completely initialized
if (xmlDoc.readyState != 4)
{
return false;
}
}*/