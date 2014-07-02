# Microsoft Developer Studio Project File - Name="lynx" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=lynx - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "lynx.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "lynx.mak" CFG="lynx - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "lynx - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "lynx - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "lynx - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I "..\..\..\..\src" /I "..\..\..\..\src\chrtrans" /I "..\..\..\..\WWW\Library\Implementation" /I "..\..\..\..\lib" /I "..\..\..\.." /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "_WINDOWS" /D "DOSPATH" /D "NO_UNISTD_H" /D "__WIN32__" /D "WIN_EX" /D "NOUSERS" /D "DIRED_SUPPORT" /D "DISP_PARTIAL" /D "DONT_HAVE_TM_GMTOFF" /D "HAVE_KEYPAD" /D "NOSIGHUP" /D "NO_TTYTYPE" /D "NO_UTMP" /D "SH_EX" /D "USE_EXTERNALS" /D "USE_FILE_UPLOAD" /D "USE_MULTIBYTE_CURSES" /D "USE_PERSISTENT_COOKIES" /D "USE_PRETTYSRC" /D "USE_READPROGRESS" /D "USE_SCROLLBAR" /D "USE_SOURCE_CACHE" /D "USE_ZLIB" /D "PDCURSES" /D "COLOR_CURSES" /D "FANCY_CURSES" /D "USE_COLOR_STYLE" /D "USE_WINSOCK2_H" /D _WIN32_WINNT=0x0400 /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib pdcurses.lib zlib.lib /nologo /subsystem:console /machine:I386 /nodefaultlib:"libcmt" /libpath:"..\..\..\..\lib"

!ELSEIF  "$(CFG)" == "lynx - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I "..\..\..\..\src" /I "..\..\..\..\src\chrtrans" /I "..\..\..\..\WWW\Library\Implementation" /I "..\..\..\..\lib" /I "..\..\..\.." /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "_WINDOWS" /D "DOSPATH" /D "NO_UNISTD_H" /D "__WIN32__" /D "WIN_EX" /D "NOUSERS" /D "DIRED_SUPPORT" /D "DISP_PARTIAL" /D "DONT_HAVE_TM_GMTOFF" /D "HAVE_KEYPAD" /D "NOSIGHUP" /D "NO_TTYTYPE" /D "NO_UTMP" /D "SH_EX" /D "USE_EXTERNALS" /D "USE_FILE_UPLOAD" /D "USE_MULTIBYTE_CURSES" /D "USE_PERSISTENT_COOKIES" /D "USE_PRETTYSRC" /D "USE_READPROGRESS" /D "USE_SCROLLBAR" /D "USE_SOURCE_CACHE" /D "USE_ZLIB" /D "PDCURSES" /D "COLOR_CURSES" /D "FANCY_CURSES" /D "USE_COLOR_STYLE" /D "USE_WINSOCK2_H" /D _WIN32_WINNT=0x0400 /YX /FD /GZ /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib wsock32.lib pdcurses.lib zlib.lib /nologo /subsystem:console /debug /machine:I386 /nodefaultlib:"libc" /nodefaultlib:"libcmt" /pdbtype:sept /libpath:"..\..\..\..\lib"

!ENDIF 

# Begin Target

# Name "lynx - Win32 Release"
# Name "lynx - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=..\..\..\..\src\DefaultStyle.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\lib\dirent.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\GridText.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTAABrow.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTAAProt.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTAAUtil.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTAccess.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\HTAlert.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTAnchor.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTAssoc.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTAtom.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTBTree.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTChunk.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTDOS.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTFile.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTFinger.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTFormat.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTFTP.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\HTFWriter.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTGopher.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTGroup.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\HTInit.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTLex.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTList.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTMIME.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\HTML.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTMLDTD.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTMLGen.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTNews.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTParse.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTPlain.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTRules.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTString.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTStyle.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTTCP.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTTelnet.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTTP.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTUU.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTWSRC.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYBookmark.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYCgi.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYCharSets.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYCharUtils.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYClean.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYCookie.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYCurses.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYDownload.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYEdit.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYEditmap.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYexit.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYExtern.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYForms.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYGetFile.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYHash.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYHistory.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYJump.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYKeymap.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYLeaks.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYList.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYLocal.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYMail.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYMain.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYMainLoop.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYMap.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYmktime.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYNews.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYOptions.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYPrettySrc.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYPrint.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYrcFile.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYReadCFG.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYSearch.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYShowInfo.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYStrings.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYStyle.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYTraversal.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYUpload.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYUtils.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\mktime.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\parsdate.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\SGML.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\strstr.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\TRSTable.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\UCAuto.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\UCAux.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\UCdomap.c
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\Xsystem.c
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=..\..\..\..\src\AttrList.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\GridText.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTAABrow.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTAAProt.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTAAUtil.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTAccess.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\HTAlert.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTAnchor.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTAssoc.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTAtom.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTBTree.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTChunk.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTCJK.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTDOS.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HText.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTFile.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTFinger.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\HTFont.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTFormat.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\HTForms.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTFTP.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTFWriter.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTGopher.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTGroup.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTInit.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTioctl.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTLex.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTList.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTMIME.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\HTML.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTMLDTD.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTMLGen.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\HTNestedList.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTNews.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTParse.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTPlain.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTRules.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\HTSaveToFile.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTStream.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTString.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTStyle.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTTCP.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTTelnet.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTTP.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\htutils.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTUU.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\HTWSRC.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYBookmark.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYCgi.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYCharSets.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYCharUtils.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYCharVals.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYClean.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYCookie.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYCurses.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYDownload.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYEdit.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\LYexit.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYExtern.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYGCurses.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYGetFile.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYGlobalDefs.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYHash.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYHistory.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYJump.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYJustify.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYKeymap.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\LYLeaks.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYList.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYLocal.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYMail.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYMainLoop.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYMap.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\LYMessages_en.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYNews.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYOptions.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYPrettySrc.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYPrint.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYrcFile.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYReadCFG.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYSearch.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYShowInfo.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYSignal.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYStrings.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYStructs.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYStyle.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYTraversal.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYUpload.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYUtils.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\LYVMSdef.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\SGML.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\structdump.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\TRSTable.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\UCAuto.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\UCAux.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\UCDefs.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\src\UCdomap.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\UCMap.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\userdefs.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\www_tcp.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\WWW\Library\Implementation\www_wait.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
