dnl Copyright (c) 2005, Eric Crahen
dnl
dnl Permission is hereby granted, free of charge, to any person obtaining a copy
dnl of this software and associated documentation files (the "Software"), to deal
dnl in the Software without restriction, including without limitation the rights
dnl to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
dnl copies of the Software, and to permit persons to whom the Software is furnished
dnl to do so, subject to the following conditions:
dnl 
dnl The above copyright notice and this permission notice shall be included in all
dnl copies or substantial portions of the Software.
dnl 
dnl THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
dnl IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
dnl FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
dnl AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
dnl WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
dnl CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
AC_PREREQ([2.68])
AC_REVISION($Revision: 1.14 $ZV_VERSION $)

m4_include([m4/acinclude.m4])
m4_include([m4/opencv.m4])


AC_INIT([ZVision], [0.1.0])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_SRCDIR([README])
AC_COPYRIGHT([Eric Crahen, 2014])

AC_CANONICAL_TARGET
AC_CANONICAL_HOST

dnl Version information
ZV_MAJOR_VERSION=0
ZV_MINOR_VERSION=1
ZV_MICRO_VERSION=0
ZV_INTERFACE_AGE=0
ZV_BINARY_AGE=0
ZV_VERSION=$ZV_MAJOR_VERSION.$ZV_MINOR_VERSION.${ZV_MICRO_VERSION}

AC_SUBST(ZV_MAJOR_VERSION)
AC_SUBST(ZV_MINOR_VERSION)
AC_SUBST(ZV_MICRO_VERSION)
AC_SUBST(ZV_INTERFACE_AGE)
AC_SUBST(ZV_BINARY_AGE)
AC_SUBST(ZV_VERSION)


dnl prepare version info
LT_RELEASE=$ZV_MAJOR_VERSION.$ZV_MINOR_VERSION
LT_CURRENT=`expr $ZV_MICRO_VERSION - $ZV_INTERFACE_AGE`
LT_REVISION=$ZV_INTERFACE_AGE
LT_AGE=`expr $ZV_BINARY_AGE - $ZV_INTERFACE_AGE`

AC_SUBST(LT_RELEASE)
AC_SUBST(LT_CURRENT)
AC_SUBST(LT_REVISION)
AC_SUBST(LT_AGE)


AM_INIT_AUTOMAKE

AM_CONFIG_HEADER(src/config.h)
AM_ACLOCAL_INCLUDE(share)

dnl Check for support
AC_PROG_CXX


AM_REQUIRE_OPENCV

dnl Switch to C++ mode and check for needed C++ headers
AC_LANG_PUSH([C++])

dnl Configure the compiling options
case "$CXX" in
  *cl.exe)   # Microsoft Visual Studio
  CXXFLAGS="/nologo /MT /W3 /GX /O2 /YX /FD /c"
  CXXFLAGS="$CXXFLAGS /D \"_MBCS\" /D \"_LIB" /D \"WIN32\"
  ;;
  *)         # GNU
  CXXFLAGS="$CXXFLAGS -Wall"
  ;;
esac

dnl Header checks
AC_HEADER_STDC
AC_CHECK_HEADERS(errno.h)

dnl Configure the final compiler & linker options
if [[ "x$with_sysroot" != "x" ]] ; then
  CXXFLAGS="-I$with_sysroot/usr/include $CXXFLAGS"
  LDFLAGS="-I$with_sysroot/usr/lib $LDFLAGS"
fi
COMPILER_OPTIONS="$COMPILER_OPTIONS $CXXFLAGS $OPENCV_CXXFLAGS"
LINKER_OPTIONS="$LINKER_OPTIONS $LDFLAGS $OPENCV_LIBS"
AC_SUBST(LINKER_OPTIONS)
AC_SUBST(COMPILER_OPTIONS)

dnl Extra variables users can customize
EXTRA_COMPILER_OPTIONS=""
EXTRA_LINKER_OPTIONS=""
AC_SUBST(EXTRA_LINKER_OPTIONS)
AC_SUBST(EXTRA_COMPILER_OPTIONS)

AM_PROG_LIBTOOL

dnl Configure targets
SUBDIRS="src"
AC_SUBST(SUBDIRS)

AC_CONFIG_FILES([Makefile src/Makefile share/zvision-config share/zvision.spec])

AC_OUTPUT
