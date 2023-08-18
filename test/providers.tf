terraform {
  required_providers {
    vsphere = {
      source                            = "hashicorp/vsphere"
      version                           = ">= 2.4.1"
    }
  }
}

provider vsphere {
# user - (Required) This is the username for vSphere API operations. Can also be specified with the VSPHERE_USER environment variable.
# password - (Required) This is the password for vSphere API operations. Can also be specified with the VSPHERE_PASSWORD environment variable.
# vsphere_server - (Required) This is the vCenter Server FQDN or IP Address for vSphere API operations. Can also be specified with the VSPHERE_SERVER environment variable.

  user                 = var.vsphereUsername
  password             = var.vspherePassword
  vsphere_server       = var.vsphereEndpoint
  allow_unverified_ssl = var.vsphereAllowUnverifiedSSL
}