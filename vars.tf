variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "region" {
    default = "us-east-2"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}