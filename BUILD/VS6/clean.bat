@echo off
@rem $LynxId: clean.bat,v 1.2 2007/07/01 21:52:45 tom Exp $
@rem Remove all build-products in subdirectories, leaving only sources (and unrecognized types)

del/f/s/q *.aps
del/f/s/q *.bsc
del/f/s/q *.exe
del/f/s/q *.exp
del/f/s/q *.idb
del/f/s/q *.ilk
del/f/s/q *.lib
del/f/s/q *.ncb
del/f/s/q *.obj
del/f/s/q *.opt
del/f/s/q *.pch
del/f/s/q *.pdb
del/f/s/q *.plg
del/f/s/q *.res
del/f/s/q *.sbr
del/f/s/q *.suo

del/f/s/q ne*.h
del/f/s/q BuildLog.htm

attrib +r *.bat /s
attrib +r *.dsp /s
attrib +r *.dsw /s
