output "thisIP" {
  sensitive = false
  value     = vsphere_virtual_machine.thisUbuntu.default_ip_address
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
  value     = data.vsphere_content_library_item.template
}