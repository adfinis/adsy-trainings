# Hands-On zu Module "journald" [SSA 1002]

# Aufgabenstellung

* Liste die Log-Einträge der letzten 3h auf

# Aufgabenstellung

* Liste die Log-Einträge eines Zeitfensters auf und nutze dazu --since und --until

# Aufgabenstellung

* Installiere den Apache Webserver

* Liste alle Log-Meldungen zum Apache Unit auf und nutze dazu beide der folgenden Varianten

  * ```journalctl -u ...```

  * ```journalctl _SYSTEMD_UNIT=...```

* Benutze die Option -o verbose

# Aufgabenstellung

* Installiere Apache2 auf dem System

* Editiere /etc/apache2/httpd.conf und ändere den Parameter "AccesFileName" in "AccesFileNames" um

* Starte Apache neu und verwende eine Kombination von ```systemctl status ...``` und ```journalctl -u ...```, um den Fehler mittels Log-Analyse aufzuzeigen

# Attribution / License

* Slides

  Adfinis SyGroup AG, 2016, Attribution-NonCommercial 2.0 (CC BY-NC 2.0)
