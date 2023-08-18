module "thisUbuntu" {
  source                = "../"
  vmCPUs                = 1
  vmRAM                 = 1024
  vmDiskSize            = 16
  vsphereName           = "ubuntu-2204"
  vmHostName            = "ubuntu-2204"
  vmHostDomain          = var.vmHostDomain
  vsphereDatacenterName = var.vsphereDatacenterName
  vsphereClusterName    = var.vsphereClusterName
  vsphereNetworkName    = var.vsphereNetworkName
  vsphereFolderName     = "test-vms"
  vsphereDatastoreName  = var.vsphereDatastoreName
  vsphereTemplateName   = "ubuntu-22.04-main"
  vsphereResourceName   = var.vsphereResourceName
}

output "thisUbuntuIP" {
  sensitive = false
  value     = module.thisUbuntu.thisIP
}

output "thisUbuntuDatastore" {
  value = module.thisUbuntu.thisDatastore
}
