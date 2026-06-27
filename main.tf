provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "dev" {
  ami           = "ami-0fc2099309ebdb62d" 
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
