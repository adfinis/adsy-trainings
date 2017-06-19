% Foreman Basics
% Andrea Bettich & Michael Hofer
% June 12, 2017

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Foreman Hands-on

Learning by doing

![](static/foreman_icon.png)

---

## Hands-on :: Basics 01

Discover the basics of Foreman

---

## Basics 01 - Web interface

Log into Foreman and get familiar with the web interface.

## Basics 01 - Web interface

* Which Foreman version are you using?

* Which Foreman plugins are installed?

* How many hosts are available?

* How many of them are still in the build mode?

## Basics 01 - Web interface

* What are bookmarks?

* What are trends?

* What's the most deployed OS?

* Who added the last host?

## Basics 01 - Web interface

* Which services is the smart proxy providing?

* Does a domain support parameters?

* Does a subnet support parameters?

---

## Hands-on :: Basics 02

Automating OS deployments is hard you've said?                                  

---

## Basics 02 - Architecture

Create two new architectures `x86_64` & `i386`

## Basics 02 - Installation media

Add a new mirror with the following parameters:
```
Name: My CentOS Mirror
URL:  http://mirror.centos.org/centos/$version/os/$arch
```

## Basics 02 - OS

Now lets add a new OS:

```
Name:         CentOS
Major:        7
Minor:        (empty)
Description:  My CentOS 7
Family:       Red Hat
Hash:         SHA512
Architecture: x86_64 & i386

Installation media: My CentOS Mirror
```

And press submit. Was it succesful?

## Basics 02 - Templates

* Create a new provisioning template called "My CentOS Kickstart"

* Get the content from an existing or vanilla template

* Associate it to the OS created previously

What's the idea of this template?

## Basics 02 - Templates

* Create a new provisioning template called "My CentOS Finish"

* Get the content from an existing or vanilla template

* Associate it to the OS created previously

What's the idea of this template?

## Basics 02 - Templates

* Create a new partition table called "My CentOS Table"

* Get the content from an existing or vanilla template

* Associate it to the OS created previously

What's the idea of this template?

---

## Hands-on :: Basics 03

Looking into the Ansible integration                                            

---

## Basics 03 - Ansible

Where can you see the available roles?

## Basics 03 - Ansible

How can you trigger them?

## Basics 03 - Ansible

What could be a possible limitation regarding hostname & IP?

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
