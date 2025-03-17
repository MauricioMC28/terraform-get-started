<h1 align='center'>Aprende Terraform Docker container</h1>

<p align='center'>Esta práctica consiste en aprender a levantar infraestructura de Docker utilizando la herramienta IoC Terraform desde un ambiente Linux</p>

**Recursos**:

![Enlace a Terraform](https://www.terraform.io/)
![Tutorial a Terraform Docker](https://developer.hashicorp.com/terraform/tutorials/docker-get-started)

**Requerimientos**:

- Entorno Linux: 
- Docker instalado:
- Terraform instalado:

**Procedimientos del tutorial 1 (Install)**

1. Instala Terraform en Linux distro Debian 12.
2. Crea directorio llamado _Aprende-terraform-docker-container_
3. Crea un archivo de configuración de Terraform llamado `main.tf`
4. Inicia el proyecto (Instala los plugins que Terraform necesita para interactuar con Docker)`terraform init`
5. Realiza los cambios `terraform apply`.
6. Revisa que el contenedor se encuentre en ejecución `docker ps`.
7. Termina el contenedor `terraform destroy`.
8. Fin de tutorial 1