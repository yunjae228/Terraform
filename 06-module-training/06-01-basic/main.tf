module "mypw1" {
  source = "../modules/terraform-random-pwgen"
}

# 자식모듈 호출
# isDB 변수값은 다르게
module "mypw2" {
  source = "../modules/terraform-random-pwgen"
  isDB   = true
}

output "mypw1" {
  value = module.mypw1
}

output "mypw2" {
  value = module.mypw2
}
