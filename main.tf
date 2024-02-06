provider "aws" {
  region = "us-west-2"  # Substitua pela região desejada
}

# data "aws_ami" "latest_amazon_linux" {
#   most_recent = true

#   owners = ["amazon"]  # AWS account ID da Amazon

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-gp2"]
#   }

#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }
# }

# resource "aws_instance" "example" {
#   ami           = data.aws_ami.latest_amazon_linux.id
#   instance_type = "t3.micro"  # Substitua pelo tipo de instância desejado

#   subnet_id = "subnet-a48fb48f"  # Substitua pelo ID da sua subnet

#   tags = {
#     Name = "MinhaInstanciaEC2lll-Test1"
#   }
# }

