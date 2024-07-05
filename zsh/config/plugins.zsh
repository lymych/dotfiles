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

# zsh-abbr
source "$ZSH_CONFIG_PATH/plugins/zsh-abbr/zsh-abbr.zsh"

# load zsh-abbr, then

chroma_single_word() {
  (( next_word = 2 | 8192 ))

  local __first_call="$1" __wrd="$2" __start_pos="$3" __end_pos="$4"
  local __style

  (( __first_call )) && { __style=${FAST_THEME_NAME}alias }
  [[ -n "$__style" ]] && (( __start=__start_pos-${#PREBUFFER}, __end=__end_pos-${#PREBUFFER}, __start >= 0 )) && reply+=("$__start $__end ${FAST_HIGHLIGHT_STYLES[$__style]}")

  (( this_word = next_word ))
  _start_pos=$_end_pos

  return 0
}

register_single_word_chroma() {
  local word=$1
  if [[ -x $(command -v $word) ]] || [[ -n $FAST_HIGHLIGHT["chroma-$word"] ]]; then
    return 1
  fi

  FAST_HIGHLIGHT+=( "chroma-$word" chroma_single_word )
  return 0
}

# if [[ -n $FAST_HIGHLIGHT ]]; then
#   for abbr in ${(f)"$(abbr list-abbreviations)"}; do
#     if [[ $abbr != *' '* ]]; then
#       register_single_word_chroma ${(Q)abbr}
#     fi
#   done
# fi
