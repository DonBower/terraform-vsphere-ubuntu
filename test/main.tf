terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = ">= 2.4.1"
    }
  }
}

variable "vsphereEndpoint" {
  description = "FQDN of the vCenter"
  type        = string
}

variable "vsphereUsername" {
  description = "Username to access vCenter"
  type        = string
}

variable "vspherePassword" {
  description = "Password for Username to access vCenter"
  type        = string
}

variable "vsphereAllowUnverifiedSSL" {
  description = "Allow Provider to access unverified vCenters"
  type        = bool
  default     = true
}

provider "vsphere" {
  # user - (Required) This is the username for vSphere API operations. Can also be specified with the VSPHERE_USER environment variable.
  # password - (Required) This is the password for vSphere API operations. Can also be specified with the VSPHERE_PASSWORD environment variable.
  # vsphere_server - (Required) This is the vCenter Server FQDN or IP Address for vSphere API operations. Can also be specified with the VSPHERE_SERVER environment variable.
  alias                = "homeLab"
  vsphere_server       = var.vsphereEndpoint
  user                 = var.vsphereUsername
  password             = var.vspherePassword
  allow_unverified_ssl = var.vsphereAllowUnverifiedSSL
}

module "thisUbuntu" {
  source = "../"
  providers = {
    vsphere = vsphere.homeLab
  }
  vsphereName  = "ubuntu-2204-test"
  vmHostName   = "ubuntu-2204-test"
  vmCPUs       = 4
  vmRAM        = 16384
  vmDiskSize   = 64
  vmHostDomain = "ag6hq.net"
  vmRole       = "Test"
  vmAdditionalDisks = {
    extraDisk = {
      size          = 64
      thinProvision = true
      unitNumber    = 1
    }
  }
  vmMacAddress  = "00:50:56:00:02:c7"
  vmIPv4Address = "192.168.2.199"

  vsphereDatacenterName = "homelab"
  vsphereClusterName    = "cluster1"
  vsphereNetworkName    = "VM Network"
  vsphereFolderName     = "test-vms"
  vsphereDatastoreName  = "esx2-datastore"
  vsphereContentLibrary = null # var.vsphereContentLibrary
  vsphereTemplateName   = "ubuntu-22.04-0.2.2"
  vsphereResourceName   = null
}

output "thisUbuntuFQDN" {
  sensitive = false
  value     = module.thisUbuntu.thisFQDN
}

output "thisUbuntuIP" {
  sensitive = false
  value     = module.thisUbuntu.thisIP
}

output "thisUbuntuMAC" {
  sensitive = false
  value     = module.thisUbuntu.thisMAC
}

output "thisUbuntuTemplateName" {
  sensitive = false
  value     = module.thisUbuntu.thisTemplateName
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

