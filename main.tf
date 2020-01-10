resource aws_api_gateway_domain_name api_gateway_custom_domain {
  domain_name     = var.domain_name
  regional_certificate_arn = var.certificate_arn

  endpoint_configuration {
    types = [var.endpoint_configuration]
  }
}

resource aws_api_gateway_base_path_mapping base_path {
  api_id      = var.api_id
  domain_name = aws_api_gateway_domain_name.api_gateway_custom_domain.domain_name
  base_path  = var.api_stage_name
  stage_name  = var.api_stage_name
}

resource aws_route53_record record {
  type     = var.route53_record_type
  name     = aws_api_gateway_domain_name.api_gateway_custom_domain.domain_name
  zone_id  = var.route53_zone_id

  alias {
    evaluate_target_health = var.route53_record_evaluate_target_health
    name                   = aws_api_gateway_domain_name.api_gateway_custom_domain.regional_domain_name
    zone_id                = aws_api_gateway_domain_name.api_gateway_custom_domain.regional_zone_id
  }
}
