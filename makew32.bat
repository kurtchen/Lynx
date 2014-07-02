@echo off
rem $LynxId: makew32.bat,v 1.5 2012/07/05 23:34:52 tom Exp $
setlocal

rem Check if GW32_ROOT is defined, and if not, fill in a default value.

	if not "x%GW32_ROOT%"=="x" goto exists
	set GW32_ROOT=c:\app\gnuwin32
:exists

	if exist "%GW32_ROOT%" goto doit
	echo ? %GW32_ROOT% does not exist
	goto finish

:doit
rem	if     exist %GW32_ROOT%\bcblibs set PATH=%PATH%;%GW32_ROOT%\bcblibs
rem	if not exist %GW32_ROOT%\bcblibs set PATH=%PATH%;%GW32_ROOT%\bin
	set PATH=%PATH%;%GW32_ROOT%\bin

rem Borland C
rem    -m                Displays the date and time stamp of each file
rem    -c                Caches auto-dependency information
make.exe -m -c -f makefile.bcb %1 %2
REM make.exe -m -c -f makefile.deb
REM make.exe -f makefile.win

:finish
endlocal
