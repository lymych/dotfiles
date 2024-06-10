# Core Shortcuts
# alias mv='mv --interactive --verbose' # Move nodes with interactive mode and extra verbosity.
# alias cp='cp --interactive --verbose' # Copy nodes with interactive mode and extra verbosity.
# alias ln='ln --interactive --verbose' # Link nodes with interactive mode and extra verbosity.
alias grep="grep --color='auto'" # Grep with colors.
alias ls="ls --color=auto"
# alias du='du --max-depth=1 --si' # Display size of files and folders under current directory.
# alias df='df --all --si --print-type' # Display all disk usage statistics with SI units and FS types.

# Custom Shortcuts
alias nv="$EDITOR"
alias g='git'

### Custom Alias
alias k='kubectl'
alias kcurl='k run -t -i --rm curl --image harbor.avalaunch.aval/docker-hub-proxy/radial/busyboxplus:curl --overrides="{ \"apiVersion\": \"v1\", \"spec\": { \"nodeSelector\": { \"node-purpose\": \"compute\" } } }"'
alias zs='source ~/.zshrc'
alias ze='nvim ~/.zshrc'
alias h='history'
alias hs='history | grep'
alias hsi='history | grep -i'
alias work='cd ${HOME}/sre/github'
alias infra='cd ${HOME}/sre/github/ua-avalaunch-terragrunt/aws/payments'
alias rdig='dig @10.191.50.50 +short'
alias b039='ssh ec2-user@bastion.payments.rbua'
alias cb="brew upgrade; brew cleanup; brew doctor; brew autoremove"

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
alias ssm='aws ssm start-session --target'
alias asgci='aws sts get-caller-identity'
alias aec2="aws ec2 describe-instances --output text --query 'Reservations[*].Instances[*].[InstanceId, Tags[?Key==\`product\`].Value | [0], Tags[?Key==\`Name\`].Value | [0] ]' --no-cli-pager --output=table"

## github
alias ghprc='git push && gh pr create -B main -f'

# usage: kubectl logs {pod} rnl
alias -g rntl="| sed 's/\\\n\\\t/\'$'\n\t''/g'" # newline and tab
alias -g rnl="| sed 's/\\\n/\'$'\n''/g'"        # only new line

# FZF
alias list_repos="ls -d ~/sre/github/*/ | cut -d/ -f6 | fzf --bind='enter:execute($EDITOR ~/sre/github/{+})'"
