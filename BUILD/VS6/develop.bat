@echo off
@rem $LynxId: develop.bat,v 1.2 2007/07/01 21:52:50 tom Exp $
@rem ensure that all IDE files are writable

attrib -r *.bat /s
attrib -r *.dsp /s
attrib -r *.dsw /s