variable rds_subnet1 {}
variable rds_subnet2 {}
variable db_instance {}
variable engine_name {}
variable en_version {}
variable storage_type {}
variable u_name {
  type        = string
  default     = "admin"
}
variable passwd {
  type        = string
  default     = "mypasswd123"
}
variable security_group_id {
  type        = string
}


