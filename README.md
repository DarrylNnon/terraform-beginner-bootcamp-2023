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
