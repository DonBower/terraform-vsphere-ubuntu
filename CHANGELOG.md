# Release History

## 1.1.0

> Release Date: 2023-09-09

:bug: **Bug Fix**:

- Correct the Resource Pool Assignement

:tada: **Enhancement**:

- Add Additional outputs, **resource pool id** and **datastore name**

:sweat_drops: **Chore**:

- Change the Local Variables `local.thisVM.vmResourcePool` and `local.thisVM.vmDatastore` to add `Id` at the end to better reflect the value.


## 1.0.0

> Release Date: 2023-09-07

:boom: **Breaking**:

- Pass the provider so the module can be used with for_each

:tada: **Enhancement**:

- Fix Terraform Badge (Version)
- Add vSphere Badge (Version)

## 0.1.2

> Release Date: 2023-08-16

:tada: **Enhancement**:

- Add Linter Badge (code quality)
- Reduce boot disk size

## 0.1.1

> Release Date: 2023-08-15

:tada: **Enhancement**:

- Clean up terraform code close issue #1
Just ran terraform fmt aginst all the `./terraform/*/*.tf` files

:sweat_drops: **Chore**:

- Updates Remove extra code, clean up.
- Discover more GitHub actions

## 0.1.0

> Release Date: 2023-08-15

:tada: **Enhancement**:

- Initial Release

:sweat_drops: **Chore**:

- Updates Remove extra code, clean up.
