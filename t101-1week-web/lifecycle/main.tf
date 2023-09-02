# 1. create_before_destroy
resource "local_file" "abc" {
  content  = "lifecycle - step 2"   # 수정
  filename = "${path.module}/abc.txt"

  lifecycle {
    create_before_destroy = true    # 생성 후 삭제
  }
}

# 2. prevent_destroy
resource "local_file" "abc" {
  content  = "lifecycle - step 33" # 수정
  filename = "${path.module}/abc.txt"

  lifecycle {
    prevent_destroy = true # 삭제 방지
  }
}

# 3. ignore_changes
resource "local_file" "abc" {
  content  = "lifecycle - step 5"   # 수정
  filename = "${path.module}/abc.txt"

  lifecycle {
    ignore_changes = [
      content
    ]
  }
}

# 4. precondition
variable "file_name" {
  default = "step0.txt"
}

resource "local_file" "abc" {
  content  = "lifecycle - step 6"
  filename = "${path.module}/${var.file_name}"

  lifecycle {
    precondition {
      condition     = var.file_name == "step0.txt"
      error_message = "file name is not \"step6.txt\""
    }
  }
}

# 5. postcondition
resource "local_file" "abc" {
  content  = ""
  filename = "${path.module}/step7.txt"

  lifecycle {
    postcondition {
      condition     = self.content != ""
      error_message = "content cannot empty"
    }
  }
}

output "step7_content" {
  value = local_file.abc.id
}