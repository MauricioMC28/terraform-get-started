<p align='center'><img src='https://raw.githubusercontent.com/maycloud-mx/ilustraciones/ee27844a4ec7810ee6eab8770fc6c1828fd7772c/logotipos/terraform-logo.svg' align='center' height='100'></p>
<h1 align='center'>Instala Terraform (Install) - Tutorial 2</h1>

<p>Instala Terraform en Mac, Linux, o Windows. Crea un contenedor Docker localmente.</p>

### Contenido del tutorial 

1. [Instala Terraform en Linux distro Debian 12](install-for-linux-debian.sh).
2. Crea directorio llamado [_Aprende-terraform-docker-container_](aprende-terraform-docker-container)
3. Crea un archivo de configuración de Terraform llamado [`main.tf`](aprende-terraform-docker-container/main.tf)
4. Inicia el proyecto (Instala los plugins que Terraform necesita para interactuar con Docker)`terraform init`
5. Realiza los cambios `terraform apply`.
6. Revisa que el contenedor se encuentre en ejecución `docker ps`.
7. Termina el contenedor `terraform destroy`.
