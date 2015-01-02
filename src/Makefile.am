## Copyright (c) 2005, Eric Crahen
##
## Permission is hereby granted, free of charge, to any person obtaining a copy
## of this software and associated documentation files (the "Software"), to deal
## in the Software without restriction, including without limitation the rights
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
## copies of the Software, and to permit persons to whom the Software is furnished
## to do so, subject to the following conditions:
## 
## The above copyright notice and this permission notice shall be included in all
## copies or substantial portions of the Software.
## 
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
## WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
## CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

AM_CXXFLAGS = -I$(top_srcdir)/include @COMPILER_OPTIONS@ @EXTRA_COMPILER_OPTIONS@
AM_CPPFLAGS = -I$(top_srcdir)/include @COMPILER_OPTIONS@ @EXTRA_COMPILER_OPTIONS@
SUBDIRS=.

libdir=$(prefix)/lib

lib_LTLIBRARIES = libZVision.la

libZVision_la_LIBADD=@LINKER_OPTIONS@ @EXTRA_LINKER_OPTIONS@
libZVision_la_LDFLAGS= \
        -release $(LT_RELEASE)  \
        -version-info $(LT_CURRENT):$(LT_REVISION):$(LT_AGE)


LIBADD=@LINKER_OPTIONS@ @EXTRA_LINKER_OPTIONS@


libZVision_la_SOURCES = \
  cvaux.cpp \
  cvblob.cpp \
  cvcolor.cpp \
  cvcontour.cpp \
  cvlabel.cpp \
  cvtrack.cpp \
  CMT.cpp \
  BB.cpp \
  BBPredict.cpp \
  FBTrack.cpp \
  Median.cpp \
  DetectionResult.cpp \
  DetectorCascade.cpp \
  EnsembleClassifier.cpp \
  Clustering.cpp \
  MedianFlowTracker.cpp \
  NNClassifier.cpp \
  VarianceFilter.cpp \
  TLDUtil.cpp
