module "env_module" {
  source  = "descomplicando-terraform/env_module/aws"
  version = "0.1.0"
  name = "Simple sample"
  ebs_block_devices = [
  {
    device_name = "/dev/foo" 
    encrypted = true
    volume_size = 10
  },
  {
    device_name = "/dev/bar" 
    encrypted = true
    volume_size = 12
  }]
    
}