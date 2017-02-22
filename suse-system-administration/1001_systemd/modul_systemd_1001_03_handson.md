# Hands-On zu Module "systemd" [SSA 1001]

# Aufgabenstellung 1001.1

* Erstelle einen Boot Chart des letzten Boot-Vorgangs

* Tipp: ```systemd-analyze```

# Aufgabenstellung 1001.2

* Installiere einen zusätzlichen Dienst auf dem System (z.B. MariaDB)

* Aktiviere den zusätzlichen Dienst, so dass er automatisch geladen wird

* Starte das System neu und erstelle einen weiteren Boot Chart

* Vergleiche die beiden Boot Charts

# Aufgabestellung 1001.3

* Generiere eine Liste der Abhängigkeiten des Dienstes "httpd"

* Tipp: ```man systemctl```

# Aufgabenstellung 1001.4

* Den aktuellen Target in rescue wechseln

* Auf der Konsole wieder in den multi-user wechseln

* Lassen Sie sich die verfügbaren targets angezeigt

# Aufgabenstellung 1001.5

* Erstelle ein Script, welches eine Kopie von /etc/passwd mit einem Timestamp im Namen unter /root/analysis/ ablegt

* Erstelle ein Service Unit File, welches das besagte Script aufruft

  Tipp: Siehe /lib/systemd/system/httpd.service

* Erstelle ein Timer Unit File, welches das Script jede Minute aufruft

# Attribution / License

* Slides

  Adfinis SyGroup AG, 2016, Attribution-NonCommercial 2.0 (CC BY_NC 2.0)
 
