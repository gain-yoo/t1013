resource "random_pet" "name" {
  keepers = {
    ami_id = timestamp()
  }
}

# DB일 경우 Password 생성 규칙을 다르게 반영
resource "random_password" "password" {
  length           = var.isDB ? 16 : 10
  special          = var.isDB ? true : false
  override_special = "!#$%*?"
}
