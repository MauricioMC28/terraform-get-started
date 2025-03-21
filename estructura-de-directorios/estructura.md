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