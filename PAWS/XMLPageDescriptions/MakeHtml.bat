REM Batch file to convert %1.xml to %.htm
REM
msxsl %1.xml ..\Transforms\PAWSSKHtmlMapper.xsl -o ..\HTMs\%1.htm
