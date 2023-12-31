locals {
  vanity_subdomain = trimsuffix(aws_route53_record.vanity.fqdn, ".")
  vanity_url       = "https://${local.vanity_subdomain}:443"
}

output "public_urls" {
  value = [local.vanity_url]
}

output "domain_name" {
  value = aws_apigatewayv2_domain_name.this.domain_name
}
