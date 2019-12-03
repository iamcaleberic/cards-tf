terraform {
  # The modules used in this example have been updated with 0.12 syntax, which means the example is no longer
  # compatible with any versions below 0.12.
  required_version = ">= 0.12"
}

module "vpc" {
  source = "./modules/vpc"
  vpc_name = "firehole" 
  aws_region = var.aws_region
  aws_profile = var.aws_profile
}

module "instance" {
  source = "./modules/instances"
  ami = var.ami
  aws_region = var.aws_region
  public_security_group =  module.vpc.public_security_group
  public_subnet = module.vpc.public_subnet
  aws_profile = var.aws_profile
}
    
