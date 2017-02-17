# Modul "dracut" [SSA 1008]

# Über initramfs 1/2

*  initird/initramfs sind beim Booten dazu da, das root-Dateisystem zu finden, damit der Kernel an den Init-Prozess übergeben kann

* initrd ist block device basiert, initramfs ist File basiert – heute wird fast ausschliesslich initramfs benutzt

# Über initramfs 2/2

Die Tools im initramfs laden z.B. die Funktionalität, um...:

* ...RAID Devices zu initialisieren

* ...Verbindung zu einem NFS Server herzustellen

* ...Partitionen auf LVM zu finden

* etc.

# Über dracut

* dracut löst mkinitrd ab

* dracut erstellt ein initramfs, welches vom Kernel benutzt wird, um das root-Dateisystem zu finden

* dracut ist nicht distributions-spezifisch

# dracut Funktionen

* dracut ist so generisch wie möglich und kopiert Tools des installierten Systems, um das initramfs zu erstellen

* dracut besteht aus vielen verschiedenen Modulen, die sich um jeweils eine spezifische Funktion kümmern, z.B.: MD RAID, LVM2, iSCSI, NFS, etc.

# initramfs definieren

Das initramfs wird wie der Kernel als GRUB-Parameter definiert (nicht vom Namen irritieren lassen), Beispiel:

```grub
menuentry 'AdSy Test'{
  set       root='hd0,msdos2'
  echo      'Loading AdSy Test \o/'
  linux     /boot/vmlinuz-3.12.60-52.54-default root= UUID=e5[...]f12 ${extra_cmdline}
  echo      'Loading initial ramdisk \o/'
  initrd    /boot/initrd-3.12.60-52.54-default
}
```

# Was enthält die initramfs?

* Ein initramfs ist ein komprimiertes CPIO-Archiv

* Unter SLE ist das Archiv LZMA komprimiert

* Entpacken:

  xzcat /boot/initrd… > initrd...cpio

  cpio -idv < initrd...cpio

* Spezifisches Tool:

  Isinitrd

* Relevant sind v.a. die Kernel-Module und Helper-Tools wie modprobe, mount, etc.

# initramfs erzeugen / anpassen

* Neues initramfs erstellen und aktuelles überschreiben:

  dracut -f

* Neues Kernel-Modul im initramfs aufnehmen, Variable *force_drivers* ergänzen (mehrere Module durch Leerzeichen trennen)

  vi /etc/dracut.conf

  oder

  vi /etc/dracut.conf.d/xyz.conf

# dracut Module?

* Module auflisten

  rpm -ql dracut | grep modules.d

  oder

  ls -la /usr/lib/dracut/modules.d

* Viele der Module sind inline dokumentiert, z.B.

  /usr/lib/dracut/modules.d/95cifs/cifs-lib.sh

  /usr/lib/dracut/modules.d/95nfs/parse-nfsroot.sh

# Fallstrick

Wenn Kernel-Parameter über sysctl angepasst werden (/etc/sysctl.conf, /etc/sysctl.d/\*.conf), muss das initramfs ebenfalls neu geschrieben werden!

dracut -f

# Attribution / License

* Slides

  Adfinis SyGroup AG, 2016, Attribution-NonCommercial 2.0 (CC BY-NC 2.0)
