terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Creamos el ECR para el Frontend
resource "aws_ecr_repository" "frontend" {
  name = "${var.nombre_proyecto}-frontend"
  force_delete = true
}

# Creamos el ECR para el Back Ventas
resource "aws_ecr_repository" "back_ventas" {
  name = "${var.nombre_proyecto}-back-ventas"
  force_delete = true
}

# Creamos el ECR para el Back Despachos
resource "aws_ecr_repository" "back_despachos" {
  name = "${var.nombre_proyecto}-back-despachos"
  force_delete = true
}