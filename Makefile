############################
# for C++ file compilation #
############################

## Variables

CXX             = g++
WARNINGS        = #-Wall
DEBUG           = #-g -DDEBUG
DEFS            = #-DTIMESEED
OPTS            = #-O2
INCLUDES        = `mecab-config --cflags` #-I/usr/include/boost-1_33_1
CXXFLAGS        = $(WARNINGS) $(DEBUG) $(DEFS) $(OPTS) $(INCLUDES)
LDFLAGS         = #-L.
LIBS            = `mecab-config --libs` #-l.

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

CLASSES         = word parser  # ADD HERE
parser_deps     = word

###
### Functions
###

define DECLARE

$(1:=_test): $(1:=_test.o) $(1:=.o) $($(1:=_deps):=.o)
	$(CXX) $(LDFLAGS) -o $(BINDIR)$(1:=_test) $(1:=_test.o) $(1:=.o) $($(1:=_deps):=.o) $(LIBS) $(TEST_LIBS)
$(1:=_test.o): $(1:=_test.cc) $(1:=.h)
$(1:=.o): $(1:=.cc) $(1:=.h) $($(1:=_deps):=.cc) $($(1:=_deps):=.h)

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
