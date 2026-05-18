output "frontend_public_ip" {
  description = "IP Publica del Frontend"
  value       = aws_instance.frontend.public_ip
}

output "backend_private_ip" {
  description = "IP Privada del Backend"
  value       = aws_instance.backend.private_ip
}