#!/bin/bash

ls images/ | grep -E "\\.jpg$" > nombreImagenes.txt

ls images/ | grep -E "^[A-Z][a-z]+( [A-Z][a-z]+)*\\.jpg$" | sed 's/.jpg$//' > listaValidos.txt

grep -E 'a$' listaValidos.txt | wc -l > nombresMujer.txt

zip -r comprimidos.zip nombreImagenes.txt listaValidos.txt nombresMujer.txt images/

echo "Se han comprimido las imagenes y las listas."
