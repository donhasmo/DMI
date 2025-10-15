variable "prefix" {
  type = list(string)
  default = ["1", "2", "3"]
}

variable "network_interface_ids" {
    type = map(string)
  
}

variable "public_ips" {
  type = map(string)
}