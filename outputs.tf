output "web_instance_public_ip" {
  value = aws_instance.web_ec2.public_ip
}