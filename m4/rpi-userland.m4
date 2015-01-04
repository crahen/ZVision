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

ifdef(AM_DETECT_RPI_USERLAND,,[

AC_DEFUN([AM_DETECT_RPI_USERLAND],
[
 AC_REQUIRE([AM_DETECT_SYSROOT])
 AC_ARG_WITH(userland,
  [  --with-userland         Userland interface prefix [default=detect]],
  [
   if test x$withval != x ; then
     RPI_USERLAND_LIBS="-L$withval/lib -L$withval/usr/lib"
     RPI_USERLAND_CXXFLAGS="-I$withval/include -Wl,-rpath-link,$withval/lib -Wl,-rpath-link,$withval/usr/lib"
   fi
  ])

  dnl Userland exposes an API in the sysroot image
  if [[ x$with_sysroot != x ]]; then
    RPI_USERLAND_CXXFLAGS="-I$with_sysroot/opt/vc/include $RPI_USERLAND_CXXFLAGS"
    RPI_USERLAND_CXXFLAGS="-I$with_sysroot/opt/vc/include/interface/vmcs_host/linux -I$with_sysroot/opt/vc/include/interface/vcos/pthreads $RPI_USERLAND_CXXFLAGS"
    RPI_USERLAND_CXXFLAGS="-Wl,-rpath-link,$with_sysroot/opt/vc/lib $RPI_USERLAND_CXXFLAGS"
    RPI_USERLAND_CXXFLAGS="-Wl,-rpath-link,$with_sysroot/opt/vc/usr/lib $RPI_USERLAND_CXXFLAGS"
    RPI_USERLAND_LIBS="$RPI_USERLAND_LIBS -L$with_sysroot/opt/vc/lib"
    RPI_USERLAND_LIBS="$RPI_USERLAND_LIBS -L$with_sysroot/opt/vc/usr/lib"
    RPI_USERLAND_LIBS="$RPI_USERLAND_LIBS -lmmal_core -lmmal_util -lmmal_vc_client -lvcos -lbcm_host -lEGL -lGLESv2"
  fi

  ac_save_LIBS="$LIBS" 
  ac_save_CXXFLAGS="$CXXFLAGS"

  LIBS="$LIBS $SYSROOT_LIBS $RPI_USERLAND_LIBS"
  CXXFLAGS="$CXXFLAGS $SYSROOT_CXXFLAGS $RPI_USERLAND_CXXFLAGS"

  AC_CHECK_HEADER([bcm_host.h],
  [AC_MSG_CHECKING([for RPI userland interfaces])
   AC_TRY_LINK([#include <bcm_host.h>],
   [
     close(0);
   ],
   [AC_MSG_RESULT(yes)
    AC_DEFINE(HAVE_RPI_USERLAND,,[defined when userland interface is available])
   ],
   [AC_MSG_RESULT(no)
   ])
  ])

  AC_SUBST(RPI_USERLAND_LIBS)
  AC_SUBST(RPI_USERLAND_CXXFLAGS)

  CXXFLAGS="$ac_save_CXXFLAGS"
  LIBS="$ac_save_LIBS"
  LDFLAGS="$ac_save_LDFLAGS"

])
])
