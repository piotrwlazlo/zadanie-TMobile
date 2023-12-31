# how many servers we want to create
variable "instance_count" {
  default = "1"
}

# default server names
variable "instance_tags" {
  type = list(string)
  default = ["tf-ansible-1", "tf-ansible-2", "tf-ansible-3", "tf-ansible-4", "tf-ansible-5"]
}

# Ubuntu as the OS
variable "ami" {
  type = string
  default = "ami-06dd92ecc74fdfb36"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}


