@rem $LynxId: makew32.bat,v 1.6 2007/06/28 21:07:24 tom Exp $
@echo off

if "%1"=="" goto normal
make -l -f makefile.bcb %1
goto done

:normal
make -l -f makefile.bcb

call makehdrs

:done
