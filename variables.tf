variable api_id {
  description = "API Gateway REST API ID."
}

variable api_stage_name {
  description = "API Gateway REST API deployment stage name."
}

variable domain_name {
  description = "Custom domain name."
}

variable certificate_arn {
  description = "ACM certificate ARN."
}

variable route53_zone_id {
  description = "Route53 hosted zone ID."
}

variable endpoint_configuration {
  default = "REGIONAL"
  description = "An API endpoint type refers to the hostname of the API."
}

variable route53_record_type {
  default = "A"
  description = "AWS Route 53 DNS record type."
}

variable route53_record_evaluate_target_health {
  default = false
  description = "AWS Route 53 health checking."
}