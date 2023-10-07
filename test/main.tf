module "thisUbuntu" {
  source = "../"
  providers = {
    vsphere = vsphere.homeLab
  }
  vmCPUs       = 4
  vmRAM        = 16384
  vmDiskSize   = 64
  vsphereName  = "ubuntu-2204-test"
  vmHostName   = "ubuntu-2204-test"
  vmHostDomain = var.vmHostDomain
  vmRole       = "Test"
  vmAdditionalDisks = {
    extraDisk = {
      size          = 64
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
  vsphereTemplateName   = "ubuntu-22.04-0.2.2-rc"
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
