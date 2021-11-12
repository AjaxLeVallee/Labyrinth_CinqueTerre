output "public_addr" {
  value = aws_instance.jenkins_instance.public_dns
}
