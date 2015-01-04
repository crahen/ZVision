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

ifdef(AM_DETECT_SYSROOT,,[

AC_DEFUN([AM_DETECT_SYSROOT],
[
  AC_MSG_CHECKING([for sysroot])
  dnl Configure sysroot for cross-compiling
  if [[ "x$with_sysroot" != "xno" ]] ; then
    if [[ -d "$with_sysroot/usr/lib" ]]; then
      SYSROOT_LIBS="-L$with_sysroot/lib -L$with_sysroot/lib/$target_alias $SYSROOT_LIBS"
      SYSROOT_LIBS="-L$with_sysroot/usr/lib -L$with_sysroot/usr/lib/$target_alias $SYSROOT_LIBS"
      SYSROOT_CXXFLAGS="-I$with_sysroot/include $SYSROOT_CXXFLAGS"
      SYSROOT_CXXFLAGS="-I$with_sysroot/usr/include $SYSROOT_CXXFLAGS"
      SYSROOT_CXXFLAGS="-I$with_sysroot/include/$target_alias $SYSROOT_CXXFLAGS"
      SYSROOT_CXXFLAGS="-I$with_sysroot/usr/include/$target_alias $SYSROOT_CXXFLAGS"
      SYSROOT_CXXFLAGS="--sysroot=$with_sysroot $SYSROOT_CXXFLAGS -lrt"
      SYSROOT_CXXFLAGS="-Wl,-rpath-link,$with_sysroot/lib -Wl,-rpath-link,$with_sysroot/lib/$target_alias $SYSROOT_CXXFLAGS"
      SYSROOT_CXXFLAGS="-Wl,-rpath-link,$with_sysroot/usr/lib -Wl,-rpath-link,$with_sysroot/usr/lib/$target_alias $SYSROOT_CXXFLAGS"
    fi
    AC_MSG_RESULT(yes)
  else
    AC_MSG_RESULT(no)
  fi

  AC_SUBST(SYSROOT_LIBS)
  AC_SUBST(SYSROOT_CXXFLAGS)

  CXXFLAGS="$ac_save_CXXFLAGS"
  LIBS="$ac_save_LIBS"

  sharedstatedir="$with_sysroot/usr/share"

])
])
