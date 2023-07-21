#!/bin/bash
check_res() {
found=false
if [ -d "images" ]; then
        for file in images/*.jpg; do
                if [ "$(identify -format "%wx%h" "$file")" == "512x512" ]; then
                        found=true
                        break
                fi
        done
fi
}
if [ -d "images" ] && $found; then
	ls images/ | grep -E "\\.jpg$" > nombreImagenes.txt
	ls images/ | grep -E "^[A-Z][a-z]+( [A-Z][a-z]+)*\\.jpg$" | sed 's/.jpg$//' > listaValidos.txt
	grep -E 'a$' listaValidos.txt | wc -l > nombresMujer.txt
	zip -r comprimidos.zip nombreImagenes.txt listaValidos.txt nombresMujer.txt images/
	echo "Se han comprimido las imagenes y las listas."
else
	echo "No hay imagenes procesadas validas"
	exit 1
fi
