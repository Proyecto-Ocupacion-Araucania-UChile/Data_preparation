#!/bin/bash

FOLDER=~/Bureau/data/jpg 
ERROR="$FOLDER/error.txt"
CURRENT=$PWD

if ! [[ -d "$FOLDER" ]]|| ! [[ -e $ERROR ]]
then
	mkdir -p $FOLDER
	touch $ERROR
else
    rm -f "$FOLDER/*"
    touch $ERROR
fi

for img in "$CURRENT/*.tif"; do
    filename=$(basename -- "$img")
    filename="${filename%.*}"
    convert $img "$FOLDER/$filename.jpg" 2> $ERROR
done