FC = gfortran
SRC = src
BIN = bin
DATA = data
TARGET = executable.exe
FFLAGS = -Wall -Wextra -fcheck=all -std=f2008 -O0

SOURCE_FILES = parameters.f90 lattice.f90 init.f90 periodic_boundary_conditions.f90 energy.f90 local_update_algorithms.f90 dynamics.f90 main.f90
OBJECTS = $(patsubst %, $(BIN)/%, $(SOURCE_FILES:.f90=.o))

$(BIN)/$(TARGET): $(OBJECTS)
	$(FC) $(FFLAGS) $^ -o $@ 

$(BIN)/%.o: $(SRC)/%.f90
	$(FC) $(FFLAGS) -J$(BIN) -I$(BIN) -c $< -o $@

.PHONY: clean run

clean: 
	rm $(BIN)/*
	rm $(DATA)/*
run:
	$(BIN)/$(TARGET) <<< parameters.dat
