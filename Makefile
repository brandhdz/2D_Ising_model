FC = gfortran
SRC = src
BIN = bin
TARGET = executable.exe

SOURCE_FILES = parameters.f90 lattice.f90 init.f90 periodic_boundary_conditions.f90 energy.f90 local_update_algorithms.f90 dynamics.f90  main.f90
OBJECTS = $(patsubst %, $(BIN)/%, $(SOURCE_FILES:.f90=.o))

$(BIN)/$(TARGET): $(OBJECTS)
	$(FC) $^ -o $@ 

$(BIN)/%.o: $(SRC)/%.f90
	$(FC) -c -J$(BIN) -I$(BIN) $< -o $@

.PHONY: clean run

clean:
	rm $(BIN)/*
run:
	$(BIN)/$(TARGET)
