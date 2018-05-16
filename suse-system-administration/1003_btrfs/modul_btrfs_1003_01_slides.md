![](pics_02/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Modul "btrfs" [SSA 1003]

# Über Btrfs

* Btrfs = B-tree File System

  * Butter FS, better FS, b-tree FS

* ZFS ähnliches Dateisystem für Linux

* Wichtige Features:

  * Integriertes RAID

  * Volume-Management

  * Copy-on-Write

  * Deduplizierung

  * Snapshots

  * Kompression

# Verbreitung

* Standard FS für das root-FS in SLE 12

* Standard FS in Meego, SailfishOS, openSUSE

* Offiziell supported in Oracle Linux

* Optionales FS in allen gängigen Distributionen

* Konvertierung zwischen ext4/btrfs ist in beiden Richtungen möglich

# Subvolumes

* Ein Subvolume ist ein Teil des Dateisystems mit einer unabhängigen Datei- und Ordner-Struktur

* Snapshots sind auch Subvolumes

* Subvolumes/Snapshots sind wie normale Verzeichnisse zugänglich oder können separat gemountet werden

# RAID

* Das integrierte RAID-Subsystem kann zwischen belegten und freien Datenblöcken unterscheiden

* Bei der Rekonstruktion eines gespiegelten RAID-Volumens kann somit nur der belegte Plattenplatz gespiegelt werden

* Im Schadensfall ergibt sich dadurch eine Zeitersparnis

# Volume Management

* Btrfs kann zusätzliche Disks zu einem bestehenden Btrfs Pool hinzufügen

* Btrfs kann somit in diversen Szenarien Lösungen wie LVM ersetzen

# Copy on Write

* Verfahren, bei dem eine Kopie erst dann "real" angefertigt wird, sobald sie von einem der Beteiligten verändert wird

* Solange alle Beteiligten ihre Kopie nicht verändert haben, reicht es, das Original ein einziges Mal zu speichern

* Die Kopie erfolgt also zunächst "virtuell" und wird erst bei einer ersten Benutzung verzögert angelegt

# Deduplizierung

* Btrfs unterstützt out-of-hand / batch Deduplizierung

* Dies passiert während das Volume gemounted ist, aber ausserhalb des Schreib-Vorgangs durch ein zusätzliches Tool

* In-band / inline Deduplizierung ist in Arbeit

# Snapshots

* Ein Snapshot ist eine eingefrorene Kopie aller Dateien/Verzeichnisse eines (sub-) Volumes

* Man kann auf Snapshots zurückgreifen und z.B. gelöschte Dateien wiederherstellen

* Snapshots nutzen das _Copy on Write_ Verhalten von Btrfs und sind somit nicht als Backup gedacht (kaputte Sektoren wirken sich z.B. auch auf Snapshots aus)

# Kompression

* Btrfs Volumes können mit der Option compress gemountet werden

* ZLIB und LZO werden aktuell unterstützt

* _chattr_ kann Kompression pro File forcieren, auch wenn die Mount-Option nicht gesetzt ist

# Wichtigste Commands 1/2

* btrfs Dateisystem erzeugen

```
mkfs.btrfs
```
* Disk-Belegung anzeigen

```
btrfs filesystem df $path
```
* Informationen zu File-System (Zusammensetzung) anzeigen

```
btrfs filesystem show
```

# Wichtigste Commands 2/2

* Subvolume erstellen

```
btrfs subvolume create
```
* Subvolumes anzeigen

```
btrfs subvolume list $path
```
* Subvolume snapshoten

```
btrfs subvolume snapshot
```
* Subvolume als Mount default setzen

```
btrfs subvolume set-default $id $path
```

# Anmerkungen

* Nicht alle Features von btrfs sind stabil, insb. der RAID 5/6 Code gilt als teilweise fehlerhaft

  http://phoronix.com/scan.php?page=news_item&px=Btrfs-RAID-56-Is-Bad

* Partitionen, bei denen z.B. keine Snapshots benötigt werden, sollten ggf. mit einem anderen FS betrieben werden

# Attribution / License

* Slide „RAID“ https://de.wikipedia.org/wiki/Btrfs

* Slide „Copy on Write“ https://de.wikipedia.org/wiki/Btrfs

* Slide „Deduplizierung“ https://btrfs.wiki.kernel.org/index.php/Deduplication

* Slide „Kompression“ https://btrfs.wiki.kernel.org/index.php/Compression

* Slides

  Adfinis SyGroup AG, 2016, Attribution-NonCommercial 2.0 (CC BY-NC 2.0)

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
