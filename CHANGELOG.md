# Release History

## 1.4.1

> Release Date: 2023-10-22

:bug: **BugFix**:

- Fix static IP to persist over reboots
- Add Ansible to post provision

:sweat_drops: **Chore**:

- Bump actions/checkout from 4.0.0 to 4.1.1

## 1.4.0

> Release Date: 2023-10-09

:tada: **Enhancement**:

- Allow for static IP
- Additional Outputs: `thisFQDN`, `thisMAC`, `thisTemplateName`

:sweat_drops: **Chore**:

- Refactor code to determine the template being used.

:clock4: **Announcement**:

- Output `thisTemplate` will be dropped in a future release

## 1.3.0

> Release Date: 2023-10-08

:tada: **Enhancement**:

- Allow main disk size to be overridden.

:sweat_drops: **Chore**:

- resize badges to be uniform in size.

## 1.2.2

> Release Date: 2023-10-07

:bug: **Bugfix**:

- Correct Built on Annotation (and fix super-linter)

## 1.2.1

> Release Date: 2023-10-07

:bug: **Bugfix**:

- Correct Orginal Disk Assignment to use template values

:sweat_drops: **Chore**:

- Add some VM Notes (annotation).

## 1.2.0

> Release Date: 2023-09-30

:tada: **Enhancement**:

- Add additional disks feature.

:sweat_drops: **Chore**:

- move BDD GitHub Action out of play.

## 1.1.1

> Release Date: 2023-09-12

:bug: **Bugfix**:

- Correct the Resource Pool Assignement when null

:tada: **Enhancement**:

- Add Custom Attributes 'Role' and 'Template' (Role is a new variable)
- Add Manual BDD Testing.


## 1.1.0

> Release Date: 2023-09-09

:bug: **Bugfix**:

- Correct the Resource Pool Assignement

:tada: **Enhancement**:

- Add Additional outputs, `thisResourcePoolId` and `thisDatastore`

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
