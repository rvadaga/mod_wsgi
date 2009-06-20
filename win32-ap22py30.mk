CPPFLAGS = \
 /I"c:\Program Files\Microsoft Visual Studio 9.0\VC\include" \
 /I"c:\Program Files\Microsoft SDKs\Windows\v6.0A\Include" \
 /I"c:\Program Files\Apache Software Foundation\Apache2.2\include" \
 /I"c:\Python30\include"

CFLAGS = \
 /DWIN32 \
 /DNDEBUG \
 /GF \
 /Gy \
 /O2 \
 /Wall \
 /Zc:wchar_t \
 /Zc:forScope

LDFLAGS = \
 /link \
 "/LIBPATH:c:\Program Files\Microsoft Visual Studio 9.0\VC\lib" \
 "/LIBPATH:c:\Program Files\Microsoft SDKs\Windows\v6.0A\Lib" \
 "/LIBPATH:c:\Program Files\Apache Software Foundation\Apache2.2\lib" \
 /LIBPATH:c:\Python30\libs \
 /OPT:REF \
 /OPT:ICF=2 \
 /RELEASE \
 /SUBSYSTEM:WINDOWS

LDLIBS = \
 python30.lib \
 libhttpd.lib \
 libapr-1.lib \
 libaprutil-1.lib

mod_wsgi.so : mod_wsgi.c
	cl $(CPPFLAGS) $(CFLAGS) $? /LD /MD $(LDFLAGS) $(LDLIBS) /OUT:$@
        mt -manifest $@.manifest -outputresource:$@;2

clean :
	del *.obj *.so *.so.manifest *.lib *.exp
