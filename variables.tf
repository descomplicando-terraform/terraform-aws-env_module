variable "name" {
  description = "Instance name"
  type        = string
  
}

variable "environment" {
  description = "Instance environment"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "Which instance type to use"
  type        = string
  
}

variable "ebs_block_devices" {
  description = "List of ebs block devices"
  type = list(any)
  default = []
}

variable "region_source" {
  description = "Provider region"
  type = string
  default = "us-east-1"
}

variable user_data {
  description = "User data script"
  type        = string
  default     = ""
}