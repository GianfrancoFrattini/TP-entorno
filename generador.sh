#! /bin/bash

# Le indicamos por variable la cantidad de imagenes que queremos que descargue
if[$# -ne 0]; then 
echo "Ingrese la cantidad de imagenes que quiera descargar: "
read cant_img #Read nos va a devolver el valor que ingrese el usuario como variable

# Descargamos la lista de archivos dependiendo la cantidad de imagenes que pidio dandole al for la variable $cant_img
for (i=1; i<=$cant_img; i++)
do
wget -O $i "https://thispersondoesnotexist.com/"  #pagina que genera imagenes aleatoriamente
# Le decimos que entre imagen e imagen espere 3 segundos
sleep 3
done
#Ahora deberiamos indicarles a cada imagen un nombre de la lista que tenemos.