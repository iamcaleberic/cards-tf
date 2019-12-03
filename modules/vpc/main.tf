provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}


resource "aws_vpc" "vpc" {
  cidr_block = "172.99.0.0/16"
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "${var.vpc_name}_gw"
    }
}


resource "aws_subnet" "subnet_private" {
   vpc_id     = aws_vpc.vpc.id
   cidr_block = "172.99.1.0/24"
   tags = {
       Name = "${var.vpc_name}_subnet_private"
   }
}   

resource "aws_subnet" "subnet_public" {
   vpc_id     = aws_vpc.vpc.id
   cidr_block = "172.99.2.0/24"
   tags = {
        Name = "${var.vpc_name}_subnet_public"
   }
}   


resource "aws_route_table" "rtb_public" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
        Name = "${var.vpc_name}_rt_public"
    }
    
}

resource "aws_route_table" "rtb_private" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "${var.vpc_name}_rtb_private"
    }
}

resource "aws_security_group" "sg_public" {
    name        = "${var.vpc_name}_sg_public"
    description = "Allow public traffic"
    vpc_id      = aws_vpc.vpc.id
      ingress {
        # TLS (change to whatever ports you need)
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        # Please restrict your ingress to only necessary IPs and ports.
        # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
        cidr_blocks =  ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${var.vpc_name}_sg_public"
    }
}   
