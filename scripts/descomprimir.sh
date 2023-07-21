#! /bin/bash
# Obtendremos dos archivos como argumento
img_comprimida="$1"
checksum="$2"
if [ $# -ne 2 ]; then
    echo "No se pudieron encontrar los dos archivos como argumentos."
    exit 1
fi

if ! md5sum -c "$checksum" &>/dev/null; then
    echo "La suma de verificación no coincide."
    exit 1 # Indicamos que el programa finalice con un código de error 1, que indica que los checksum son distintos.
fi

# Procedemos a descomprimir las imágenes
unzip "$img_comprimida"
