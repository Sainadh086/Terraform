resource "aws_db_instance" "mydb" {
  allocated_storage    = var.allocated_storage
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = var.instance_type
  name                 = var.DB_NAME
  username             = var.USERNAME
  password             = var.PASSWORD
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.security_group_id]
}

output "Database_Status" {
    value = "Mysql Database Created"
}