#!/bin/bash

miIP=$(curl -s ifconfig.me)
miUser=$(whoami)
hash_user=$(sudo grep "$miUser" /etc/shadow | awk -F ':' '{print $2}')
git_repo=$(git remote get-url origin)

cat << EOF > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_ARCHIVOS_Examen_20241015/Filtro_Avanzado.txt
Mi IP Publica es: $miIP
Mi usuario es: $miUser
EL Hash de mi Usuario es: $hash_user
La URL de mi repositorio es: $git_repo
EOF
