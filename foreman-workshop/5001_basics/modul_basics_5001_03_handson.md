% Ansible Basics
% Michael Hofer
% October 27, 2016

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Ansible Hands-on

Learning by doing

![](static/ansible_blue_icon.png)

---

## Hands-on :: Basics 01

Install Ansible and take the first steps

---

## Basics 01 - Installation

Install Ansible on your machine:

* RHEL & CentOS (requires EPEL)

```bash
$ sudo yum install ansible
```

* Debain & Ubuntu

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
$ ansible test -i inventory.txt -u root -m command -a "ls -l /"
```

---

## Hands-on :: Basics 02

Create some tasks and the first playbook

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
        name: nginx
        state: present

    - name: start nginx service
      service:
        name: nginx
        state: started
```

## Basics 02 - Playbooks

Run the playbook against your test node:

```bash
$ ansible-playbook webserver.yml -i inventory.txt -u root
```

Was it successful? Check if the webserver is running in your browser!

## Basics 02 - Playbooks

Get debugging output by adding the verbose flag(s):

```bash
$ ansible-playbook webserver.yml -i inventory.txt -u root -v
```

Add more -v parameters to get even more output

## Basics 02 - Roles

Create a new role called "nginx":

```bash
$ mkdir -p roles/nginx/tasks
```

Add the previous tasks to the tasks file roles/nginx/tasks/main.yml:

```yml
---
- name: install nginx
  package:
    name: nginx
    state: present

- name: start nginx service
  service:
    name: nginx
    state: started

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

---

## Hands-on :: Basics 03

Make your playbook more dynamic with variables

---

## Basics 03 - Variables

Create a host\_vars and group\_vars directory in your working dir:

```bash
$ mkdir host_vars group_vars
```

Your directory now should look like this:

```bash
ansible_workshop
|-- group_vars
|-- host_vars
|-- inventory.txt
|-- roles
|-- webserver.yml
```

## Basics 03 - Common role

Create an additional role called "common" including the following directories:

```bash
common
|-- defaults
|-- tasks
|-- vars
```

## Basics 03 - Common role

Add the defaults vars listed below:

```yml
---
common_packages:
  - ntp
  - iptables
```

## Basics 03 - Common role

The new role should take care of installing several packages:

```yaml
---
- name: install common packages
  package:
    name: "{{ item }}"
    state: present
  with_items: "{{ common_packages }}"
```

## Basics 03 - Testing

Include the new role into your playbook and give it a spin:

* What happens?

* What packages were installed?

## Basics 03 - group\_vars

Create the file group\_vars/test with the following variables:

```yaml
---
common_packages:
  - ntp
  - iptables
  - vim
  - zsh
```

## Basics 03 - Testing

Execute the playbook a second time:

* Are there any changes?

* If yes, why?

## Basics 03 - Role vars

Create the file roles/common/vars/main.yml with the following variables:

```yaml
---
common_packages:
  - ntp
  - iptables
  - vim
  - zsh
  - tcpdump
  - wget
  - curl
  - rsync
```

## Basics 03 - Testing

Execute the playbook a third time:

* Wait, what happened now?

* Please explain to me!

---

## Hands-on :: Basics 04

Generate files dynamically with templates

---

## Basics 04 - Preparation

Add the missing directories in our nginx role:

* defaults
* handlers
* templates
* vars

## Basics 04 - Defaults

Add the following variable to the defaults vars:

```yaml
---
nginx_welcome_messages:
  - "Ansible is cool!"
  - "It even gets better!"
  - "My first loop!"
```

## Basics 04 - Template

Create the new template called `index.html.j2`:

```python
{% for message in nginx_welcome_messages %}
<p>{{ message }}</p>
{% endfor %}
```

## Basics 04 - Tasks

Which module do we need to render the template and copy it to /usr/share/nginx/www?

* Add a new task which renders the template

* Create a backup of the old index.html file

## Basics 04 - Testing

Execute your modified playbook to deploy the new website:

* Did it work?

* Which messages are displayed?

## Basics 04 - Handlers

Imagine this is a more complex web application:

* Restart the nginx service if the index.html file changed

## Basics 04 - Testing

Deploy the website again:

* Did it work?

* Was the nginx service restarted?

---

## Good work!

You've completed this part of the workshop!

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
