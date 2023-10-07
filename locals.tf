locals {
  build_with          = "HashiCorp Terraform 1.4.6"
  build_date          = formatdate("YYYY-MM-DD", timestamp())
  build_time          = formatdate("hh:mm ZZZ", timestamp())
  version_text        = file("${path.module}/version.txt")
  vsphereResourceName = var.vsphereResourceName != null ? format("%s%s%s", data.vsphere_compute_cluster.cluster.name, "/Resources/", var.vsphereResourceName) : format("%s%s", data.vsphere_compute_cluster.cluster.name, "/Resources")
  thisVM = {
    vmHostName       = var.vmHostName != null ? var.vmHostName : var.vsphereName
    vmFolder         = var.vsphereFolderName != null ? var.vsphereFolderName : "/${var.vsphereDatacenterName}/vm/test-vms"
    vmResourcePoolId = data.vsphere_resource_pool.default.id
    vmDatastoreId    = data.vsphere_datastore.datastore.id
    vmTemplateID        = var.vsphereContentLibrary != null ? data.vsphere_content_library_item.template[0].id : data.vsphere_virtual_machine.template[0].id
    vmAnnotation     = "Version: ${local.version_text}\nBuilt on: ${local.build_date}\nBuilt with: ${local.build_with}\nBuilt from: ${var.vsphereTemplateName}"

    network = {
      staticMAC      = var.vmMacAddress != null ? true : false
      macAddress     = var.vmMacAddress # "00:50:56:00:02:14" 00:50:56:00 is prefix, 02:14 is ip 192.168.2.20
      vsphereNetwork = data.vsphere_network.network.id
    }
    disk = {
      label         = "root"
      size          = var.vmDiskSize
      thinProvision = true
      unitNumber    = 0
    }
    tags = {
      (data.vsphere_custom_attribute.Template.id) = var.vsphereTemplateName
      (data.vsphere_custom_attribute.Role.id)     = var.vmRole
    }
  }
}
