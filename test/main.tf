module "thisUbuntu" {
  source = "../"
  providers = {
    vsphere = vsphere.homeLab
  }
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
  vsphereContentLibrary = var.vsphereContentLibrary
  vsphereTemplateName   = "linux-ubuntu-22.04-lts-main"
  vsphereResourceName   = var.vsphereResourceName
}

output "thisUbuntuIP" {
  sensitive = false
  value     = module.thisUbuntu.thisIP
}

output "thisUbuntuResourcePool" {
  sensitive = false
  value     = module.thisUbuntu.thisResourcePoolId
}

output "thisUbuntuDatastore" {
  value = module.thisUbuntu.thisDatastore
}

output "thisUbuntuFolder" {
  sensitive = false
  value     = module.thisUbuntu.thisFolder
}