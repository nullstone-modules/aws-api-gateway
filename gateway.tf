resource "aws_apigatewayv2_domain_name" "this" {
  domain_name = trimsuffix(local.subdomain_name, ".")
  tags        = local.tags

  domain_name_configuration {
    certificate_arn = aws_acm_certificate.this.arn
    endpoint_type   = "REGIONAL"
    security_policy = "TLS_1_2"
  }

  depends_on = [aws_acm_certificate_validation.this]
}
