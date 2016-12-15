% SUSE Manager Backup
% Marc Stulz
% November 14, 2016

# SUSE Manager 3 Hands-on

![](static/suma.png)

---

## Hands-on :: Backup 06

Configure a scheduled backup and perform a restore.

---

## Backup 06 - Database

Create a backup directory:

```text

# mkdir /var/spacewalk/db-backup

# chown postgres:postgres /var/spacewalk/db-backup

# chmod 700 /var/spacewalk/db-backup

```

## Backup 06 - Database

Create a backup for the first time:

```text

# smdba backup-hot --enable=on --backup-dir=/var/spacewalk/db-backup

```

## Backup 06 - Database

Create a cron job for scheduled backups.

Add the following line to the cron job at `/etc/cron.d/db-backup-mgr`:

```text

0 2 * * * root /usr/bin/smdba backup-hot --enable=on --backup-dir=/var/spacewalk/db-backup

```

## Backup 06 - Database

Perform a restore.

Stop spacewalk servies:

```text

# spacewalk-service stop

```

Stop the database:

```text

# smdba db-stop

```

## Backup 06 - Database

Start the restore process:

```text

# smdba backup-restore start

```

## Backup 06 - Database

Start spacewalk servies:

```text

# spacewalk-service start

```

