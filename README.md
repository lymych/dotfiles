# dotfiles

## Requirements

Install next utils:

- zsh
- alacritty
- tmux
- fzf
- lazygit

## Install

### All dotfiles

1. Install requirements utils
2. Clone repository to the ~/dotfiles
3. Run script `zsh install.sh`

### Specific config

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

```zsh
mkdir -p ~/.config/tmux/
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/tmux/plugins ~/.config/tmux/plugins
```

#### TPM

- `prefix + I` – (capital i, as in Install) to fetch the plugin
- `prefix + U` – updates plugin(s)
- `prefix + alt + u` – remove/uninstall plugins not on the plugin list

#### tmux-resurrect (save and restore session with)

- `prefix + Ctrl-s` – save
- `prefix + Ctrl-r` – restore

### Alacritty

```zsh
mkdir -p ~/.config/alacritty
ln -sf ~/dotfiles/terminal/alacritty.toml ~/.config/alacritty/alacritty.toml
```

MacOS thin_strokes

```zsh
defaults write org.alacritty AppleFontSmoothing -int 0
defaults find AppleFontSmoothing
default delete
```

### Fonts

MacOS

```zsh
brew install font-meslo-lg-nerd-font
```

### Nvim

```zsh
brew install npm
ln -sf ~/dotfiles/nvim ~/.config/nvim
```
