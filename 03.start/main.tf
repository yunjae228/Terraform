variable "sensitive_content" {
  default = "secret"

  # 실행 계획에서 보이지 않지만, state에선 보일수도 있음 
  sensitive = true
}

resource "local_file" "foo" {
  # upper 는 내장함수
  content  = upper(var.sensitive_content)
  filename = "${path.module}/foo.bar"

  # 로컬 리소스 프로비저너
  provisioner "local-exec" {
    command = "echo The content is ${self.content}"
  }

  provisioner "local-exec" {
    command    = "abc"
    on_failure = continue
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo The deleting filename is ${self.filename}"
  }
}
