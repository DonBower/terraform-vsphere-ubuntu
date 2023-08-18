module thisUbuntu {
  source                      = "../"
  vmCPUs                      = 1
  vmRAM                       = 1024
  vmDiskSize                  = 16
  vsphereName                 = "ubuntu-2204"
  vmHostName                  = "ubuntu-2204"
  vmHostDomain                = "local"
  vsphereDatacenterName       = "ag6hq-homelab"
  vsphereClusterName          = "ag6hq-cluster1"
  vsphereNetworkName          = "VM Network"
  vsphereFolderName           = "test-vms"
  vsphereDatastoreName        = "esx1-datastore1"
  vsphereTemplateName         = "ubuntu-22.04-main"
  vsphereHostName             = "esx1.ag6hq.net"
  vsphereResourceName         = "ag6hq-cluster1"
}

output thisUbuntuIP {
  sensitive                   = false
  value                       = module.thisUbuntu.thisIP
}
