<h1 align='center'>Construye infraestructura (Build) - Tutorial 3</h1>

<p>Utiliza Terraform para desplegar un contenedor de Docker, formatea tu configuración de Terraform, y revisa el status de tu infraestructura.</p>

1. Completar el tutorial 2
2. Revisar la configuración del archivo `main.tf` del tutorial 2
    - `terraform {}` contiene las configuraciones de Terraform, incluyendo el proveedor que Terraform utilizará para provisionar la infraestructura.
        - `required_providers` Bloque donde se declara el proveedor
            - `source` Atributo que define el _hostname_, _namespace_, y el _tipo de proveedor_.
                - El tipo de proveedor que Terraform instala, los obtiene del ![Registro de Terraform](https://registry.terraform.io/?product_intent=terraform).
                - `version` Atributo que establece la versión definida por el proveedor
    - `provider "" {}` Bloque que configura al proveedor especificado, ejemplo, _docker_
. Fin del tutorial 3