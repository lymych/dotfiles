# Insert Mode
# bindkey -M viins '^K' up-history
# bindkey -M viins '^J' down-history
# bindkey -M viins '^F' vi-forward-char
# bindkey -M viins '^U' backward-kill-line
# bindkey -M viins '^?' backward-delete-char
# bindkey -M viins '^[[3~' delete-char
# bindkey -M viins '^R' user-fuzzy-history
# bindkey -M viins '^P' user-fuzzy-select

# Normal Mode
# bindkey -M vicmd 'j' down-line # Override `down-line-or-history`.
# bindkey -M vicmd 'k' up-line # Override `up-line-or-history`.
# bindkey -M vicmd 'sr' change-surround
# bindkey -M vicmd 'sd' delete-surround
# bindkey -M vicmd 'sa' add-surround

# Visual Mode
# bindkey -M visual 'sa' add-surround
# foreach char ({a,i}{\',\",\`}) { bindkey -M visual $char select-quoted } && unset char
# foreach char ({a,i}${(s..)^:-'()[]{}<>bB'}) { bindkey -M visual $char select-bracketed } && unset char

# Operator Mode
# foreach char ({a,i}{\',\",\`}) { bindkey -M viopp $char select-quoted } && unset char
# foreach char ({a,i}${(s..)^:-'()[]{}<>bB'}) { bindkey -M viopp $char select-bracketed } && unset char

# Completion Mode
# bindkey -M menuselect '^?' undo
# bindkey -M menuselect '^I' menu-complete
# bindkey -M menuselect '^[[Z' reverse-menu-complete

### old

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Use emacs key bindings
bindkey -e

# [PageUp] - Up a line of history
if [[ -n "${terminfo[kpp]}" ]]; then
  bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
  bindkey -M viins "${terminfo[kpp]}" up-line-or-history
  bindkey -M vicmd "${terminfo[kpp]}" up-line-or-history
fi
# [PageDown] - Down a line of history
if [[ -n "${terminfo[knp]}" ]]; then
  bindkey -M emacs "${terminfo[knp]}" down-line-or-history
  bindkey -M viins "${terminfo[knp]}" down-line-or-history
  bindkey -M vicmd "${terminfo[knp]}" down-line-or-history
fi

# Start typing + [Up-Arrow] - fuzzy find history forward
if [[ -n "${terminfo[kcuu1]}" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search

  bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# Start typing + [Down-Arrow] - fuzzy find history backward
if [[ -n "${terminfo[kcud1]}" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search

  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# [Home] - Go to beginning of line
if [[ -n "${terminfo[khome]}" ]]; then
  bindkey -M emacs "${terminfo[khome]}" beginning-of-line
  bindkey -M viins "${terminfo[khome]}" beginning-of-line
  bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
fi
# [End] - Go to end of line
if [[ -n "${terminfo[kend]}" ]]; then
  bindkey -M emacs "${terminfo[kend]}"  end-of-line
  bindkey -M viins "${terminfo[kend]}"  end-of-line
  bindkey -M vicmd "${terminfo[kend]}"  end-of-line
fi
