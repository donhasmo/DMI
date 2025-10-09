data "template_file" "userdata" {
    template = base64encode(templatefile("${path.module}/userdata.yaml", {
    db_host     = var.dbhost
    db_username = var.dbuser
    db_password = var.dbpass
    db_name     = var.dbname
  }))


#   template = file("${path.module}/userdata.sh")

#   vars = {
#     rds_endpoint   = var.rds_endpoint
#     rds_secret_arn = var.rds_secret_arn
#     aws_region     = var.aws_region
#   }
}