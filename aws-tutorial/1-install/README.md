<p align='center'><img src='https://raw.githubusercontent.com/maycloud-mx/ilustraciones/ee27844a4ec7810ee6eab8770fc6c1828fd7772c/logotipos/terraform-logo.svg' align='center' height='100'></p>

<h1 align='center'>Titulo (Install) - Tutorial 2</h1>

<p align='center'>Descripción.</p>

### Contenido

1. [](#)
2. [](#)
3. [](#)
4. [](#)

### Instala Terraform
Terraform ofrece varias maneras de instalación: __Manual__, __Homebrew on macOS__, __Chocolatey en Windows__, y __Linux__.

Este tutorial instala Terraform en Linux distribución _Ubuntu/Debian_:

```sh
# Instalación de HashiCorp GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | \
	gpg --dearmor | \
	sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
# Agrega el repositorio oficial de HashiCorp al sistema
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
	https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
	sudo tee /etc/apt/sources.list.d/hashicorp.list

# Instala las librerias necesarias
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

# Actualiza el sistema
sudo apt update -y

# Instala Terraform
sudo apt-get install terraform
```

>[!Note]
> Otra opción es descargar el script [terraform-instalación-debian.sh](terraform-instalacion-debian.sh)
> Ejecutar el script con el comando `bash terraform-instalacion-debian.sh`

### Verifica la Instalación

Si la instalación se completo correctamente, utiliza el siguiente comando

```sh
terraform -v | head -n 1
```