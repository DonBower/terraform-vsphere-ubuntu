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
