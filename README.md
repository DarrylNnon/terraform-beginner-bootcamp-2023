# Terraform Beginner Bootcamp 2023

## Semantic versioning :mage:

This project is going to utilize semantic versioning for it tagging.
[semver.org](https://semver.org/)
Given a version number MAJOR.MINOR.PATCH, increment the:

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes
- **Additional** labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

```i had to use git cobase becuase my credit was done on gitpod
the challenge was solve in git cobase instead of gitpod
 the next 2 weeks , i will be using git cobase.
```
- **Install terrform**: i had to install Terraform
# How to check shells version

```sh
cat /etc/shells
cat /etc/os-release
`#!/usr/bin/env bash for portability (Recommanded by chatgpt)`
```

## linux permission
```sh
chmod u+x ./bin/install_terraform_cli
```
```sh
or we can do chmod 777 ./bin/install_terraform_cli
```

### Working with Env vars

### env command 

We can list  out all Environment  Variables (Env Vars) using `env` command

We can filter specific env vars using  grep eg. `env | grep AWS_`

### Setting and Unsetting Env Vars

In the terminal  we can  using `export HELLO='world`

In the terminal  we unset `unset HELLO`

We can set an env var temporarily when just running a command

```sh
HELLO='world' ./bin/print_message
```

Within a bash scrpt we can set an env var without writing export eg.

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

#### Printing env Vars

We can print an env var using echo eg. `echo $HELLO`

#### Scoping of Env vars

When you open up a new bash terminal in VScode it will not be aware of env vars that i have set in another window.

If i want to env  vars to persist accross all future bash terminals that are open i need to set env vars in my bash profile. eg. `.bash_profile`

#### Persisting Env vars in Gitpod 

We can persit env vars into gitpod by storing them in gitpod secrets storage

```
gp env HELLO='world'
```

All future workspaces launched will set the env vars for all bash terminals opend in those workspaces.

```sh
gp env PROJECT_ROOT='/workspace/terraform-beginner-2023'
echo $PROJECT_ROOT
```


### AWS CLI installation

AWS CLI is install for this project via bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

We can check if it work properly by running this command

`aws sts get-caller-identity`

## Terraform Basics

[terraform-random](https://registry.terraform.io/providers/hashicorp/random/)

### Terraform registry
Terraform sources their provider and modules from the terraform registry which is located at [registry.terraform.io](https://registry.terraform.io/)
    
    
- **Providers** are plugin use to interact with api cloud platform
- **Module** are way to make large amount of terraform code modular, portable and sharable.

### Terraform console

We can see a list of all the terraform commands by simply typing `terraform`

#### Terraform Init

At the start of a new terraform project we will run `terraform init` to download the binaries for the terraform provider.

#### Terraform Plan

`terraform plan`
Will generate out a changeset, about the state of our infrastructure and what will be changed.

We can output this changeset ie."plan" to be passed to an apply, but often i can ignore outputing.

#### Terraform apply

`terraform apply`
This run a plan and pass the changeset to be executed by terraform. Apply should prompt out yes or no.

If we want to automatically approve an apply we can provide the auto approve flag eg. `terraform apply --auto-approve`

#####  Terraform lock files

`.terraform.lock.hcl` contains the locked versioning for the providers or modulues that should be used with this project.

The terraform lock fle **should be commited** to my version control system (vsc) eg. Github

#### Terraform State files

`.terraform.tfstate` contain information about the current state of my infrastructure.

This file **should not be commited** to my version system vsc

This  file can contain sensitive data.

If i lose this file, i lose knowing the state of my infrastructure.

`.terraform.tfstate.backup` is the previous state file state

##### Terraform Directory

`.terraform` directory contains binaries of terraform providers.


####   Terraform destroy

`terraform destroy`
This will destroy resources.

I can also use the auto aprove flag to skip prompt
eg. `terraform apply --auto-approve`

##### Issues with  terraform login 

when attempting to run `terraform login`. it will launch a wiswig bash. It doesn't work as expected.

The work around is manually generate a token in terraform cloud

```
https:app.terraform.io/app/settings/token?source=terraform-login
```

Then create the file manually:

```sh
touch /home/codespace/terraform.d/credentials.tfrc.json
open  /home/codespace/terraform.d/credentials.tfrc.json
```

Then provide the following code (replace my token in the file):


```json
{
    "credentials": {
        "app.terraform.io": {
            "token": "MY-TERRAFORM-CLOUD-TOKEN"
        }
    }
}
```