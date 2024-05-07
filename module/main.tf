module "aws_vpc" {
    source = "../"
    availability_zone = ["us=east-2a","us-east2b","us-east2c"]
    public_subnet = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
    private_subnets = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
}