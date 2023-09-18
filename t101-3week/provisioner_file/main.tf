resource "null_resource" "foo" {
  
  # myapp.conf 파일이 /etc/myapp.conf 로 업로드
  provisioner "file" {
    source      = "conf/myapp.conf"
    destination = "/etc/myapp.conf"
  }
  
  # content의 내용이 /tmp/file.log 파일로 생성
  provisioner "file" {
    content     = "ami used: ${self.ami}"
    destination = "/tmp/file.log"
  }
  
  # configs.d 디렉터리가 /etc/configs.d 로 업로드
  provisioner "file" {
    source      = "conf/configs.d"
    destination = "/etc"
  }
  
  # apps/app1 디렉터리 내의 파일들만 D:/IIS/webapp1 디렉터리 내에 업로드
  provisioner "file" {
    source      = "apps/app1/"
    destination = "D:/IIS/webapp1"
  }

}