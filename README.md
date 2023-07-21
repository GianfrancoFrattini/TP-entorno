# TP-entorno
Trabajo practico de la Materia Entorno de la carrera TUIA, de Dominguez, Ramiro; Frattini, Gianfranco; Prado, Matias

docker build -t entorno .
docker run -it -v "$(pwd)":/app/outside entorno

