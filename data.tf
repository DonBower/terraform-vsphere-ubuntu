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
  name          = local.vsphereResourceName
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphereDatastoreName
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vsphereTemplateName
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

