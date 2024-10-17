#!/bin/bash
#creamos los grupos
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

#creamos los usuario
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_A1
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_A2
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_A3
sudo useradd -m -s /bin/bash -G p1c2_2024_gProfesores -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_P1

#asignar dueño y grupo a su carpeta correspondiente
sudo chown -R p1c2_2024_A1:p1c2_2024_A1 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_1
sudo chown -R p1c2_2024_A2:p1c2_2024_A2 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_2
sudo chown -R p1c2_2024_A3:p1c2_2024_A3 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_3
sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/profesores

#modificamos permisos 
sudo chmod 750 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_1
sudo chmod 760 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_2
sudo chmod 700 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_3
sudo chmod 775 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/profesores

#creamos el archivo validar.txt para cada usuario en su respectiva carpeta

sudo -u p1c2_2024_A1 bash -c "whoami > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_1/validar.txt"
sudo -u p1c2_2024_A2 bash -c "whoami > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_2/validar.txt"
sudo -u p1c2_2024_A2 bash -c "whoami > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/alumno_3/validar.txt"
sudo -u p1c2_2024_p1 bash -c "whoami > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Toscano/RTA_SCRIPT_Examen_20241015/Examenes-UTN/profesores/validar.txt"
