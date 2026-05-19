output "backend_private_ip" {
  description = "IP Privada del Backend"
  value       = aws_instance.backend.private_ip
}