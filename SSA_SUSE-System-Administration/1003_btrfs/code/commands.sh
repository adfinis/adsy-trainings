## Create disk and write file to it

dd if=/dev/zero of=/tmp/btrfs/disk1 bs=128M count=1
mkfs.btrfs /tmp/btrfs/disk1
mkdir /mnt/btrfs1
mount /tmp/btrfs/disk1 /mnt/btrfs1

for i in $(seq 1 10); do cat /sbin/httpd >> /mnt/btrfs1/httpd_dup; done
sync

## Check used disk space
btrfs filesystem df /mnt/btrfs1

## Do the same with compression

umount /mnt/btrfs1
mount /tmp/btrfs/disk1 /mnt/btrfs1 -o compress

for i in $(seq 1 10); do cat /sbin/httpd >> /mnt/btrfs1/httpd_dup_comp; done
sync
btrfs filesystem df /mnt/btrfs1

#### #### #### ####

dd if=/dev/zero of=/tmp/btrfs/disk1 bs=128M count=1
dd if=/dev/zero of=/tmp/btrfs/disk2 bs=128M count=1
dd if=/dev/zero of=/tmp/btrfs/disk3 bs=128M count=1

mkfs.btrfs -d raid0 /tmp/btrfs/disk1 /tmp/btrfs/disk2 /tmp/btrfs/disk3

losetup /dev/loop1 /tmp/btrfs/disk1
losetup /dev/loop2 /tmp/btrfs/disk2
losetup /dev/loop3 /tmp/btrfs/disk3

mkdir /mnt/btrfs1
mount /dev/loop1 /mnt/btrfs1

btrfs filesystem show
df -h /mnt/btrfs1

dd if=/dev/zero of=/tmp/btrfs/disk4 bs=128M count=1
losetup /dev/loop4 /tmp/btrfs/disk4
btrfs device add /dev/loop4 /mnt/btrfs1
df -h /mnt/btrfs1
btrfs filesystem balance /mnt/btrfs1
df -h /mnt/btrfs1

#### #### #### ####

dd if=/dev/zero of=/tmp/btrfs/disk1 bs=128M count=1
dd if=/dev/zero of=/tmp/btrfs/disk2 bs=128M count=1
dd if=/dev/zero of=/tmp/btrfs/disk3 bs=128M count=1

mkfs.btrfs -d raid1 /tmp/btrfs/disk1 /tmp/btrfs/disk2 /tmp/btrfs/disk3

losetup /dev/loop1 /tmp/btrfs/disk1
losetup /dev/loop2 /tmp/btrfs/disk2
losetup /dev/loop3 /tmp/btrfs/disk3

mkdir /mnt/btrfs1
mount /dev/loop1 /mnt/btrfs1

btrfs filesystem show
df -h /mnt/btrfs1

echo "Hello Btrfs" > /mnt/btrfs1/hello

umount /mnt/btrfs1
dd if=/dev/zero of=/tmp/btrfs/disk3 bs=128M count=1
btrfs filesystem show

# Will fail
mount /dev/loop1 /mnt/btrfs1
# Try with degraded option
mount -o degraded /dev/loop1 /mnt/btrfs1
cat /mnt/btrfs1/hello

umount /mnt/btrfs1
btrfs filesystem show
dd if=/dev/zero of=/tmp/btrfs/disk4 bs=128M count=1
losetup /dev/loop4 /tmp/btrfs/disk4
mount -o degraded /dev/loop1 /mnt/btrfs1
btrfs replace start 3 /dev/loop4 /mnt/btrfs1
sleep 10
umount /mnt/btrfs1
btrfs filesystem show


#### #### #### ####

dd if=/dev/zero of=/tmp/btrfs/disk1 bs=128M count=1
mkfs.btrfs /tmp/btrfs/disk1
mkdir /mnt/btrfs1
mount /tmp/btrfs/disk1 /mnt/btrfs1

for i in $(seq 1 10); do cp /sbin/httpd /mnt/btrfs1/$i; done
df -h /mnt/btrfs1

btrfs filesystem df /mnt/btrfs1
/opt/duperemove -d /mnt/btrfs1
sync
btrfs filesystem df /mnt/btrfs1
