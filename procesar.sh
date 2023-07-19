#!/bin/bash

#OBJ: Obtener todos los archivos dentro de la carpeta en la que se encuentra, que sean un nombre valido (previo al .jpg), y terminen en .jpg
IMAGENES=$(ls | grep -E "^[A-Z][a-z]+\\.jpg$")

#OBJ: Iterar sobre los archivos filtrados y modificarlos con imagemagick a una resolucion de 512*512
for imagen in $IMAGENES; do
  convert "$imagen" -resize 512x512 "$imagen"
done