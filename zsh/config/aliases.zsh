if [[ $(uname) == "Darwin" ]]; then
    export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
elif [[ $(uname) == "Linux" ]]; then
    alias mv='mv --interactive --verbose'
    alias cp='cp --interactive --verbose'
    alias ln='ln --interactive --verbose'
    alias du='du --max-depth=1 --si'
    alias df='df --all --si --print-type'
fi

# Core Shortcuts
alias grep="grep --color='auto'" # Grep with colors.
alias ls="ls --color=auto"

# Custom Shortcuts
alias nv="$EDITOR"
alias g='git'

### Custom Alias
alias k='kubectl'
alias zs='source ~/.zshrc'
alias ze='nvim ~/.zshrc'
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
