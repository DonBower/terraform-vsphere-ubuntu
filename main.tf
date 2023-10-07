resource "vsphere_virtual_machine" "thisUbuntu" {
  name             = var.vsphereName
  annotation       = local.thisVM.vmAnnotation
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

  dynamic "disk" {
    for_each = data.vsphere_virtual_machine.template[0].disks
    content {
      label            = disk.value.label
      size             = disk.value.size
      thin_provisioned = disk.value.thin_provisioned
      eagerly_scrub    = disk.value.eagerly_scrub
      unit_number      = disk.value.unit_number
    }
  }

  dynamic "disk" {
    for_each = var.vmAdditionalDisks
    content {
      label            = disk.key
      size             = disk.value.size
      thin_provisioned = disk.value.thinProvision
      eagerly_scrub    = false
      unit_number      = disk.value.unitNumber
    }
  }

  custom_attributes = local.thisVM.tags
}
