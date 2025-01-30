variable "instance_name" {
  description = "Nome da instância EC2"
  type        = string
  default     = "wordpress-monitoring" # Valor padrão
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t2.micro" # Valor padrão
}

variable "ami_id" {
  description = "ID da AMI para a instância EC2"
  type        = string
  default     = "ami-0f214d1b3d031dc53" # Amazon Linux 2 (us-east-1)
}

variable "key_name" {
  description = "Nome da chave SSH para acessar a instância"
  type        = string
  default     = "my-key" # Substitua pelo nome da sua chave
}
