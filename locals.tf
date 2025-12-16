locals {
  public_subnets = {
    "ap-northeast-1a" = { cidr_block = "10.0.10.0/24" }
    "ap-northeast-1c" = { cidr_block = "10.0.20.0/24" }
  }
  private_subnets = {
    "ap-northeast-1a" = { cidr_block = "10.0.110.0/24" }
    "ap-northeast-1c" = { cidr_block = "10.0.120.0/24" }
  }
}

