terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = ">= 2.4.1"
    }
  }
}

provider "vsphere" {
  # The following arguments are used to configure the provider:
  # user - (Required) This is the username for vSphere API operations. Can also be specified with the VSPHERE_USER environment variable.
  # password - (Required) This is the password for vSphere API operations. Can also be specified with the VSPHERE_PASSWORD environment variable.
  # vsphere_server - (Required) This is the vCenter Server FQDN or IP Address for vSphere API operations. Can also be specified with the VSPHERE_SERVER environment variable.
  # allow_unverified_ssl - (Optional) Boolean that can be set to true to disable SSL certificate verification. This should be used with care as it could allow an attacker to intercept your authentication token. If omitted, default value is false. Can also be specified with the VSPHERE_ALLOW_UNVERIFIED_SSL environment variable.
  # vim_keep_alive - (Optional) Keep alive interval in minutes for the VIM session. Standard session timeout in vSphere is 30 minutes. This defaults to 10 minutes to ensure that operations that take a longer than 30 minutes without API interaction do not result in a session timeout. Can also be specified with the VSPHERE_VIM_KEEP_ALIVE environment variable.
  # api_timeout - (Optional) Sets the number of minutes to wait for operations to complete. The default timeout is 5 minutes.
  api_timeout = 5
}