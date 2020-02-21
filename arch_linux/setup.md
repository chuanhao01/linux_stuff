Quick notes on setting up arch linux for myself later  

After iso  
Installing arch onto the drives
```bash
# Setting up time
timedatectl set-ntp true
# setting up cfdisk to partition drive
# Goes like this
# nvme0n1p1 -> boot EFI system
# nvme0n1p2 -> swap linux swap
# nvme0n1p3 -> main linux file system
cfdisk /dev/nvme0n1
fdisk -l # to check

# Formatting the type
mkfs.fat -F32 /dev/nvme0n1p1
mkswap /dev/nvme0n1p2
mkfs.ext4 /dev/nvme0n1p3

# Mount the drive
mount /dev/nvme0n1p3 /mnt
swapon /dev/nvme0n1p2

# Install all needed packages on the drive
pacstrap /mnt base linux linux-firmware vim dhcpcd sudo

# Gen the fstab into the drive
genfstab -pU /mnt >> /mnt/etc/fstab

# Go into the system
arch-chroot /mnt

# Set up the mirrorlist for the system
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

# Set hostname
vim /etc/hostname
vim /etc/hosts

# Set locale.gen
vim /etc/locale.gen
locale-gen
vim /etc/locale.conf

# Setup the time
ln -sf /usr/share/zoneinfo/Singapore /etc/localtime
hwclock --systohc

# Set up password
passwd

# Setup dhcpcd
systemctl enable dhcpcd

# Setup new user
useradd chuanhao01
usermod -aG wheel,audio,video,optical,storage,power
mkhomedir_helper chuanhao01
passwd chuanhao01

# Change the sudo to allow wheel groups
visudo

# Installing grub and the bootloader
pacman -S grub efibootmgr dosfstools os-prober mtools
mkdir /boot/EFI
mount /dev/nvme0n1p1 /boot/EFI
grub-install --target=x86_64-efi  --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
```

```bash
# Setting up kde desktop
sudo pacman -Syu
sudo pacman -S xorg
sudp pacman -S plasma-meta kde-applications
sudo systemctl enable sddm
sudo systemctl enable NetworkManager
```