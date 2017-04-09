% SUSE Manager 3 Patch Management
% Marc Stulz
% November 14, 2016

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# SUSE Manager 3 - Patch Management

![](static/suma.png)

---

## Agenda

* Patch Day

* Emergency Patches

---

## Patch Day

The common workflow is to merge one channel with an other one. So you have to merge the vendor channels with your test channels, to upgrade the software packages on your SLES test systems.

If all tests on your SLES test systems passed successfully, you can go ahead and merge the test channels with the production channel, and upgrade your SLES production systems.

## Patch Day - Development

```text
# spacewalk-manage-channel-lifecycle -u admin -p "$pw" \
                                     -w adsy-sles12-sp1 \
                                     --channel sles12-sp1-pool-x86_64 \
                                     --promote

INFO: Merging packages from sles12-sp1-pool-x86_64 into devl-sles12-sp1-pool-x86_64
INFO: Added 0 packages
INFO: Merging errata into devl-sles12-sp1-pool-x86_64
INFO: Added 0 errata

INFO: Merging packages from sle-manager-tools12-pool-x86_64-sp1 into devl-sle-manager-tools12-pool-x86_64-sp1
INFO: Added 0 packages
INFO: Merging errata into devl-sle-manager-tools12-pool-x86_64-sp1
INFO: Added 0 errata

INFO: Merging packages from sle-manager-tools12-updates-x86_64-sp1 into devl-sle-manager-tools12-updates-x86_64-sp1
INFO: Added 0 packages
INFO: Merging errata into devl-sle-manager-tools12-updates-x86_64-sp1
INFO: Added 0 errata

INFO: Merging packages from sles12-sp1-updates-x86_64 into devl-sles12-sp1-updates-x86_64
INFO: Added 22 packages
INFO: Merging errata into devl-sles12-sp1-updates-x86_64
INFO: Added 7 errata

INFO: Merging packages from suse-manager-proxy-3.0-pool-x86_64 into devl-suse-manager-proxy-3.0-pool-x86_64
INFO: Added 0 packages
INFO: Merging errata into devl-suse-manager-proxy-3.0-pool-x86_64
INFO: Added 0 errata

INFO: Merging packages from suse-manager-proxy-3.0-updates-x86_64 into devl-suse-manager-proxy-3.0-updates-x86_64
INFO: Added 0 packages
INFO: Merging errata into devl-suse-manager-proxy-3.0-updates-x86_64
INFO: Added 0 errata
```

## Patch Day - Production

```text
# spacewalk-manage-channel-lifecycle -u admin -p "$pw" \
                                     -w adsy-sles12-sp1 \
                                     --channel devl-sles12-sp1-pool-x86_64 \
                                     --promote

INFO: Merging packages from devl-sles12-sp1-pool-x86_64 into prod-sles12-sp1-pool-x86_64
INFO: Added 0 packages
INFO: Merging errata into prod-sles12-sp1-pool-x86_64
INFO: Added 0 errata

INFO: Merging packages from devl-sle-manager-tools12-pool-x86_64-sp1 into prod-sle-manager-tools12-pool-x86_64-sp1
INFO: Added 0 packages
INFO: Merging errata into prod-sle-manager-tools12-pool-x86_64-sp1
INFO: Added 0 errata

INFO: Merging packages from devl-sle-manager-tools12-updates-x86_64-sp1 into prod-sle-manager-tools12-updates-x86_64-sp1
INFO: Added 0 packages
INFO: Merging errata into prod-sle-manager-tools12-updates-x86_64-sp1
INFO: Added 0 errata

INFO: Merging packages from devl-sles12-sp1-updates-x86_64 into prod-sles12-sp1-updates-x86_64
INFO: Added 24 packages
INFO: Merging errata into prod-sles12-sp1-updates-x86_64
INFO: Added 8 errata

INFO: Merging packages from devl-suse-manager-proxy-3.0-pool-x86_64 into prod-suse-manager-proxy-3.0-pool-x86_64
INFO: Added 0 packages
INFO: Merging errata into prod-suse-manager-proxy-3.0-pool-x86_64
INFO: Added 0 errata

INFO: Merging packages from devl-suse-manager-proxy-3.0-updates-x86_64 into prod-suse-manager-proxy-3.0-updates-x86_64
INFO: Added 0 packages
INFO: Merging errata into prod-suse-manager-proxy-3.0-updates-x86_64
INFO: Added 0 errata
```

## Emergency Patches

If you’re unable to merge complete channels or if you just want to push an explicit patch to your SLES test and production systems.

---

## Hands-on :: Patch Management 08

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
