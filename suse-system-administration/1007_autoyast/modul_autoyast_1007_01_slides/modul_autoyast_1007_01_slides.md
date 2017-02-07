# Modul "autoyast" [SSA 1007]

# autoyast 1/3

* Installationskonfiguration

* Fast alle Aspekte des Systems vorkonfigurieren

  * Benutzer anlegen

  * Netzwerk konfigurieren

  * Partitionierung

  * ...

# autoyast 2/3

* Unbeaufsichtigte Systeminstallation

* XML-Konfiguration

* Klonen bestehender Systeme

* Reproduzierbare Systeminstalltionen

* Benutzer-Scripts während allen Phasen ausführbar

  * Vor der Installation

  * Nach der Installation

  * Während der Installation

# autoyast 3/3

* Dokumentation unter folgender URL:

  https://www.suse.com/documentation/sles-12/singlehtml/book_autoyast/book_autoyast.html

# Beispiel-Konfiguration

```xml
<?xml version="1.0"?>
<!DOCTYPE profile>
<profile xmlns="http://www.suse.com/1.0/yast2ns" xmlns:config="http://www.suse.com/1.0/configns">
   <...>
  <keyboard>
    <keyboard_values>
      <delay/>
      <discaps config:type="boolean">false</discaps>
      <numlock/>
      <rate/>
    </keyboard_values>
    <keymap>german-ch</keymap>
  </keyboard>
  <timezone>
    <hwclock>UTC</hwclock>
    <timezone>Europe/Zurich</timezone>
  </timezone>
   <...>
</profile>
```

# Die wichtigsten Befehle

# autoyast 1/2

* Erstellen einer autoyast-Datei für den System-Klon

```shell
sudo yast2 clone_system
```

  Erstellt die Datei Datei "/root/autoinst.xml"

* Konfiguration mit einem beliebigen Editor anpassen

```shell
sudo vim /root/autoinst.xml
```

# autoyast 2/2

* Installation mit folgendem Kernel-Parameter starten

```
autoyast=<URL oder Pfad zu autoyast-Profil>
```

* Nach Installation ist das System bereit

# Attribution / License

* Slides

  Adfinis SyGroup AG, 2016, Attribution-NonCommercial 2.0 (CC BY-NC 2.0)
