output "public_ip1" {
  value = aws_instance.webdev.public_ip
}

output "public_ip2" {
  value = aws_instance.webprd.public_ip
}