env = "dev"
default_vpc_id = "vpc-0136e61a0bfd44629"
vpc = {
  main = {
    cidr_block = "10.0.0.0/16"
    availability_zones = ["us-east-1a", "us-east-1b"]
    public_subnets = {
      public = {
        name = "public"
        cidr_block = ["10.0.0.0/24","10.0.1.0/24"]

      }
    }
  }
}