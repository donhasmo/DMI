variable "prefix" {
  type = list(string)
  default = ["1", "2"]
}

variable "network_interface_ids" {
    type = map(string)
  
}

variable "public_ips" {
  type = map(string)
}

variable "rg_name" {
  type = string 
}

variable "location" {
  type = string  
}