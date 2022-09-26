module "aws_security_group" {
  source = "./modules/services/security-groups"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "~> 4.16"
    }
  }
}

provider "aws" {
# access_key = "<<Please config here>>"
# secret_key = "<<Please config here>>"
region = "us-west-2"
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = module.aws_security_group.securitygroup_id
  network_interface_id = aws_instance.app_server.primary_network_interface_id
}

resource "aws_instance" "app_server" {
  ami           = "ami-08e2d37b6a0129927" # check from ec2 launch page. The ami id is region specific
  instance_type = "t2.micro"
  subnet_id = "subnet-03f612571dd073f23" #define the ec2 in same vpc(subnet) as SG
  tags = {
    Name = var.instance_name
  }
}
