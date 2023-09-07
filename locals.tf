locals {
  vsphereResourceName = var.vsphereResourceName != null ? var.vsphereResourceName : format("%s%s", data.vsphere_compute_cluster.cluster.name, "/Resources")
  thisVM = {
    vmHostName     = var.vmHostName != null ? var.vmHostName : var.vsphereName
    vmFolder       = var.vsphereFolderName != null ? var.vsphereFolderName : "/${var.vsphereDatacenterName}/vm/test-vms"
    vmTemplateID   = var.vsphereContentLibrary != null ? data.vsphere_content_library_item.template[0].id : data.vsphere_virtual_machine.template[0].id
    vmResourcePool = data.vsphere_resource_pool.default.id
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
