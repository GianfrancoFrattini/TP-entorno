#!/bin/bash

cant_img=$1
if [ -z "$cant_img" ]; then
    echo "Ingrese el numero de imagenes que desee descargar: "
    read cant_img # Read devuelve el valor que se ingrese a la variable cant_img
fi

wget -O nombres.csv "https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv"
archivo_csv="nombres.csv"
num_lineas=$(wc -l < $archivo_csv)

for ((i=1; i<=$cant_img; i++))
do
    num_aleatorio=$(( ( RANDOM % $num_lineas ) + 1 ))
    nombre_aleatorio=$(awk -v linea=$num_aleatorio 'NR==linea { print $1 }' FS=, $archivo_csv)
    wget -O "${nombre_aleatorio}.jpg" "https://thispersondoesnotexist.com/"  # pagina que genera las imagenes
    sleep 3
done
