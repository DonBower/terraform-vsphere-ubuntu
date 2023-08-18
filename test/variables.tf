variable vsphereDatacenterName {
  description = "The Name of the vSphere Datacenter"
  type        = string
}

variable vsphereClusterName {
  description = "The Name of the vSphere Cluster"
  type        = string
}

variable vsphereResourceName {
  description = "The Name of the vSphere Resource Pool"
  type        = string
}

variable vsphereDatastoreName {
  description = "The Name of the vSphere Datastore for the VM information"
  type        = string
}

variable vsphereHostName {
  description = "The Name of the vSphere Host for the VM information"
  type        = string
}

variable vsphereNetworkName {
  description = "The Name of the vSphere Datastore"
  type        = string
}

variable vsphereFolderName {
  description = "The Name of the Folder to store the VM in"
  type        = string
  default     = null
}

variable vsphereEndpoint {
  description = "FQDN of the vCenter"
  type        = string
}

variable vsphereUsername {
  description = "Username to access vCenter"
  type        = string
}

variable vspherePassword {
  description = "Password for Username to access vCenter"
  type        = string
}

variable vsphereAllowUnverifiedSSL {
  description = "Allow Provider to access unverified vCenters"
  type        = bool
  default     = true
}
