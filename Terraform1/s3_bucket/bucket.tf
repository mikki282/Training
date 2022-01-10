terraform {
  backend "s3" {
    region = "ap-south-1"
    bucket = "my-test-bucklt"
    key = "setup/terraform.tfstate"
  }
  
}
