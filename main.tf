provider "aws" {
    region = "ap-southeast-1"
}

// To Generate Private Key
resource "tls_private_key" "rsa_4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_instance" "Master-Instance" {
  ami           = "ami-03caf91bb3d81b843" 
  instance_type = "t2.micro"
  tags = {
      Name = "Master-Instance"
  }
}
