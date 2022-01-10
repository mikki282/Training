variable cidr_block {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr block"
}
variable cidr_pub_subnet {
    type = string
    default = "10.0.1.0/24"
    description = "cidr block for public subnet"
}
variable cidr_pvt_subnet {
    type = string
    default = "10.0.0.0/24"
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