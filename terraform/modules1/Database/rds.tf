resource "aws_db_subnet_group" "rds-subnet" {
  name = "rds-subnet"
  subnet_ids = ["${var.rds_subnet1}","${var.rds_subnet2}"]
}


resource "aws_db_instance" "my-sql-db" {
  identifier = "sqldatabase10"
  name = "myDB10"
  instance_class = var.db_instance
  engine = var.engine_name
  engine_version = var.en_version
  storage_type = var.storage_type
  allocated_storage = 20
  username = var.u_name
  password = var.passwd
  db_subnet_group_name = aws_db_subnet_group.rds-subnet.name
  vpc_security_group_ids = [var.security_group_id]
  publicly_accessible = false
  deletion_protection = true
  skip_final_snapshot = true
}