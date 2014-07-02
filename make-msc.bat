@echo off
rem Build with Visual C++
cd src\chrtrans
nmake -f makefile.msc %1 %2 %3 %4 %5 %6 %7 %8 %9
cd ..\..
nmake -f makefile.msc %1 %2 %3 %4 %5 %6 %7 %8 %9
