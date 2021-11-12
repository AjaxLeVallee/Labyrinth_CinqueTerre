
variable "vpc_id" {
  description = "AWS VPC you have alotted me"
  default     = "us-east-1"
}

variable "aws_region" {
  description = "AWS region to create resources"
  default     = "us-east-1"
}

variable "aws_credentials_file" {
  description = "AWS Credential to use"
}

variable "aws_credentials_file_profile" {
  description = "AWS Credential profile to use in credential file"
}

variable "key_name" {
  description = "Key Name"
  # This SHOULD	be stored in like a Slide or whatnot
}

variable "key_path" {
  description = "needs to be full path, Key name that is needed for local host ssh-ing"
  # This SHOULD	be stored in like a Slide or whatnot
}


variable "cidr_block_local" {
  default = "74.96.238.95/32"
}

variable "cidr_block_remote_devbox" {
  default = "199.193.84.138"
}
