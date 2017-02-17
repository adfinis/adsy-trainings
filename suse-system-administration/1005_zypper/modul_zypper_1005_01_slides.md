# Modul "zypper" [SSA 1005]

# zypper 1/2

* Paket- und Repository-Verwaltungstool

* Installation, Aktualisierung und Deinstallation von Paketen

* Installation von (Sicherheits-)Patches

* Patching auch selektiv nach CVE möglich

* Hinzufügen und Entfernen von Repositories

# zypper 2/2

* Viele Abkürzungen für Befehle vorhanden

  Bsp.: zypper in statt zypper install

* Upgrade auf nächstes Major Release möglich

* Prozesse auflisten, die nach Update inexistente Dateien verwenden

* Paket-Gruppen suchen, installieren und deinstallieren (patterns)

# Die wichtigsten Befehle

# zypper 1/5

* Paket- oder Pattern-Suche
```
zypper search <paketname>
zypper search -t pattern <name>
```
* Paket- oder Pattern-Informationen anzeigen
```
zypper info <paketname>
zypper info <pattern>
```

# zypper 2/5

* Repository-Informationen
```
zypper repos
```
* Repositories aktualisieren
```
zypper refresh
```
* Repository hinzufügen und bearbeiten
```
zypper addrepo
zypper modifyrepo
```

# zypper 3/5

* Paket oder Pattern installieren
```
zypper install <paket_name>
zypper in -t pattern <pattern>
```
* Paket oder Pattern deinstallieren
```
zypper rm <paket_name>
zypper remove -t pattern <pattern>
```

# zypper 4/5

* Updates anzeigen und installieren
```
zypper list-updates
zypper update [paketname]
```
* Patches anzeigen, überprüfen und installieren
```
zypper list-patches
zypper patch-check
zypper patch
zypper patch --cve=CVE-2015-3194
```

# zypper 5/5

* Prozesse anzeigen, welche nach Update fehlende Dateien verwenden
```
zypper ps
```

# Attribution / License

* Slides
  Adfinis SyGroup ASG, 2016, Attribution-NonCommercial 2.0 (CC BY-NC 2.0)
