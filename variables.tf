variable "vsphereName" {
  description = "Name of the VM as it appears in vSphere"
  type        = string
  default     = "thisUbuntu"
}

variable "vsphereTemplateName" {
  description = "The Name of the template to clone the VM from"
  type        = string
}

variable "vsphereDatacenterName" {
  description = "The Name of the vSphere Datacenter"
  type        = string
}

variable "vsphereClusterName" {
  description = "the Name of the vSphere Cluster"
  type        = string
}

variable "vsphereContentLibrary" {
  description = "the Name of the vSphere Content Library"
  type        = string
}

# variable "vsphereHostName" {
#   description = "The Name of the vSphere ESX Host"
#   type        = string
# }

variable "vsphereResourceName" {
  description = "the Name of the vSphere Resource Pool"
  type        = string
  default     = null
}

variable "vsphereDatastoreName" {
  description = "the Name of the vSphere Datastore"
  type        = string
}

variable "vsphereNetworkName" {
  description = "the Name of the vSphere Network"
  type        = string
}

variable "vsphereFolderName" {
  description = "The Folder name to store the VM in"
  type        = string
  default     = null
}

variable "vmHostName" {
  description = "Name of the VM as it appears in the VM."
  type        = string
  default     = null
}

variable "vmHostDomain" {
  description = "Name of the Host's Domain as it appears in the VM."
  type        = string
  default     = null
}

variable "vmCPUs" {
  description = "The number of Virtual CPUs for the VM"
  type        = number
  default     = 1
}

variable "vmRAM" {
  description = "The amout of RAM expresed in megabytes for the VM"
  type        = number
  default     = 1024
}

variable "vmMacAddress" {
  description = "Assign a Static Mac Address here"
  type        = string
  default     = null
}

variable "vmRole" {
  description = "Tag value for Custom Attribute Role"
  type        = string
  default     = null
}

variable "vmDiskSize" {
  description = "The amout of Disk expresed in gigabytes for the VM"
  type        = number
  default     = 16
}

