# Basic instance with 1 network and a Floating IP
resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_name      = "cirros-gold"
  flavor_name     = "tempest1"
  key_pair        = ""
  security_groups = ["default"]
  user_data       = "#cloud-config\nhostname: coco_1.mydomain.com\nfqdn: coco_1.mydomain.com"

  metadata {
    this = "that"
  }

  network {
    name = "private"
  }
}

resource "openstack_networking_floatingip_v2" "fip_1" {
  pool = "public"
}

resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.fip_1.address}"
  instance_id = "${openstack_compute_instance_v2.basic.id}"
}
