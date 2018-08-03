
FC = gfortran
FFLAGS_output = -g -O0 -ffree-line-length-none -fmax-errors=1

CC = gcc
CFLAGS_output = -ggdb3 -O0 -fmax-errors=1

OUTPUTDIR = ./obj
SRCDIR = ./src
BINDIR = ./bin

FOBJS_output = \
	$(OUTPUTDIR)/main_f.o

COBJS_output = \
	$(OUTPUTDIR)/main_c.o

.DEFAULT_GOAL := usage
.PHONY: usage fortran c

usage:
	#fortran; c.

$(OUTPUTDIR)/main_f.o: $(SRCDIR)/main.f90
	$(FC) $(FFLAGS_output) -J$(OUTPUTDIR) -c -o $@ $(SRCDIR)/main.f90
$(BINDIR)/main_f.elf: $(FOBJS_output)
	$(FC) $(FFLAGS_output) -o $@ $(FOBJS_output)
fortran: $(BINDIR)/main_f.elf

$(OUTPUTDIR)/main_c.o: $(SRCDIR)/main.c
	$(FC) $(CFLAGS_output) -J$(OUTPUTDIR) -c -o $@ $(SRCDIR)/main.c
$(BINDIR)/main_c.elf: $(COBJS_output)
	$(FC) $(CFLAGS_output) -o $@ $(COBJS_output)
c: $(BINDIR)/main_c.elf
