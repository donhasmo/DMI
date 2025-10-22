resource "aws_instance" "my_ec2" {
  ami                    = var.ami                     # Ubuntu 20.04 AMI (update for your region)
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.dev_key.key_name             # Your pem key name (without .pem) or ssh key.
  subnet_id              = var.epicbook_pubsub_id
  vpc_security_group_ids = var.pub_sg_id
  associate_public_ip_address = true
  user_data_base64             = data.template_file.userdata.rendered
  tags                   = var.tags

  depends_on = [aws_key_pair.dev_key]
}


resource "aws_key_pair" "dev_key" {
  key_name   = "${var.aws_region}-${terraform.workspace}-key"
  public_key = file("~/.ssh/id_ed25519.pub")          # path to your public key
}