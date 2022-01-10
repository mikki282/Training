provider "aws" {
    shared_credentials_file = "C:/Users/mikki.kumari/.aws/credentials"
    profile = "default"
}
resource "ec2_instamce" "web" {
    instance_type = var.instance_type
    ami ="ami_"
    count= var.instance_conut
    tags {
        name ="terraform_ec2"
    }
}
variable instance_type {
  type        = string
  default     = "t2.micro"
  description = "variable for instance_type we can modify the type of instance"
}
variable instance_conut{
    type = number
    default = 2
    description ="ec2 instance count which ARE going to create number of instance which i have mention here"
}
