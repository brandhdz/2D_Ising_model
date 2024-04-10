#! /bin/bash

FC=gfortran
SRC=./src
BIN=./bin
DATA=./data

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
$BIN/$TARGET <<< parameters.dat
