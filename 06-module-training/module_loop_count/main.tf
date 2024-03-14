provider "aws" {
  region = "ap-northeast-2"
}

module "ec2_seoul" {
  count  = 2
  source = "../modules/terraform-aws-ec2"
}

output "module_output" {
  value = module.ec2-seoul[*].private_ip
}
