variable "instance_type" {
  type        = string
  description = "describe your variable"
  default     = "t2.micro"
}

variable "instance_Name" {
  type        = string
  description = "describe your variable"
  default     = "my_ec2"
}

variable "vpc_name" {
  type        = string
  description = "this is my vpc_name"
  default     = "MyVPC"
}

variable "ami_id" {
  type        = string
  description = "this is my ami_id"
  default     = "ami-020cba7c55df1f615"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}


variable "subnet_name" {
  type        = string
  description = "this is my subnet_name"
  default     = "MySubnet"
}

variable "cidr_block_subnet" {
  type        = string
  description = "this is my subnet_cidir"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  type        = string
  description = "this is my subnet_cidir"
  default     = "us-east-1a"
}

variable "routtable_name" {
  type        = string
  description = "this is my routtable_name"
  default     = "MyRouteTable"
}

variable "security_group_name" {
  type        = string
  description = "this is my routtable_name"
  default     = "MySecurityGroup"
}

variable "GH_TOKEN" {}

variable "GH_USERNAME" {}
