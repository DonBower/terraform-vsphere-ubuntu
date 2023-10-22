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
        ipv4_address = local.thisVM.network.ipv4Address
        ipv4_netmask = local.thisVM.network.ipv4Mask
      }
      ipv4_gateway = local.thisVM.network.ipv4Gateway
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
      size             = local.thisVM.disk.size > disk.value.size ? var.vmDiskSize : disk.value.size
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
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u don -i '${self.default_ip_address},' --private-key ${local.buildPrivateKey} -e 'pub_key=${local.buildPublicKey}' -e 'networkIsStatic=${local.staticIPv4}' ${local.ansiblePlaybook}"
  }

  custom_attributes = local.thisVM.tags
}
