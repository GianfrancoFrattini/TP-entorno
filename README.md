# TP-entorno
Trabajo practico de la Materia Entorno de la carrera TUIA, de Dominguez, Ramiro; Frattini, Gianfranco; Prado, Matias

1) Descargar el repositorio desde GITHUB:

Se puede hacer de dos maneras 

Desde terminal (not recommended):
gh repo clone GianfrancoFrattini/TP-entorno

Descargar el archivo .zip (altamente recomendado): 1) Seleccionar CODE 2) Download ZIP

![image](https://github.com/GianfrancoFrattini/TP-entorno/assets/105806173/675f782f-ea88-4fec-9049-bff27d3c34bb)

2) Descomprimir el archivo zip en la carpeta que uno desee trabajar

3) Generar la imagen de docker con el docker file usando el siguiente codigo.

docker build -t entorno .

4) Correr la imagen de docker con la siguiente linea de comando.

docker run -it -v "$(pwd)":/app/outside entorno

