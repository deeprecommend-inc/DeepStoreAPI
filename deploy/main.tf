resource "aws_eip" "deep-store" {
  vpc = true
}

resource "aws_route53_record" "www" {
  zone_id = var.hosted_zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = "300"
  records = [aws_eip.deep-store.public_ip]
}

module "my_module" {
  source = "../deploy"

  // Pass in other necessary variables here
}