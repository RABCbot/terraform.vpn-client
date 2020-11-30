resource "aws_ec2_client_vpn_endpoint" "client-vpn"  {
  server_certificate_arn       = var.server_certificate
  client_cidr_block            = var.vpn_cidr
  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = var.client_certificate
  }
  connection_log_options {
    enabled                    = false
  }
}

resource "aws_ec2_client_vpn_network_association" "client-vpn" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client-vpn.id
  subnet_id              = var.subnet
  security_groups        = [var.security_group]
}

resource "aws_ec2_client_vpn_authorization_rule" "client-vpn" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client-vpn.id
  target_network_cidr    = "0.0.0.0/0"
  authorize_all_groups   = true
}