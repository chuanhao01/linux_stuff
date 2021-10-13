# vifm setup

## For arch linux

1. pacman install vifm
2. Set up configs
   1. Either `XDG_CONFIG_HOME`
      1. This is easier
   2. Or `VIFM` variables

```bash
sudo pacman -S vifm
export XDG_CONFIG_HOME # get zsh config from dotfiles
~/.config/vifm
```

Everything should be inside the `~/.config/vifm` folder from `dotfiles`

## Notes

1. There might be some errors due to the wrong config loading, check the docs

## Reference

1. [arch vifm](https://wiki.archlinux.org/title/Vifm#Customizing_vifm)
2. [vifm config docs](https://wiki.vifm.info/index.php/Configuration_model)
