<p align='center'><img src='https://raw.githubusercontent.com/maycloud-mx/ilustraciones/ee27844a4ec7810ee6eab8770fc6c1828fd7772c/logotipos/terraform-logo.svg' align='center' height='100'></p>

<h1 align='center'>Define variables de entrada (Variables) - Tutorial 6</h1>

<p align='center'>En este tutorial aprenderás de las variables que incluye Terraform para que las configuraciones sean más dinámicas y flexibles.</p>

### Contenido

1. [Requisitos previos](#requisitos-previos)
2. [Configura el nombre de la instancia dentro de una variable](#configura-el-nombre-de-la-instancia-dentro-de-una-variable)
3. [Aplica la configuración](#aplica-la-configuración)


### Requisitos previos

Contar con la carpeta `learn-terraform-aws-instance`, con la siguiente configuración dentro del archivo `main.tf`:

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
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
```

Otro requisito previo, haber iniciado el directorio `learn-terraform-aws-instance` con el comando `terraform init`.

### Configura el nombre de la instancia dentro de una variable

- Dentro del directorio `learn-terraform-aws-instance`, crea un archivo llamado `variables.tf`

```sh
cd learn-terraform-aws-instance/
touch variables.tf
```

Define la variable `instance_name` dentro del archivo

```tf
variable "instance_name" {
    description = "Value of the Name tag for the EC2 instance"
    type = string
    default = "ExampleAppServerInstance"
}
```

> [!Note]
> Terraform carga todos los archivos dentro del directorio que terminen en `.tf`, por lo que puedes nombrar a tus configuraciones como desees.

Añade la nueva variable dentro del archivo `main.tf`
Reemplaza el nombre dentro del atributo `Name` por la variable a continuación:

```tf
resource "aws_instance" "app_server" {
  ami           = "ami-07a6f770277670015"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
```

### Aplica la configuración

Aplica la configuración y responde `yes` a la solicitud de confirmación.

```sh
terraform apply
```

Aplica la configuración de nuevo, esta vez anulando el nombre de instancia predeterminado pasando una variable usando el indicador `-var`.
Terraform actualizara la etiqueta `Name` de la instancia con el nuevo nombre, confirma la solicitud con `yes`.

```sh
terraform apply -var "instance_name=YetAnotherName"
```