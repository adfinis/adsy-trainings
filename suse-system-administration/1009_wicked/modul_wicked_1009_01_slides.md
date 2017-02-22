# Modul "wicked" [SSA 1009]

# Über wicked 1/2

* Framework für Netzwerk-Konfiguration

* Ersetzt die alten Befehle wie ifup, ifdown, ifprobe und netconfig

* Die alten Befehle existieren weiter und sind Wrapper um wicked
  /sbin/ifup → /usr/sbin/ifup → Bash Wrapper um wicked

* Die Konfigurationen unter /etc/sysconfig/network/ifcfg-* können weiterhin genutzt werden

# Über wicked 2/2

* Jedes Netzwerk-Interface kann über DBus konfiguriert werden

* DBus Endpoints unter: /org/opensuse/Network/Interfaces

# Warum wicked? 1/3

* ifup, ifdown, ifprobe, etc. stammen aus einer Zeit, in der die Netzwerk-Konfiguration simpel war

![wicked1](wicked1.png)

# Warum wicked? 2/3

* Heute ist alles etwas komplizierter

![wicked2](wicked2.png)

# Warum wicked? 3/3

* wicked ist ein modernes Tool, um die komplexen Netzwerk-Konfigurationen verwalten zu können

* Unterstützte Geräte-Typen:

  * Ethernet, VLAN, Bridging, Bonding, Infiniband, Loopback

  * tun, tap, ipip, sit, gre, dummy

  * macvlan, macvtao

  * hsi, qeth, iuct

  * wireless (WPA, EAP)

* Konfiguration von Adressen:

  * statisch, dhcp4, dhcp6

* Hotplugging

# Was ist mit NetworkManager?

* NetworkManager eignet sich für dynamische Setups, in denen die Verbindung oft wechselt (Notebook)

  z.B. UMTS → WLAN → Ethernet → UMTS

* NetworkManager ist weniger geeignet, wenn ein System anderen Geräten Netzwerk Dienste wie DHCP, DNS,      NTP,... anbietet (Server)

* SUSE aktiviert NetworkManager auf Laptops automatisch

# Konfiguration von wicked

* wicked unterstützt SUSE Style Konfigurationen in /etc/sysconfig/network

* Zusätzlich unterstützt wicked ein internes XML-Format, um die Konfiguration zu speichern

* Die wicked Konfiguration liegt unter
  /etc/wicked

# Was ändert sich an der Administration?

* wicked selber ist ein systemd Service:
  systemctl restart network.service
  startet die Netzwerk Interfaces neu
  systemctl restart wickedd.service
  startet nur wicked neu, ohne die Netzwerk Interfaces neu zu konfigurieren

* wicked löst ifup, ifdown, ifprobe und netconfig ab

# Wie wird wicked benutzt?

* Die Commands bleiben sehr ähnlich:
ifup eth0	→ wicked ifup eth0
ifdown wlan0	→ wicked ifdown wlan0
ifstatus br0	→ wicked ifstatus br0

* Das Format von /etc/sysconfig/network/ifcfg-* hat sich nicht geändert!

# Wie funktioniert Hotplugging?

* Hotplugging wird durch einen zusätzlichen Dienst, den wicked mitbringt, implementiert:
nanny

* nanny ist seit SLE 12 SP1 standardmässig aktiviert

* nanny kann über die wicked Konfiguration deaktiviert werden

# wicked Konfiguration

* Globale Konfiguration die von allen wicked Komponenten geladen wird:
/etc/wicked/common.xml

* Lokale Anpassungen gehören in:
/etc/wicked/local.xml

* wicked Server (wickedd) Konfiguration:
/etc/wicked/server.xml

* wicked Client (wicked) Konfiguration:
/etc/wicked/client.xml

* nanny Server (wickedd-nanny) Konfiguration:
/etc/wicked/nanny.xml

# Gängige Anpassungen

* Nanny aktivieren/deaktivieren:
/etc/wicked/common.xml
```
<use-nanny>true</use-nanny>
```
* Debug Logs aktivieren/deaktivieren:
/etc/wicked/local.xml
```
<debug>all</debug>
```
* Weitere Details:
```shell
  man 5 wicked-config
```

#  Was ist mit resolv.conf, hosts, host.conf,…?

* Netzwerk Konfigurationsdateien die nicht Interface- spezifisch sind, bleiben ebenfalls bestehen und ändern sich nicht. Gilt z.B. für:

* /etc/hosts

* /etc/host.conf

* /etc/resolv.conf

* /etc/nsswitch.conf

* etc.

# Commands 1/2

* Interface aktivieren
wicked ifup $dev

* Interface deaktivieren
wicked ifdown $dev

* Konfigurations-Änderungen applizieren
wicked ifreload $dev

* Device Informationen anzeigen
wicked ifstatus $dev

# Commands 2/2

* Sämtliche Konfigurationen lesen/parsen und das interne XML-Format anzeigen

```shell
wicked show-config
```
* Weitere Details:

```shell
man 8 wicked
```

# Attribution / License

* Slide „RAID“ https://de.wikipedia.org/wiki/Btrfs

* Slide „Copy on Write“ https://de.wikipedia.org/wiki/Btrfs

* Slide „Deduplizierung“ https://btrfs.wiki.kernel.org/index.php/Deduplication

* Slides
Adfinis SyGroup AG, 2016, Attribution-NonCommercial 2.0
(CC BY-NC 2.0)
