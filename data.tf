data "vsphere_datacenter" "datacenter" {
  name = var.vsphereDatacenterName
}

data "vsphere_network" "network" {
  name          = var.vsphereNetworkName
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# data "vsphere_host" "host" {
#   name          = var.vsphereHostName
#   datacenter_id = data.vsphere_datacenter.datacenter.id
# }

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphereClusterName
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "default" {
  # name          = format("%s%s", data.vsphere_compute_cluster.cluster.name, "/Resources")
  name          = local.vsphereResourceName != null ? local.vsphereResourceName : format("%s%s", data.vsphere_compute_cluster.cluster.name, "/Resources")
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphereDatastoreName
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  count         = var.vsphereContentLibrary != null ? 0 : 1
  name          = var.vsphereTemplateName
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_content_library" "library" {
  count = var.vsphereContentLibrary != null ? 1 : 0
  name  = var.vsphereContentLibrary
}

data "vsphere_content_library_item" "template" {
  count      = var.vsphereContentLibrary != null ? 1 : 0
  name       = var.vsphereTemplateName
  type       = "vm-template"
  library_id = data.vsphere_content_library.library[0].id
}

data "vsphere_custom_attribute" "Template" {
  name = "Template"
}

data "vsphere_custom_attribute" "Role" {
  name = "Role"
}