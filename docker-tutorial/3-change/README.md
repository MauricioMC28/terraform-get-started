<p align='center'><img src='https://raw.githubusercontent.com/maycloud-mx/ilustraciones/ee27844a4ec7810ee6eab8770fc6c1828fd7772c/logotipos/terraform-logo.svg' align='center' height='100'></p>

<h1 align='center'>Cambia infraestructura (Change) - Tutorial 4</h1>

<p align='center'> Este tutorial modifica ese recurso, y aprendes como aplicar cambios a tus proyectos de Terraform </p>

### Contenido

1. [Prerrequisitos](#prerrequisitos)
2. [Actualiza la configuración](#actualiza-la-configuración)
3. [Aplica los cambios](#aplica-los-cambios)

### Prerrequisitos

1. Terraform CLI, y Docker CLI instalados
2. Crea con el comando `mkdir` una carpeta con el nombre _aprende-terraform-docker-container_
3. Accede a la carpeta utilizando el comando `cd`
4. Crea un archivo de configuración dentro del directorio creado, llamado `main.tf` utilizando el comando `touch`
5. Realiza la configuración de terraform para desplegar `nginx` dentro de un contenedor Docker.
6. Inicia la configuración con el comando `terraform init`
7. Aplica la configuración con el comando `terraform apply`

### Actualiza la configuración

1. Modifica el archivo `main.tf`. Reemplaza el puerto `8000` por el `8080`
    ```tf
    ports {
        internal = 80
        external = 8080
    }
    ```

2. Guarda el cambio

### Aplica los cambios

1. Utiliza el comando `terraform apply`

> Este comando `apply`, muestra las modificaciones que se hicieron dentro del archivo `main.tf` y pregunta si estas de acuerdo con las modificaciones, por lo que debes escribir `yes`.
> > Terraform destruirá y recreará el recurso, en lugar de cambiarlo dentro del lugar. Por ejemplo, en este tutorial, lo que se hizó fue destruir el contenedor que tenia el puerto `8000` y creo uno nuevo con el nuevo puerto `8080`.