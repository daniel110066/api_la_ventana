#!/bin/bash

# Nombre de la imagen PNG de entrada
imagen="$1"

# Usar xxd para generar una salida hexadecimal
hex_data=$(xxd -p "$imagen" | tr -d '\n')

# Convertir la salida hexadecimal a base64
base64_data=$(echo "$hex_data" | xxd -r -p | base64)

# Crear el encabezado Blob
mime_type="image/png"
blob_header="data:$mime_type;base64"

# Combinar el encabezado y los datos codificados en base64
blob_data="$blob_header,$base64_data"

# Imprimir el resultado
echo "$blob_data"
