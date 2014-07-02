@echo off
@rem $LynxId: lynx.bat,v 1.3 2013/10/17 09:02:20 tom Exp $
@rem Claudio Santambrogio
setlocal
set TERM=vt100
set HOME=%CD%
set TEMP=%HOME%\tmp
set LYNX_CFG=%HOME%\lynx-demo.cfg
set LYNX_LSS=%HOME%\opaque.lss
"%HOME%\lynx.exe" %1 %2 %3 %4 %5
endlocal
