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

resource "aws_key_pair" "key-pair-01" {
  key_name   = example_KP
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "key-01" {
  content         = tls_private_key.rsa.private_key_pem
  file_permission = "0400"
  filename        = example_KP
}


