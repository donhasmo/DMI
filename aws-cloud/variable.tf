variable "aws_region" {
  type = string
}


variable "ec2_key_name" {
  type = string
}

# variable "ec2-keypair" {
#     type = string  
# }

variable "dbname" {
  description = "Database name"
  type        = string
}

variable "dbuser" {
  description = "Database admin username"
  type        = string
}

variable "dbpass" {
    sensitive = true
}

variable "projectname" {
  type = string
}

variable "ami" {
    type = string
}

# variable "subnet_ids" {
#   type = list(string)
# }

# variable "db_sg_ids" {
#   type = list(string)
# }

# variable "tags" {
#   type = map(string)
# }

# variable "pub_sg_id" {
#   type = list(string)
# }

# variable "priv_sg_id" {
#   type = list(string)
# }

# variable "public_ip" {
#     type = string  
# }

# variable "rds_secret_arn" {
#   type = string
# }