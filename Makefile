#
# Makefile for Billing Agent
#
# $Id: Makefile 125 2009-03-01 16:37:11Z cdsheen $

OSNAME=OSX

DEFINES=

TARGET=testHamming

RM=rm

ifeq ($(OS),Windows_NT)

	UNAME_P := $(shell uname -p)
	ifeq ($(UNAME_P),x86_64)
		JNI_OS_INCLUDE = $(JAVA_HOME)/include/x86_64
	else 
		JNI_OS_INCLUDE = $(JAVA_HOME)/include/win32	
	endif
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		JNI_OS_INCLUDE = $(JAVA_HOME)/include/linux
	endif
	ifeq ($(UNAME_S),Darwin)
		JNI_OS_INCLUDE = $(JAVA_HOME)/include/darwin
	endif
endif

#revision := $(shell svnversion|sed 's/[\:MS].*//')

#CFLAGS=-Wall -g -fPIC -I $(DEFINES) -DSVN_REVISION=$(revision) -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64

#CFLAGS=-Wall -g -fPIC -I $(DEFINES) -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
CFLAGS=-Wall -g $(DEFINES) -std=c++11 -fpic `pkg-config opencv --cflags` -I$(JAVA_HOME)/include -I$(JNI_OS_INCLUDE)
#LDFLAGS=-lpthread -shared -fPIC
LDFLAGS=`pkg-config opencv --libs`
OBJS=testHamming.o



.SUFFIXES:	.cpp

.c.o:	
	$(CXX) $(CFLAGS) -c $<

.cpp.o:	
	$(CXX) $(CFLAGS) -c $<

all: $(TARGET)

$(TARGET):	$(OBJS)
	$(CXX) $(OBJS) $(LDFLAGS) -o $(TARGET)

clean:
	$(RM) *.o *~ $(TARGET)
