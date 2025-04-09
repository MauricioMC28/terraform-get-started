#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Ejecutar script como root"
    exit
fi

comando() {
    command -v "$1" >/dev/null 2>&1
}

### Instalación de GPK key y copia del repositorio HashiCorp al sistema
terraform_keyrings="/usr/share/keyrings/hashicorp-archive-keyring.gpg"
if [ -f "$terraform_keyrings" ]; then
    echo "El archivo $terraform_keyrings ya existe"
else
    echo "El archivo $terraform_keyrings no se encontró. Instalando"
    wget -O- https://apt.releases.hashicorp.com/gpg | \
	gpg --dearmor | \
	sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
	https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
	sudo tee /etc/apt/sources.list.d/hashicorp.list

    if [ $? -eq 0 ]; then
        echo "Archivo descargado exitosamente."
    else
        echo "Error al descargar el archivo."
    fi
fi
#Instalación de librerias
if ! comando curl; then
	sudo apt-get install unzip curl gpg
else
	echo "Librerias instaladas correctamente"
fi

#Descarga e instala AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo bash aws/install --bin-dir /usr/bin --install-dir /usr/bin/aws-cli --update

#Verifica integridad
gpg --import public-key.pub
curl -o awscliv2.sig https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip.sig
gpg --verify awscliv2.sig awscliv2.zip

#Valida istalación
which aws
ls -l /usr/local/bin/aws
aws --version