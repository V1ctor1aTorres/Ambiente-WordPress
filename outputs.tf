output "instance_public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = aws_instance.wordpress_monitoring.public_ip
}

output "grafana_url" {
  description = "URL do Grafana"
  value       = "http://${aws_instance.wordpress_monitoring.public_ip}:3000"
}

output "prometheus_url" {
  description = "URL do Prometheus"
  value       = "http://${aws_instance.wordpress_monitoring.public_ip}:9090"
}

output "wordpress_url" {
  description = "URL do WordPress"
  value       = "http://${aws_instance.wordpress_monitoring.public_ip}"
}
