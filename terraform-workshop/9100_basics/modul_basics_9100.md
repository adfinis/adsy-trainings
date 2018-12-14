% Terraform Basics
% Benjamin Stauffacher
% 2018-12-14

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

---

Write, Plan, and Create Infrastructure as Code

![](static/terraform_logo.svg)

---

## Agenda
* Introduction to Terraform
* Setup
* HCL
* My first Terraform
* Extended Script

---

## Introduction to Terraform
What is it?

## Facts
* First release: 2014-07-28
* Written by: HashiCorp
* Written in: Go

## Wikipedia says...
It allows users to define a datacenter infrastructure in a high-level configuration language, from which it can create an execution plan to build the infrastructure[...].

## it essentially is
Infrastructure as Code

---

## Setup
https://www.terraform.io/downloads.html

## Check
```bash
> terraform
Usage: terraform [-version] [-help] <command> [args]

The available commands for execution are listed below.
The most common, useful commands are shown first, followed by
less common or more advanced commands. If you're just getting
started with Terraform, stick with the common commands. For the
other commands, please read the help and docs before usage.

Common commands:
    apply              Builds or changes infrastructure
    console            Interactive console for Terraform interpolations
    destroy            Destroy Terraform-managed infrastructure
    env                Workspace management
    fmt                Rewrites config files to canonical format
    get                Download and install modules for the configuration
    graph              Create a visual graph of Terraform resources
    import             Import existing infrastructure into Terraform
    init               Initialize a Terraform working directory
    output             Read an output from a state file
    plan               Generate and show an execution plan
    providers          Prints a tree of the providers used in the configuration
    push               Upload this Terraform module to Atlas to run
    refresh            Update local state file against real resources
    show               Inspect Terraform state or plan
    taint              Manually mark a resource for recreation
    untaint            Manually unmark a resource as tainted
    validate           Validates the Terraform files
    version            Prints the Terraform version
    workspace          Workspace management

All other commands:
    debug              Debug output management (experimental)
    force-unlock       Manually unlock the terraform state
    state              Advanced state management
```

---

## HCL
HashiCorp configuration language
https://github.com/hashicorp/hcl

## HCL/JSON
```hcl
resource "azurerm_resource_group" "workshoptest-01" {
  name      = "rg-adsy-workshoptest-01"
  location  = "westeurope"
}
```

```json
{
  "resource": {
    "azurerm_resource_group": {
      "workshoptest-01": {
        "name": "rg-adsy-workshoptest-01",
        "location": "westeurope"
      }
    }
  }
}
```

---

## My first Terraform
https://github.com/adfinis-sygroup/

## main.tf
```hcl
resource "azurerm_resource_group" "main" {
  name     = "main"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "main" {
  name                = "main_network"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
}
```

## variables.tf
```hcl
variable "location" {
  default	= "West Europe"
}
```

## output.tf
```hcl
output "rgname" {
  description       = "The name of our resource group"
  value             = "${azurerm_resource_group.main.name}"
}
```

## Try it
```bash
> terraform init
> terraform plan
```

## Adapt it
https://www.terraform.io/docs/providers/index.html

---

# Attribution / License

* Slides
Adfinis SyGroup AG, 2017, Attribution-NonCommercial 2.0
(CC BY-NC 2.0)

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
