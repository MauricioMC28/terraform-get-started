<p align='center'><img src='https://raw.githubusercontent.com/maycloud-mx/ilustraciones/ee27844a4ec7810ee6eab8770fc6c1828fd7772c/logotipos/terraform-logo.svg' align='center' height='100'></p>

<h1 align='center'>Cambia infraestructura (Change) - Tutorial 4</h1>

<p align='center'>En este tutorial se modificará el recurso creado en el [tutorial anterior](/aws-tutorial/2-build/) y aprenderá a cómo aplicar cambios en los proyectos de Terraform.</p>

### Contenido

1. [Requisitos previos](#requisitos-previos)
2. [Configuración](#configuración)
3. [Aplicar cambios](#aplicar-cambios)

### Requisitos previos

- Terraform CLI (+1.2.0) y AWS CLI instalados
- Crear el directorio `learn-terraform-aws-instance` y el archivo de configuración `main.tf` con la siguiente configuración:

```tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-00a929b66ed6e0de6"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
```

- Iniciar la configuración 

```sh
terraform init
```

- Aplicar la configuración 

```sh
terraform apply
```

### Configuración

- Actualiza el `ami` de la instancia. Cambia el recurso `aws_instance.app_server` dentro del archivo `main.tf`.

```tf
resource "aws_instance" "app_server" {
  ami           = "ami-07a6f770277670015"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
```

### Aplicar cambios

Ejecuta el comando para cambiar la configuración

```sh
terraform apply
```

Los prefijos `+/-` significa que Terraform destruirá y volverá a crear recursos.

Acepta los cambios respondiendo `yes` dentro de la consola.