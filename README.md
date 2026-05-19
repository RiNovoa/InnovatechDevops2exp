AWS Infrastructure with Terraform & CI/CD - ECS Fargate (ProyectoSemestral2)
📝 Descripción

Este proyecto implementa una infraestructura automatizada en Amazon Web Services (AWS) utilizando Terraform como herramienta de Infraestructura como Código (IaC).

La solución despliega una arquitectura basada en contenedores utilizando Amazon ECS con AWS Fargate, siguiendo el enfoque práctico trabajado en laboratorio y clases.

La infraestructura permite ejecutar:

Frontend en contenedor Docker
Backend de Ventas (Spring Boot)
Backend de Despachos (Spring Boot)
Base de datos MariaDB en EC2
Integración continua y despliegue continuo (CI/CD) con GitHub Actions

El sistema utiliza Amazon ECR para almacenar las imágenes Docker y CloudWatch Logs para centralizar los registros de ejecución de los contenedores.

🧭 Estructura del Proyecto
infra/terraform/
├── main.tf                 # Infraestructura principal AWS
├── variables.tf            # Variables globales
├── outputs.tf              # Salidas del sistema
├── terraform.tfvars        # Variables de entorno
└── README.md
🚀 Requisitos Previos

Antes de ejecutar el proyecto se requiere:

Terraform CLI >= 1.0
AWS CLI configurado
Docker Desktop instalado
Cuenta AWS Academy Learner Lab activa
GitHub Actions habilitado
Credenciales temporales AWS:
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_SESSION_TOKEN
⚙️ Arquitectura Implementada

La infraestructura despliega:

🔹 Red AWS
VPC personalizada
Subred pública
Subred privada
Internet Gateway
NAT Gateway
Tablas de ruteo públicas y privadas
🔹 Seguridad

Security Groups para:

Frontend HTTP (Puerto 80)
Backend Ventas (Puerto 8080)
Backend Despachos (Puerto 8081)
Base de datos MariaDB (Puerto 3306)
SSH (Puerto 22)
🔹 Servicios desplegados
Amazon ECS + Fargate

Se ejecutan tres contenedores:

Servicio	Puerto
Frontend	80
Backend Ventas	8080
Backend Despachos	8081
🔹 Amazon ECR

Repositorios privados para:

Frontend
Backend Ventas
Backend Despachos
🔹 EC2 + MariaDB

Instancia EC2 utilizada para:

Ejecutar MariaDB
Centralizar la base de datos utilizada por ambos microservicios
🔹 CloudWatch Logs

Logs centralizados para:

Frontend
Backend Ventas
Backend Despachos
⚙️ Flujo de Uso y Despliegue
Paso 1: Clonar repositorio
git clone <repositorio>
cd infra/terraform
Paso 2: Inicializar Terraform
terraform init
Paso 3: Revisar infraestructura
terraform plan
Paso 4: Crear infraestructura AWS
terraform apply -auto-approve

Terraform desplegará automáticamente:

VPC
Subredes
ECS Cluster
ECS Service
ECR Repositories
Security Groups
EC2 con MariaDB
CloudWatch Logs
🔄 Pipeline CI/CD con GitHub Actions

El proyecto utiliza GitHub Actions para automatizar:

Construcción de imágenes Docker
Push automático hacia Amazon ECR
Actualización automática de ECS
📁 Archivo deploy.yml

Ubicación:

.github/workflows/deploy.yml
Flujo automatizado

Cuando se realiza un push a la rama:

deploy

GitHub Actions ejecuta:

Backend Ventas
docker build
docker push

hacia:

innovatech-ep2-back-ventas
Backend Despachos
docker build
docker push

hacia:

innovatech-ep2-back-despachos
Frontend

Construcción y despliegue de la aplicación frontend hacia:

innovatech-ep2-frontend
📦 Contenedores Docker
Frontend
Vite + React
Servido mediante Nginx
Puerto 80
Backend Ventas
Spring Boot
Puerto 8080
Conexión MariaDB
Backend Despachos
Spring Boot
Puerto 8081
Conexión MariaDB
🗄️ Base de Datos

La base de datos MariaDB se ejecuta en EC2 mediante:

mariadb105-server

Configuración automática mediante user_data.

La conexión utilizada por ambos backends es:

jdbc:mysql://<PRIVATE_IP_EC2>:3306/test
📊 Monitoreo

Los logs de los contenedores se visualizan desde:

Amazon CloudWatch Logs

Separados por:

frontend
backend
despachos
🌐 Acceso a la Aplicación
Frontend
http://35.173.193.214/
Backend Ventas
http://35.173.193.214:8080/
Backend Despachos
http://35.173.193.214:8081/
📌 Buenas Prácticas Implementadas
Infraestructura como Código con Terraform
Separación de servicios mediante contenedores
CI/CD automatizado
Uso de ECS Fargate Serverless
Logs centralizados con CloudWatch
Imágenes privadas en Amazon ECR
Variables reutilizables con Terraform
🔧 Posibles Mejoras Futuras
Incorporar Application Load Balancer (ALB)
Implementar Auto Scaling
Migrar MariaDB hacia Amazon RDS
Agregar HTTPS con ACM
Configurar dominios personalizados con Route53
Implementar ECS Service Discovery
Separar Frontend y Backends en servicios ECS independientes
🧭 Tecnologías Utilizadas
Tecnología	Uso
Terraform	Infraestructura como Código
AWS ECS	Orquestación de contenedores
AWS Fargate	Ejecución Serverless
AWS ECR	Registro de imágenes Docker
AWS EC2	Base de datos MariaDB
AWS CloudWatch	Logs y monitoreo
Docker	Contenedores
GitHub Actions	CI/CD
Spring Boot	Backend
React + Vite	Frontend
