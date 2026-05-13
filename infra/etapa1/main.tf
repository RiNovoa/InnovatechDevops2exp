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

# Creamos el ECR para el Backend
resource "aws_ecr_repository" "backend" {
  name = "${var.nombre_proyecto}-backend"
  force_delete = true
}

# Creamos el ECR para el Frontend
resource "aws_ecr_repository" "frontend" {
  name = "${var.nombre_proyecto}-frontend"
  force_delete = true
}