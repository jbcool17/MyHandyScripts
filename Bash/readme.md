# bash scripts
- simple bash scripts


```
# Set default folder permissions 
setfacl -d -m u::rwx .ssh/

# Partition & Format HD
fdisk /dev/sdc
mkfs -t ext4 /dev/sdc1

# Label
e2label /dev/sdb1 DRIVE_NAME

# Mount
mount /dev/sdb1 /mnt/DRIVE

# Auto Mount FSTAB
/dev/sdc1 /mnt/DRIVE ext4 defaults 0 0

# Mount All
mount -a

# Create Test File
dd if=/dev/zero of=/mnt/DRIVE/image.img bs=1024M count=1000
```
