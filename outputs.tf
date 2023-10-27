locals {
  vanity_subdomain = trimsuffix(aws_route53_record.vanity.fqdn, ".")
  vanity_url       = "https://${local.vanity_subdomain}:443"
}

output "public_urls" {
  value = [local.vanity_url]
}

output "domain_name" {
  value = aws_api_gateway_domain_name.this.domain_name
}

output "endpoint_types" {
  value: var.endpoint_types
}