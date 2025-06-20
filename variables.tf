variable "aws_region" {
  description = "AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID where the instance will be deployed."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance."
  type        = string
}

variable "key_name" {
  description = "Name of the existing EC2 Key Pair to enable SSH access."
  type        = string
}

variable "iam_instance_profile" {
  description = "Optional IAM instance profile name to attach to the EC2 instance."
  type        = string
  default     = null
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to access the instance via SSH."
  type        = string
  default     = "0.0.0.0/0"
}

variable "instance_tags" {
  description = "Map of tags to assign to the instance and related resources."
  type        = map(string)
  default     = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
