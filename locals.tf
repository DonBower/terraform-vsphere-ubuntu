locals {
  vsphereResourceName = var.vsphereResourceName != null ? var.vsphereResourceName : format("%s%s", data.vsphere_compute_cluster.cluster.name, "/Resources")
  thisVM = {
    vmHostName     = var.vmHostName != null ? var.vmHostName : var.vsphereName
    vmFolder       = var.vsphereFolderName != null ? var.vsphereFolderName : "/${var.vsphereDatacenterName}/vm/test-vms"
    vmTemplateID   = data.vsphere_virtual_machine.template.id
    vmResourcePool = data.vsphere_compute_cluster.cluster.resource_pool_id
    vmDatastore    = data.vsphere_datastore.datastore.id
    network = {
      staticMAC      = var.vmMacAddress != null ? true : false
      macAddress     = var.vmMacAddress # "00:50:56:a8:02:14"
      vsphereNetwork = data.vsphere_network.network.id
    }
    disk = {
      label         = "root"
      size          = var.vmDiskSize
      thisProvision = true
    }
  }
}

# locals {
#   thisVM = {
#     name = "ubuntu-2204"
#     dnsDomain = "local"
#     resourcePool = data.vsphere_compute_cluster.cluster.resource_pool_id
#     dataStore = data.vsphere_datastore.esx1.id
#     secureBoot = true
#     enableLogging = true
#     vmFolder = "test-vms"
#     cpus = 2
#     ram = 2048
#     vmType = "ubuntu64Guest"
#     vmFirmware = "efi"
#     ntpHostSync = true
#     staticMAC = false
#     # macAddress = "00:50:56:a8:02:14"
#     macAddress = null
#     vsphereNetwork = data.vsphere_network.network.id
#     disk = {
#       label                   = "disk0"
#       size                    = 40
#       provision               = true
#     }
#   }
# }
# resource vsphere_virtual_machine thisVM {
#   name                        = local.thisVM.name
#   resource_pool_id            = local.thisVM.resourcePool
#   datastore_id                = local.thisVM.dataStore
#   efi_secure_boot_enabled     = local.thisVM.secureBoot
#   enable_logging              = local.thisVM.enableLogging
#   folder                      = local.thisVM.vmFolder
#   num_cpus                    = local.thisVM.cpus
#   memory                      = local.thisVM.ram
#   guest_id                    = local.thisVM.vmType
#   firmware                    = local.thisVM.vmFirmware
#   sync_time_with_host         = local.thisVM.ntpHostSync
#   clone {
#     template_uuid = data.vsphere_virtual_machine.template.id
#     customize {
#       linux_options {
#         host_name             = local.thisVM.name
#         domain                = local.thisVM.dnsDomain
#       }
#       network_interface {
#       }
#     }
#   }
#   network_interface {
#     use_static_mac            = local.thisVM.staticMAC
#     mac_address               = local.thisVM.macAddress
#     network_id                = local.thisVM.vsphereNetwork
#   }
#   disk {
#     label                     = local.thisVM.disk.label
#     size                      = local.thisVM.disk.size
#     thin_provisioned          = local.thisVM.disk.provision
#   }
# }

# output thisIP {
#   sensitive                   = false
#   value                       = vsphere_virtual_machine.thisVM.default_ip_address
# }

# output template {
#   value                       = data.vsphere_virtual_machine.template
# }