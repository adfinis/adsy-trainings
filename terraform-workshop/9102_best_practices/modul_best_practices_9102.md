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

## Use modules
```bash
.
├── env
│   ├── dev
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   └── prod
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
├── modules
│   ├── webapp
│   │   ├── db.tf
│   │   ├── dns.tf
│   │   ├── instances.tf
│   │   ├── main.tf
│   │   ├── network.tf
│   │   ├── output.tf
│   │   ├── security_groups.tf
│   │   └── variables.tf
│   └── cluster
│       ├── dns.tf
│       ├── aks.tf
│       ├── main.tf
│       ├── network.tf
│       ├── output.tf
│       ├── security_groups.tf
│       └── variables.tf
├── outputs.tf
└── variables.tf
```

# Attribution / License

* Slide Skeleton https://de.wikipedia.org/wiki/Skeleton_(Programmierung)

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
