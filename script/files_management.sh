#!/bin/bash

FOLDER=~/Bureau/data/jpg 
ERROR="$FOLDER/error.txt"

if ! [[ -d "$FOLDER" ]]|| ! [[ -e $ERROR ]]
then
	mkdir -p $FOLDER
	touch $ERROR
else
    rm -f "$FOLDER/*.jpg"
fi

for img in "$PWD"/*.tif; do 
    filename="$(basename "${img%.tif}")"
    convert "$img" "$FOLDER/$filename.jpg"
done 2>> $ERROR