module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"

  name = "sandbox-0-vpc"

  cidr = "10.234.0.0/19"

  azs             = ["ap-southeast-1a", "ap-southeast-1b"]
  private_subnets = ["10.234.8.0/21", "10.234.16.0/21"]
  public_subnets  = ["10.234.1.0/24", "10.234.2.0/24"]

  enable_nat_gateway  = true
  single_nat_gateway  = true
  one_nat_gateway_per_az = false
  reuse_nat_ips       = false                   

  tags = {
    terraform = "true"
    environment = "sandbox"
  }
}