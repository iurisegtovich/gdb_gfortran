
FC = gfortran
FFLAGS_output = -g -O0 -ffree-line-length-none

CC = gcc
CFLAGS_output = -g -O0

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
	$(FC) $(FFLAGS_output) -J$(OUTPUTDIR) -c -o $@ $(SRCDIR)/main_c.c
$(BINDIR)/main_c.elf: $(COBJS_output)
	$(FC) $(FFLAGS_output) -o $@ $(COBJS_output)
c: $(BINDIR)/main_c.elf
