<p align='center'><img src='https://raw.githubusercontent.com/maycloud-mx/ilustraciones/ee27844a4ec7810ee6eab8770fc6c1828fd7772c/logotipos/terraform-logo.svg' align='center' height='100'></p>

<h1 align='center'>Titulo (Build) - Tutorial 3</h1>

<p align='center'>Este tutorial aprovisiona una instancia EC2 en Amazon Web Services (AWS). Las instancias EC2 son maquinas virtuales que se ejecutan en AWS, y un componente común de muchos proyectos de infraestructura.</p>

### Contenido

1. [Requisitos Previos](#requisitos-previos)
2. [Escribe Configuración](#escribe-configuración)
3. [Inicia el Directorio](#inicia-el-directorio)
4. [Formatea y valida la Configuración](#formatea-y-valida-la-configuración)
5. [Crea Infraestructura](#crea-infraestructura)
6. [Inspecciona Estado](#inspecciona-estado)
7. [Troubleshooting](#troubleshooting)

### Requisitos previos

- Contar con [Terraform CLI](/aws-tutorial/1-install/terraform-instalacion-debian.sh) instalado
- Contar con [AWS CLI](awscli-instalacion.sh) instalado. Instalación oficial de [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) en Amazon.
- [Cuenta de AWS](https://aws.amazon.com/free) y acceso a los recursos a la nube

---

1. Crea un usuario IAM con el permiso `AdministratorAccess` activado
2. Ve a administración de usuarios IAM y crea un `Access Key` para el usuario recien creado.
3. Copia y el `Access Key` y el `Secret Access Key`.

Utiliza el siguiente comando para configurar tus credenciales IAM en AWS CLI que utilizará Terraform. Necesitarás el `AWS_ACCESS_KEY_ID` y el `AWS_SECRET_ACCESS_KEY`:

```sh
aws configure
```

Ejemplo: 

```sh
AWS Access Key ID [None]: WS_ACCESS_KEY_ID
AWS Secret Access Key [None]: AWS_SECRET_ACCESS_KEY
Default region name [None]: us-east-1
Default output format [None]: json
```

### Escribe configuración

- Crea un directorio llamado `learn-terraform-aws-instance`.

```sh
mkdir learn-terraform-aws-instance
cd learn-terraform-aws-instance
```

- Crea el archivo para definir la infraestructura

```sh
touch main.tf
```

- Abre el archivo y agrega la siguiente configuración:

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
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

```

- `terraform {}` Contiene la configuración de Terraform, incluye los proveedores que Terraform utilizará para aprovisionar la infraestructura. Terraform instala los proveedores desde el [Registro de Terraform](https://registry.terraform.io/?product_intent=terraform)
- `required providers {}` Establece una restricción de version para cada proveedor.
- `version` Atributo recomendado para restringir la version del proveedor y evitar que Terraform instale una versión que no sea compatible.
- `Providers` Bloque configura el proveedor especificado. Es un plugin
- `Resources` Bloque que define componentes en la infraestructura. Este bloque contiene argumentos, puede incluir, como tamaño de máquinas, nombre de discos, o VPC IDs.
    - El tipo de recurso del ejemplo es `aws_instance` y el nombre es `app_server`.

### Inicia el directorio



### Formatea y valida la configuración



### Crea infraestructura



### Inspecciona estado


### Troubleshooting

