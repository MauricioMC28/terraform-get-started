<p align='center'><img src='/logo.svg' align='center' height='100'></p>

<h1 align='center'>Destruye infraestructura (Destroy) - Tutorial 5</h1>

<p align='center'> En este tutorial utilizarás Terraform para destruir esta infraestructura. Una vez que ya no necesite la infraestructura, podría querer destruirla para reducir la exposición a la seguridad, los costos o la sobrecarga de recursos. Por ejemplo, podría retirar del servicio un entorno de producción o administrar entornos de corta duración, como sistemas de compilación o prueba. Además de construir y modificar la infraestructura, Terraform puede destruir o recrear la infraestructura que administra.</p>

### Contenido

1. [Destruir](#destruir)

### Destruir

1. Utiliza el comando `terraform destroy` para terminar el recurso administrado por Terraform, este comando es el inverso de `terraform apply`.

> `terraform destroy` Muestra en pantalla que destruira el contenedor y espera por la aprobación, por lo que deberas responder `yes`.