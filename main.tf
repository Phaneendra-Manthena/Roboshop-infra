module "vpc" {
  source = "github.com/Phaneendra-Manthena/tf-module-vpc"
  for_each = var.vpc
  cidr_block = each.value
}