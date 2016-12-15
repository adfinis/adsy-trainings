% SUSE Manager Proxy
% Marc Stulz
% November 10, 2016

# SUSE Manager 3 Hands-on

![](static/suma.png)

---

## Hands-on :: Proxy 05

Install the SUMA Proxy and register clients.

---

## Proxy 05 - Datadisks

Create the data disk and put a file system on the device:

```text
# pvcreate /dev/vdb

# vgcreate vg_data /dev/vdb

# lvcreate -l100%FREE -n lv_squid_cache vg_data

# mkfs.xfs /dev/mapper/vg_data-lv_squid_cache
```

## Proxy 05 - Mount Datadisk

Add the new devie to the `/etc/fstab`:

```text
UUID=2b769250-6dcf-4b5b-b84b-f25df40ca871 /var/cache/squid xfs defaults 0 2
```

Create the mountpoint and mount the new device:

```text
# mkdir /var/cache/squid

# mount -a
```

## Proxy 05 - Activation Key

Create an activation key for the proxy systems:

```text
# spacecmd activationkey_create
INFO: Connected to https://localhost/rpc/api as admin
Name (blank to autogenerate): ak-sles12sp1-prod-proxy
Description [None]: Activation Key for SUMA Proxies

Base Channels
-------------
archive-20161110-prod-sles12-sp1-pool-x86_64
devl-sles12-sp1-pool-x86_64
prod-sles12-sp1-pool-x86_64
sles12-sp1-pool-x86_64

Base Channel (blank for default): prod-sles12-sp1-pool-x86_64

virtualization_host Entitlement [y/N]: 

Universal Default [y/N]: 
INFO: Created activation key 1-ak-sles12sp1-prod-proxy
```

## Proxy 05 - Activation Key

Add the child channels the to proxy activation key:

```text
# spacecmd activationkey_addchildchannels \
           1-ak-sles12sp1-prod-proxy \
           prod-sles12-sp1-updates-x86_64 \
           prod-sle-manager-tools12-pool-x86_64-sp1 \
           prod-sle-manager-tools12-updates-x86_64-sp1 \
           prod-suse-manager-proxy-3.0-pool-x86_64 \
           prod-suse-manager-proxy-3.0-updates-x86_64
```

## Proxy 05 - Activation Key

Add the required packages to the acvivation key:

```text
# spacecmd activationkey_addpackages \
           1-ak-sles12sp1-prod-proxy \
           rhncfg-actions \
           osad \
           rhncfg-client \
           rhncfg-management 
```

## Proxy 05 - Bootstrap Script

Create a new bootstrap script:

```text
# cd /srv/www/htdocs/pub/bootstrap/
# cp bootstrap{,-proxy}.sh 
```

Modify the bootstrap script:

```text
[...]
#exit 1

# can be edited, but probably correct (unless created during initial install):
# NOTE: ACTIVATION_KEYS *must* be used to bootstrap a client machine.
ACTIVATION_KEYS=1-ak-sles12sp1-prod-proxy
```

## Proxy 05 - Registration

Register the proxy system:

```text
# cd /srv/www/htdocs/pub/bootstrap/

# cat bootstrap-proxy.sh | ssh root@proxy"$NR".net"$NR".lab /bin/bash
```
---

## Proxy 05 - Installation

Verify if the proxy pattern is available and install it:

```text
# zypper search -t pattern suma_proxy

# zypper info -t pattern suma_proxy

# zypper install -t pattern suma_proxy
```

## Proxy 05 - Configuration

Run `configure-proxy.sh` to install the required packages:

```text
# configure-proxy.sh
```

Copy the CA files from the SUMA:

```text
# scp "root@suma"$NR".net"$NR".lab:/root/ssl-build/{RHN-ORG-PRIVATE-SSL-KEY,RHN-ORG-TRUSTED-SSL-CERT,rhn-ca-openssl.cnf}" \
/root/ssl-build
```
Run `configure-proxy.sh` again:

```text
# configure-proxy.sh
```

---

## Proxy 05 - Client Registration Salt

Add the SUMA tools repository and install the minion package:

```text
# zypper addrepo \
         http://proxy"$NR".net"$NR".lab/pub/repositories/sle/12/1/bootstrap/ \
         SUMA3-Tools

# zypper -n install salt-minion
```
## Proxy 05 - Client Registration Salt

Configure the minion and do a restart:

```text
# echo "master: proxy"$NR".net"$NR".lab" > /etc/salt/minion.d/master.conf

# echo -e "susemanager:\n  activation_key: 1-ak-sles12sp1-devl-salt" > /etc/salt/grains

# systemctl restart salt-minion
```

## Proxy 05 - Client Registration Salt

Accept the new minion on the SUMA:

```text
# salt-key -L

# salt-key -A
```

## Proxy 05 - Client Registration RHN

Create a bootstrap script on the proxy:
```text
# mgr-bootstrap --activation-keys=1-ak-sles12sp1-prod-trad
```

Register the new client (pull):

```text
# curl http://proxy"$NR".net"$NR".lab/pub/bootstrap/bootstrap.sh | bash
```

