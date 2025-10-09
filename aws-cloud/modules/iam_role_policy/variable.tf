variable "tags" {
  type = map(string)
  description = "A map of tags to assign to resources"
}

variable "rds_secret_arn" {
  type        = string
  description = "ARN of the RDS secret"
}
