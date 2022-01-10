provider "aws" {
    shared_credentials_file = "C:/Users/mikki.kumari/.aws/credentials"
    profile = "default"
    region = "ap-south-1"
}
module vpc {
  source = "C:/Users/mikki.kumari/Training/Terraform/vpc_module"

}
module instance {
  source = "C:/Users/mikki.kumari/Training/Terraform/ec2_instance"
  count = 2
  tag_name = "Server1"
}
