data "vsphere_datacenter" "datacenter" {
  name                        = "AG6HQ Homelab"
}

data "vsphere_datastore" "datastore" {
  name                        = "datastore1"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name                        = "AG6HQ Cluster1"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "default" {
  name                        = format("%s%s", data.vsphere_compute_cluster.cluster.name, "/Resources")
  datacenter_id               = data.vsphere_datacenter.datacenter.id
}

data vsphere_folder k8sVMs {
  path = "/AG6HQ Homelab/vm/k8s-vms"
}

data "vsphere_host" "host" {
  name                        = "myesxi.ag6hq.net"
  datacenter_id               = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name                        = "VM Network"
  datacenter_id               = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name                        = "linux-ubuntu-22.04-lts-0.1.0-initial-release"
  datacenter_id               = data.vsphere_datacenter.datacenter.id
}

locals {
  thisVM = {
    name = "ubuntu-test"
  }
}
resource vsphere_virtual_machine thisVM {
  name                        = local.thisVM.name
  resource_pool_id            = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id                = data.vsphere_datastore.datastore.id
  folder                      = "k8s-vms"
  num_cpus                    = 1
  memory                      = 1024
  guest_id                    = "ubuntu64Guest"
  firmware                    = "efi"
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name             = "ubuntu-test"
        domain                = "ag6hq.net"
      }
      network_interface {
        ipv4_address          = "192.168.2.245"
        ipv4_netmask          = 24
      }
      ipv4_gateway            = "192.168.2.1"
    }
  }
  network_interface {
    network_id                = data.vsphere_network.network.id
  }
  disk {
      unit_number             = 0
      label                   = "root"
      size                    = 40
      eagerly_scrub           = false
      thin_provisioned        = true
    }
  disk {
      label                   = "app"
      unit_number             = 1
      size                    = 4
      eagerly_scrub           = false
      thin_provisioned        = true
    }
  disk {
      label                   = "applogs"
      unit_number             = 2
      size                    = 4
      eagerly_scrub           = false
      thin_provisioned        = true
  }
}

output vm {
  sensitive                   = true
  value                       = vsphere_virtual_machine.thisVM
}

output template {
  value                       = data.vsphere_virtual_machine.template
}