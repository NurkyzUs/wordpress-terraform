variable "vpc_cidr_block" {
    type         = string
    description  = "this is the CIDR Block for my vpc_1"
}

variable "env" {
    type          = string
    description   = "Name of the environment"

  }

variable "project_name" {
    type          = string
    description   = "this is the project name"

}
variable "cidr_pub_sub1" {
    type          = string
    description   = "this cidr is for the public subnet 1"
}

variable "cidr_pub_sub2"{
    type         = string
    description  = "this cidr is for the public subnet 2"
}


variable "cidr_pub_sub3" {
    type         = string
    description  = "this cidr is for the public subnet 3"
}

variable "cidr_pri_sub1"{
    type          = string
    description   = "this cidr is for the private subnet 1"
}

variable "cidr_pri_sub2"{
    type          = string
    description   = "this cidr is for the private subnet 2"
}

variable "cidr_pri_sub3"{
    type          = string
    description   = "this cidr is for the private subnet 3"
}

variable "open_cidr_block" {
    type = string
    description = "this is an open cidr block"
}

variable "instance_type" {
    type          = string
    description   = "this is an instance type"
}

variable "database_ingress_port" {
    type          = number
    description   = "ingress http port for database instance"
}

variable "database_ingress_protocol" {
    type          = string 
    description   = "this is an ingress protocol"
}

variable "database_sg_cidr_block" {
    type          = string
    description   = "this is a database instance's CIDR block"
}

variable "database_egress_port" {
    type          = number
    description   = "this is an egress protocol"
}

variable "database_egress_protocol" {
    type          = string 
    description   = "this is an egress protocol"
}

variable "web_sg_ssh" {
    type          = number
    description   = "this is SSH for a web instance"
}

variable "web_sg_protocol" {
    type          = string
    description   = "this is a web sg protocol "
}

variable "web_sg_http" {
    type          = number
    description   = "this is HTTP for a web instance"
}