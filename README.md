# dotfiles

## Requirements

Install next utils:

- taskfile
- git

## Install

1. Install requirements utils
2. Clone repository to the ~/dotfiles
3. Run `task install`

## Submodule Update

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
