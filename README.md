# dotfiles

## Requirements
Install next utils:
- zsh
- alacritty
- tmux
- fzf

## Install

### All dotfiles
1. Install requirements utils
2. Clone repository to the ~/dotfiles
3. Run script `zsh install.sh`

###  Specific config
1. Install requirements utils
2. Clone repository to the ~/dotfiles
3. Go to the specific folder
4. Run script `zsh install_zsh.sh`

## Update
```zsh
git pull
git submodule update --init --recursive
git submodule update --remote
```
## Tips

### Tmux

#### TPM
- `prefix + I` – (capital i, as in Install) to fetch the plugin
- `prefix + U` – updates plugin(s)
- `prefix + alt + u` – remove/uninstall plugins not on the plugin list

#### tmux-resurrect (save and restore session with)
- `prefix + Ctrl-s` – save
- `prefix + Ctrl-r` – restore

### Alacritty
