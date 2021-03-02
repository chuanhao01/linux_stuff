# Notes on using arch linux with i3  
This is to mainly help me remeber the configs and tools I use on my personal installation of i3 and arch linux  

## nmtui
This is the utility u use to handle and manage your network/wifi connections
```
nmtui
```

The configs are stored in: `/etc/NetworkManager/system-connections`

## arandr
This is the utility used for selecting displays and HDMI outputs
```
arandr
```

## Adding bluetooth earpiece

For arch linux:

You follow these steps for bluetooth drivers and bluetooth earpiece.  
- [Bluetooth](https://wiki.archlinux.org/index.php/bluetooth)
- [Bluetooth audio](https://wiki.archlinux.org/index.php/bluetooth_headset)

TL:DR
- Get bluetooth
- Get pulseaudio-bluetooth

## Vscodium
Hopefully nothing is different from vscode

To create a sym link for the code command to work
1. Check `where codium` to find out where the bin is located
2. Usually in `/usr/bin`
3. Need sym link from `codium` to `code`
```
ln -s /usr/bin/codium /usr/bin/code
```

[Link](https://github.com/VSCodium/vscodium/blob/master/DOCS.md#extensions-marketplace) for `product.json`
`products.json` is in `/usr/share/vscodium-bin/resources/app/product.json`

## For external hard drives mounting and compatibility

For most hard drives, they will be using the ntfs fs format for the hard drive.
As such to read and write to the hard drive you need an additional library in order for reading, writing and mounting to work.
This is true even for KDE dolphin and other GUI based applications.
Also vifm and mounting in general requires this.

```
sudo pacman -S ntfs-3g
```

[Link](https://wiki.archlinux.org/index.php/NTFS-3G)
