# Finish if there isn't a plugins directory.
if (! [[ -d "$ZSH_CONFIG_PATH/plugins/" ]]) {
  return 1
}
# powerlevel10k: theme for Zsh
source "$ZSH_CONFIG_PATH/theme/powerlevel10k/powerlevel10k.zsh-theme"

# zsh-autopair: Insert or delete brackets, parens, quotes in pair.
# source "$ZSH_CONFIG_PATH/plugins/autopair/autopair.zsh"

# zsh-system-clipboard: Synchronize system clipboard with ZLE registers.
# source "$ZSH_CONFIG_PATH/plugins/system-clipboard/zsh-system-clipboard.zsh"

# zsh-autosuggestions: Fish-like auto-suggestions.
source "$ZSH_CONFIG_PATH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# fast-syntax-highlighting: Syntax highlighting support.
source "$ZSH_CONFIG_PATH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
  FAST_HIGHLIGHT_STYLES[${FAST_THEME_NAME}unknown-token]='fg=red'

zle_highlight=('paste:none')
