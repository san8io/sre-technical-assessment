variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "DefaultAppName"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
