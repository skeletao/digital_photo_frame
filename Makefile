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
CFLAGS  += -I$(PWD)/include -I/usr/include/freetype2

LDFLAGS := -lm -lfreetype -lvga -lvgagl

TOPDIR := $(shell pwd)

export AS LD CC CPP AR NM
export STRIP OBJCOPU OBJDUMP
export CFLAGS LDFLAGS
export TOPDIR

TARGET := show_file



all: 
	$(CC) $(LDFLAGS) -o $(TARGET) built-in.o  

clean:
	rm -f show_file
	rm -f $(OBJS)

%.o:%.c
	$(CC) $(CFLAGS) -o $@ $<

