# Core Shortcuts
# alias mv='mv --interactive --verbose' # Move nodes with interactive mode and extra verbosity.
# alias cp='cp --interactive --verbose' # Copy nodes with interactive mode and extra verbosity.
# alias ln='ln --interactive --verbose' # Link nodes with interactive mode and extra verbosity.
alias grep="grep --color='auto'" # Grep with colors.
# alias du='du --max-depth=1 --si' # Display size of files and folders under current directory.
# alias df='df --all --si --print-type' # Display all disk usage statistics with SI units and FS types.

# Custom Shortcuts
alias v="$EDITOR"
alias g='git'

# git
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gst='git status'
alias gbl='!git --no-pager branch --verbose --all'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gd='git diff --stat=100,100 --patch'
alias gds='git diff --stat=100,100 --patch --staged'
alias gdt='git difftool'
alias gdts='git difftool --staged'
alias gf='git fetch'
alias gl='git log --graph --branches --remotes --tags --date=iso8601'
alias gr='git reflog --date=iso8601'
alias gs='git status --short'
alias gsm='git submodule'
alias gsw='git switch'
alias gprune-merged="!git branch --merged | grep --invert-match --extended-regexp '\\*|main|master' | xargs -n 1 git branch --delete"
alias gcm='git checkout main'
alias gcb='git checkout -b'

### Custom Alias
alias zs='source ~/.zshrc'
alias ze='nvim ~/.zshrc'
alias h='history'
alias hs='history | grep'
alias hsi='history | grep -i'
alias k='kubectl'
alias sre='cd ${HOME}/sre/'
alias infra='cd ${HOME}/sre/github/ua-avalaunch-terragrunt/live-infrastructure/payments'
alias gpom='git pull origin main'
alias rdig='dig @10.191.50.50 +short'
alias b039='ssh ec2-user@bastion.payments.rbua'
alias kcurl='k run -t -i --rm curl --image harbor.avalaunch.aval/docker-hub-proxy/radial/busyboxplus:curl --overrides="{ \"apiVersion\": \"v1\", \"spec\": { \"nodeSelector\": { \"node-purpose\": \"compute\" } } }"'
alias cb="brew upgrade; brew cleanup; brew doctor"

## Terraform
alias tf='terraform'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tff='terraform fmt'
alias tfi='terraform init'
alias tfo='terraform output'
alias tfp='terraform plan'
alias tfv='terraform validate'
alias tg='terragrunt'
alias tga='terragrunt apply'
alias tgd='terragrunt destroy'
alias tgf='terragrunt hclfmt'
alias tgi='terragrunt init'
alias tgo='terragrunt output'
alias tgp='terragrunt plan'
alias tgv='terragrunt validate'

## AWS
alias asgci='aws sts get-caller-identity'

## github
alias ghprc='gh pr create -B main -f'

# usage: kubectl logs {pod} rnl
alias -g rntl="| sed 's/\\\n\\\t/\'$'\n\t''/g'" # newline and tab
alias -g rnl="| sed 's/\\\n/\'$'\n''/g'"        # only new line
