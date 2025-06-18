terraform {
  required_providers {
     aws = {
       source = "hashicorp/aws"
       version = "~> 5.0"
     }
   }
}

provider "aws" {
   shared_credentials_files = [var.creds_file]
   region = "us-east-1"
}

resource "aws_instance" "docker_server" {
  ami = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t3.medium"
  subnet_id = "subnet-0a58c14b24314989d"
  vpc_security_group_ids = ["sg-0f8ca0e8655ad4416"]
  tags = {
    Name = "DockerServer"
  }
  user_data = "${file('init.sh')}"
}