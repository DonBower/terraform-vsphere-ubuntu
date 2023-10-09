output "thisIP" {
  sensitive = false
  value     = vsphere_virtual_machine.thisUbuntu.default_ip_address
}

output "thisFQDN" {
  sensitive = false
  value     = "${local.thisVM.vmHostName}.${var.vmHostDomain}"
}

output "thisMAC" {
  sensitive = false
  value     = vsphere_virtual_machine.thisUbuntu.network_interface[0].mac_address
}

output "thisTemplateName" {
  sensitive = false
  value     = local.thisTemplateName
}

output "thisResourcePoolId" {
  sensitive = false
  value     = vsphere_virtual_machine.thisUbuntu.resource_pool_id
}

output "thisFolder" {
  sensitive = false
  value     = vsphere_virtual_machine.thisUbuntu.folder
}

output "thisDatastore" {
  sensitive = false
  value     = var.vsphereDatastoreName
}

output "thisTemplate" {
  sensitive = false
  value     = data.vsphere_virtual_machine.template
}
