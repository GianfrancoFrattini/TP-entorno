# Utiliza una imagen base de Ubuntu
FROM ubuntu:latest

# Instala cualquier paquete necesario (p. ej., zip)
RUN apt-get update && apt-get install -y zip && apt-get install -y imagemagick

# Crea un directorio dentro del contenedor
RUN mkdir /scripts

# Copia los scripts desde el host al contenedor
COPY scripts/* /scripts/

# Establece el directorio de trabajo
WORKDIR /scripts

# Ejecuta comprimir.sh dentro del contenedor
CMD ./menu.sh

# Exponer el volumen para que se pueda acceder desde fuera del contenedor
VOLUME ["/scripts"]
