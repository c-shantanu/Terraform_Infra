provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_instance" "master" {
  ami           = "ami-03caf91bb3d81b843" 
  instance_type = "t2.micro"
  tags = {
      Name = "Master-Instance"
  }
}
