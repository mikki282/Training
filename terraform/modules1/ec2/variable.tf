variable instance_type{
  type        = string
  default     = "t2.micro"
  description = "this free instance type which we are going to create"
}
variable ami_id {
  type        = string
  default     = "ami-0851b76e8b1bce90b"
  description = "this is AMI id"
}
variable key_pair {
  type        = string
  default     = "AS_1"
  description = "description"
}
variable subnet_id {
  type        = string
}
variable security_group_id {
 type        = string
}

# variable security_group_id {
#  type        = string
# }
# variable subnet1 {
#   type        = string
# }
# variable subnet2 {
#   type        = string 
# }
# variable ip {
#   type        = string
#   default     = "ipv4"
# }
# variable balancer {
#   type        = string
#   default     = "application"
# }
# variable type {
#   type        = string
#   default     = "instance"
# }
# variable vpc_id {
#   type        = string
# }
# # variable instance_id {
#   # type        = string
# # }




