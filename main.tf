provider "aws" {
 region = "us-west-2"
}

resource "aws_instance" "dev" {
    ami = "ami-0cb473a1f3c06c13d"
    instance_type = "t3.micro"
    tags = {
      Name = "Bhavani"
    }
}
