locals {
  alternative_names = []
}

resource "aws_acm_certificate" "this" {
  domain_name               = local.subdomain_name
  validation_method         = "DNS"
  subject_alternative_names = local.alternative_names
  tags                      = local.tags

  count = local.create_cert ? 1 : 0
}

locals {
  dvos = [for dvo in try(aws_acm_certificate.this[0].domain_validation_options, []) : {
    name   = dvo.resource_record_name
    record = dvo.resource_record_value
    type   = dvo.resource_record_type
  }]
}

resource "aws_route53_record" "cert_validation" {
  count = local.create_cert ? length(local.alternative_names) + 1 : 0

  allow_overwrite = true
  name            = local.dvos[count.index].name
  records         = [local.dvos[count.index].record]
  type            = local.dvos[count.index].type
  ttl             = 60
  zone_id         = local.subdomain_zone_id
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = aws_acm_certificate.this[count.index].arn
  validation_record_fqdns = [for cv in aws_route53_record.cert_validation : cv.fqdn]

  timeouts {
    create = "5m"
  }

  count = local.create_cert ? 1 : 0
}

locals {
  create_cert     = !local.subdomain_has_certificate
  certificate_arn = local.subdomain_has_certificate ? local.subdomain_certificate_arn : aws_acm_certificate_validation.this[0].certificate_arn
}