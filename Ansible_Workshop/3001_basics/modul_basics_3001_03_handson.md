% Ansible Basics
% Michael Hofer
% October 27, 2016

# Ansible Hands-on

Learning by doing

![](static/ansible_blue_icon.png)

---

## Hands-on :: Basics 01

Install Ansible and take the first steps

---

## Basics 01 - Installation

Install Ansible on your machine:

* RHEL / CentOS (requires EPEL)

```bash
$ sudo yum install ansible
```

* Debain / Ubuntu

```bash
$ sudo apt-get install ansible
```

## Basics 01 - Installation

Check if you have the latest Ansible version:

```bash
$ ansible --version
$ man ansible
```

## Basics 01 - Installation

Add your SSH public key to the authorized\_keys file on the target node:

```bash
$ ssh-copy-id root@192.168.122.10
```

## Basics 01 - Installation

Create a working directory for this workshop:

```bash
$ mkdir ~/ansible_workshop
$ cd ~/ansible_workshop
```

## Basics 01 - Inventory

Create the file inventory.txt containing your test node:

```ini
[test]
192.168.122.10
```

## Basics 01 - Ad-hoc commands

Execute your first ad-hoc commands:

```bash
$ ansible test -i inventory.txt -u root -m ping
$ ansible test -i inventory.txt -u root -m command -a "df -h"
$ ansible test -i inventory.txt -u root -m command -a "ls -l"
```

---

## Basics 02 - Facts

Explore the facts of your test node:

```bash
$ ansible test -i inventory.txt -u root -m setup
```

## Basics 02 - Playbooks

Create the file webserver.yml with the following content:

```yaml
---
- hosts: test
  tasks:
    - name: install nginx
      package:
        name=nginx
        state=present
    
    - name: start nginx service
      service:
        name=nginx
        state=started
```

## Basics 02 - Playbooks

Run the playbook against your test node:

```bash
$ ansible-playbook webserver.yml -i inventory.txt -u root
```

Was it successful? Check if the webserver is running in your browser!

## Basics 02 - Roles

Create a new role called "nginx":

```bash
$ mkdir -p roles/nginx/tasks
```

Move the tasks from the webserver.yml playbook into the following file:

```bash
$ vim roles/nginx/tasks/main.yml
```

## Basics 02 - Roles

Include the new nginx role in the webserver.yml playbook:

```yml
---
- hosts: test
  roles:
    - nginx
```

Execute the playbook again, what happens?
