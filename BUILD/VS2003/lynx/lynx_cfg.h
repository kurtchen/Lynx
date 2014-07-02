// $LynxId: lynx_cfg.h,v 1.6 2011/05/28 13:07:55 tom Exp $
// definitions abstracted from makefile.msc

#ifndef LYNX_CFG_H
#define LYNX_CFG_H 1

#define __WIN32__
#define _WINDOWS
#define _WIN32_WINNT 0x0400

#define ACCESS_AUTH 1
#define CJK_EX 1
#define DIRED_SUPPORT 1
#define DISP_PARTIAL 1
#define DOSPATH 1
#define USE_ALT_BINDINGS 1
#define EXP_NESTED_TABLES 1
#define HAVE_KEYPAD 1
#define HAVE_PUTENV 1
#define LONG_LIST 1
#define NDEBUG 1
#define NOSIGHUP 1
#define NOUSERS 1
#define NO_CONFIG_INFO 1
#define NO_CUSERID 1
#define NO_FILIO_H 1
#define NO_TTYTYPE 1
#define NO_UNISTD_H 1
#define NO_UTMP 1
#define OK_OVERRIDE 1
#define SH_EX 1
#define USE_CMD_LOGGING 1
#define USE_EXTERNALS 1
#define USE_FILE_UPLOAD 1
#define USE_JUSTIFY_ELTS 1
#define USE_MULTIBYTE_CURSES 1
#define USE_PERSISTENT_COOKIES 1
#define USE_PRETTYSRC 1
#define USE_READPROGRESS 1
#define USE_SCROLLBAR 1
#define USE_SOURCE_CACHE 1
#define USE_ZLIB 1
#define WIN_EX 1

// definitions to account for using this file (see HTUtils.h, userdefs.h)
#define ANSI_VARARGS 1
#define HAVE_GETCWD 1
#define HAVE_STDARG_H 1
#define HAVE_STDLIB_H 1
#define LYNX_CFG_FILE "./lynx.cfg"
#define UNDERLINE_LINKS FALSE
#define socklen_t int

// configuration choices
#define PDCURSES 1
#define USE_WINSOCK2_H 1

#ifdef PDCURSES
#define USE_COLOR_STYLE 1
#define COLOR_CURSES 1
#define FANCY_CURSES 1
#endif

#pragma warning (disable : 4244)	/* conversion from 'xxx' to 'yyy', possible loss of data */
#pragma warning (disable : 4267)	/* conversion from 'xxx' to 'yyy', possible loss of data */
#pragma warning (disable : 4311)	/* 'type cast': pointer truncation from 'xxx' to 'yyy' FIXME */

#endif /* LYNX_CFG_H */
