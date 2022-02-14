variable security_group_id {
 type        = string
}
variable subnet1 {
  type        = string
}
variable subnet2 {
  type        = string 
}
variable ip {
  type        = string
  default     = "ipv4"
}
variable balancer {
  type        = string
  default     = "application"
}
variable type {
  type        = string
  default     = "instance"
}
variable vpc_id {
  type        = string
}
variable instance_id1 {
  type        = string
}
variable instance_id2 {
  type        = string
}
variable instance_id3 {
  type        = string
}