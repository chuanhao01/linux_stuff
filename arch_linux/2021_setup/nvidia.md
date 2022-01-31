# Arch Linux
## Xorg
Nvidia GPU, with Xorg

### Enabling DRM
Context for this is to allow for hardware accerleration, [arch linux hardware accerleration](https://wiki.archlinux.org/title/Hardware_video_acceleration#Configuring_VA-API).

Can look at [Hardware Accerleraction](./hardware_accerleration.md)

To enable DRM (simple):
1. Add `nvidia-drm.modeset=1` kernel parameters
2. Add `nvidia nvidia_modeset nvidia_uvm nvidia_drm` module to mkinitcpio
3. Add pacman hook to rebuild mkinitcpio everytime nvidia is updated
    1. Make sure to rebuild when doing it the first time
4. Run `nvidia-xconfig` to generate the xorg configs

More explaination
1. Adding drm kernel enable DRM
2. The Nvidia modules allows for other stuff (xorg) to interact with the DRM
3. NIL
4. You can check the configs and outputs in these dirs
    1. logs
        1. ~/.local/share/xorg/Xorg.0.log
        2. /var/log/Xorg.0.log
    2. settings
        1. /usr/share/X11/
        2. /etc/X11



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