```
timedatectl set-ntp true

# Setup partitions
cfdisk

lsblk /dev/sdX
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sdX      8:112  1 14.5G  0 disk
├─sdX1   8:113  1   10M  0 part MBR I think
├─sdX2   8:114  1  500M  0 part EFI
├─sdX3   8:114  1  500M  0 part Linux file system (/boot)
└─sdX4   8:115  1   14G  0 part LVM

# https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS
# https://wiki.archlinux.org/title/LVM
# https://wiki.archlinux.org/title/Dm-crypt/Device_encryption
cryptsetup luksFormat --type luks1 --use-random -s 512 -h sha512 -i 5000 /dev/sdX
cryptsetup open /dev/sdX4 cryptlvm

pvcreate /dev/mapper/cryptlvm
vgcreate vg /dev/mapper/cryptlvm
lvcreate -l 100%FREE vg -n home

mkfs.ext4 /dev/vg/home
mkfs.ext4 /dev/sdX3
mkfs.fat -F32 /dev/sdX2 # efi

pacstrap /mnt base linux-firmware linux linux-headers  vi vim vifm tmux networkmanager lvm2 mkinitcpio sudo

genfstab -pU /mnt > /mnt/etc/fstab

arch-chroot /mnt

systemctl enable NetworkManager.service
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

# Set hostname
vim /etc/hostname
vim /etc/hosts

# Set locale.gen
# Install US as well, just for other locales
vim /etc/locale.gen
locale-gen
vim /etc/locale.conf

ln -sf /usr/share/zoneinfo/Singapore /etc/localtime
hwclock --systohc

vim /etc/fstab # Change to reltime and atime to noatime
# /dev/sdY3
UUID=uuid1  /      ext4  rw,noatime     0 1

# /dev/sdY2
UUID=uuid2  /boot  vfat  rw,noatime,... 0 2


mkdir -p /etc/systemd/journald.conf.d
vim /etc/systemd/journald.conf.d/10-volatile.conf
[Journal]
Storage=volatile
SystemMaxUse=16M
RuntimeMaxUse=32M

# Setup new user
useradd chuanhao01
usermod -aG wheel,audio,video,optical,storage,power chuanhao01
mkhomedir_helper chuanhao01
passwd chuanhao01

# Change the sudo to allow wheel groups
visudo

# edit mkinitcpio.conf
vim /etc/mkinitcpio.conf
HOOKS=(base udev block keyboard autodetect modconf encrypt lvm2 filesystems fsck)

mkinitcpio -p linux

pacman -S intel-ucode amd-ucode
pacman -S grub efibootmgr
pacman -S xf86-video-vesa xf86-video-ati xf86-video-fbdev

vim /etc/default/grub
# /etc/default/grub
GRUB_TIMEOUT=0
GRUB_CMDLINE_LINUX="... cryptdevice=UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx:cryptlvm root=/dev/vg/root ..." # UUID is of partiion, /dev/sdX4
GRUB_ENABLE_CRYPTODISK=y

grub-install --target=i386-pc --boot-directory /boot --recheck --removable /dev/sdX # BIOS --force?
grub-install --target=x86_64-efi --boot-directory /boot --efi-directory /efi  --bootloader-id=grub_uefi --recheck # EFI

grub-mkconfig -o /boot/grub/grub.cfg

pacman -S acpi polkit
```