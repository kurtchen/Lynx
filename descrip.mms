!	Make LYNX hypertext browser under VMS
!       =====================================
!
!	NOTE:  Use [.SRC.CHRTRANS]BUILD-CHRTRANS.COM to create the
!	       chrtrans header files before using this descrip.mms.
!
! History:
!  01/01/93 creation at KU (Lou montulli@ukanaix.cc.ukans.edu). 
!  04/12/93 (seb@lns61.tn.cornell.edu)
!            modified to support either UCX or MULTINET
!  12/13/93 (macrides@sci.wfeb.edu)
!	     Added conditional compilations for VAXC vs. DECC
!	     (dependencies not yet specified; this is just a
!	      "starter", should anyone want to do it well).
!  10/26/94 (dyson@IowaSP.Physics.UIowa.EDU) RLD
!            Updated for AXP/VMS v6.1 and VAX/VMS v5.5-1
!  12/07/94 (macrides@sci.wfeb.edu)
!	     Updated for DECC/VAX, VAXC/VAX and DECC/AXP
!  02/17/95 (macrides@sci.wfeb.edu)
!	     Updated for v2.3-FM
!  03/23/95 (macrides@sci.wfeb.edu)
!	     Replaced references to v2.3.8 or v2.3.9 with v2.3-FM to
!	     avoid any confusion with official releases at UKans.
!  07/29/95 (macrides@sci.wfeb.edu)
!	     Added support for GNUC.
!  15 Sep 06 (TD)	Cleanup...
!
! Instructions:
!	Use the correct command line for your TCP/IP implementation:
!
!	$ MMS /Macro = (MULTINET=1)		for VAXC - MultiNet
!	$ MMS /Macro = (WIN_TCP=1)		for VAXC - Wollongong TCP/IP
!	$ MMS /Macro = (UCX=1)			for VAXC - UCX
!	$ MMS /Macro = (CMU_TCP=1)		for VAXC - OpenCMU TCP/IP
!	$ MMS /Macro = (SOCKETSHR_TCP=1)	for VAXC - SOCKETSHR/NETLIB
!	$ MMS /Macro = (TCPWARE=1)		for VAXC - TCPWare TCP/IP
!	$ MMS /Macro = (DECNET=1)		for VAXC - socket emulation over DECnet
!
!	$ MMS /Macro = (MULTINET=1, DEC_C=1)	for DECC - MultiNet
!	$ MMS /Macro = (WIN_TCP=1, DEC_C=1)	for DECC - Wollongong TCP/IP
!	$ MMS /Macro = (UCX=1, DEC_C=1)		for DECC - UCX
!	$ MMS /Macro = (CMU_TCP=1, DEC_C=1)	for DECC - OpenCMU TCP/IP
!	$ MMS /Macro = (SOCKETSHR_TCP=1,DEC_C=1) for DECC - SOCKETSHR/NETLIB
!	$ MMS /Macro = (TCPWARE=1, DEC_C=1)	for DECC - TCPWare TCP/IP
!	$ MMS /Macro = (DECNET=1, DEC_C=1)	for DECC - socket emulation over DECnet
!
!	$ MMS /Macro = (MULTINET=1, GNU_C=1)	for GNUC - MultiNet
!	$ MMS /Macro = (WIN_TCP=1, GNU_C=1)	for GNUC - Wollongong TCP/IP
!	$ MMS /Macro = (UCX=1, GNU_C=1)		for GNUC - UCX
!	$ MMS /Macro = (CMU_TCP=1, GNU_C=1)	for GNUC - OpenCMU TCP/IP
!	$ MMS /Macro = (SOCKETSHR_TCP=1,GNU_C=1) for GNUC - SOCKETSHR/NETLIB
!	$ MMS /Macro = (TCPWARE=1, GNU_C=1)	for GNUC - TCPWare TCP/IP
!	$ MMS /Macro = (DECNET=1, GNU_C=1)	for GNUC - socket emulation over DECnet

.ifdef DEC_C
COMPILE_DEF = DEC_C
.else
.ifdef GNU_C
COMPILE_DEF = GNU_C
.else
COMPILE_DEF = VAX_C
.endif
.endif

.ifdef SLANG
SCREEN_DEF = SLANG
.else
SCREEN_DEF = VMS_CURSES
.endif

.ifdef WIN_TCP
NETWORK_DEF = WIN_TCP
.else
.ifdef CMU_TCP
NETWORK_DEF = CMU_TCP
.else
.ifdef SOCKETSHR_TCP
NETWORK_DEF = SOCKETSHR_TCP
.else
.ifdef UCX
NETWORK_DEF = UCX
.else
.ifdef TCPWARE
NETWORK_DEF = TCPWARE
.else
.ifdef DECnet
NETWORK_DEF = DECNET
.else !  Default to MultiNet
NETWORK_DEF = MULTINET
.endif !  DECnet
.endif !  TCPWARE
.endif !  UCX
.endif !  SOCKETSHR_TCP
.endif !  CMU_TCP
.endif !  WIN_TCP

RECURS_DEFS = /Macro=($(NETWORK_DEF)=1, $(SCREEN_DEF)=1, $(COMPILE_DEF)=1)

lynx :	lynx.exe
	! Finished Building LYNX for VMS!!!

lynx.exe : library exe
	@ Continue

library :
	Set Default [.www.library.implementation]
	$(MMS) $(MMSQUALIFIERS) /Description = [-.VMS]DESCRIP.MMS $(RECURS_DEFS) Library
	Set Default [---]

exe :
	Set Default [.src]
	$(MMS) $(MMSQUALIFIERS) $(RECURS_DEFS) Lynx
	Copy /NoLog /NoConfirm lynx.exe [-];
	Set Default [-]

clean :
	Set Default [.www.library.implementation]
	$(MMS) $(MMSQUALIFIERS) /Description = [-.VMS]DESCRIP.MMS clean
	Set Default [---]
	Set Default [.src]
	$(MMS) $(MMSQUALIFIERS) clean
	Set Default [-]
	- Purge /NoLog /NoConfirm
