![](pics_2/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Modul "snapper" [SSA 1006]

# Über Snapper

* Tool zum Verwalten von Snapshots
  * Snapshots erstellen

  * Snapshots löschen

  * Snapshots vergleichen

* Änderungen zwischen Snapshots anzeigen

* Unterstützt btrfs, ext4 und thin-provisioned LVM

* ACL & xattr Support

* CLI, DBus und GUI-Interface

# Snapper in SLE

* SLE 12 integriert Snapper und erstellt selbständig Snapshots (z.B. vor dem Ausführen eines Updates)

* Es gibt zwei unterschiedliche Varianten wie Snapper in Problem-Situationen unterstützen kann

  * Änderungen rückgängig machen (selektiv)

  * Rollback des "gesamten" Systems

# Einschränkungen

* Snapper kann die Integrität von Dateien nicht sicherstellen!

* Ein Rollback z.B. einer Datenbank ist somit immer mit dem Risiko inkonsistenter Daten verbunden

* Nicht alle Verzeichnisse und Dateien sind im Snapshot enthalten, SUSE definiert diverse (sinvolle) Ausnahmen

# Ausnahmen

* /boot/grub2/[i386-pc, x86_64-efi, powerpc-ieee1275, s390x-emu]
* /home
* /opt, /var/opt
* /srv
* /tmp, /var/tmp, /var/crash
* /usr/local
* /var/lib/named
* /var/lib/pgqsl
* /var/log

* Beschreibung zu den Ausnahmen führt der SLE Administrator Guide auf:

  DE: ...

  EN: 3.1.2 Directories That Are Excluded from Snapshots

# Integration in YAST

* Bei jeder YAST oder zypper Transaktion erstellt Snapper zwei Snapshots:

  * "pre"-Snapshotl, vor der Änderung
  * "post"-Snapshot, nach der Änderung

* Mit dem YAST-Modul für snapper oder mit dem snapper CLI-Tool können die entsprechenden Änderungen rückgängig gemacht werden

* Zudem gibt es eine Boot-Option, um das System von einem Snapshot zu booten

# Manuellen Snapshot erstellen

* Snapshots können auch manuell erstellt werden
```shell
snapper create
```

# Unterschiede anzeigen

* Snapper kann zwischen zwei Snapshots ein Diff erstellen
```
snapper list
snapper diff $id1..$id2 $path
```

# System Rollback mittels Booten von Snapshot

* Ein System kann mittels Snapshots auf einen älteren Stand zurückgesetzt werden

* Einschränkungen

  * root Dateisystem muss btrfs sein

  * das root Dateisystem muss auf einem einzelnen Device liegen

  * der Bootloader muss noch geladen werden können

# Rollback durchführen

* Im Boot-Menü kann ein Snapshot ausgewählt werden

* Danach bootet das System im read-only Modus und man kann den Zustand prüfen

* Der Snapshot kann mit folgendem Command übernommen werden
```
snapper Rollback
```

# Snapshots löschen

* Snapshots können via YAST oder über das CLI gelöscht werden

* Via CLI
```
snapper delete $id
```
* Wenn ein "pre"-Snapshot gelöscht wird, sollte auch der korrespondierende "post"-Snapshot gelöscht werden

* Es ist aktuell nicht möglich, herauszufinden, wie viel Platz ein Snapshot belegt

* Der freie Platz auf einem btrfs Volume sollte immer mit btrfs Tools ermittelt werden:
```
btrfs filesystem df $path
```

# Snapper Config

* Die Snapper Config liegt unter
  /etc/snapper/configs/root

* Informationen zu der Config:
```
man 8 snapper
man 5 snapper-configs
```

# Attribution / License

* Slides

  Adfinis SyGroup AG, 2016, Attribution-NonCommercial 2.0 (CC BY-NC 2.0)

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
