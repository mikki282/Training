variable instance_type{
  type        = string
  default     = "t2.micro"
  description = "this free instance type which we are going to create"
}
variable ami_id {
  type        = string
  default     = "ami-08ee6644906ff4d6c"
  description = "this is AMI id"
}
variable key_pair {
  type        = string
  default     = "AS_1"
  description = "description"
}
variable tag_name {
  type        = string
  default     = "terraform server"
  description = "name for server"
}


