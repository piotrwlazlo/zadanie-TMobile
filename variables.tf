# below we define with the variable instance_count how many servers we want to create
variable "instance_count" {
  default = "1"
}

# below we define the default server names
variable "instance_tags" {
  type = list(string)
  default = ["tf-ansible-1", "tf-ansible-2", "tf-ansible-3", "tf-ansible-4", "tf-ansible-5"]
}

# we use Ubuntu as the OS
variable "ami" {
  type = string
  default = "ami-06dd92ecc74fdfb36"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}


# output.tf

output "server-data" {
  value       = [for vm in aws_instance.server[*] : {
    ip_address  = vm.public_ip
    public_dns = vm.public_dns
  }]
  description = "The public IP and DNS of the servers"
}