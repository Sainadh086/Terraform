provider "aws" {
    region = var.region
}




resource "aws_security_group" "Wordpress_SG" {
        name = "Terraform-Security"
        ingress {

                from_port = 0
                to_port = 0
                protocol = -1
                cidr_blocks = ["0.0.0.0/0"]

                }

	egress {
		   from_port = 0
		   to_port = 0
		   protocol = -1
		   cidr_blocks = ["0.0.0.0/0"]
		}
    }





resource "aws_ecs_service" "wpService" {
    
    depends_on = [
      aws_ecs_task_definition.wpcontainer
    ]

    name = "myService"
    cluster = aws_ecs_cluster.ContainerCluster.arn
    task_definition = aws_ecs_task_definition.wpcontainer.arn
    launch_type = "FARGATE"
    scheduling_strategy = "REPLICA"
    desired_count = var.desired_count
    network_configuration {
      subnets          = ["${aws_default_subnet.default_subnet_a.id}", "${aws_default_subnet.default_subnet_b.id}", "${aws_default_subnet.default_subnet_c.id}"]
      assign_public_ip = true
      security_groups = [aws_security_group.Wordpress_SG.id]
    }
  
  
}




output "container_service" {
  value = "Executed Container Service"
}

