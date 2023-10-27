resource "aws_api_gateway_domain_name" "this" {
  domain_name     = trimsuffix(local.subdomain_name, ".")
  certificate_arn = aws_acm_certificate_validation.this.certificate_arn

  endpoint_configuration {
    types = var.endpoint_types
  }

  security_policy = "TLS_1_2"

  tags = local.tags
}
