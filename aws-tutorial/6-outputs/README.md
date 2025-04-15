<p align='center'><img src='https://raw.githubusercontent.com/maycloud-mx/ilustraciones/ee27844a4ec7810ee6eab8770fc6c1828fd7772c/logotipos/terraform-logo.svg' align='center' height='100'></p>

<h1 align='center'>Consulta datos con salidas (Outputs) - Tutorial 7</h1>

<p align='center'>En este tutorial, usarás los valores de salidas para presentar información útil al usuario.</p>

### Contenido

1. [Configuración inicial](#configuración-inicial)
2. [Configuración de la instancia EC2 de salida](#configuración-de-la-instancia-ec2-de-salida)
3. [Inspecciona valores de salidas](#inspecciona-valores-de-salidas)
4. [Destruye infraestructura](#destruye-infraestructura)

### Configuración inicial

Dentro del directorio `learn-terraform-aws-instance` debes contar con la siguiente configuración:

`main.tf`

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
  ami           = "ami-07a6f770277670015"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
```

`variables.tf`

```tf
variable "instance_name" {
    description = "Value of the Name tag for the EC2 instance"
    type = string
    default = "ExampleAppServerInstance"
}
```

Asegurate que la configuración anterior coincida con tu configuración, y haber iniciado la configuración del directorio:

```sh
terraform init
```

Aplica la configuración y responde la solicitud con `yes`.

```sh
terraform apply
```

### Configuración de la instancia EC2 de salida

- Crea un archivo dentro del directorio `learn-terraform-aws-instance` llamado `outputs.tf`

```sh
cd learn-terraform-aws-instance
touch outputs.tf
```

Añade la configuración a continuación al archivo `outputs.tf` para definir las salidas ID y dirección IP de la instancia EC2.

```tf
output "instance_id" {
    description = "ID of the EC2 instance"
    value = aws_instance.app_server.id
}

output "instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value = aws_instance.app_server.public_ip
}
```

### Inspecciona valores de salidas

Una vez completado el archivo de configuración `outputs.tf`, aplica la configuración y responde la confirmación con `yes`.

```sh
terraform apply
```

```sh
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes
```

Ahora, Terraform puede imprimir en pantalla los valores de salida. Consulta las salidas con el comando `output`.

```sh
terraform output
```

> [!Note]
> Terraform outputs se puede usar para conectar los proyectos de Terraform con otras partes de la infraestructura, o con otros proyectos de Terraform. Visita [Output_Data](https://developer.hashicorp.com/terraform/tutorials/configuration-language/outputs).

### Destruye infraestructura

Destruye la infraestructura con el siguiente comando:

```sh
terraform destroy
```

Responde la confirmación con `yes`.

```sh
Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes
```