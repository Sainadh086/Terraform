provider "aws" {
    region = var.region
}




resource "aws_security_group" "Wordpress_SG" {
        name = "Terraform-Security"
        ingress {

                from_port = var.port
                to_port = var.port
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]

                }
	egress {
		   from_port = var.port
		   to_port = var.port
		   protocol = "tcp"
		   cidr_blocks = ["0.0.0.0/0"]
		}
    }





resource "aws_ecs_service" "wpService" {
    
    depends_on = [
      aws_ecs_task_definition.wpcontainer
    ]

    name = "WordpressCluster"
    cluster = aws_ecs_cluster.ContainerCluster.arn
    task_definition = aws_ecs_task_definition.wpcontainer.arn
    desired_count = 1
    launch_type = "FARGATE"
    network_configuration {
      subnets          = ["${aws_default_subnet.default_subnet_a.id}", "${aws_default_subnet.default_subnet_b.id}", "${aws_default_subnet.default_subnet_c.id}"]
      assign_public_ip = true
      security_groups = [aws_security_group.Wordpress_SG.id]
    }
    desired_container = 3 
  
  
}

output "LoadBalancer_IP" {
  value = aws_lb.application_load_balancer.dns_name
}




