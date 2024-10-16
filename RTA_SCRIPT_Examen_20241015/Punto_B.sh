#!/bin/bash

#ejecutamos como superusuario

echo sudo su

#creamos las primeras 4 particiones primarias de 1gb

for i in {1..3}; do
        echo -e "n\np\n\n\n+1G\nw" | sudo fdisk /dev/sdc
done

#creamos una particion extendida con el resto de memoria restante
sudo fdisk /dev/sdc << EOF
n
e


w
EOF

#creamos el resto de forma logica.

for i in {5..11}; do
        echo -e "n\n+1G\nW" | sudo fdisk /dev/sdc

#formateamos cada uno de las particiones con extension4

for i in {1..3}; do
        sudo mkfs.ext4 "/dev/sdc${i}"
done

for i in {5..11}; do
        sudo mkfs.ext4 "/dev/sdc${i}"
done

#montamos cada uno

sudo mount /dev/sdc1 /Examenes-UTN/alumno_1/parcial_1
sudo mount /dev/sdc2 /Examenes-UTN/alumno_1/parcial_2
sudo mount /dev/sdc3 /Examenes-UTN/alumno_1/parcial_3
sudo mount /dev/sdc5 /Examenes-UTN/alumno_2/parcial_1
sudo mount /dev/sdc6 /Examenes-UTN/alumno_2/parcial_2
sudo mount /dev/sdc7 /Examenes-UTN/alumno_2/parcial_3
sudo mount /dev/sdc8 /Examenes-UTN/alumno_3/parcial_1
sudo mount /dev/sdc9 /Examenes-UTN/alumno_3/parcial_2
sudo mount /dev/sdc10 /Examenes-UTN/alumno_3/parcial_3
sudo mount /dev/sdc11 /Examenes-UTN/profesores

#antes de modificar el archivo hacemos una copia de seguridad
sudo cp /etc/fstab /etc/fstab.bak

#modificamos el archivo fstab

sudo tee -a /etc/fstab << END
UUID=8023d873-0203-40a2-af24-ce383ac9248b /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0
UUID=9bc5c218-b3e5-4a7a-82db-e31c2575eb24 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0
UUID=3e085bd7-bfc3-41e8-8513-0124421bd0fa /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0
UUID=595f3b0d-d381-47c3-9b41-c95bc0719b75 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0
UUID=acb0ca32-fbfa-441d-bd4a-2b275ec656a8 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0
UUID=d94f8ba5-1d51-417f-9bf8-63f392520411 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0
UUID=82e84320-2299-4c26-9f63-316698c99df0 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0
UUID=e1f09e3f-b085-478c-9f45-14d044e0c4e8 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0
UUID=6ee233ce-5de1-4f21-9888-e9ec0ce33f7d /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0
UUID=795d9342-1741-4444-b372-e9f69d4732dd /Examenes-UTN/profesores ext4 defaults 0 0
END

#montamos todos los discos

sudo mount -a
