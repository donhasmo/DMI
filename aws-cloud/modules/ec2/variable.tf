variable "tags" {
  type = map(string)
  description = "A map of tags to assign to resources"
}

variable "pub_sg_id" {
    type = list(string) 
}

variable "react_pubsub_id" {
    type = string  
}

variable "aws_region" {
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