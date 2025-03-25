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
    [0m[1mdocker_image.nginx: Refreshing state... [id=sha256:53a18edff8091d5faff1e42b4d885bc5f0f897873b0b8f0ace236cd5930819b0nginx:latest][0m
[0m[1mdocker_container.nginx: Refreshing state... [id=05aff7e620fc61bf34ecefc25c96f24a2b8087c4d3e0d7a2d63dcb7ed97519ba][0m

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
[31m-[0m/[32m+[0m destroy and then create replacement[0m

Terraform will perform the following actions:

[1m  # docker_container.nginx[0m must be [1m[31mreplaced[0m
[0m[31m-[0m/[32m+[0m[0m resource "docker_container" "nginx" {
      [32m+[0m[0m bridge                                      = (known after apply)
      [33m~[0m[0m command                                     = [
          [31m-[0m[0m "nginx",
          [31m-[0m[0m "-g",
          [31m-[0m[0m "daemon off;",
        ] -> (known after apply)
      [32m+[0m[0m container_logs                              = (known after apply)
      [31m-[0m[0m cpu_shares                                  = 0 [90m-> null[0m[0m
      [31m-[0m[0m dns                                         = [] [90m-> null[0m[0m
      [31m-[0m[0m dns_opts                                    = [] [90m-> null[0m[0m
      [31m-[0m[0m dns_search                                  = [] [90m-> null[0m[0m
      [33m~[0m[0m entrypoint                                  = [
          [31m-[0m[0m "/docker-entrypoint.sh",
        ] -> (known after apply)
      [33m~[0m[0m env                                         = [] -> (known after apply)
      [32m+[0m[0m exit_code                                   = (known after apply)
      [31m-[0m[0m group_add                                   = [] [90m-> null[0m[0m
      [33m~[0m[0m hostname                                    = "05aff7e620fc" -> (known after apply)
      [33m~[0m[0m id                                          = "05aff7e620fc61bf34ecefc25c96f24a2b8087c4d3e0d7a2d63dcb7ed97519ba" -> (known after apply)
      [33m~[0m[0m init                                        = false -> (known after apply)
      [33m~[0m[0m ipc_mode                                    = "private" -> (known after apply)
      [33m~[0m[0m log_driver                                  = "json-file" -> (known after apply)
      [31m-[0m[0m log_opts                                    = {} [90m-> null[0m[0m
      [31m-[0m[0m max_retry_count                             = 0 [90m-> null[0m[0m
      [31m-[0m[0m memory                                      = 0 [90m-> null[0m[0m
      [31m-[0m[0m memory_swap                                 = 0 [90m-> null[0m[0m
      [33m~[0m[0m name                                        = "ExampleNginxContainer" [33m->[0m[0m "YetAnotherName" [31m# forces replacement[0m[0m
      [33m~[0m[0m network_data                                = [
          [31m-[0m[0m {
              [31m-[0m[0m gateway                   = "172.17.0.1"
              [31m-[0m[0m global_ipv6_prefix_length = 0
              [31m-[0m[0m ip_address                = "172.17.0.2"
              [31m-[0m[0m ip_prefix_length          = 16
              [31m-[0m[0m mac_address               = "02:42:ac:11:00:02"
              [31m-[0m[0m network_name              = "bridge"
                [90m# (2 unchanged attributes hidden)[0m[0m
            },
        ] -> (known after apply)
      [31m-[0m[0m network_mode                                = "bridge" [90m-> null[0m[0m [31m# forces replacement[0m[0m
      [31m-[0m[0m privileged                                  = false [90m-> null[0m[0m
      [31m-[0m[0m publish_all_ports                           = false [90m-> null[0m[0m
      [33m~[0m[0m runtime                                     = "runc" -> (known after apply)
      [33m~[0m[0m security_opts                               = [] -> (known after apply)
      [33m~[0m[0m shm_size                                    = 64 -> (known after apply)
      [33m~[0m[0m stop_signal                                 = "SIGQUIT" -> (known after apply)
      [33m~[0m[0m stop_timeout                                = 0 -> (known after apply)
      [31m-[0m[0m storage_opts                                = {} [90m-> null[0m[0m
      [31m-[0m[0m sysctls                                     = {} [90m-> null[0m[0m
      [31m-[0m[0m tmpfs                                       = {} [90m-> null[0m[0m
        [90m# (20 unchanged attributes hidden)[0m[0m

      [33m~[0m[0m healthcheck (known after apply)

      [33m~[0m[0m labels (known after apply)

        [90m# (1 unchanged block hidden)[0m[0m
    }

[1mPlan:[0m 1 to add, 0 to change, 1 to destroy.
[0m[0m[1m
Do you want to perform these actions?[0m
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  [1mEnter a value:[0m [0m
[0m[1mdocker_container.nginx: Destroying... [id=05aff7e620fc61bf34ecefc25c96f24a2b8087c4d3e0d7a2d63dcb7ed97519ba][0m[0m
[0m[1mdocker_container.nginx: Destruction complete after 1s[0m
[0m[1mdocker_container.nginx: Creating...[0m[0m
[0m[1mdocker_container.nginx: Creation complete after 1s [id=3e51cbb92a0024cf6ba58d43cbe06ef859da78dab84d03fa1a7c86435541f142][0m
[0m[1m[32m
Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
[0m
```

> [!Note]
> Configurar variables desde la línea de comandos no guarda sus valores.