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

TARGET          = main
SRCS            = main.cc word.cc
OBJS            = $(SRCS:.cc=.o)
EXES            = $(TARGET/$/.exe)
MAKEFILE        = Makefile
DOCS            = README

###
### Targets
###

.PHONY: all
all: target
target: $(TARGET)
$(TARGET): $(OBJS)
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

.PHONY: clean
clean:
	$(RM) $(OBJS)

realclean: clean
	$(RM) core a.out *~
