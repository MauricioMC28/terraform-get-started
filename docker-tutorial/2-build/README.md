<h1 align='center'>Construye infraestructura (Build) - Tutorial 3</h1>

<p>
Utiliza Terraform para desplegar un contenedor de Docker, formatea tu configuración de Terraform, y revisa el status de tu infraestructura.
En este tutorial, se revisara la configuracion previa del contenedor Docker
</p>

1. Completar el tutorial 2
2. Revisar la configuración del archivo `main.tf` del tutorial 2
    
3. Inicia el directorio
    - Utiliza el comando `terraform init` para crear una nueva configuración. El comando descarga el proveedor definido (docker) en un subdirectorio llamado `.terraform` en el directorio actual, muestra la versión del proveedor instalado y crea un archivo de bloqueo llamado `.terraform.lock.hcl`

4. Fin del tutorial 3

### Bloques y atributos del archivo main.tf

| Bloque              | Descripción |
| :---------------- | :------: |
| `terraform {}`        |   Contiene las configuraciones de Terraform, incluyendo el proveedor que Terraform utilizará para provisionar la infraestructura.   |
| `required_providers` |   Se declara el proveedor   |
| `provider`           |   Configura el proveedor especificado, por ejemplo, _docker_. Se puede usar multiple proveedores    |
| `resource`    |  Define componentes de la infraestructura; podría ser un componente físico o virtual como un contenedor o lógico como una aplicación Heroku. ontiene argumentos para configurar los recursos como tamaño de la máquina, nombres de imágenes de disco, o IDs de VPC.   |

> [!Note]
> El proveedor mencionado en el atributo `source` que Terraform instala, se obtiene de [Registro de Terraform](https://registry.terraform.io/?product_intent=terraform).

| Atributos   |   Descripción   |
| :---------- | :-------------: |
| `source`   |   Atributo que define el _hostname_, _namespace_, y el _tipo de proveedor_   |
| `version`   |   Atributo que establece la versión definida por el proveedor   |