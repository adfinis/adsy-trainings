![](pics_02/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Erfolgskontrolle zu Module "journald" [SSA 1002]

# Kontrollfrage 1

* Welchen Command nutzt man, um mit einem systemd basierten System die Log-Files zu lesen?

A) systemd-log

B) journalctl

C) tail /var/log/systemd/logs

# Kontrollfrage 2

* Wie können mit journalctl alle Log Einträge der letzten drei Stunden angezeigt werden? Annahme: Altuelles Datum ist 2016-08-23 28:15:22

A) journalctl --since "-3h"

B) journalctl --since "2016-08-23 15:15:22"

C) journalctl --since "-3h" --until "now"

# Kontrollfrage 3

* Über welches Config File kann journald konfiguriert werden?

A) /etc/systemd/system.conf

B) /etc/systemd/syslog.conf

C) /etc/systemd/journald.conf

# Kontrollfrage 4

* Wie können mit journalctl alle Log-Einträge des Units MariaDB aufgelistet werden?

A) ```journalctl -u mariadb```

B) ```journalctl list mariadb```

C) ```journalctl _SYSTEMD_UNIT=mariadb.service```

# Attribution / License

* Slides

  Adfinis SyGroup AG, 2016, Attribution-NonCommercial 2.0 (CC BY_NC 2.0)

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
