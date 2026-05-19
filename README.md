# Terraform AWS Infrastructure & CI/CD - Innovatech

## Descripción
Infraestructura gestionada con Terraform y automatización de despliegue continuo (CI/CD) mediante GitHub Actions para el proyecto Innovatech. Este entorno despliega:
* **Amazon ECR (Elastic Container Registry):** Repositorios privados para almacenar las imágenes Docker de los microservicios (Ventas y Despachos) y el Frontend.
* **Amazon ECS con AWS Fargate:** Orquestación de contenedores sin servidor (Serverless) para ejecutar la aplicación con alta disponibilidad.
* **Security Groups & Networking:** Configuración de reglas de firewall para permitir el tráfico HTTP/HTTPS y la comunicación interna entre microservicios.
* **Pipeline CI/CD:** Flujo de GitHub Actions automatizado que construye las imágenes Docker desde el código fuente y las sube directamente a AWS al integrar cambios en la rama `develop`.

## 🧭 Estructura del Proyecto

```text
ProyectoSemestral_2/
├── .github/
│   └── workflows/
│       └── deploy.yml        # Pipeline de CI/CD para compilar y subir a ECR
├── backend/
│   ├── back-Ventas_SpringBoot/
│   └── back-Despachos_SpringBoot/
├── frontend/                 # Aplicación cliente web
├── infra/                    # Código de Infraestructura como Código (IaC)
│   ├── main.tf               # Definición de recursos AWS (ECS, ECR, SG)
│   ├── variables.tf          # Variables de entorno para Terraform
│   └── outputs.tf            # Salidas importantes (Ej: IP Pública de acceso)
├── docker-compose.yml        # Orquestación para entorno de desarrollo local
└── README.md
🚀 Requisitos
Terraform CLI versión >= 1.0

AWS CLI configurado con credenciales de AWS Academy (Learner Lab)

Variables de entorno/Secrets configurados en GitHub para las credenciales de AWS (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN).

Docker y Docker Compose (para pruebas locales).

⚙️ Flujo de Uso y Despliegue
1. Despliegue de Infraestructura (AWS)
Navega a la carpeta de infraestructura e inicializa Terraform:

Bash
cd infra
terraform init
terraform plan
terraform apply -auto-approve
Nota: Al finalizar el comando apply, la consola retornará la IP Pública para acceder al frontend de la aplicación.

2. Ejecución del Pipeline (CI/CD)
El despliegue de la aplicación está automatizado. Para actualizar los contenedores en la nube:

Asegúrate de estar en la rama develop.

Realiza un git push origin develop.

GitHub Actions ejecutará automáticamente el flujo: Checkout del código -> Login en AWS ECR -> Build de imágenes Docker -> Push a repositorios ECR.

📦 ¿Qué despliega este proyecto?
Módulo de Red y Cómputo (AWS): Levanta la red virtual, los grupos de seguridad y los clústeres de ECS con perfiles de Fargate para ejecutar la aplicación de manera pública.