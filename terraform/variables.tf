variable "network_name" { default = "k8s-network" }
variable "subnet_name" { default = "k8s-subnet" }
variable "subnet_cidr" { default = "10.10.0.0/16" }
variable "master_instance_name" { default = "k8s-master" }
variable "worker_instance_count" { default = 2 }

