
CSAutomationps.dll: dlldata.obj CSAutomation_p.obj CSAutomation_i.obj
	link /dll /out:CSAutomationps.dll /def:CSAutomationps.def /entry:DllMain dlldata.obj CSAutomation_p.obj CSAutomation_i.obj \
		kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib \

.c.obj:
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x0400 /DREGISTER_PROXY_DLL \
		$<

clean:
	@del CSAutomationps.dll
	@del CSAutomationps.lib
	@del CSAutomationps.exp
	@del dlldata.obj
	@del CSAutomation_p.obj
	@del CSAutomation_i.obj
