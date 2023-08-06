#!/bin/bash
# Universidad de San Carlos de Guatemala
# Sistemas operativos 1
# Josué Daniel Caal Torres
# 201408473

# Crear el directorio para el log
log_dir="/tmp/$(date +'%Y%m%d')"
mkdir -p "$log_dir"
# Crear el archivo de log
log_file="$log_dir/saludos.log"
if [ $# -ne 1 ]; then
    echo "Faltó nombre de usuario"
    echo "Falto nombre de usuario">> "$log_file"
    exit 1
fi

GITHUB_USER=$1

# Leer la variable GITHUB_USER
#read -p "Ingresa el usuario de GitHub: " GITHUB_USER

# Consultar la API de GitHub
API_URL="https://api.github.com/users/$GITHUB_USER"
response=$(curl -s "$API_URL")

# Extraer los datos del JSON
github_user=$(echo "$response" | jq -r '.login')
user_id=$(echo "$response" | jq -r '.id')
created_at=$(echo "$response" | jq -r '.created_at')

# Imprimir el mensaje
echo "Hola $github_user. User ID: $user_id. Cuenta fue creada el: $created_at."

#Escribir en log
echo "Hola $github_user. User ID: $user_id. Cuenta fue creada el: $created_at." >> "$log_file"

echo "Mensaje guardado en $log_file"
