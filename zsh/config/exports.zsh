if [[ $(uname) == "Darwin" ]]; then
    export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
fi

# Basics
export EDITOR=nvim
export LANG='en_US.UTF-8'

# Tools
export BAT_THEME="ansi"

# Terraform
export TERRAGRUNT_DOWNLOAD="${HOME}/sre/tmp/.terragrunt_cache"
export TF_PLUGIN_CACHE_DIR="${HOME}/.terraform.d/plugin-cache"
export TF_PLUGIN_CACHE_MAY_BREAK_DEPENDENCY_LOCK_FILE=true
export TF_CLI_ARGS_apply=--parallelism=50
export TF_CLI_ARGS_plan=--parallelism=50
export TF_CLI_ARGS_destroy=--parallelism=50
export TERRAGRUNT_APPLY=local

# fzf
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
"
