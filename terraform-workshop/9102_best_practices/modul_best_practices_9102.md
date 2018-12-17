% title: Terraform best practices

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

---

Write, Plan, and Create Infrastructure as Code

![](static/terraform_logo.svg)

---

## Agenda
* Repository
* Modules
* Secrets
* State

---

## Repository
Split your files!

## Bad idea
```bash
.
├── main.tf
├── infrastructure.tfvars
├── outputs.tf
└── variables.tf
```
...and main.tf is over 2000 lines...

## Better approach
```bash
.
├── main.tf
├── network.tf
├── vms.tf
├── dns.tf
├── security_groups.tf
├── network.tf
├── env-dev.tfvars
├── env-int.tfvars
├── env-prod.tfvars
├── outputs.tf
└── variables.tf
```
Better, but not much reusability

## Use modules, workspaces and other fancy things
```bash
.
├── env
│   └── production
│       ├── main.tf
│       ├── output.tf
│       ├── production.tfvars
│       └── variables.tf
├── modules
│   ├── webapp
│   │   ├── main.tf
│   │   └── variables.tf
│   └── cluster
│       ├── main.tf
│       ├── security_groups.tf
│       └── variables.tf
└── variables.tf
```

---

## Workspaces
Each Terraform configuration has an associated backend that defines how operations are executed and where persistent data such as the Terraform state are stored.

The persistent data stored in the backend belongs to a workspace.

## Use workspaces
```bash
terraform workspace new production
terraform workspace new development
terraform workspace select development
terraform workspace list
```

## How to use it

The current workspace can be accessed with `${terraform.workspace}`

## How to use it

Variables should be restructured:
```hcl
variable "token" {
  type = "map"
  default = {
    production  = "abcd1234"
    development = "1234abcd"
  }
}
```

## How to use it

...and can be accessed with
```hcl
provider "github" {
  token = "${lookup(var.token, terraform_workspace)}"
}
```

---

## Modules
Modules in Terraform are self-contained packages of Terraform configurations that are managed as a group. Modules are used to create reusable components in Terraform as well as for basic code organization.

<small><https://www.terraform.io/docs/modules/index.html></small>



---

## Secrets


---

## State


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
