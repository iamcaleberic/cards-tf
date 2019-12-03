variable "aws_region" {
  default = "eu-west-2"
}

variable "ami" {
 default = "ami-0be057a22c63962cb" // ubuntu 18.04
}

// variable "public_subnet" {
//   type = string
// }

// variable "public_security_group" {
//   type = string
// }

variable "aws_profile" {
  default = "cs"
}