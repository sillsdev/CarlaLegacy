
SenTransCOMps.dll: dlldata.obj SenTransCOM_p.obj SenTransCOM_i.obj
	link /dll /out:SenTransCOMps.dll /def:SenTransCOMps.def /entry:DllMain dlldata.obj SenTransCOM_p.obj SenTransCOM_i.obj \
		kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib \

.c.obj:
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x0400 /DREGISTER_PROXY_DLL \
		$<

clean:
	@del SenTransCOMps.dll
	@del SenTransCOMps.lib
	@del SenTransCOMps.exp
	@del dlldata.obj
	@del SenTransCOM_p.obj
	@del SenTransCOM_i.obj
