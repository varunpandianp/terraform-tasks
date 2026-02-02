variable "ami" {
  default = "ami-0e2ba60a049853bb4"
}

variable "instancetype" {
  default = "t3.micro"
}

variable "tag" {
  default = "New-Server"
}
variable "block1" {
  default = "10.0.0.0/20"
}
variable "block2" {
  default = "10.0.1.0/24"
}

variable "block3" {
  default = "10.0.2.0/24"
}

variable "block4" {
  default = "10.0.3.0/24"
}

variable "block5" {
  default = "0.0.0.0/0"
}


variable "vpcname" {
  default = "terravpc"
}

variable "pubsub1" {
  default = "terrapub1"
}

variable "pubsub2" {
  default = "terrapub2"
}

variable "privatesub1" {
  default = "terraprivate1"
}