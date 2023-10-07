output "catapp_url" {
  value = {
    for instance in aws_instance.hashicat:
      instance.id => "http://${instance.public_dns}"
  }
}

output "catapp_ip" {
  value = {
    for instance in aws_instance.hashicat:
      instance.id => "http://${instance.public_ip}"
  }
}