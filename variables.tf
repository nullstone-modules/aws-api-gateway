variable "endpoint_types" {
  type        = list(string)
  default     = ["EDGE"]
  description = <<EOF
A list of endpoint types to configure. Valid values that can be included in the list are "EDGE", "REGIONAL", and "PRIVATE".
EOF
}
