Feature: Verify VM creation with Terraform in vSphere 7

#     Then the VM should be based on the template "rhel-8.8-latest"

  Scenario: Check if a VM is created from the template "rhel-8.8-latest" with specific disk requirements
     Given I connect to my vSphere vCenter host
     When I retrieve details of the VM created by Terraform
     Then the VM should have two disks
     And the first disk should be no larger than 64GB
