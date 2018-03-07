# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = "f48beb215c5f1157f07894cf32e684983d84ee281366878d25e3e6e5c68a11"
  auth_url    = "http://myauthurl:5000/v2.0"
  region      = "RegionOne"
}
