@rem $LynxId: make-msc.bat,v 1.6 2008/02/18 00:34:44 tom Exp $
@echo off

nmake -f makefile.msc %1 %2 %3 %4 %5 %6 %7 %8 %9

if exist makeuctb.exe call makehdrs
