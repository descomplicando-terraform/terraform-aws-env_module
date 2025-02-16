variable "name" {
  type        = string
  description = "Nome da instancia"
}

variable "environment" {
  type        = string
  description = "Ambiente da instancia"
  default     = "dev"
}


variable "ebs_block_devices" {
  description = "Lista de volumes ebs para ser mounted na instância"
  type = list(any)
  
}
