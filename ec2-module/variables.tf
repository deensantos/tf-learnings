variable "vol_size" {
  default = 30
}

variable "vol_type" {
  default = "gp3"
}

variable "ec2_tags" {
  type = map(any)
  default = {
    "Name" = "ec2-module"
  }
}

variable "instance_type" {
  #default = "t2.large"
}

variable "ami" {
  default = "ami-05fa00d4c63e32376"
}

variable "name" {
  
}

variable "user_data" {
  default = "../main/userdata.sh.tpl"
}