provider "aws" {
  region = "ap-south-1"
}
# remote state storing on s3 and state file locking using dynamodb
terraform {
  backend "s3" {
    bucket = "terraform-s3-aj"
    region = "ap-south-1"
    key = "terraform.tfstate"
    dynamodb_table = "statelocking-tf-aj"
  }
}