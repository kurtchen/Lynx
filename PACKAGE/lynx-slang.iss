; $LynxId: lynx-slang.iss,v 1.2 2013/12/17 23:04:59 tom Exp $
;
; This is an installer for the "color-style" flavor of Lynx.
;
; The script assumes environment variables have been set, e.g., to point to
; data which is used by the installer (see "lynx.lss" for details).

#define SetupBaseName "lynx-sl"
#define SourceExeName "lynx-slang.exe"
#define ScreenDllName "wslang32.dll"

#include "lynx.iss"
