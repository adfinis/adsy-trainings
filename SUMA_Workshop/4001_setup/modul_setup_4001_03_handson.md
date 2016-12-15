% SUSE Manager 3 Setpu
% Marc Stulz
% November 08, 2016

# SUSE Manager 3 Hands-on

![](static/suma.png)

---

## Hands-on :: Setup 01

Access the training systems, prepare the system and install the SUMA.

---

## Setup 01 - Login

Connect to the training system with `ssh`:

```text
# ssh "user$nr"@"$hostsystem"
# ssh root@"suma$nr"
```

## Setup 01 - Datadisks

Create the data disks and put a file system on the devices:

```text
# pvcreate /dev/vdb

# vgcreate vg_data /dev/vdb

# lvcreate -l50%FREE -n lv_database vg_data

# lvcreate -l100%FREE -n lv_spacewalk vg_data

# mkfs.xfs /dev/mapper/vg_data-lv_database

# mkfs.xfs /dev/mapper/vg_data-lv_spacewalk
```

## Setup 01 - Mount Datadisks

Delete the BTRFS pgsql subvolume and add the new devies to the `/etc/fstab`:

```text
UUID=9f9e1724-f38a-40f9-8d24-867a24cc8e0f /var/lib/pgsql xfs defaults 0 2
UUID=a13dd737-3042-42fb-9a09-1b88828d2bf5 /var/spacewalk xfs defaults 0 2
```

Create the mountpoint and mount the new devices:

```text
# mkdir /var/spacewalk

# mount -a
```

## Setup 01 - Attach the repositories (INET)

If you have internet access (via proxy), register with scc.suse.com:

```text
# SUSEConnect -e "$mail_address" -r "$registration_code"

# SUSEConnect -p SUSE-Manager-Server/3.0/x86_64 -r "$registration_code"
```

## Setup 01 - Attach the repositories (SMT)

If you don't have internet access, get the repositories from your SMT server:

```text
# SUSEConnect -p SUSE-Manager-Server/3.0/x86_64
```

## Setup 01 - Verify the respositories

Check if the SUMA repositories are available on your machine:

```text
# zypper repos
```

---

## Setup 01 - Installation

Verify if the SUMA pattern is available and install it:

```text
# zypper search -t pattern suma_server

# zypper info -t pattern suma_server

# zypper install -t pattern suma_server
```

---

## Setup 01 - Setup

Run the `yast2` command to start the setup:

```text
# yast2 susemanager_setup
```

## Setup 01 - E-mail Address

![](static/yast2_suma_setup_1_email_addr.png)

## Setup 01 - Certificate

![](static/yast2_suma_setup_2_cert_setup.png)

## Setup 01 - Database

![](static/yast2_suma_setup_3_db_setup.png)

## Setup 01 - SCC

![](static/yast2_suma_setup_4_scc.png)

---

## Setup 01 - First Login

Open a SSH tunnel:

```text
$ ssh -Nf -R 0.0.0.0:$high_port:localhost:443 "$user"@"$trainings_host"
```

Access the WebUI with your browser:

https://training.cust.adfinis-sygroup.ch:"$high_port"

## Setup 01 - Create Organization and User

![](static/webui_1_create_org.png)

