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

variable "vsphereDatacenterName" {
  description = "The Name of the vSphere Datacenter"
  type        = string
}

variable "vsphereClusterName" {
  description = "the Name of the vSphere Cluster"
  type        = string
}

# variable "vsphereResourceName" {
#   description = "the Name of the vSphere Resource Pool"
#   type        = string
#   default     = null
# }

variable "vsphereDatastoreName" {
  description = "the Name of the vSphere Datastore"
  type        = string
}

# variable "vsphereContentLibrary" {
#   description = "the Name of the vSphere Content Library"
#   type        = string
# }

variable "vsphereNetworkName" {
  description = "the Name of the vSphere Network"
  type        = string
}

variable "vmHostDomain" {
  description = "Name of the Host's Domain as it appears in the VM."
  type        = string
  default     = null
}

