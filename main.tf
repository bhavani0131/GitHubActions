provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "dev" {
  ami           = "ami-05d38da78ce859165"  
  instance_type = "t3.micro"
  
  tags = {
    Name = "Bhavani"
  }
}

terraform {
  backend "s3" {
    bucket = "bhavani-terraform-state-bucket-uswest2"  
    key    = "terraform.tfstate"
    region = "ap-south-2"
  }
}
