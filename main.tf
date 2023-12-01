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
}

resource "tls_private_key" "example_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "null_resource" "change_key_permissions" {
  depends_on = [aws_instance.Master-Instance]

  provisioner "local-exec" {
    command = "chmod 400 ${path.module}/example-key.pem"
  }
}




