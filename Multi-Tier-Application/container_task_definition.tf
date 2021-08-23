resource "aws_ecs_task_definition" "wpcontainer" {
  family = "webapp"
  /*depends_on = [
    aws_db_instance.mydb
  ]*/
  container_definitions = jsonencode([
    {
      "name": "wordpress",
      "image": "wordpress:latest",
      "cpu": 200,
      "memory": 300,
      "essential": true,
      "environment": [
        {
          "name": "WORDPRESS_DB_HOST",
          "value": "${aws_db_instance.mydb.endpoint}"         
        },
        {
          "name": "WORDPRESS_DB_USER",
          "value": "${var.USERNAME}"
        },
        {
          "name": "WORDPRESS_DB_PASSWORD",
          "value": "${var.PASSWORD}"
        },
        {
          "name": "WORDPRESS_DB_NAME",
          "value": "${var.DB_NAME}"
        }
      ],
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
        }
      ],
    }
  ])

  requires_compatibilities = [ "FARGATE" ]
  network_mode             = "awsvpc"
  memory                   = 512         
  cpu                      = 256
  #execution_role_arn       = "${aws_iam_role.ecsTaskExecutionRole.arn}"
  
}

