if [[ $(uname) == "Darwin" ]]; then
    export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
fi

# Basics
export EDITOR=nvim
export LANG='en_US.UTF-8'

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
  --border=sharp \
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
"
