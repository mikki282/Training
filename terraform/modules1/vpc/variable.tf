variable cidr_block {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr block"
}
variable cidr_pub_subnet {
    type = list
    default = ["10.0.1.0/24", "10.0.2.0/24"]
    description = "cidr block for public subnets"
}
variable availability_zones1 {
  type        = list
  default= ["ap-south-1a","ap-south-1b"]
}


variable cidr_pvt_subnet {
    type = list
    default = ["10.0.3.0/24","10.0.4.0/24"]
    description =" cidr block for private subnet"
}
variable igw_cidr{
    type = string
    default = "0.0.0.0/0"
    description =" cidr block for internet gateway"
}
variable gw_cidr{
     type = string
    default = "0.0.0.0/0"
    description =" cidr block for nat gateway"
}
# variable availability_zones1 {
#   type        = string
#   default     = "ap-south-1a"
# }
variable availability_zones2 {
  type        = list
  default= ["ap-south-1a","ap-south-1b"]
}
