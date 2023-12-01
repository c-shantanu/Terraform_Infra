provider "aws" {
    region = "ap-southeast-1"
}


resource "aws_instance" "Master-Instance" {
  ami           = "ami-03caf91bb3d81b843" 
  instance_type = "t2.micro"

  key_name = aws_key_pair.example_key.key_name

  tags = {
      Name = "Master-Instance"
  }
}

resource "aws_key_pair" "example_key" {
  key_name   = "example-key"
  public_key = tls_private_key.example_key.public_key_openssh
  file_permission = "0400"
}

resource "tls_private_key" "example_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
