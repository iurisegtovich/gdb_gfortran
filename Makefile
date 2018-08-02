
FC = gfortran

FFLAGS_output = -g -O0 -ffree-line-length-none

OUTPUTDIR = ./obj
SRCDIR = ./src
RUNDIR = ./run

OBJS_output = \
	$(OUTPUTDIR)/main.o

.DEFAULT_GOAL := $(RUNDIR)/main.elf

$(OUTPUTDIR)/main.o: $(SRCDIR)/main.f90
	$(FC) $(FFLAGS_output) -J$(OUTPUTDIR) -c -o $@ $(SRCDIR)/main.f90

$(RUNDIR)/main.elf: $(OBJS_output)
	$(FC) $(FFLAGS_output) -o $@ $(OBJS_output)

