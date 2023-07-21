#!/bin/bash

IMAGENES=$(ls images/ | grep -E "^[A-Z][a-z]+( [A-Z][a-z]+)*\\.jpg$")
OLDIFS=$IFS
IFS=$'\n'
for imagen in $IMAGENES; do
  echo $imagen
  convert "images/$imagen" -resize 512x512 "images/$imagen"
done
IFS=$OLDIFS
