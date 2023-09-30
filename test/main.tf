module "thisUbuntu" {
  source = "../"
  providers = {
    vsphere = vsphere.homeLab
  }
  vmCPUs       = 4
  vmRAM        = 16384
  vmDiskSize   = 48
  vsphereName  = "ubuntu-2204"
  vmHostName   = "ubuntu-2204"
  vmHostDomain = var.vmHostDomain
  vmRole       = "Test"
  vmAdditionalDisks = {
    extraDisk = {
      size          = 16
      thinProvision = true
      unitNumber    = 1
    }
  }
  vsphereDatacenterName = var.vsphereDatacenterName
  vsphereClusterName    = var.vsphereClusterName
  vsphereNetworkName    = var.vsphereNetworkName
  vsphereFolderName     = "test-vms"
  vsphereDatastoreName  = var.vsphereDatastoreName
  vsphereContentLibrary = null # var.vsphereContentLibrary
  vsphereTemplateName   = "ubuntu-k8s-initial-commit"
  vsphereResourceName   = null
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

output "thisTemplate" {
  sensitive = false
  value     = module.thisUbuntu.thisTemplate
}