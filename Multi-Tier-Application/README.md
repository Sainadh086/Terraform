# Multi-Tier Application

Launches a MySql Database in Relational Database Services(RDS) and an Wordpress Image in Elastic Container Service.

## Overview
    - Create a MySQL Database
    - Create a Security Group, Container Cluster, Task Definition, Service, and Fargate Instances.

## Prerequisites
    - Require an AWS account.
    - Create an IAM user with required permissions.

## Output
    - Deploys a MySql Database in RDS.
    - Creates an ECS Cluster, Task Definition, Service, and Fargate Instances.
    - Deploys a Wordpress Image in an Elastic Container Service.
    - In total there are 9 resources created.

## Commands
    - terraform init #initializes the Terraform configuration.
    - terraform plan #plan the changes that will be made to your infrastructure.
    - terraform apply #apply the planned changes to your infrastructure.
    - terraform destroy #destroy the infrastructure.