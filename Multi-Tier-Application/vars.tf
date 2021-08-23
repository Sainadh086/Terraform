variable "region" {
    default = "ap-south-1"
}

variable "USERNAME" {
    default = "terraform"
}

variable "PASSWORD" {
    default = "Terraform123"
}

variable "DB_NAME" {
    default="mydb"  
}

variable "instance_type" {
    default = "db.t2.micro"
}

variable "port" {
    default = 80
}

variable "security_group_id" {
    default = "sg-08bc3db4e47b81483"
}

variable "desired_count" {
  default = 1
}

variable "allocated_storage" {
  default = 5
}