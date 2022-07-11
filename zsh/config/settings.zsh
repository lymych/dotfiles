# Completion
autoload -Uz compinit
compinit
autoload -U +X bashcompinit && bashcompinit
zmodload zsh/complist

# Zsh Line Editor
unsetopt BEEP # Turn off all beeps
# unsetopt LIST_BEEP # Turn off autocomplete beeps

# Changing Directories
setopt NO_POSIX_CD # Make cd command POSIX incompatible
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# Complete
complete -o nospace -C ${HOME}/bin/terraform terraform
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
[[ $commands[helm] ]] && source <(helm completion zsh)
[[ $commands[podman] ]] && source <(podman completion zsh)

zstyle ':completion:*' menu select # Use completion menu for completion when available
zstyle ':completion:*' rehash true # When new programs is installed, auto update without reloading
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s#:#)LS_COLORS} # Match dircolors with completion schema
# setopt COMPLETE_ALIASES # Prevent aliases from being substituted before completion is attempted
setopt COMPLETE_IN_WORD # Attempt to start completion from both ends of a word
setopt GLOB_COMPLETE # Don't insert anything resulting from a glob pattern, show completion menu
setopt NO_LIST_BEEP # Don't beep on an ambiguous completion
setopt LIST_PACKED # Try to make the completion list smaller by drawing smaller columns
compdef g='git' # Trigger git completions for g alias

# History
typeset -g HISTFILE="${HOME}/.zsh_history" # Where history logs are stored
typeset -g HISTSIZE=100000 # The maximum number of events stored in the internal history list
typeset -g SAVEHIST=$HISTSIZE # The maximum number of history events to save in the history file
setopt HIST_SAVE_NO_DUPS # Don't write duplicate entries in the history file
setopt HIST_IGNORE_DUPS # Don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate
setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY # Share history between all sessions
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording an entry
setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space
setopt EXTENDED_HISTORY # Save each command's epoch timestamps and the duration in seconds
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history
setopt HIST_VERIFY # Don't execute the line directly instead perform history expansion

# Plugins
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
