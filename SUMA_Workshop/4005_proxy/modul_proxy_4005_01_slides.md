% SUSE Manager 3 Proxy
% Marc Stulz
% November 10, 2016

# SUSE Manager 3 - Proxy

![](static/suma.png)

---

## Agenda

* Overview

* Components

* Archidecture

* Requirements

* Installation

* Configuration

* Register clients with the proxy

---

## Overview

* SUSE Manager add-on

* Available as pattern

* The client registers with the Proxy

* The Proxy is registered as a client with the SUMA

## Components

* Apache Web Server

* Squid Proxy Server

* SaltStack Brocker

* Brocker for Tranditional Clients

## Archidecture I

![](static/arch_1.png)

## Archidecture II

![](static/arch_2.png)

## Requirements

* Hardware

* SLES12 SP1

* File System for `/var/cache/squid`

* Firewall Rules

---

## Installation

* Acivation key with SUMA Proxy child channels

* Register the proxy

* Install the pattern

## Configuration

* Run `configure-proxy.sh`

* Copy the CA certs

* TFTP and Cobbler sync

---

## Register Clients

* Tranditional Client

* Salt Minion

---

## Hands-on :: Proxy 05

