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

├── **environments** - multiples entornos, evita accidentes en producción, logra modularidad y reutilización.
│   ├── **development**
│   │   ├── **main.tf** - Define los recursos Cloud con variables, en lugar de codificarlas
│   │   ├── **outputs.tf**
│   │   ├── **terraform.tfvars**
│   │   └── **variables.tf** - Declara variables y tipo sin valores
│   ├── **production**
│   │   ├── **main.tf**
│   │   ├── **outputs.tf** - Almacena las salidas de Terraform para las dependencias; proporciona resultados para las configuraciones
│   │   ├── **terraform.tfvars** - Proporciona valores para las variables
│   │   └── **variables.tf**
│   └── **staging**
│       ├── **main.tf**
│       ├── **outputs.tf**
│       ├── **terraform.tfvars**
│       └── **variables.tf**
├── **modules** - Componentes de Infraestructura reutilizables, asegura consistencia, despliegue rápido, evita código duplicado
│   ├── **ec2** - Modulo que maneja instancias EC2 eficientemente
│   │   ├── **main.tf**
│   │   ├── **outputs.tf**
│   │   └── **variables.tf**
│   └── **vpc** - Maneja la creación de Virtual Private Cloud
│       ├── **main.tf**
│       ├── **outputs.tf**
│       └── **variables.tf**
├── **scripts** - Automatiza los flujos de trabajo de Terraform, ahorra tiempo en operaciones y reduce errores manuales
│    ├── **init.sh** - Inicia Terraform antes de aplicar las configuraciones
│    └── **teardown.sh** - Destruye infraestructura para ahorrar costos
__Core Terraform Files__ - Es el Cerebro de la infraestructura
├── **backend.tf** - Define la configuración Backend (S3 o Terraform Cloud)
├── **main.tf** - 
├── **outputs.tf** - 
├── **provider.tf** - Define la configuración del proveedor (AWS, Azure)
└── **variables.tf** - 
