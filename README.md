# AWS Infrastructure with Terraform & CI/CD - ECS Fargate (ProyectoSemestral2)

## 📝 Descripción
Este proyecto gestiona e implementa de forma automatizada la infraestructura en **Amazon Web Services (AWS)** utilizando **Terraform** como herramienta de Infraestructura como Código (IaC). La solución despliega un entorno de contenedores serverless de alta disponibilidad guiado bajo el modelo práctico del laboratorio `academia-304d`.

A través de un pipeline automatizado en **GitHub Actions**, el código fuente se compila, genera imágenes Docker y las despliega directamente en AWS, otorgando una **IP pública estática** para el acceso directo al Frontend.

---

## 🧭 Estructura del Proyecto de Infraestructura

La configuración de Terraform está dividida en dos etapas principales para respetar el ciclo de dependencias y las buenas prácticas enseñadas en clase:

```text
infra/terraform/
├── providers.tf            # Configuración de proveedores (AWS)
├── variables.tf            # Variables globales del entorno
├── ecr.tf                  # ETAPA 1: Registros privados de contenedores
├── ecs.tf                  # ETAPA 2: Orquestación de clúster y servicios
├── compute.tf              # ETAPA 2: Recursos de cómputo y perfiles de Fargate
├── security.tf             # ETAPA 2: Reglas de firewall (Security Groups)
└── outputs.tf              # Salidas del sistema (IP Pública del Frontend)
🚀 Requisitos Previos
Terraform CLI versión >= 1.0 instalado localmente.

AWS CLI configurado con las credenciales del ambiente de aprendizaje (AWS Academy Learner Lab).

Tokens de sesión de AWS activos (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN).

⚙️ Flujo de Uso y Despliegue (Paso a Paso)
Paso 1: Inicialización del Entorno
Navega a la carpeta de infraestructura e inicializa los plugins correspondientes de AWS:

Bash
cd infra/terraform
terraform init
Paso 2: Ejecución de la Etapa 1 (Creación de Repositorios)
Se despliegan las bodegas de imágenes en Amazon ECR mediante la validación previa del plan:

Bash
terraform plan
terraform apply -auto-approve
Nota: En este punto, los repositorios de ECR quedan listos para recibir las imágenes generadas por el pipeline de integración continua (deploy.yml).

Paso 3: Despliegue de la Aplicación en ECS (Etapa 2)
Una vez que el pipeline ha subido las imágenes a ECR con la etiqueta latest, Terraform aprovisiona de forma automática los servicios Serverless:

Crea el clúster en Amazon ECS.

Configura la tarea con AWS Fargate definiendo los límites de CPU y Memoria (vCPU / GiB).

Expone la IP Pública de salida en la consola de comandos.

📦 ¿Qué despliega este proyecto?
Amazon ECR (Elastic Container Registry): Tres repositorios independientes para almacenar de manera segura las imágenes Docker de back-ventas, back-despachos y el frontend.

Amazon ECS (Elastic Container Service): Clúster lógico para administrar el ciclo de vida de los microservicios sin necesidad de gestionar servidores físicos (Serverless).

AWS Fargate Tasks: Definiciones de tareas ejecutando las imágenes Docker de la aplicación.

Security Groups (Firewall): Reglas de entrada que habilitan el tráfico por el puerto HTTP estipulado para la correcta visualización de la interfaz en internet.