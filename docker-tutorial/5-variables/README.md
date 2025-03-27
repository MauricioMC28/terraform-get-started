<p align='center'><img src='https://raw.githubusercontent.com/maycloud-mx/ilustraciones/ee27844a4ec7810ee6eab8770fc6c1828fd7772c/logotipos/terraform-logo.svg' align='center' height='100'></p>

<h1 align='center'>Definir variables de Entrada(Variables) - Tutorial 6</h1>

<p align='center'>Dentro de las configuraciones de Terraform, se pueden incluir variables para hacer la configuración más dinámica y flexible</p>

### Contenido

1. [Requisitos previos](#requisitos-previos)
2. [Establece el nombre del contenedor con una variable](#establece-el-nombre-del-contenedor-con-una-variable)
3. [Aplica la configuración](#aplica-la-configuración)

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

### Aplica la configuración

- Una vez modificado el archivo `main.tf`, utiliza el comando `terraform apply` para realizar estos nuevos cambios, confirma con `yes`.


- Utiliza el comando `docker ps` para ver el cambio en el contenedor:

```sh
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS              PORTS                  NAMES
05aff7e620fc   53a18edff809   "/docker-entrypoint.…"   2 minutes ago   Up About a minute   0.0.0.0:8080->80/tcp   ExampleNginxContainer
```

- Utiliza de nuevo el comando `terraform apply` seguido de la bandera `-var`, para cambiar de nuevo el nombre del contenedor.

    ```sh
    terraform apply -var "container_name=YetAnotherName"
    ```
    
- Ejemplo de salida:

    ```sh
    docker_image.nginx: Refreshing state... [id=sha256:53a18edff8091d5faff1e42b4d885bc5f0f897873b0b8f0ace236cd5930819b0nginx:latest]
    docker_container.nginx: Refreshing state... [id=05aff7e620fc61bf34ecefc25c96f24a2b8087c4d3e0d7a2d63dcb7ed97519ba]

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
    -/+ destroy and then create replacement

    Terraform will perform the following actions:

        # docker_container.nginx must be replaced
    -/+ resource "docker_container" "nginx" {
        + bridge                                      = (known after apply)
        ~ command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "05aff7e620fc" -> (known after apply)
      ~ id                                          = "05aff7e620fc61bf34ecefc25c96f24a2b8087c4d3e0d7a2d63dcb7ed97519ba" -> (known after apply)
      ~ init                                        = false -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      ~ name                                        = "ExampleNginxContainer" -> "YetAnotherName" # forces replacement
      ~ network_data                                = [
        - {
            - gateway                   = "172.17.0.1"
            - global_ipv6_prefix_length = 0
            - ip_address                = "172.17.0.2"
            - ip_prefix_length          = 16
            - mac_address               = "02:42:ac:11:00:02"
            - network_name              = "bridge"
                # (2 unchanged attributes hidden)
          },
        ] -> (known after apply)
      - network_mode                                = "bridge" -> null # forces replacement
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      ~ runtime                                     = "runc" -> (known after apply)
      ~ security_opts                               = [] -> (known after apply)
      ~ shm_size                                    = 64 -> (known after apply)
      ~ stop_signal                                 = "SIGQUIT" -> (known after apply)
      ~ stop_timeout                                = 0 -> (known after apply)
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
        # (20 unchanged attributes hidden)

      ~ healthcheck (known after apply)

      ~ labels (known after apply)

        # (1 unchanged block hidden)
       }

    Plan: 1 to add, 0 to change, 1 to destroy.

    Do you want to perform these actions?
    Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.

    Enter a value: yes
    docker_container.nginx: Destroying... [id=05aff7e620fc61bf34ecefc25c96f24a2b8087c4d3e0d7a2d63dcb7ed97519ba]
    docker_container.nginx: Destruction complete after 1s
    docker_container.nginx: Creating...
    docker_container.nginx: Creation complete after 1s [id=3e51cbb92a0024cf6ba58d43cbe06ef859da78dab84d03fa1a7c86435541f142]

    Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
    ```

> [!Note]
> Configurar variables desde la línea de comandos no guarda sus valores.