# Basic instance with 1 network, 1 Floating IP and 1 Volume attached
resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_id        = "${var.image_id}"
  flavor_name     = "tempest1"
  key_pair        = ""
  security_groups = ["default"]

  metadata {
    this = "that"
  }

  network {
    name = "private"
  }

  block_device {
    boot_index            = 0
    delete_on_termination = true
    destination_type      = "local"
    source_type           = "image"
    uuid                  = "${var.image_id}"
  }

  block_device {
    boot_index            = 1
    delete_on_termination = true
    destination_type      = "volume"
    source_type           = "blank"
    volume_size           = 5
  }
}

resource "openstack_networking_floatingip_v2" "fip_1" {
  pool = "public"
}

resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.fip_1.address}"
  instance_id = "${openstack_compute_instance_v2.basic.id}"
}
