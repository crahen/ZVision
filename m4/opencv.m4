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

ifdef(AM_DETECT_OPENCV,,[

AC_DEFUN([AM_DETECT_OPENCV],
[
 AC_REQUIRE([AM_DETECT_SYSROOT])
 AC_ARG_WITH(opencv,
  [  --with-opencv           OpenCV prefix [default=detect]],
  [

   if test x$withval != x ; then
     OPENCV_LIBS="-L$withval/lib"
     OPENCV_CXXFLAGS="-I$withval/include"
   fi

  ], 
  [OPENCV_LIBS=""
   OPENCV_CXXFLAGS=""
  ])

  OPENCV_CXXFLAGS="$OPENCV_CXXFLAGS"
  OPENCV_LIBS="$OPENCV_LIBS -lopencv_core -lopencv_imgproc -lopencv_ml -lopencv_highgui"

  ac_save_LIBS="$LIBS" 
  ac_save_CXXFLAGS="$CXXFLAGS"

  AC_CHECK_HEADER([opencv/cv.h],
  [AC_MSG_CHECKING([for OpenCV core, imgproc, ml & highgui components])

   LIBS="$LIBS $SYSROOT_LIBS $OPENCV_LIBS -lopencv_core -lopencv_imgproc -lopencv_ml -lopencv_highgui"
   CXXFLAGS="$CXXFLAGS $SYSROOT_CXXFLAGS $OPENCV_CXXFLAGS"

   AC_TRY_LINK([#include <opencv/cv.h>],
   [
   ],
   [AC_MSG_RESULT(yes)
    AC_DEFINE(HAVE_OPENCV,,[defined when OpenCV is available])
   ],
   [AC_MSG_RESULT(no)
   AC_MSG_ERROR("Could not use OpenCV")
   ])
  ])

  AC_SUBST(OPENCV_LIBS)
  AC_SUBST(OPENCV_CXXFLAGS)

  CXXFLAGS="$ac_save_CXXFLAGS"
  LIBS="$ac_save_LIBS"

])
])
