provider "aws" {
 region = "ap-south-2"
}

resource "aws_instance" "dev" {
    ami = "ami-01f3f4b95d125a9af"
    instance_type = "t3.micro"
    tags = {
      Name = "Bhavani"
    }
}
