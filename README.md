<h1 align='center'>Aprendiendo Terraform</h1>

<p align='center'>Es una herramienta de Infraestructura como Código(IaC), que permite administrar infraestructura con archivos de configuración en lugar de una Interfaz gráfica.</p>

<h3>Características:</h3>

- Permite construir, cambiar y administrar infraestructura de manera segura, consistente y repetible.
- Estos recursos de configuración se pueden versionar, reusar y compartir.
- Permite definir recursos e infraestructura en archivos de configuración declarativos y legibles, y gestiona el ciclo de vida de la infraestructura.
- Terraform puede administrar infraestructura en multiples plataformas Cloud.

<h3>Flujo de trabajo de despliegue></h3>

1. **Alcance** - Identificar la infraestructura del proyecto
2. **Autor** - Escribe la configuracion de la infraestructura
3. **Inicializa** - Instala los plugins que Terraform necesita para gestionar la infraestructura
4. **Plan** - Muestra la vista previa de los cambios que Terraform realizará
5. **Apply** - Realiza los cambios planeados.

<h3>Extra:</h3>

**Distribucion de archivos en un proyecto de Terraform**

├── backend.tf
├── environments
│   ├── development
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   ├── production
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   └── staging
│       ├── main.tf
│       ├── outputs.tf
│       ├── terraform.tfvars
│       └── variables.tf
├── main.tf
├── modules
│   ├── ec2
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── vpc
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── outputs.tf
├── provider.tf
├── README.md
├── scripts
│   ├── init.sh
│   └── teardown.sh
└── variables.tf
