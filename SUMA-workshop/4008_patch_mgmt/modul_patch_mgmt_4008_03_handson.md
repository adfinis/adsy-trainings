% SUSE Manager Patch Management
% Marc Stulz
% November 17, 2016

# SUSE Manager 3 Hands-on

![](static/suma.png)

---

## Hands-on :: Patch Management 07

Import the new patches and apply the "parted"-patch to a system.

---

## Patch Management 07- Data directory

Configure the new repository data.

Stop the tomcat service:

```text
# systemctl stop tomcat
```

Change the data directory in `/etc/rhn/rhn.conf` to:

```text
# local data directory
server.susemanager.fromdir = /data/repos_wpatches_20161116
```

Start the tomcat service:

```text
# systemctl start tomcat
```

## Patch Management 07 - Synchronization

Refresh the channel and schedule a reposync:

```text
mgr-sync refresh
mgr-sync add channel sles12-sp1-updates-x86_64
```

Verify the synchronization:

```text
tailf /var/log/rhn/reposync/sles12-sp1-updates-x86_64.log
```

## Patch Management 07 - Vendor Channel

Check the SLES12 SP1 Updates vendor channel:

```text
# spacecmd softwarechannel_details sles12-sp1-updates-x86_64
INFO: Connected to https://localhost/rpc/api as admin
Label:              sles12-sp1-updates-x86_64
Name:               SLES12-SP1-Updates for x86_64
Architecture:       x86_64
Parent:             sles12-sp1-pool-x86_64
Systems Subscribed: 0
Number of Packages: 2164
[...]
```

## Patch Management 07- Development Channel

Check the SLES12 SP1 Updates development channel:

```text
# spacecmd softwarechannel_details devl-sles12-sp1-updates-x86_64               
INFO: Connected to https://localhost/rpc/api as admin
Label:              devl-sles12-sp1-updates-x86_64
Name:               devl-sles12-sp1-updates-x86_64
Architecture:       x86_64
Parent:             devl-sles12-sp1-pool-x86_64
Systems Subscribed: 1
Number of Packages: 2140
[...]
```

## Patch Management 07 - Vendor Channel

List the patches from the vendor channel:

![](static/webui_02_devl_channel.png)

## Patch Management 07 - Development Channel

List the patches from the development channel:

![](static/webui_01_vendor_channel.png)

## Patch Management 07 - Channel Diff

Comapre the updates channels:

```text
# spacecmd softwarechannel_errata_diff \
           sles12-sp1-updates-x86_64 \
           devl-sles12-sp1-updates-x86_64 \
           | grep par
INFO: Connected to https://localhost/rpc/api as admin 
-SUSE-12-SP1-2016-1310 Recommended update for apparmor 
-SUSE-12-SP1-2016-1655 Recommended update for parted 
+CL-SUSE-12-SP1-2016-1310 Recommended update for apparmor 
```

---

## Patch Management 07 - Clone Patches

Select the patch and click the "Clone Patches" button.

![](static/webui_03_clone_patch.png)


## Patch Management 07 - Clone Patches

Click "Confirm:"

![](static/webui_04_clone_patches_2.png)

## Patch Management 07 - Unpublished Patches

Click on the patch:

![](static/webui_05_unpublished_patches.png)

## Patch Management 07 - Publish Patches

Click "Publish Patches":

![](static/webui_06_publish_patches.png)

## Patch Management 07 - Publish Patches

Select the devl channel and click "Publish Patches":

![](static/webui_07_publish_patches_2.png)

## Patch Management 07 - Publish Patches

Select the packages and click "Continue":

![](static/webui_08_publish_patches_3.png)

---

## Patch Management 07 - Verify a devl System

Click on the system srv2:

![](static/webui_09_verfiy_devl_system.png)

## Patch Management 07 - Apply Patches

Click on "Non-Critical":

![](static/webui_10_verify_system_2.png)

## Patch Management 07 - Apply Patches

Select the patch and click "Apply Patches":

![](static/webui_11_apply_patches.png)

## Patch Management 07 - Apply Patches

Click "Confirm":

![](static/webui_12_apply_patches_2.png)

## Patch Management 07 - Verify System

![](static/webui_13_verify_patched_system.png)

## Patch Management 07 - Verify System

Check the RPM-database on the srv2 system:

```text
# rpm -qa --last | head -10
```

Check the patches with `zypper` command:

```text
# zypper patches | grep "1655"
```
