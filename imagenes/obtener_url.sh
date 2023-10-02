#!/bin/bash

# Ruta de la carpeta donde se encuentran los archivos
carpeta="$1"

# Verificar si la carpeta existe
if [ ! -d "$carpeta" ]; then
  echo "La carpeta no existe."
  exit 1
fi

# Iterar a través de los archivos en la carpeta
for archivo in "$carpeta"/*; do
  if [ -f "$archivo" ]; then
    # Obtener el nombre del archivo sin la ruta
    nombre_archivo=$(basename "$archivo")
    
    # Imprimir "hola" seguido del nombre del archivo
    echo "https://laventa-bucket.s3.amazonaws.com/images/$nombre_archivo"
  fi
done
