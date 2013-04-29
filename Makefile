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

TEST_LIBS       = -lgtest

RM              = rm -f

###
### Files
###

MAKEFILE        = Makefile
DOCS            = README.md
BINDIR          = bin/

### VPATH

VPATH           = $(BINDIR)

### C++ Classes

CLASSES         = word  # ADD HERE

###
### Functions
###

define DECLARE

$(1:=_test): $(1:=_test.o) $(1:=.o)
	$(CXX) $(LDFLAGS) -o $(BINDIR)$(1:=_test) $(1:=_test.o) $(1:=.o) $(LIBS) $(TEST_LIBS)
$(1:=_test.o): $(1:=_test.cc) $(1:=.h)
$(1:=.o): $(1:=.cc) $(1:=.h)

endef


###
### Targets
###

.PHONY: all
all: prepare $(CLASSES:=_test) main

prepare:
	mkdir -p $(BINDIR)

$(foreach i,$(CLASSES),$(eval $(call DECLARE,$(i))))

main: main.o $(CLASSES:=.o)
	$(CXX) $(LDFLAGS) -o $(BINDIR)$@ $^ $(LIBS)

###
### Suffix Rules
###

.SUFFIXES: .cc .o # file extention list for applying suffix rule

.cc.o:
	$(CXX) $(CXXFLAGS) -c $<

###
### clean
###

.PHONY: clean realclean

clean:
	$(RM) *.o *.gch *~

realclean: clean
	$(RM) -r $(BINDIR)
