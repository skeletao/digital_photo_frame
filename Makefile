CROSSCOMPILE := 

AS  = $(CROSSCOMPILE)as
LD 	= $(CROSSCOMPILE)ld
CC 	= $(CROSSCOMPILE)gcc
CPP = $(CC) -E
AR  = $(CROSSCOMPILE)ar
NM  = $(CROSSCOMPILE)nm

STRIP 		= $(CROSSCOMPILE)strip
OBJCOPY		= $(CROSSCOMPILE)objcopy
OBJDUMP 	= $(CROSSCOMPILE)objdump

CFLAGS 	:= -Wall -O2 -g 
CFLAGS  += -I$(PWD)/include -I/usr/local/include/freetype2

LDFLAGS := -lm -lfreetype -lvga -lvgagl

TOPDIR := $(shell pwd)

export AS LD CC CPP AR NM
export STRIP OBJCOPU OBJDUMP
export CFLAGS LDFLAGS
export TOPDIR

TARGET := show_file


obj-y += main.o
obj-y += display/
obj-y += draw/
obj-y += encoding/
obj-y += fonts/

all: 
	make -C ./ -f $(TOPDIR)/Makefile.build
	$(CC) $(LDFLAGS) -o $(TARGET) built-in.o  

clean:
	rm -f $(shell find -name "*.o")
	rm -f $(TARGET)

distclean:
	rm -f $(shell find -name "*.o")
	rm -f $(shell find -name "*.d")
	rm -f $(TARGET)

