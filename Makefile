############################
# for C++ file compilation #
############################

## Variables

CXX             = g++
WARNINGS        = #-Wall
DEBUG           = #-g -DDEBUG
DEFS            = #-DTIMESEED
OPTS            = #-O2
INCLUDES        = #-I/usr/include/boost-1_33_1
CXXFLAGS        = $(WARNINGS) $(DEBUG) $(DEFS) $(OPTS) $(INCLUDES)
LDFLAGS         = #-L.
LIBS            = #-l.

RM              = rm -f

###
### Files ##FIXME##
###

BINDIR          = bin
TARGETFILE      = main
TARGET          = $(BINDIR)/$(TARGETFILE)
SRCS            = main.cc word.cc
OBJS            = $(SRCS:.cc=.o)

MAKEFILE        = Makefile
DOCS            = README.md

###
### Targets
###

.PHONY: all
all: target
target: $(TARGET)
$(TARGET): $(OBJS)
	mkdir -p $(BINDIR)
	$(CXX) $(LDFLAGS) -o $(TARGET) $(OBJS) $(LIBS)

###
### Suffix Rules
###

.SUFFIXES: .cc .o # file extention list for applying suffix rule

.cc.o:
	$(CXX) $(CXXFLAGS) -c $<

###
### Dependencies ##FIXME##
###

## write only ".o" dependencies for simplicity... ##
word.o: word.cc word.h
main.o: main.cc

###
### clean
###

.PHONY: clean cleanobj cleanbin
clean: cleanobj cleanbin

cleanobj:
	$(RM) $(OBJS)

cleanbin:
	$(RM) -r $(BINDIR)
