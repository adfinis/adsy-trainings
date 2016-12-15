% SUSE Manager 3 Channel Management
% Marc Stulz
% November 10, 2016

# SUSE Manager 3 - Channel Management

![](static/suma.png)

---

## Agenda

* Channels

* Lifecycle Management

* Activation Keys
	
---

## Channels

* Channels are RPM repositories releated to products, add-ons or modules. 

* SUSE products contains a pool and an update channels

    * Pool channels do not change

    * Update channels can change

## Channel Types

* Vendor Channels

* Base Channels

* Child Channels

* Cloned Channles

* Custom Channels

## Channel Rules

* A channel points to a repository

* A channel can contain multiple repositories 

* A system can subscribe to only one base channel

* A base channel can have zero or more child channels

## Channel Rules

* A system can optionally subscribe to zero or more child channels

* A child channel can only be linked to one base channel

* A base channel can not become a child channel

* Clients obtain access to repositories through a channel assignment

---

## Lifecycle Environment

![](static/lifecycle.png)

## Activation Keys

* Is a token that can optionally be used by a system when it registers with a SUSE Manager server

* It can assign a base channel to a system 

* It can assign optional child channels to a system

* It can apply salt states to a system

---

## Hands-on :: Channel Managemant 03

