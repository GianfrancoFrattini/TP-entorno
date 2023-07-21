#!/bin/bash

IMAGENES=$(ls images/ | grep -E "^[A-Z][a-z]+( [A-Z][a-z]+)*\\.jpg$")
OLDIFS=$IFS
IFS=$'\n'	
if [ -n "$IMAGENES" ]; then
    for imagen in $IMAGENES; do
	convert "images/$imagen" -resize 512x512 "images/$imagen"
    done
else
    echo -e "\e[31mWARNING!!!\e[0m \e[33mNo hay nombres validos para procesar\e[0m"
fi
IFS=$OLDIFS
