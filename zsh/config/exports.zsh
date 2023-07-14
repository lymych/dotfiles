#path=(
#  $path
#)

# macOS specific exports.
if ([[ $OSTYPE =~ 'darwin*' ]]) {
 export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
}

# Basics
export EDITOR=nvim
# export LANG='en_US.UTF-8'

# terraform
export TERRAGRUNT_DOWNLOAD="${HOME}/sre/tmp/.terragrunt_cache"
export TF_PLUGIN_CACHE_DIR="${HOME}/.terraform.d/plugin-cache"
export TF_PLUGIN_CACHE_MAY_BREAK_DEPENDENCY_LOCK_FILE=true
export TF_CLI_ARGS_apply=--parallelism=50
export TF_CLI_ARGS_plan=--parallelism=50
export TF_CLI_ARGS_destroy=--parallelism=50
export TERRAGRUNT_APPLY=local

# aws
export AWS_CA_BUNDLE=/opt/homebrew/etc/ca-certificates/cert.pem

# fzf
export FZF_DEFAULT_COLORS='--color=fg:-1,bg:-1,hl:#bd93f9,fg+:#f8f8f2,bg+:#22212c,hl+:#bd93f9,info:#ffb86c,prompt:#50fa7b,pointer:#9580FF,marker:#9580FF,spinner:#ffb86c,header:#6272a4'
export FZF_DEFAULT_OPTS="\
  $FZF_DEFAULT_COLORS \
  --no-mouse \
  --reverse \
  --multi \
  --preview-window='right:60%:wrap'"
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_COMPLETION_TRIGGER='~~'
