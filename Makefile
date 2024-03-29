include Makefile.vars

EXEC_NAME := app
LIB_NAME  := mylib
SRC_DIR   := src
ARFLAGS   := rcs
BUILD_NAME := build$(addprefix _,$(call to_lower,$(TARGET)))                    
BUILD_DIR  := $(BUILD_NAME)

# Compilation flags
ifeq($(TARGET),WEB)
    AR  := emar
    CC  := emcc
    CXX := em++
    LDLIBS   += 
    LDFLAGS  += 
    DEBUG_FLAGS   += 
    RELEASE_FLAGS += 
    WFLAGS   += 
    CPPFLAGS += 
    CXXFLAGS += 
    CFLAGS   += 
endif
ifeq($(TARGET),ANDROID)
	ANDROID_ARCH ?= arm64
	ANDROID_API_VERSION ?= 29
    LDLIBS   += 
    LDFLAGS  += 
    DEBUG_FLAGS   += 
    RELEASE_FLAGS += 
    WFLAGS   += 
    CPPFLAGS += 
    CXXFLAGS += 
    CFLAGS   += 
endif
ifeq($(TARGET),WINDOWS)
ifdef MSVC
    LDLIBS   += 
    LDFLAGS  += 
    DEBUG_FLAGS   += 
    RELEASE_FLAGS += 
    WFLAGS   += 
    CPPFLAGS += 
    CXXFLAGS += 
    CFLAGS   += 
else
    LDLIBS   += 
    LDFLAGS  += 
    DEBUG_FLAGS   += -g -ggdb -O0
    RELEASE_FLAGS += -march=native -Ofast -s -DNDEBUG
    WFLAGS   += 
    CPPFLAGS += 
    CXXFLAGS += 
    CFLAGS   += 
endif
endif
ifeq($(TARGET),LINUX)
    LDLIBS   += 
    LDFLAGS  += 
    DEBUG_FLAGS   += -g -ggdb -O0
    RELEASE_FLAGS += -march=native -Ofast -s -DNDEBUG
    WFLAGS   += 
    CPPFLAGS += 
    CXXFLAGS += 
    CFLAGS   += 
endif
ifeq($(TARGET),OSX)
    LDLIBS   += 
    LDFLAGS  += 
    DEBUG_FLAGS   += 
    RELEASE_FLAGS += 
    WFLAGS   += 
    CPPFLAGS += 
    CXXFLAGS += 
    CFLAGS   += 
endif
# Add more targets

export

.PHONY: all run run_cgdb info clean cleanall

all:
	$(MAKE) -f Makefile all

lib:
	$(MAKE) -f Makefile lib

run:
	$(MAKE) -f Makefile run

run_valgrind:
	$(MAKE) -f Makefile run_valgrind

run_cgdb:
	$(MAKE) -f Makefile run_cgdb

info:
	$(MAKE) -f Makefile info

clean:
	$(MAKE) -f Makefile clean

cleanall:
	$(MAKE) -f Makefile cleanall
