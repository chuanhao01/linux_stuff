# zsh setup

This is mainly for zsh, ohmyzsh and powerlevel10k
Should be installed as the first thing on an arch install.

## Steps

1. pacman install zsh
2. install fonts
   1. ttf-meslo-nerd-font-powerlevel10k
   2. Used for terminal
3. Install ohmyzsh from github
   1. sh script
4. Setup ohmyzsh
   1. get from `dotfiles`
   2. install plugins
5. Install powerlevel10k
   1. From github into ohmyzsh plugin
6. Setup powerlevel10k
   1. get from `dotfiles`

```bash
sudo pacman -S zsh
yay -S ttf-meslo-nerd-font-powerlevel10k
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Installing Powerlevel10k as a oh-my-zsh plugin
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

~/.config/zsh
~/.p10k.zsh
```

## Notes

1. Remove fzf and other files before they are installed
2. May have some miss match for the configs, take note
