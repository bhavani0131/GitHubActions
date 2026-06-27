provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "dev" {
  # FIXED: Valid Ubuntu 24.04 LTS AMI ID for the us-west-2 (Oregon) region
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
    region = "us-west-2"
  }
}

#resource "aws_s3_bucket" "terraform_state" {
#  bucket = "bhavani-terraform-state-bucket"   # Must be globally unique

#  tags = {
#    Name = "Terraform State Bucket"
#  }
#}

#resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
#  bucket = aws_s3_bucket.terraform_state.id

# versioning_configuration {
#    status = "Enabled"
#  }
#}

#resource "aws_s3_bucket_public_access_block" "terraform_state_public_access" {
#  bucket = aws_s3_bucket.terraform_state.id

#  block_public_acls       = true
#  ignore_public_acls      = true
#  block_public_policy     = true
#  restrict_public_buckets = true
#}
