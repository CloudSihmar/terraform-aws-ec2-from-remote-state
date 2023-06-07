provider "aws" {
  region  = var.region
  
}

resource "aws_instance" "terraform-cloud-vm" {
  ami                    = var.ami
  instance_type          = var.instance_type
  count                  = 1
  user_data              = file("install.sh")
  subnet_id              = data.terraform_remote_state.vpc.outputs.subnet_id        
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.security_group_id]
  tags = {
    "Name" = "terraform-cloud-vm"
  }
}
