#! /bin/bash
#chmod +x compile.sh To execute first time
FC=gfortran
SRC=./src
BIN=./bin
DATA=./data
TARGET=ising_program_main.exe

FFLAGS="-Wall -Wextra -fcheck=all -std=f2008 -O0"

if [ -d $BIN ]
then
    rm $BIN/*
else
    mkdir $BIN
fi

if [ -d $DATA ]
then
    echo $DATA "directory already exist"
else
    mkdir $DATA
fi

$FC $FFLAGS -J$BIN -c $SRC/parameters.f90 -o $BIN/parameters.o
$FC $FFLAGS -J$BIN -c $SRC/lattice.f90 -o $BIN/lattice.o
$FC $FFLAGS -J$BIN -c $SRC/init.f90 -o $BIN/init.o
$FC $FFLAGS -J$BIN -c $SRC/periodic_boundary_conditions.f90 -o $BIN/periodic_boundary_conditions.o
$FC $FFLAGS -J$BIN -c $SRC/energy.f90 -o $BIN/energy.o
$FC $FFLAGS -J$BIN -c $SRC/local_update_algorithms.f90 -o $BIN/local_update_algorithms.o


$FC $FFLAGS -J$BIN -c $SRC/main.f90 -o $BIN/main.o

#Agarro todos lo que ya están compilados
$FC $FFLAGS $BIN/*.o -o $BIN/$TARGET

$BIN/$TARGET <<< parameters.dat