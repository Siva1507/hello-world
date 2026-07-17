output "instance_public_ip" {
  value = aws_instance.expense_server.public_ip
}

output "instance_public_dns" {
  value = aws_instance.expense_server.public_dns
}

output "ssh_command" {
  value = "ssh -i ~/.ssh/id_rsa ubuntu@${aws_instance.expense_server.public_ip}"
}