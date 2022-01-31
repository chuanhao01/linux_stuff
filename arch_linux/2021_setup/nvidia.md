# Arch Linux
## Xorg
Nvidia GPU, with Xorg

### Enabling DRM
Context for this is to allow for hardware accerleration, [arch linux hardware accerleration](https://wiki.archlinux.org/title/Hardware_video_acceleration#Configuring_VA-API).

Can look at [Hardware Accerleraction](./hardware_accerleration.md)


## Wayland
TL|DR, not supported so far
Also does not work cause issues with drivers and stuff

So if wanting to go wayland, either run open-source (which is not that well supported)
Go buy intel/amd gpu

More promising work is being done, so check back and be careful.
There will be a lot of errors not a lot of people will experience


Some context:
- [Sway guy saying nvidia bad](https://drewdevault.com/2017/10/26/Fuck-you-nvidia.html)
- [Sway Github Page about the issue, check for nvidia blame](https://github.com/swaywm/sway/blame/master/sway/main.c)