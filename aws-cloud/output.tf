output "public_ip" {
  value = module.ec2.public_ip
}

# output "rds_password" {
#     value = aws_secretsmanager_secret.rds_secret
# }