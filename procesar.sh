#!/bin/bash

#OBJ: Obtener todos los archivos dentro de la carpeta en la que se encuentra, que sean un nombre valido (previo al .jpg), y terminen en .jpg

current_directory=$(pwd)
files=$(ls)
# ^[A-Z] == Inicio de Mayuscula
# [a-z]+ == Seguidilla de letras minusculas
# \. == Caracter PUNTO
# jpg == Extension deseada (Podria cambiarse por png, de ser necesaria)
# $ == Es el final de la cadena, lo que implica que no haya nada posterior la jpg
filtered_files=$(echo $files | grep -E "^[A-Z][a-z]+\.jpg$") 
echo $filtered_files