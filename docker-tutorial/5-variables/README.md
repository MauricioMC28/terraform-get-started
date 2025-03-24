<p align='center'><img src='/logo.svg' align='center' height='100'></p>

<h1 align='center'>Definir variables de Entrada(Variables) - Tutorial 6</h1>

<p align='center'>Dentro de las configuraciones de Terraform, se pueden incluir variables para hacer la configuración más dinámica y flexible</p>

### Contenido

1. [Requisitos previos](#requisitos-previos)

### Requisitos previos

1. Tener completado el tutorial Install, es decir, tener el archivo `main.tf` dentro de la carpeta `aprende-terraform-docker-container`.
2. Haber ejecutado el comando `terraform init` dentro del directorio `aprende-terraform-docker-container`.

### Establece el nombre del contenedor con una variable

1. Crea un archivo nuevo llamado `variables.tf` dentro del directorio `aprende-terraform-docker-container`
    ```yml
    variable "container_name" {
        description = "Value of the name for the Docker container"
        type        = string
        default     = "ExampleNginxContainer"
    }
    ```
2. Modifica el archivo `main.tf` de la siguiente manera:
    ```yml
    resource "docker_container" "nginx" {
        image = docker_image.nginx.image_id
        name = var.container_name
        ports {
            internal = 80
            external = 8080
        }
    }
    ```
    > [!NOTE]
    > Está modificación reemplaza el nombre `tutorial`, por la variable `var.container_name` que llama a la variable declarado en el archivo `variables.tf`.
3. Aplica la configuración utilizando el comando `terraform apply` y despues escribe `yes` para aplicar los cambios.

Verás el siguiente mensaje:
```sh
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```
Utiliza el comando `docker ps` para ver el cambio en el contenedor:
```sh
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS              PORTS                  NAMES
05aff7e620fc   53a18edff809   "/docker-entrypoint.…"   2 minutes ago   Up About a minute   0.0.0.0:8080->80/tcp   ExampleNginxContainer
```

- Utiliza el comando `terraform show` para ver inspeccionar el contenedor:

```sh
# docker_container.nginx:
resource "docker_container" "nginx" {
    attach                                      = false
    bridge                                      = [90mnull[0m[0m
    command                                     = [
        "nginx",
        "-g",
        "daemon off;",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_set                                     = [90mnull[0m[0m
    cpu_shares                                  = 0
    domainname                                  = [90mnull[0m[0m
    entrypoint                                  = [
        "/docker-entrypoint.sh",
    ]
    env                                         = []
    hostname                                    = "05aff7e620fc"
    id                                          = "05aff7e620fc61bf34ecefc25c96f24a2b8087c4d3e0d7a2d63dcb7ed97519ba"
    image                                       = "sha256:53a18edff8091d5faff1e42b4d885bc5f0f897873b0b8f0ace236cd5930819b0"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "ExampleNginxContainer"
    network_data                                = [
        {
            gateway                   = "172.17.0.1"
            global_ipv6_address       = [90mnull[0m[0m
            global_ipv6_prefix_length = 0
            ip_address                = "172.17.0.2"
            ip_prefix_length          = 16
            ipv6_gateway              = [90mnull[0m[0m
            mac_address               = "02:42:ac:11:00:02"
            network_name              = "bridge"
        },
    ]
    network_mode                                = "bridge"
    pid_mode                                    = [90mnull[0m[0m
    privileged                                  = false
    publish_all_ports                           = false
    read_only                                   = false
    remove_volumes                              = true
    restart                                     = "no"
    rm                                          = false
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_signal                                 = "SIGQUIT"
    stop_timeout                                = 0
    tty                                         = false
    user                                        = [90mnull[0m[0m
    userns_mode                                 = [90mnull[0m[0m
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = [90mnull[0m[0m

    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.nginx:
resource "docker_image" "nginx" {
    id           = "sha256:53a18edff8091d5faff1e42b4d885bc5f0f897873b0b8f0ace236cd5930819b0nginx:latest"
    image_id     = "sha256:53a18edff8091d5faff1e42b4d885bc5f0f897873b0b8f0ace236cd5930819b0"
    keep_locally = false
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:124b44bfc9ccd1f3cedf4b592d4d1e8bddb78b51ec2ed5056c52d3692baebc19"
}
```