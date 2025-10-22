data "aws_caller_identity" "current" {}

locals {
  environment    = terraform.workspace == "prod" ? "prod" : "dev"
  aws_account    = data.aws_caller_identity.current.account_id
  aws_user_id    = data.aws_caller_identity.current.user_id
  # S3_bucket_name = var.S3_bucket_name
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
  epicbook_pubsub_id = module.net.epicbook_pubsub_id
  rds_endpoint    = module.db.rds_endpoint
  rds_secret_arn  = module.db.rds_secret_arn
  dbname = var.dbname
  dbhost = module.db.dbhost
  dbpass = var.dbpass
  dbuser = var.dbuser
  tags      = local.tags
}




module "db" {
  source        = "./modules/db"
  projectname   = var.projectname
  db_subnet_ids = module.net.db_subnet_ids
  priv_sg_id    = module.net.priv_sg_id
  dbname = var.dbname
  dbuser = var.dbuser
  dbpass = var.dbpass
  tags   = local.tags
}


module "net" {
  source      = "./modules/net"
  projectname = var.projectname
  aws_region = var.aws_region
  tags        = local.tags
}

module "iam_role_policy" {
  source = "./modules/iam_role_policy"
  rds_secret_arn   = module.db.rds_secret_arn
  tags   = local.tags
}




