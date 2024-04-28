FC = gfortran
SRC = src
BIN = bin
TARGET = executable.exe

SOURCE_FILES = periodic_boundary_conditions.f90 energy.f90 main.f90
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
