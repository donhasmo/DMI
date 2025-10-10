variable "tags" {
  type = map(string)
  description = "A map of tags to assign to resources"
}

# variable "sg_id" {
#   type = string
# }

variable "pub_sg_id" {
    type = list(string) 
}

variable "epicbook_pubsub_id" {
    type = string  
}

variable "rds_endpoint" {
  type = string
}

variable "rds_secret_arn" {
  type = string
}

variable "aws_region" {
}

variable "dbuser" {
  type = string  
}

variable "dbname" {
  type = string  
}

variable "dbpass" {
    sensitive = true 
}

variable "dbhost" {
    type = string  
}

variable "ami" {
    type = string  
}

variable "ec2_key_name" {
    type = string  
}

# variable "public_ip" {
#     type = string  
# }