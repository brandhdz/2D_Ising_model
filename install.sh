#! /bin/bash

BIN=./bin
DATA=./data
FIG=./figures

if [ -d $BIN ]
then
    echo $BIN "directory already exist"
    rm $BIN/*
else
    mkdir $BIN
fi

if [ -d $DATA ]
then
    echo $DATA "directory already exist"
    rm -r $DATA/*
else
    mkdir $DATA
fi

if [ -d $FIG ]
then
    echo $FIG "directory already exist"
#    rm $FIG/*
else
    mkdir $FIG
fi

make 
