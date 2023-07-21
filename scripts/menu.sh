#!/bin/bash
# Función para mostrar el menú
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

mostrar_menu() {
    echo -e "\033[36m==== OPCIONES ====\033[0m"
    echo -e "1. \e[32mGenerar Imagenes\e[0m"

    if [ -f "checksum.txt" ] && [ -f "imagenes.zip" ]; then
        echo -e "2. \e[32mDescomprimir con Checksum\e[0m"
        valid2=1
    else
        echo -e "2. \e[31mDescomprimir con Checksum\e[0m"
        valid2=0
    fi

    if [ -d "images" ] && [ "$(ls images/*.jpg 2>/dev/null)" ]; then
        echo -e "3. \e[32mProcesar Imagenes\e[0m"
        valid3=1
    else
        echo -e "3. \e[31mProcesar Imagenes\e[0m"
        valid3=0
    fi
    check_res
    if [ -d "images" ] && $found; then
	echo -e "4. \e[32mComprimir Resultados\e[0m"
        valid4=1
    else
        echo -e "4. \e[31mComprimir Resultados\e[0m"
        valid4=0
    fi
    echo -e "0. \e[32mSalir\e[0m"
}

# Función para leer la opción del usuario
leer_opcion() {
    read -p "Elegi una opcion: " opcion
}
# Bucle principal del menú
while true; do
    mostrar_menu
    leer_opcion
    case $opcion in
        1)
            echo "Generando imagenes..."
            ./generar.sh
            ;;
        2)  
	    if [ "$valid2" -eq 1 ]; then
               echo "Descomprimiendo archivos..."
               ./descomprimir.sh imagenes.zip checksum.txt
	    else
	       echo "Deberias intentar generar las imagenes primero"
	    fi
            ;;
        3)
            if [ "$valid3" -eq 1 ]; then
	    	echo "Procesando imagenes..."
            	./procesar.sh
	    else
		echo "No hay imagenes para procesar, dentro de la carpeta Images"
	    fi
            ;;
        4)  
	    if [ "$valid4" -eq 1 ]; then
	    	echo "Comprimiendo imagenes..."
	    	./comprimir.sh
	    else
		echo "Deberias tratar de procesar las imagenes primero"
		echo -e "Si intentaste procesar las imagenes, y \e[33mComprimir Resultados\e[0m sigue en \e[31mROJO\e[0m, es porque no existieron nombres validos para procesar"
		echo "Deberias tratar de generar una mayor cantidad de imagenes para encontrar al menos un nombre valido"
	    fi
	    ;;
	0)  	
            echo "Saliendo... Nos vemos"
            break
            ;;
        *)
            echo "INVALIDO. Elegi una opcion entre 0-4"
            ;;
    esac
    echo # Salto de línea para una mejor presentación
done
