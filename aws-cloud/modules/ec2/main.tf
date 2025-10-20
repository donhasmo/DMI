resource "aws_instance" "my_ec2" {
  ami                    = var.ami # Ubuntu 20.04 AMI (update for your region)
  instance_type          = "t3.micro"
  key_name               = var.ec2_key_name             # Your pem key name (without .pem)
  subnet_id              = var.epicbook_pubsub_id
  vpc_security_group_ids = var.pub_sg_id
  associate_public_ip_address = true
  user_data_base64             = data.template_file.userdata.rendered
  tags                   = var.tags
}


