<p align='center'><img src='https://raw.githubusercontent.com/maycloud-mx/ilustraciones/ee27844a4ec7810ee6eab8770fc6c1828fd7772c/logotipos/terraform-logo.svg' align='center' height='100'></p>

<h1 align='center'>Destruye infraestructura (Destroy) - Tutorial 5</h1>

<p align='center'>En este tutorial usaras Terraform para destruir esta infraestructura. </p>

### Contenido

1. [Destruye](#destruye)

### Destruye

Ingresa a la carpeta `learn-terraform-aws-instance` y utiliza el comando `destroy` para destruir la infraestructura.

```sh
cd learn-terraform-aws-instance
terraform destroy
```

Este comando no destruye recursos en ejecución que no son administrados por el proyecto actual de Terraform.

Responde `yes` para ejecutar el plan de destruir la infraestructura.

```sh
Enter a value: yes
```