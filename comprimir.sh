#!/bin/bash

ls | grep -E "\\.jpg$" > nombreImagenes.txt

ls | grep -E "^[A-Z][a-z]+\\.jpg$" | sed 's/.jpg$//' > listaValidos.txt

grep -E 'a$' listaValidos.txt | wc -l > nombresMujer.txt

zip -r comprimidos.zip nombreImagenes.txt listaValidos.txt nombresMujer.txt *.jpg

echo "Se han comprimido las imagenes y las listas."

