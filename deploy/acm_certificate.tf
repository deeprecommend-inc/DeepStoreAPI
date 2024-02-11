resource "aws_acm_certificate" "cert" {
  domain_name       = "deeprecommend.online"
  validation_method = "DNS"
}