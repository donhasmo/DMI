output "pub_sg_id" {
  value = aws_security_group.public_sg.id
}



output "react_pubsub_id" {
  description = "Public subnet ID for EC2"
  value       = aws_subnet.react_pubsub.id
}

