#!/bin/bash

#ejecutamos como superusuario

echo sudo su

#creamos las primeras 4 particiones primarias de 1gb, 1 particion extendida de 7gb con 6 particiones logicas de 1gb

sudo fdisk /dev/sdc << EOF
n
p


+1G
n
p


+1G
n
p


+1G
n
e


n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n


w
EOF

#formateamos cada uno de las particiones con extension4

sudo mkfs.ext4 /dev/sdc1
sudo mkfs.ext4 /dev/sdc2
sudo mkfs.ext4 /dev/sdc3
sudo mkfs.ext4 /dev/sdc5
sudo mkfs.ext4 /dev/sdc6
sudo mkfs.ext4 /dev/sdc7
sudo mkfs.ext4 /dev/sdc8
sudo mkfs.ext4 /dev/sdc9
sudo mkfs.ext4 /dev/sdc10
sudo mkfs.ext4 /dev/sdc11

#montamos cada uno

sudo mount /dev/sdc1 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_1/parcial_1
sudo mount /dev/sdc2 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_1/parcial_2
sudo mount /dev/sdc3 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_1/parcial_3
sudo mount /dev/sdc5 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_2/parcial_1
sudo mount /dev/sdc6 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_2/parcial_2
sudo mount /dev/sdc7 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_2/parcial_3
sudo mount /dev/sdc8 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_3/parcial_1
sudo mount /dev/sdc9 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_3/parcial_2
sudo mount /dev/sdc10 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_3/parcial_3
sudo mount /dev/sdc11 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/profesores

#antes de modificar el archivo hacemos una copia de seguridad
sudo cp /etc/fstab /etc/fstab.bak

#modificamos el archivo fstab

sudo tee -a /etc/fstab << END
/dev/sdc1 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0
/dev/sdc2 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0
/dev/sdc3 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0
/dev/sdc5 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0
/dev/sdc6 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0
/dev/sdc7 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0
/dev/sdc8 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0
/dev/sdc9 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0
/dev/sdc10 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0
/dev/sdc11 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/profesores ext4 defaults 0 0
END

#montamos todos los discos

sudo mount -a
