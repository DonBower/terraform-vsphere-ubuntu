resource "vsphere_virtual_machine" "thisUbuntu" {
  name             = var.vsphereName
  resource_pool_id = local.thisVM.vmResourcePoolId
  datastore_id     = local.thisVM.vmDatastoreId
  num_cpus         = var.vmCPUs
  memory           = var.vmRAM
  folder           = local.thisVM.vmFolder
  guest_id         = "ubuntu64Guest"
  firmware         = "efi"
  clone {
    template_uuid = local.thisVM.vmTemplateID
    customize {
      linux_options {
        host_name = local.thisVM.vmHostName
        domain    = var.vmHostDomain
      }
      network_interface {
        # ipv4_address          = "192.168.2.245"
        # ipv4_netmask          = 24
      }
      # ipv4_gateway            = "192.168.2.1"
    }
  }
  network_interface {
    use_static_mac = local.thisVM.network.staticMAC
    mac_address    = local.thisVM.network.macAddress
    network_id     = local.thisVM.network.vsphereNetwork
  }
  disk {
    label            = local.thisVM.disk.label
    size             = local.thisVM.disk.size
    thin_provisioned = local.thisVM.disk.thisProvision
    eagerly_scrub    = false
  }
  custom_attributes = local.thisVM.tags
}
