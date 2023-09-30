import os

from behave import given, when, then
from pyVim.connect import SmartConnect  # , Disconnect
from pyVmomi import vim

username = os.environ.get("TF_VAR_vsphereUsername")
password = os.environ.get("TF_VAR_vspherePassword")
host = os.environ.get("TF_VAR_vsphereEndpoint")

if not username or not password or not host:
    raise ValueError(
        "Please set the TF_VAR_vsphereUsername, TF_VAR_vspherePassword and TF_VAR_vsphereEndpoint environment variables."
    )


# Create a connection to vSphere
@given("I connect to my vSphere vCenter host")
def step_connect_to_vsphere(context):
    context.si = SmartConnect(
        disableSslCertValidation=True, host=host, user=username, pwd=password
    )
    context.content = context.si.RetrieveContent()


@when("I retrieve details of the VM created by Terraform")
def step_retrieve_vm_details(context):
    container = context.content.viewManager.CreateContainerView(
        context.content.rootFolder, [vim.VirtualMachine], True
    )

    # Assuming VM naming convention or other properties to identify the correct VM
    for vm in container.view:
        if "test-ubuntu" in vm.name:
            context.vm = vm
            break


@then('the VM should be based on the template "{template_name}"')
def step_verify_template(context, template_name):
    # Accessing the template property of the VM to check its source
    assert (
        context.vm.config.template == template_name
    ), f"VM is not based on {template_name}, it's based on {context.vm.config.template}"


@then("the VM should have two disks")
def step_verify_disk_count(context):
    disk_count = sum(
        1
        for device in context.vm.config.hardware.device
        if isinstance(device, vim.vm.device.VirtualDisk)
    )
    assert disk_count == 2, f"VM has {disk_count} disks, expected 2"


@then("the first disk should be no larger than 64GB")
def step_verify_disk_size(context):
    for device in context.vm.config.hardware.device:
        if isinstance(device, vim.vm.device.VirtualDisk):
            assert (
                device.capacityInKB <= 64 * 1024 * 1024
            ), "First disk is larger than 64GB"
            break
