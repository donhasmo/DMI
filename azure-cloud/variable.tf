variable "prefix" {
  type = list(string)
  default = ["1", "2", "3"]
}

variable "rg_name" {
  type = string 
}

variable "location" {
  type = string  
}