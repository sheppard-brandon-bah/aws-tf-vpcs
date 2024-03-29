/********************************/
/**Set the region for resources**/
/********************************/
provider "aws" {
  region = local.region
}

variable "vpc" {
  default = "mvpc"
}

variable "Environment" {
  default = "manageelopment"
}

/********************************/
/*Set the VPC used by resources**/
/********************************/
variable "vpc-id" {
  description = "ID of the VPC"
  #TODO
  default     = "vpc_id"
}

#TODO
variable "vpc-cidr" {
  default = "vpc_cidr"
}

/************************************/
/*Set the Subnets used by resources**/
/************************************/
variable "manage_subnet_AZ1" {
  description = "Subnet to be used for manage AZ1"
  #TODO
  default     = "subnet_id"
}

variable "manage_subnet_AZ2" {
  description = "Subnet to be used for manage AZ2"
  #TODO
  default     = "subnet_id"
}

/********************************************/
/**Set the Availability Zones for resources**/
/********************************************/
variable "availability_zones" {
  #TODO
  default = ["AZ_1_name", "AZ_2_name"]
}

variable "manage_AZ1" {
  description = "Availability Zone for all manage resources"
  #TODO
  default     = "AZ_1_name"
}

variable "manage_AZ2" {
  description = "Availability Zone for all manage resources"
  #TODO
  default     = "AZ_2_name"
}

locals {
  #TODO
  region    = data.terraform_remote_state.<global_state_name>.outputs.region_out
  base_tags = merge(
    {
      "VPC"         = var.vpc
      "Environment" = var.Environment
    },
    #TODO  
    data.terraform_remote_state.<global_state_name>.outputs.base_tags_out
  )
}
