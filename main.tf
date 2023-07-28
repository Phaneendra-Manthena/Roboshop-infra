module "vpc" {
  source            = "github.com/Phaneendra-Manthena/tf-module-vpc"
  env               = var.env
  default_vpc_id    = var.default_vpc_id
  for_each          = var.vpc
  cidr_block        = each.value.cidr_block
  public_subnets    = each.value.public_subnets
  private_subnets   = each.value.private_subnets
  availability_zone = each.value.availability_zone
  name              = each.key
}

module "docdb" {
  source = "https://github.com/Phaneendra-Manthena/tf-module-docdb.git"
  env = var.env
  for_each = var.docdb
#  subnet_ids = lookup(lookup(lookup(lookup(module.vpc,each.value.vpc_name,null),"private_subnet_ids",null),"each.value.subnets_name,null),"subnet_ids",null)
    subnet_ids = lookup(lookup(lookup(vpc.main.private_subnet_ids, "db", null), "subnet_ids", null), "*")
}

output "vpc" {
  value = module.vpc
}