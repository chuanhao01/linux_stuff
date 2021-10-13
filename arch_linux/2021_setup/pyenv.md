# pyenv setup

Using pyenv, because I can't be bothered to track python versions

## Steps

1. pacman install pyenv
   1. This installs the binary
   2. Not sure if it works as intended hmm...
2. set up pyenv in zsh
   1. This is specific for zsh, because from github project

```bash
sudo pacman -S pyenv

# In ~/.config/zsh/export.zsh (the zsh configs)
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
```

## Notes

1. When installed, do not touch system python as much as possible
   1. This might affect how other applications use python
   2. So leave it alone, will be updated and handled by pacman
2. Main use is for per project python version control
