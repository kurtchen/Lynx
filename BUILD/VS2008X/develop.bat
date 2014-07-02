@echo off
@rem $LynxId: develop.bat,v 1.2 2007/06/29 00:22:25 tom Exp $
@rem ensure that all IDE files are writable

attrib -r *.bat /s
attrib -r *.sln /s
attrib -r *.vcproj /s