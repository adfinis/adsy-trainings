% SUSE Manager 3 Sync SMT
% Marc Stulz
% November 10, 2016

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# SUSE Manager 3 - SMT Synchronization

![](static/suma.png)

---

## Agenda

* Scenario

* Data Export > Import

* Configuration

* Add and Sync Channels

* Verify Synchronization

---

## Scenario

> If it is not possible to connect SUSE Manager directly or via a proxy to the Internet, a disconnected setup in combination with Subscription Management Tool (SMT) is the recommended solution.

[SUSE Documentation](https://www.suse.com/documentation/suse-manager-3/singlehtml/book_suma_best_practices/book_suma_best_practices.html#sub.mgr.tool)

## Data Export > Import

* Export data

* Import data

## Configuration

* Specify the local path on the SUSE Manager server in `/etc/rhn/rhn.conf`

## Add and Sync Channels

```text
mgr-sync add channel "$channel-label"
```

* Channels are RPM repositories like:
    * sles12-sp1-pool-x86_64
    * sles12-sp1-updates-x86_64
    * sle-ha12-sp1-pool-x86_64
    * sle-ha12-sp1-updates-x86_64
    * sle-module-containers12-pool-x86_64-sp1
    * sle-module-containers12-updates-x86_64-sp1

## Verify Synchronization

* Log files

* WebUI

* `spacecmd`

---

## Hands-on :: SMT Sync 02

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
