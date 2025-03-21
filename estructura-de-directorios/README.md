<p align='center'><img src='/logo.svg' align='center' height='100'></p>

<h1> Distribucion de archivos en un proyecto de Terraform</h1>

```sh
├── environments
│   ├── development
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   ├── production
│   │   └── ...
│   └── staging
│       └── ...
├── modules
│   ├── ec2
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── vpc
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── scripts
│    ├── init.sh
│    └── teardown.sh
├── backend.tf
├── main.tf
├── outputs.tf
├── provider.tf
└── variables.tf
```

- **environments** _Directorio_: Multiples entornos, evita accidentes en producción, logra modularidad y reutilización.
    - **development** _Directorio_: Configuraciones del entorno de desarrollo
        - **main.tf** _Archivo_: Define los recursos Cloud con variables, en lugar de codificarlas.
        - **outputs.tf** _Archivo_: Salidas para las configuraciones de Terraform para dependencias
        - **terraform.tfvars** _Archivo_: Proporciona valores para las variables
        - **variables.tf** _Archivo_: Declara variables y tipo sin valores
    - **production** _Directorio_: Configuraciones del entorno de producción
        - **...** Misma estructura que development
    - **staging** _Directorio_: Configuraciones del entorno de ensayo
        - **...** Misma estructura que development
- **modules** _Directorio_: Componentes de Infraestructura reutilizables, logra consistencia, despliegue rápido, y evita duplicado
    - **ec2** _Directorio_: Modulo que maneja instancias EC2 eficientemente.
        - **main.tf** _Archivo_: Configuración de computo
        - **outputs.tf** _Archivo_: Salidas para instancias IPs
        - **variables.tf** _Archivo_: Variables de entrada para la configuración de instancias
    - **vpc** _Directorio_: Maneja la creación de Virtual Private Cloud
        - **main.tf** _Archivo_: Define VPC, subredes, etc
        - **outputs.tf** _Archivo_: Salidas para VPC, IDs de subredes
        - **variables.tf** _Archivo_: Variables de entrada para configuraciones de VPC
- **scripts** _Directorio_: Automatiza los flujos de trabajo de Terraform, ahorra tiempo en operaciones y reduce errores manuales
    - **init.sh** _Archivo_: Inicia Terraform antes de aplicar las configuraciones
    - **teardown.sh** _Archivo_: Destruye infraestructura para ahorrar costos
_Core Terraform Files_ Es el Cerebro de la infraestructura
- **backend.tf** _Archivo_: Define la configuración Backend (S3 o Terraform Cloud)
- **main.tf** _Archivo_:
- **outputs.tf** _Archivo_:
- **provider.tf** _Archivo_: Define la configuración del proveedor (AWS, Azure)
- **variables.tf** _Archivo_:
