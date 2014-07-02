@ECHO OFF
@rem $LynxId: oldlynx.bat,v 1.3 2013/10/17 09:38:40 tom Exp $
@rem demonstrate lynx without color-style -TD
setlocal

set TERM=vt100
set HOME=%CD%
set TEMP=%HOME%\tmp

set LYNX_CFG=%HOME%\oldlynx.cfg
set LYNX_LSS=

if exist "%LYNX_CFG%" goto done

echo "DEFAULT_COLORS:off"    >>"%LYNX_CFG%"
echo "include:lynx-demo.cfg" >>"%LYNX_CFG%"
echo "COLOR_STYLE:"          >>"%LYNX_CFG%"
echo "NESTED_TABLES:off"     >>"%LYNX_CFG%"

:done
"%HOME%\lynx.exe" -lss="" %1 %2 %3 %4 %5 %6 %7 %8 %9
endlocal
