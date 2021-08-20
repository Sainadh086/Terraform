resource "aws_ecs_cluster" "ContainerCluster" {
  name = "WordPressCluster"
  capacity_providers = [ "FARGATE_SPOT","FARGATE" ]
   default_capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
  }
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}