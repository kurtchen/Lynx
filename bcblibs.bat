@echo off
rem $LynxId: bcblibs.bat,v 1.5 2012/07/05 23:32:15 tom Exp $
rem Use this script to construct import-libraries for the Borland C compiler
rem from the dll's in the GnuWin32 directory.
rem
rem The script assumes that the Borland C compiler is already in your %PATH%
rem search-list.  It also uses the Windows 2000 command-extensions, which are
rem provided in Windows XP and later by default.
setlocal

rem Check if GW32_ROOT is defined, and if not, fill in a default value.

	if not "x%GW32_ROOT%"=="x" goto exists
	set GW32_ROOT=c:\app\gnuwin32
:exists

	if exist "%GW32_ROOT%" goto doit
	echo ? %GW32_ROOT% does not exist
	goto finish

:doit
	rem do this just in case it is needed
	set PATH=%PATH%;%GW32_ROOT\bin

	set SAVE_CD="%CD%"
	cd %GW32_ROOT%

	if not exist bcblibs mkdir bcblibs

	cd bin
	if ERRORLEVEL 1 goto failed

	for %%N in (*.dll) do call :implib %%~nN%

	cd %CD%
	goto finish

:implib
	echo making import-library for %1
	set SOURCE=%1.dll
	set TARGET=..\bcblibs\%1.lib
	copy %1.dll ..\bcblibs
	implib -a %TARGET% %1.dll
	:goto :eof

:failed

:finish
endlocal
