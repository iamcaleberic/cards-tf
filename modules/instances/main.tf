provider "aws" {
    profile = var.aws_profile
    region = var.aws_region
}

resource "aws_instance" "cards" {
    ami = var.ami 
    instance_type = "t2.micro"
    subnet_id = var.public_subnet
    security_groups = [var.public_security_group]
}
