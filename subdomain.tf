data "ns_connection" "subdomain" {
  name     = "subdomain"
  contract = "subdomain/aws/route53"
}

locals {
  subdomain_name    = trimsuffix(data.ns_connection.subdomain.outputs.fqdn, ".")
  subdomain_zone_id = data.ns_connection.subdomain.outputs.zone_id
}
