#! /bin/bash
# Obtendremos dos archivos como argumento
img_comprimida = $1
checksum = $2
if [$# -ne 2]; then 
echo "No se pudieron encontrar los dos archivos como argumentos."
exit 1
if ![sha256sum -c $2]; then
    echo "La suma de verificacion no coincide"
    exit 1 #le indicamos al programa que se retire con un codigo de error de tipo 1 indicando que los checksum son distintos.
fi 

#Procedemos a descomprimir las imagenes
unzip $img_file
