#!/bin/bash

# Directorio donde se encuentran las imágenes
directorio_imagenes="$(pwd)"

# Nombre del archivo donde se guardará la lista de nombres de todas las imágenes
archivo_nombres_imagenes="lista_nombres_imagenes.txt"

# Nombre del archivo donde se guardará la lista de nombres válidos
archivo_nombres_validos="lista_nombres_validos.txt"

# Nombre del archivo donde se guardará el total de personas cuyo nombre finaliza con la letra "a"
archivo_total_nombres_con_a="total_nombres_con_a.txt"

# Nombre del archivo comprimido que incluirá los archivos generados y las imágenes
archivo_comprimido="archivos_generados_comprimidos.tar.gz"

# Paso 1: Generar un archivo con la lista de nombres de todas las imágenes
ls "$directorio_imagenes" > "$archivo_nombres_imagenes"

# Paso 2: Generar un archivo con la lista de nombres válidos (nombres que comiencen con una letra mayúscula seguida de minúsculas)
grep -E '^[A-Z][a-z]+' "$archivo_nombres_imagenes" > "$archivo_nombres_validos"

# Paso 3: Generar un archivo con el total de personas cuyo nombre finaliza con la letra "a"
grep -E '^[A-Z][a-z]+a$' "$archivo_nombres_validos" | wc -l > "$archivo_total_nombres_con_a"

# Paso 4: Comprimir todos los archivos generados y las imágenes
tar -czvf "$archivo_comprimido" "$archivo_nombres_imagenes" "$archivo_nombres_validos" "$archivo_total_nombres_con_a" "$directorio_imagenes"

echo "Se ha generado el archivo comprimido $archivo_comprimido que incluye los archivos generados y las imágenes."

