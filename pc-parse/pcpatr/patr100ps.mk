
patr100ps.dll: dlldata.obj patr100_p.obj patr100_i.obj
	link /dll /out:patr100ps.dll /def:patr100ps.def /entry:DllMain dlldata.obj patr100_p.obj patr100_i.obj \
		kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib \

.c.obj:
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x0400 /DREGISTER_PROXY_DLL \
		$<

clean:
	@del patr100ps.dll
	@del patr100ps.lib
	@del patr100ps.exp
	@del dlldata.obj
	@del patr100_p.obj
	@del patr100_i.obj
