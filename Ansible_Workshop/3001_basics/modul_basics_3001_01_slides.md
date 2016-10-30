% Ansible Basics
% Michael Hofer
% October 27, 2016

# Ansible - Basics

Simple config management and orchestration

```yaml
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

* Variable handling

---

## Config management vs. orchestration

Learn the difference

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

* Written in Python 2

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

* Does not scale as well as other tools

* Certain complex tasks turn ugly

## Weak spots

* No Ansible Tower upstream project yet (see [ansible.com/open-tower](http://ansible.com/open-tower))

* Ansible Galaxy (proceed with caution!)

* Contributions are somewhat slowly processed 

---

## Ansible components

Basic terminology you need to know

## Modules

Modules are used to interact with nodes and manage different resources:

* ping
* command
* copy / synchronize
* lineinfile
* package
* mysql_user / mysql_db

Have a look at the [Ansible Module Index](http://docs.ansible.com/ansible/modules_by_category.html)!

## Modules

Modules can be executed ad-hoc:

```bash
$ ansible all -i inventory.txt -u root -m ping
$ ansible all -i inventory.txt -u root -m command -a "df -h"
```

Each module exposes different options that can be customized

## Inventory

An inventory contains all the target nodes and structures them into groups:

```ini
[adfinis:children]
bern
basel

[bern:children]
database

[basel:children]
web

[database]
db[01:03].adfinis-sygroup.ch ansible_user=db_admin

[web]
web[01:03].adfinis-sygroup.ch ansible_user=web_admin
```

---

## Hands-on :: Basics 01

Install Ansible and take the first steps

---

## Ansible components 2

Further down the rabbit hole

## Tasks

* Tasks are Ansible commands which call a module

* Written in a YAML file

* Executed from top to bottom

```yaml
- name: install nginx
  package:
    name=nginx
    state=present

- name: start nginx service
  service:
    name=nginx
    state=started
```

## Handlers

* Handlers are basically tasks but notified by other tasks

* Executed only when necessary

```yaml
- name: restart nginx
  service:
    name=nginx
    state=restarted
```

## Playbooks

Group tasks and handlers together in a playbook and make them reusable

```yaml
---
- hosts: web
  tasks:
    - name: template nginx.conf
      template:
        src=nginx.conf.j2
        dest=/etc/nginx/conf.d
      notify:
        - restart nginx
  handlers:
    - name: restart nginx
      service:
        name=nginx
        state=restarted
```

## Playbooks

Execute the playbook:

    $ ansible-playbook webserver.yml -i inventory.txt -u root

## Roles

Divide and structure a playbook into different roles:

* Each role is responsible for a certain component

* Reuse the same roles in many different projects (playbooks)

```yaml
---
- hosts: web
  roles:
    - common
    - webserver
    - monitoring
```

## Roles

A role has a specific directory structure:

```console
ansible
|-- webserver.yml
|-- roles
    |-- nginx
        |-- defaults
        |-- handlers
        |-- tasks
        |-- templates
        |-- vars
        |-- meta
```

## Facts

Node specific information stored in variables:

* Hardware resources

* Network configuration

* Operating system

* and much much more

## Facts

Use the `setup` module to gather and display facts:

```bash
$ ansible all -i inventory.txt -u root -m setup
```

```yaml
"ansible_facts": {
    "ansible_all_ipv4_addresses": [
        "192.168.122.10"
    ], 
    "ansible_all_ipv6_addresses": [
        "fe80::5054:ff:fe5c:593"
    ], 
    "ansible_architecture": "x86_64", 
    "ansible_bios_date": "04/01/2014", 
    "ansible_bios_version": "1.9.3-20160701_074356-anatol", 
[...]
```

---

## Hands-on :: Basics 02

Create some tasks and the first playbook

---

## Variable handling

Where to store variables and what you need to know about precedence

## Locations

## Variable precedence


