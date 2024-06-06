FC = gfortran
SRC = src
BIN = bin
DATA = data
LIB = lib
TARGET = executable.exe
#FFLAGS = -Wall -Wextra -fcheck=all -std=f2008 -O0
OP = -O3

SOURCE_FILES = str_conv.f90 statistics.f90 parameters.f90 lattice.f90 init.f90 periodic_boundary_conditions.f90 energy.f90 observables.f90 local_update_algorithms.f90 dynamics.f90 main.f90
OBJECTS = $(patsubst %, $(BIN)/%, $(SOURCE_FILES:.f90=.o))

$(BIN)/$(TARGET): $(OBJECTS)
	$(FC) $(FFLAGS) $(OP) -L$(LIB) -lstats $^ -o $@ 

$(BIN)/%.o: $(SRC)/%.f90
	$(FC) $(FFLAGS) $(OP) -J$(BIN) -I$(BIN) -c $< -o $@

.PHONY: clean run

clean: 
	rm -r $(DATA)/*
run:
	echo "parameters.dat" | $(BIN)/$(TARGET)

plot:
	python plots.py
