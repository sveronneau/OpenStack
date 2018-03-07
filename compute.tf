# Basic instance with 1 network
resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_id        = "cirros"
  flavor_id       = "tempest_1"
  key_pair        = ""
  security_groups = ["default"]

  metadata {
    this = "that"
  }

  network {
    name = "private"
  }
}
