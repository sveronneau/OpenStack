# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  domain_name = "default"
  password    = "<your password>"
  auth_url    = "http://<your public auth ip>:5000/v3"
  region      = "RegionOne"
  insecure    = "true"
}
