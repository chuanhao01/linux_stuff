Upataed for 2021, doing this on windows and on github online woo!

Just code, git gud
References:


```bash
timedatectl set-ntp true

# Setup partitions
cfdisk

gdisk -l
lsblk -f # Check filesystem
iwctl # Setup network

# https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS
# https://wiki.archlinux.org/title/LVM
# https://wiki.archlinux.org/title/Dm-crypt/Device_encryption
cryptsetup luksFormat --type luks1 --use-random -s 512 -h sha512 -i 5000 /dev/sdX
cryptsetup open /dev/sdX cryptlvm

pvcreate /dev/mapper/cryptlvm
vgcreate vg /dev/mapper/cryptlvm
lvcreate -L XG vg -n NAME
lvcreate -l 100%FREE

mkfs.ext4 /dev/vg/NAME
mkfs.fat -F32 /dev/sdX # efi
mkswap /dev/vg/NAME
swapon

mount /dev/vg/NAME /mnt
mount /dev/sdX /mnt/boot
mount /dev/sdX /mnt/efi

pacstrap /mnt base linux-firmware linux linux-headers linux-lts linux-lts-headers vi vim vifm tmux networkmanager lvm2 mkinitcpio sudo

genfstab -pU /mnt > /mnt/etc/fstab

arch-chroot /mnt

systemctl enable NetworkManager.service
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak


# Set hostname
vim /etc/hostname
vim /etc/hosts

# Set locale.gen
vim /etc/locale.gen
locale-gen
vim /etc/locale.conf

passwd

# Setup new user
useradd chuanhao01
usermod -aG wheel,audio,video,optical,storage,power chuanhao01
mkhomedir_helper chuanhao01
passwd chuanhao01

# Change the sudo to allow wheel groups
visudo

# edit mkinitcpio.conf
vim /etc/mkinitcpio.conf
mkinitcpio -p linux

# Installing grub and the bootloader
pacman -S intel-ucode amd-ucode
pacman -S grub efibootmgr
vim /etc/default/grub
grub-install --target=i386-pc --boot-directory /boot --recheck /dev/sdX # BIOS
grub-install --target=x86_64-efi --boot-directory /boot --efi-directory /efi  --bootloader-id=grub_uefi --recheck # EFI
 # --removable for usb
grub-mkconfig -o /boot/grub/grub.cfg

# For dual-boot
pacman -S dosfstools os-prober mtools
```

```
# /etc/default/grub
GRUB_TIMEOUT=0
GRUB_CMDLINE_LINUX="... cryptdevice=UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx:cryptlvm root=/dev/vg/root ..."
GRUB_ENABLE_CRYPTODISK=y
```

```
# /etc/hosts
127.0.0.1 localhost
::1   localhost
127.0.1.1 hostname-localdomain  localhost

ln -sf /usr/share/zoneinfo/Singapore /etc/localtime
hwclock --systohc
```

```
# /etc/locale.conf
LANG=en_SG.UTF-8
```

```
# /etc/mkinitcpio.conf
HOOKS=(base udev autodetect modconf block filesystems keyboard fsck)
HOOKS=(base udev autodetect keyboard keymap modconf block encrypt lvm2 filesystems fsck)
HOOKS=(base udev autodetect keyboard modconf block encrypt lvm2 filesystems fsck)
```

```
# After initial grub setup
sudo pacman -Sy

# More tools
sudo pacman -S git make udisks2 alacritty
# udisks2 for mounting
# alacritty for a terminal

# Install yay
sudo pacman -S base-devel
git clone https://aur.archlinux.org/yay.git
makepkg -si

# xorg
# Switching to qtile because python scripting with rofi is better, I can spare some resources
sudo pacman -S xorg xorg-xinit
cp /etc/X11/xinit/xinitc .xinitrc
vim .xinitrc

# xorg testing
sudo pacman -S xterm
startx
sudo pacman -Rs xterm
sudo pacman -Rsc xterm

# For VMWare to work woo
sudo pacman -S  xf86-input-vmmouse xf86-video-vmware mesa

# Install python (optional)
# We are using pyenv for python version management
# https://github.com/pyenv/pyenv#installation
sudo pacman -S pyenv
pyenv install --list # Install latest version of python, -v verbose
pyenv global $VERSION

# Install qtile
# https://wiki.archlinux.org/title/Qtile
sudo pacman -S qtile
sudo pacman -S --needed base-devel openssl zlib xz
```
