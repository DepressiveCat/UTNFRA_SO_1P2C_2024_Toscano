#!/bin/bash

grep MemTotal /proc/meminfo > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_ARCHIVOS_Examen_20241015/Filtro_Basico.txt

sudo dmidecode -t chassis | grep Manufacturer >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_ARCHIVOS_Examen_20241015/Filtro_Basico.txt
