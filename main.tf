provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "dev" {
  ami           = "ami-05d38da78ce859165"  # Correct Oregon AMI ID
  instance_type = "t3.micro"
  
  tags = {
    Name = "Bhavani"
  }
}

terraform {
  backend "s3" {
    bucket = "bhavani-terraform-state-bucket-uswest2"  # Your newly created bucket
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}