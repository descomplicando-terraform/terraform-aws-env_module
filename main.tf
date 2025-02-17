data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}
##tfsec:ignore:aws-ec2-enforce-http-token-imds:exp:2025-05-01
resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  root_block_device {
      encrypted = true
  }


  dynamic "ebs_block_device" {
    for_each = var.ebs_block_devices
    iterator = device
    content {
      device_name = device.value["device_name"]
      encrypted = device.value["encrypted"]
      volume_size = device.value["volume_size"]
    }

  }
    tags = {
      Name = var.name
      Env = var.environment
      Platform = data.aws_ami.ubuntu.platform_details
  }
}

data "terraform_remote_state" "aula_output" {
  backend = "s3"
  config = {
    bucket = "terraform-dan-2024"
    key = "check3"
    region = "us-east-2"
    }
}