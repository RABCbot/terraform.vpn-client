# Terraform Client VPN Endpoint
Creates an AWS Client VPN Endpoint

# Information
https://aws.amazon.com/blogs/networking-and-content-delivery/introducing-aws-client-vpn-to-securely-access-aws-and-on-premises-resources/

# Create Certificate 
Follow instructions to create certificate and upload to AWS Certificate manager (ACM)
https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/client-authentication.html#mutual

# Usage
On your root .tf file, add

module "client-vpn" {
  source             = "./client-vpn"
  namespace          = "a tag to identify your system"
  name               = "a prefix to identify your system"
  stage              = "dev or prod"
  vpn_cidr           = "enter a CIDR subnet that does not overlap the resources you will access"
  server_certificate = "your server certiicate ARN"
  client_certificate = "your client certiicate ARN"
  subnet             = "subnet id"
  security_group     = "sg id"
}
