output "public_ip" {
  value = module.ec2.public_ip
}

# output "rds_password" {
#     value = aws_secretsmanager_secret.rds_secret
# }

output "dbhost" {
    value = module.db.dbhost
}

output "dbuser" {
  value = var.dbuser
}

output "dbname" {
  value = var.dbname  
}

output "dbpass" {
  value = var.dbpass
}