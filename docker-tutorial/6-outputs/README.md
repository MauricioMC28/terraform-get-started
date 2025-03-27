<p align='center'><img src='https://raw.githubusercontent.com/maycloud-mx/ilustraciones/ee27844a4ec7810ee6eab8770fc6c1828fd7772c/logotipos/terraform-logo.svg' align='center' height='100'></p>

<h1 align='center'>Consultar datos con salidas(Outputs) - Tutorial 7</h1>

<p align='center'>En este tutorial, usarás valores de salida para organizar datos para ser facilmente consultados y mostrados al usuario de Terraform.</p>

### Contenido

1. [Configuración inicial](#configuración-inicial)
2. [Configuración del contenedor Docker de salida](#configuración-del-contenedor-docker-de-salida)
3. [Inspeccionar los valores de salida](#inspeccionar-los-valores-de-salida)
4. [Destruye infraestructura](#destruye-infraestructura)

### Configuración inicial

- En el tutorial de `Instalación` se creo una carpeta llamado _aprende-terraform-docker-container_
- En el tutorial anterior `Variables` se añadió una variable que modifica el nombre del contenedor, obteniendo los siguientes archivos:

Archivo `main.tf`

    ```tf
    terraform {
    required_providers {
        docker = {
        source  = "kreuzwerker/docker"
        version = "~> 3.0.1"
        }
    }
    }

    provider "docker" {}

    resource "docker_image" "nginx" {
    name         = "nginx:latest"
    keep_locally = false
    }

    resource "docker_container" "nginx" {
    image = docker_image.nginx.image_id
    name  = var.container_name
    ports {
        internal = 80
        external = 8080
    }
    }
    ```

Archivo `variables.tf`

    ```tf
    variable "container_name" {
    description = "Value of the name for the Docker container"
    type        = string
    default     = "ExampleNginxContainer"
    }
    ```
    
- Para ejecutar el contenedor utilizando Docker, utiliza el comando `terraform init` y después el comando `terraform apply` dentro del directorio _aprende-terraform-docker-container_ desde la línea de comandos.

### Configuración del contenedor Docker de salida

- Dentro del directorio _aprende-terraform-docker-container_ crea un archivo llamado `outputs.tf`

- Agrega la siguiente configuración:

    ```tf
    output "container_id" {
        description = "ID del contenedor Docker"
        value = docker_container.nginx.id
    }
    output "image_id" {
        description = "ID de la imagen de Docker"
        value = docker_image.nginx.id
    }
    ```

### Inspeccionar los valores de salida

- Una vez finalizado con el archivo `outputs.tf`, utiliza el comando `terraform apply` para agregar esta configuración

- Muestra en pantalla los valores de salida utilizando el comando `terraform output`.

### Destruye infraestructura

- Utiliza el comando `terraform destroy` para eliminar la infraestructura dentro del directorio _aprende-terraform-docker-container_

- Tutorial completado