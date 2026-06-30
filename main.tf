terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "bhavani-terraform-state-bucket-1" 
    key    = "terraform.tfstate"
    region = "ap-south-2"
    
    # ADD THESE TWO LINES TO FIX THE HYDERABAD VALIDATION BUG
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "aws" {
  region = "ap-south-2"
}

# Dynamically find the latest official Ubuntu 22.04 LTS AMI in Hyderabad
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Official Canonical Owner ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "dev" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = "t3.micro"
  
  tags = {
    Name = "Bhavani"
  }
}
