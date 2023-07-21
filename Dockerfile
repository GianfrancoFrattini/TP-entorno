# Utilizamos la imagen base de Ubuntu
FROM ubuntu

# Instalamos las dependencias necesarias
RUN apt-get update && \
    apt-get install -y zip imagemagick wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Creamos un directorio dentro del contenedor para copiar los scripts
WORKDIR /app

# Copiamos los scripts de la carpeta "scripts" en el directorio del contenedor
COPY scripts /app

# Otorgamos permisos de ejecución a los scripts
RUN chmod +x /app/*.sh

# Directorio donde se almacenarán los archivos fuera del contenedor
VOLUME /app/outside

# Ejecutamos el script menu.sh que a su vez ejecutará comprimir.sh
CMD ["/bin/bash", "/app/menu.sh"]
