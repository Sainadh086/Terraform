
provider "aws" {
	region = "ap-south-1"
}


resource "aws_security_group" "mySG" {
        name = "Terraform-Security"
        ingress {

                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]

                }
	egress {
		   from_port = 80
		   to_port = 80
		   protocol = "tcp"
		   cidr_blocks = ["0.0.0.0/0"]
		}
        }



resource "aws_instance" "WebOS" {
	ami = "ami-0ebc1ac48dfd14136"
	instance_type = "t2.micro"
        vpc_security_group_ids = aws_security_group.mySG.id
	user_data = <<EOF
		      #!/bin/bash
		      sudo yum install httpd -y
		      sudo echo "Hello World" > /var/www/html/index.html
		      sudo systemctl start httpd &
		      EOF
	tags = {
		Name = "Terraform_WebServer"
		}
	}



output "aws_instance_ip" {
	value = aws_instance.WebOS.public_ip 
}


