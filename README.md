# wordpress-terraform
This repo is about a hosting Wordpress website in Terraform within AWS 
##  Part 1 - VPC 
 
 - Virtual Private Cloud [vpc.tf](vpc.tf)

 - Public & Private Route Tables

 - Internet & NAT Gateways

 - 3 Private Subnets

 - 3 Public Subnets

 - Elastic IP

 - Public/Private Route Table association with Public/Private Subnets

 -  Public Route Table attachment with IGW

 - Private Route Table attachment with NAT Gateway

## Part 2 - EC2 Instance

- Key Pair [key_pair.tf](key_pair.tf)

- Instances : [web_inst.tf](web_inst.tf )  , [database_inst.tf](database_inst.tf)

