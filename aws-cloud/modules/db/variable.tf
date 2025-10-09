variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to resources"
}

variable "projectname" {
  type = string  
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

variable "db_subnet_ids" {
  type = list(string)
}

variable "priv_sg_id" {
  type = string  
}
