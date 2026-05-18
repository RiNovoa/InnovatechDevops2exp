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