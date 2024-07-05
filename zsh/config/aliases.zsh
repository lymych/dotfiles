if [[ $(uname) == "Linux" ]]; then
    alias mv='mv --interactive --verbose'
    alias cp='cp --interactive --verbose'
    alias ln='ln --interactive --verbose'
fi

# General UNIX
alias df="df -sh"
alias du="du -sh"

# Core Shortcuts
alias grep="grep --color='auto'" # Grep with colors.
alias ls="ls --color=auto"

# AWS
alias aec2="aws ec2 describe-instances --output text --query 'Reservations[*].Instances[*].[InstanceId, Tags[?Key==\`product\`].Value | [0], Tags[?Key==\`Name\`].Value | [0] ]' --no-cli-pager --output=table"

# FZF
alias list_repos="ls -d ~/sre/github/*/ | cut -d/ -f6 | fzf --bind='enter:execute($EDITOR ~/sre/github/{+})'"
