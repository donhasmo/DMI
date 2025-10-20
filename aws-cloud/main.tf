data "aws_caller_identity" "current" {}

locals {
  environment    = terraform.workspace == "prod" ? "prod" : "dev"
  aws_account    = data.aws_caller_identity.current.account_id
  aws_user_id    = data.aws_caller_identity.current.user_id
  ec2_key_name   = var.ec2_key_name
  tags = {
    env      = local.environment
    location = var.aws_region
  }
}

provider "aws" {
  # profile = var.aws_profile
  region = var.aws_region
}

module "ec2" {
  source = "./modules/ec2"
  # sg_id  = module.sg.sg_id
  aws_region      = var.aws_region
  pub_sg_id = [module.net.pub_sg_id]
  ami = var.ami
  ec2_key_name = var.ec2_key_name
  react_pubsub_id = module.net.react_pubsub_id
  tags      = local.tags
}


module "net" {
  source      = "./modules/net"
  projectname = var.projectname
  aws_region = var.aws_region
  tags        = local.tags
}




