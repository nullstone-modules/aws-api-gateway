resource "aws_route53_record" "vanity" {
  name    = aws_api_gateway_domain_name.this.domain_name
  type    = "A"
  zone_id = local.subdomain_zone_id

  alias {
    name                   = aws_api_gateway_domain_name.this.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.this.cloudfront_zone_id
    evaluate_target_health = false
  }
}
