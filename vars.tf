
variable "cdirs_remote_access" {
  type = list
  description = "List of CIDR blocks"
}

#-------------------------------------------------------------------
# OPTIONAL VARIABLES
#-------------------------------------------------------------------

variable "region"{
    description = "Region of the instance"
    type = string
    default = "us-east-1"
}

variable "amis" {
    description = "AMI to use for the instance"
    type = map
    default = {
      "us-east-1" = "ami-026c8acd92718196b"
    }
}

variable "instance_type"{
    description = "Type of the instance"
    type = string
    default = "t2-micro"
}

variable "port"{
    description = "Number of the port to security group"
    type = number
    default = 22
}

variable billing_mode{
    description = "Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST"
    type = string
    default = "PAY_PER_REQUEST"
}
