$ v0 = 0
$ v = f$verify(v0)
$! $LynxId: build.com,v 1.19 2011/05/23 23:49:53 tom Exp $
$!			BUILD.COM
$!
$!   Command file to build LYNX.EXE on VMS systems.
$!   Also invokes build of the WWWLibrary if its
$!    object library does not already exist.
$!
$!
$!   11-Jun-2010	Ch. Gartmann
$!	add support for "Multinet UCX emulation"
$!   01-Jul-2007	T.Dickey
$!	add support for "TCPIP" (TCPIP Services)
$!   04-Nov-2004	T.Dickey
$!	workarounds to build with IA64 platform.
$!   23-Oct-2004	T.Dickey
$!	cleanup, remove duplication, etc.
$!   08-Oct-1997	F.Macrides		macrides@sci.wfeb.edu
$!	Added comments and minor tweaks for convenient addition of
$!	compiler definitions and compiler and linker options.
$!   28-Jun-1997	F.Macrides		macrides@sci.wfeb.edu
$!	Added chartrans support.
$!   29-Feb-1996	F.Macrides		macrides@sci.wfeb.edu
$!	Added LYMap to the compilation and link lists.
$!   26-Jul-1995	F.Macrides		macrides@sci.wfeb.edu
$!	Reorganized the option files into ones for the transport and
$!	ones for the compiler, and adding support for GNUC.
$!   14-Jun-1995	F.Macrides		macrides@sci.wfeb.edu
$!	Added LYList.
$!   03-May-1995	F.Macrides		macrides@sci.wfeb.edu
$!	Include /nomember for compilations with DECC.  It's not the
$!	default on AXP and the code assumes byte alignment.
$!   23-Mar-1995	F.Macrides		macrides@sci.wfeb.edu
$!	Replaced references to v2.3.8 or v2.3.9 with v2.3-FM to avoid
$!	any confusion with official releases at UKans.
$!   16-Mar-1995	F.Macrides		macrides@sci.wfeb.edu
$!	Updated to permit submission to BATCH.
$!   17-Feb-1995	F.Macrides		macriees@sci.wfeb.edu
$!	Updated for v2.3-FM
$!   07-Dec-1994	F.Macrides		macrides@sci.wfeb.edu
$!	Updated for DECC/VAX, VAXC/VAX and DECC/AXP
$!   03-OCT-1994	A.Harper		A.Harper@kcl.ac.uk
$!	Mods to support SOCKETSHR/NETLIB and add a /DEBUG/NOOPT option
$!   02-Jun-1994	F.Macrides		macrides@sci.wfeb.edu
$!	Mods to support TCPWare (To use non-blocking connects, you need
$!	the DRIVERS_V405B.INC patch from FTP.PROCESS.COM for TCPware for
$!	OpenVMS Version 4.0-5, or a higher version of TCPWare, which will
$!	have that bug in the TCPDRIVER fixed.  Otherwise, add NO_IOCTL to
$!	the $ cc := cc/define=(...) list in [.WWW.Library.VMS]libmake.com).
$!   20-May-1994	Andy Harper		A.Harper@bay.cc.kcl.ac.uk
$!	Mods to support CMU TCP/IP
$!   13-Dec-1993	F.Macrides		macrides@sci.wfeb.edu
$!	Mods for conditional compilations with VAXC versus DECC
$!   10-Dec-1993	F.Macrides		macrides@sci.wfeb.edu
$!	Initial version, for Lynx v2.1
$!
$ ON CONTROL_Y THEN GOTO CLEANUP
$ ON ERROR THEN GOTO CLEANUP
$ proc = f$environment("PROCEDURE")
$ where = f$parse(proc,,,"DEVICE") + f$parse(proc,,,"DIRECTORY")
$ set default 'where'
$ write sys$output "Default directory:"
$ show default
$ write sys$output ""
$!
$!	Compiler definitions can be added here as a comma separated
$!	list with a lead comma, e.g., ",HAVE_FOO_H,DO_BLAH".  The
$!	definitions will apply only to the LYfoo.c modules.  Ones
$!	for the libwww-FM modules can be added equivalently in
$!	[.WWW.Library.vms]libmake.com. - FM
$!
$ extra_defs = ""
$!
$!	Include-paths can be added here as a comma separated
$!	list with a lead comma, e.g., ",foo".
$!
$ extra_incs = ""
$!
$!	Library definitions can be added here as a comma separated
$!	list with a lead comma, e.g., ",foo/LIB".
$!
$ extra_libs = ""
$!
$!	If no TCP/IP agent is specified (as the first argument),
$!	prompt for a number from the list.   Note that the agent
$!	must be the first argument if the debugger mode is to be
$!	set via a second argument (see below). - FM
$!
$ agent = 0
$ IF P1 .EQS. ""
$ THEN
$   If f$mode() .eqs. "BATCH"
$   Then
$	write sys$output "TCP/IP agent not specified!"
$	write sys$output "Defaulting to MULTINET"
$	agent = 1
$   Else
$ 	write sys$output "Acceptable TCP/IP agents are"
$ 	write sys$output " [1] MULTINET (default)"
$ 	write sys$output " [2] UCX"
$ 	write sys$output " [3] WIN_TCP"
$	write sys$output " [4] CMU_TCP"
$	write sys$output " [5] SOCKETSHR_TCP"
$	write sys$output " [6] TCPWARE"
$	write sys$output " [7] DECNET"
$	write sys$output " [8] TCPIP"
$	write sys$output " [9] Multinet with UCX emulation"
$ 	read sys$command/prompt="Agent [1,2,3,4,5,6,7,8,9] (RETURN = [1]) " agent
$   EndIf
$ ENDIF
$ option = ""
$ if agent .eq. 1 .or. agent .eqs. "" .or. p1 .eqs. "" .or. p1 .eqs. "MULTINET" then -
    option = "MULTINET"
$ if agent .eq. 2 .or. p1 .eqs. "UCX"           then option = "UCX"
$ if agent .eq. 3 .or. p1 .eqs. "WIN_TCP"       then option = "WIN_TCP"
$ if agent .eq. 4 .or. p1 .eqs. "CMU_TCP"       then option = "CMU_TCP"
$ if agent .eq. 5 .or. p1 .eqs. "SOCKETSHR_TCP" then option = "SOCKETSHR_TCP"
$ if agent .eq. 6 .or. p1 .eqs. "TCPWARE"       then option = "TCPWARE"
$ if agent .eq. 7 .or. p1 .eqs. "DECNET"        then option = "DECNET"
$ if agent .eq. 8 .or. p1 .eqs. "TCPIP"         then option = "TCPIP"
$ if agent .eq. 9 .or. p1 .eqs. "MULTINETUCX"        
$    then
$    option = "UCX"
$    mucx = 1
$    extra_defs = extra_defs + ",MUCX"
$ ELSE
$    mucx = 0
$ ENDIF
$!
$ if option .eqs. ""
$ then
$    write sys$output "TCP/IP agent could not be determined"
$    exit 18
$ endif
$!
$ if option .eqs. "TCPWARE"
$ then
$    write sys$output "Building Lynx for TCPWARE with UCX emulation..."
$    extra_defs = extra_defs + ",UCX"
$ endif
$!
$ optfile = "''option'"
$!
$!	Compiler and linker options can be specified here.  If
$!	there was a second argument (with any value), then debugger
$!	mode with no optimization will be specified as well.  The
$!	compiler options will apply only to the LYfoo.c and UCfoo.c
$!	modules.  Ones for the libwww-FM modules can be specified
$!	in [.WWW.Library.vms]libmake.com. - FM
$!
$ cc_opts = ""
$ link_opts = ""
$!
$!	The second parameter is a comma-separated list of the optional
$!	libraries:
$!		bzlib, slang, ssl, zlib
$!	Because these are normally not installed in a standard place,
$!	you must define their locations (see below for the symbols ending
$!	with "_INC" or "_LIB").
$!
$ if P2 .nes. ""
$ then
$   count_parm = 0
$ parse_p2:
$   value_parm = f$element('count_parm, ",", "''p2'")
$   if value_parm .nes. ","
$   then
$      if value_parm .eqs. "BZLIB"
$      then
$         write sys$output "** adding BZlib to build."
$         extra_defs = extra_defs + ",USE_BZLIB"
$         extra_incs = extra_incs + "," + BZLIB_INC
$         extra_libs = extra_libs + "," + BZLIB_LIB + "libbz2/LIB"
$      endif
$      if value_parm .eqs. "SLANG"
$      then
$         write sys$output "** adding SLang to build."
$         extra_defs = extra_defs + ",USE_SLANG"
$         extra_incs = extra_incs + "," + SLANG_INC
$         extra_libs = extra_libs + "," + SLANG_LIB + "slang.olb/lib"
$      endif
$      if value_parm .eqs. "SSL"
$      then
$         write sys$output "** adding SSL to build."
$         IF F$TYPE( ssl_lib ) .EQS. "" THEN ssl_lib = F$TRNLNM("SSLLIB")
$         IF F$TYPE( ssl_inc ) .EQS. "" THEN ssl_inc = F$TRNLNM("SSLINCLUDE")
$         extra_defs = extra_defs + ",USE_SSL,USE_OPENSSL_INCL"
$         extra_libs = extra_libs + "," + SSL_LIB + "libssl/LIB," + SSL_LIB + "libcrypto/LIB"
$!
$!	The "#include <openssl/ssl.h>" requires a logical variable "openssl".
$!
$         define/nolog openssl 'SSL_INC
$      endif
$      if value_parm .eqs. "ZLIB"
$      then
$         write sys$output "** adding Zlib to build."
$         extra_defs = extra_defs + ",USE_ZLIB"
$         extra_incs = extra_incs + "," + ZLIB_INC
$         extra_libs = extra_libs + "," + ZLIB_LIB + "libz/LIB"
$      endif
$      count_parm = count_parm + 1
$      goto parse_p2
$   endif
$ endif
$!
$!	The third parameter is nonempty to make a debug build
$!
$ if P3 .nes. ""
$   then
$      debug_arg = "DEBUG"
$      cc_opts = cc_opts + "/DEBUG/NOOPT"
$      link_opts = link_opts + "/DEBUG"
$   else
$      debug_arg = ""
$ endif
$!
$ IF f$search("[.WWW.Library.Implementation]WWWLib_''option'.olb") .nes. ""
$ THEN
$   write sys$output "  WWWLib_''option'.olb already exists."
$   If f$mode() .eqs. "BATCH"
$   Then
$	write sys$output "  Updating WWWLib_''option'.olb"
$   Else
$	read sys$command/prompt="  Update it [default Y]? " reply
$	if reply .nes. "" .and. -
	   f$extract(0,1,f$edit(reply, "TRIM, UPCASE")) .nes. "Y" then -
$	   goto Compile_CHRTRANS
$   EndIf
$ ENDIF
$ v1 = f$verify(1)
$!
$!	Build the WWWLibrary
$!
$ set default [.WWW.Library.VMS]
$ v1 = f$verify(v0)
$ @libmake "''option'" "''P2'" "''debug_arg'"
$ v1 = f$verify(1)
$ set default [-.-.-]
$ v1 = f$verify(v0)
$ ON CONTROL_Y THEN GOTO CLEANUP
$ ON ERROR THEN GOTO CLEANUP
$!
$Compile_CHRTRANS:
$ IF f$search("[.src.chrtrans]makeuctb.exe") .nes. ""
$ THEN
$   write sys$output "  [.src.chrtrans]makeuctb.exe already exists."
$   If f$mode() .eqs. "BATCH"
$   Then
$	write sys$output "  Updating makeuctb.exe and chrtrans header files."
$   Else
$	read sys$command -
	   /prompt="  Update it and chrtrans header files [default Y]? " reply
$	if reply .nes. "" .and. -
	   f$extract(0,1,f$edit(reply, "TRIM, UPCASE")) .nes. "Y" then -
$	   goto Compile_SRC
$   EndIf
$ ENDIF
$!
$ v1 = f$verify(1)
$!
$!	Build the chrtrans modules.
$!
$ set default [.src.chrtrans]
$ v1 = 'f$verify(v0)
$ @build-chrtrans
$ v1 = f$verify(1)
$ set default [-.-]
$ v1 = f$verify(v0)
$ ON CONTROL_Y THEN GOTO CLEANUP
$ ON ERROR THEN GOTO CLEANUP
$!
$Compile_SRC:
$ v1 = f$verify(1)
$!
$!	Compile the Lynx [.SRC] modules
$!
$ set default [.SRC]
$ v1 = f$verify(v0)
$ IF f$getsyi("ARCH_NAME") .eqs. "Alpha" .or. -
     f$getsyi("ARCH_NAME") .eqs. "IA64" .or. -
     f$trnlnm("VAXCMSG") .eqs. "DECC$MSG" .or. -
     f$trnlnm("DECC$CC_DEFAULT") .eqs. "/DECC" .or. -
     f$trnlnm("DECC$CC_DEFAULT") .eqs. "/VAXC"
$ THEN
$  compiler := "DECC"
$!
$  if option .eqs. "UCX"
$     then
$     optfile = "UCXSHR"
$     IF mucx THEN optfile = "MULTINET_UCX"
$  ENDIF
$  if option .eqs. "TCPIP"         then optfile = "TCPIPSHR"
$  if option .eqs. "TCPWARE"       then optfile = "TCPWARESHR"
$!
$  if option .eqs. "SOCKETSHR_TCP" then extra_defs = extra_defs + ",_DECC_V4_SOURCE"
$  if option .eqs. "TCPIP"         then extra_defs = extra_defs + ",TCPIP_SERVICES"
$  if option .eqs. "MULTINET" then -
	extra_defs = extra_defs + ",_DECC_V4_SOURCE,__SOCKET_TYPEDEFS"
$!
$  if option .eqs. "TCPIP"
$  then
$     if f$trnlnm("TCPIP$IPC_SHR") .eqs. "" then define TCPIP$IPC_SHR SYS$LIBRARY:TCPIP$IPC_SHR
$  endif
$!
$  v1 = f$verify(1)
$! DECC:
$  cc := cc/decc/prefix=all/nomember'cc_opts' -
	   /DEFINE=(ACCESS_AUTH,'option''extra_defs',__VMS_CURSES)-
	   /INCLUDE=([],[-],[-.WWW.Library.Implementation],[.chrtrans]'extra_incs')
$  v1 = f$verify(v0)
$ ELSE
$  IF option .eqs. "UCX"
$     THEN
$     optfile = "UCXSHR"
$     IF mucx THEN optfile = "MULTINET_UCX"
$  ENDIF
$  if option .eqs. "TCPIP"         then optfile = "TCPIPOLB"
$  if option .eqs. "TCPWARE"       then optfile = "TCPWAREOLB"
$  IF f$search("gnu_cc:[000000]gcclib.olb") .nes. ""
$  THEN
$   compiler := "GNUC"
$   v1 = f$verify(1)
$! GNUC:
$   cc := gcc'cc_opts' -
	     /DEFINE=(ACCESS_AUTH,'option''extra_defs')-
	     /INCLUDE=([],[-],[-.WWW.Library.Implementation],[.chrtrans]'extra_incs')
$   v1 = f$verify(v0)
$  ELSE
$   compiler := "VAXC"
$   v1 = f$verify(1)
$! VAXC:
$   cc := cc'cc_opts' -
	    /DEFINE=(ACCESS_AUTH,'option''extra_defs')-
	    /INCLUDE=([],[-],[-.WWW.Library.Implementation],[.chrtrans]'extra_incs')
$   v1 = f$verify(v0)
$  ENDIF
$ ENDIF
$ v1 = f$verify(1)
$!
$ cc DefaultStyle
$ cc GridText
$ cc HTAlert
$ cc HTFWriter
$ cc HTInit
$ cc HTML
$ cc LYBookmark
$ cc LYCgi
$ cc LYCharSets
$ cc LYCharUtils
$ cc LYClean
$ cc LYCookie
$ cc/nooptimize LYCurses
$ cc LYDownload
$ cc LYEdit
$ cc LYEditmap
$ cc LYexit
$ cc LYForms
$ cc LYGetFile
$ cc LYHistory
$ cc LYJump
$ cc LYKeymap
$ cc LYLeaks
$ cc LYList
$ cc LYMail
$ cc LYMain
$ cc LYMainLoop
$ cc LYMap
$ cc LYMktime
$ cc LYNews
$ cc LYOptions
$ cc LYPrint
$ cc LYrcFile
$ cc LYReadCFG
$ cc LYSearch
$ cc LYSession
$ cc LYShowInfo
$ cc LYStrings
$ cc LYTraversal
$ cc LYUpload
$ cc LYUtils
$ cc PARSDATE
$ cc TRSTable
$ cc UCAuto
$ cc UCAux
$ cc UCdomap
$!
$!	Link the objects and libaries.
$!
$ IF f$getsyi("ARCH_NAME") .eqs. "IA64"
$ THEN
$    optslibs="''extra_libs'"
$ ELSE
$    optslibs=", sys$disk:[]''optfile'.opt/opt, sys$disk:[]''compiler'.opt/opt ''extra_libs'"
$ ENDIF
$!
$ link/exe=lynx.exe/map=lynx 'link_opts' -
DefaultStyle.obj, -
GridText.obj, -
HTAlert.obj, -
HTFWriter.obj, -
HTInit.obj, -
HTML.obj, -
LYBookmark.obj, -
LYCgi.obj, -
LYCharSets.obj, -
LYCharUtils.obj, -
LYClean.obj, -
LYCookie.obj, -
LYCurses.obj, -
LYDownload.obj, -
LYEdit.obj, -
LYEditmap.obj, -
LYexit.obj, -
LYForms.obj, -
LYGetFile.obj, -
LYHistory.obj, -
LYJump.obj, -
LYKeymap.obj, -
LYLeaks.obj, -
LYList.obj, -
LYMail.obj, -
LYMain.obj, -
LYMainLoop.obj, -
LYMap.obj, -
LYMktime.obj, -
LYNews.obj, -
LYOptions.obj, -
LYPrint.obj, -
LYrcFile.obj, -
LYReadCFG.obj, -
LYSearch.obj, -
LYSession.obj, -
LYShowInfo.obj, -
LYStrings.obj, -
LYTraversal.obj, -
LYUpload.obj, -
LYUtils.obj, -
Parsdate.obj, -
TRSTable.obj, -
UCAuto.obj, -
UCAux.obj, -
UCdomap.obj, -
[-.WWW.Library.Implementation]WWWLib_'option'.olb/library 'optslibs
$!
$!	Copy the executable to the top directory and restore the default.
$!
$ copy lynx.exe [-]
$ set def [-]
$!
$ v1 = f$verify(v0)
$!
$!  Issue message on how to include LYNX.HLP in the system HELP library
$!
$ write sys$output ""
$ write sys$output "  To install or update lynx.hlp in the system HELP library,"
$ write sys$output "  use:"
$ write sys$output "        library/replace sys$help:helplib.hlb lynx.hlp"
$ write sys$output ""
$!
$ CLEANUP:
$    v1 = f$verify(v0)
$    set default 'where'
$    write sys$output "Default directory:"
$    show default
$    v1 = f$verify(v)
$ exit
