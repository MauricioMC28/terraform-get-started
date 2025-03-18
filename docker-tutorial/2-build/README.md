<p align='center'><img src='logo.svg' align='center' height='100'></p>
<h1 align='center'>Construye infraestructura (Build) - Tutorial 3</h1>

<p>
Utiliza Terraform para desplegar un contenedor de Docker, formatea tu configuración de Terraform, y revisa el status de tu infraestructura.
En este tutorial, se revisara la configuracion previa del contenedor Docker
</p>

### Contenido del tutorial

1. Completar el tutorial [Install](1-install)
2. Revisar la configuración [Archivo main.tf](#bloques-y-atributos-del-archivo-maintf)
3. Inicia el directorio [Comando `init`](#inicializa "Comando de terraform")
4. Formatea y valida la configuración [Comando `fmt` y `validate`](#formatea-y-valida "Comandos de terraform")
5. Crea la infraestructura [Comando `apply`](#crea-infraestructura "Comando de terraform")
6. Inspecciona el estado [Comando `show` y `state`](#inspecciona-estado)
7. Fin del tutorial Build

### Bloques y atributos del archivo main.tf

| Bloque               | Descripción   |
| :------------------- | :----------   |
| `terraform {}`       |   Contiene las configuraciones de Terraform, incluyendo el proveedor que Terraform utilizará para provisionar la infraestructura.   |
| `required_providers` |   Se declara el proveedor   |
| `provider`           |   Configura el proveedor especificado, por ejemplo, _docker_. Se puede usar multiple proveedores   |
| `resource`           |  Define componentes de la infraestructura; podría ser un componente físico o virtual como un contenedor o lógico como una aplicación Heroku. ontiene argumentos para configurar los recursos como tamaño de la máquina, nombres de imágenes de disco, o IDs de VPC.   |

> [!Note]
> El proveedor mencionado en el atributo `source` que Terraform instala, se obtiene de [Registro de Terraform](https://registry.terraform.io/?product_intent=terraform).

| Atributos   |   Descripción   |
| :---------- | :-------------: |
| `source`   |   Atributo que define el _hostname_, _namespace_, y el _tipo de proveedor_   |
| `version`   |   Atributo que establece la versión definida por el proveedor   |

### Comandos

#### Inicializa

- `terraform init` Para crear una nueva configuración. El comando descarga el proveedor definido (docker) en un subdirectorio llamado `.terraform` en el directorio actual, muestra la versión del proveedor instalado y crea un archivo de bloqueo llamado `.terraform.lock.hcl`

#### Formatea y valida

- `terraform fmt` Actualiza los archivos de configuración de terraform del directorio actual que facilita la legibilidad y la coherencia.
- `terraform validate` Valida si la configuración es sintácticamente valida y consistente.

#### Crea infraestructura

- `terraform apply` Aplica la configuración, primero imprime en pantalla las acciones a ejecutar (_plan de ejecución_), si todo es correcto, escribe `yes`, despues tecla Enter.

>[!Note]
> El comando `apply` crea y escribe datos en un archivo llamado `terraform.tfstate`. Almacena los IDs y las propiedades de los recursos que administra, es requerido para actualizar o destruir recursos. Contiene información confidencial, por lo que se debe asegurar y restringir a solo miembros de confianza. Se puede almacenar en _HCP Terraform_ o _Terraform Enterprise_, u otro que sea compatible con Terraform.

#### Inspecciona estado

- `terraform show` Inspecciona el estado actual del proyecto
- `terraform state` Gestión avanzanda del estado. Usa el subcomando `terraform state list` para listar los recursos.