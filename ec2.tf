resource "aws_instance" "wordpress_monitoring" {
  ami           = var.ami_id                  # ID da AMI
  instance_type = var.instance_type           # Tipo da instância
  key_name      = var.key_name                # Nome da chave SSH

  security_groups = [aws_security_group.wordpress_sg.name]

  user_data = file("user_data.sh")

  tags = {
    Name = var.instance_name                  # Nome da instância
  }
}
