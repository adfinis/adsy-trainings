% Ansible Basics
% Michael Hofer
% October 27, 2016

# Ansible - Basics

Simple config management and orchestration

```YAML
- name: teach ansible basics
  template:
    src: good_ideas.j2
    dest: customers
    state: present
```

![](static/ansible_red_icon.png)

---

## Agenda

* Config management vs. orchestration

* Introduction to Ansible

* Basic components

* Modules overview

---

## Config management vs. orchestration

## Config management

  > "Define how a system should look like in an abstract way."

* Ensure Apache and MariaDB is installed

* Ensure file /etc/motd contains line XYZ

## Orchestration

  > "Run a set of tasks on a set of servers at once."

* Update and restart exactly 49% of a clustered service to ensure the quorum

* Patch all systems which are vulnerable to the Dirty COW bug

## Goals

* Reproducibility is key

* Consistency

* Save time in the long run*

![](static/xkcd.png)

---

## Introduction to Ansible

What's it all about?

## Facts

* Project started in 2012

* Licensed under the GPLv3

* Acquired by Red Hat in October 2015

* Development pushed by Red Hat and community is growing fast

## Ecosystem

* Ansible

* Ansible Tower

* Ansible Container (the new face in town)

* Ansible Galaxy

## Design

* Agentless

* YAML based configuration via SSH

* Written in Python

* Template rendering with Jinja2

## Strong suite

* Simplicity is key

* Easy as pie

* Zero configuration (almost)

* Works via SSH

## Strong suite

* Idempotence

* Small footprint

## Weak spots

* Does not scale as well as other cfg mgmt tools

* Certain complex tasks turn ugly

## Weak spots

* No Ansible Tower upstream project yet (see [ansible.com/open-tower](http://ansible.com/open-tower))

* Ansible Galaxy (proceed with caution!)

* Contributions are somewhat slowly processed 

---

## Ansible components

Basic terminology you need to know

## Tasks

Tasks are single steps executed against a machine:

* Install nginx

```YAML
- name: install nginx
  package:
    name=nginx
    state=present
```

* Start nginx

```YAML
- name: start nginx service
  service:
    name=nginx
    state=started
```

## Modules

Task blocks consist of specific modules for each use case:

* Install nginx > uses the `package` module:

```yaml
- name: install nginx
  **package**:
    name=nginx
    state=present
```

Each module exposes different options that can be customized.

## Modules

Many different modules in several categories are available, e.g.:

* File modules
* Database modules
* Network modules
* Cloud modules

Have a look at the [Ansible Module Index](http://docs.ansible.com/ansible/modules_by_category.html)!

## Inventory

## Roles

## Handlers

## Playbooks
