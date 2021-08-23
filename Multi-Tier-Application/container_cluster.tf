resource "aws_ecs_cluster" "ContainerCluster" {
  name = "WordPressCluster"
  capacity_providers = [ "FARGATE", "FARGATE_SPOT" ]
   default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
  }
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}