# Apps
abbr -S -q nv='nvim'
abbr -S -q k='kubectl'
abbr -S -q g='git'

### Custom Alias
abbr -S -q zs='source ~/.zshrc'
abbr -S -q ze='nvim ~/.zshrc'
abbr -S -q dot='cd ~/dotfiles/'
abbr -S -q cb="brew upgrade; brew cleanup; brew doctor; brew autoremove"

## Terraform
abbr -S -q tf='terraform'
abbr -S -q tfa='terraform apply'
abbr -S -q tfd='terraform destroy'
abbr -S -q tff='terraform fmt'
abbr -S -q tfi='terraform init'
abbr -S -q tfo='terraform output'
abbr -S -q tfp='terraform plan'
abbr -S -q tfv='terraform validate'
abbr -S -q tg='terragrunt'
abbr -S -q tga='terragrunt apply'
abbr -S -q tgd='terragrunt destroy'
abbr -S -q tgf='terragrunt hclfmt'
abbr -S -q tgi='terragrunt init'
abbr -S -q tgo='terragrunt output'
abbr -S -q tgp='terragrunt plan'
abbr -S -q tgv='terragrunt validate'

## AWS
abbr -S -q ssm='aws ssm start-session --target'
abbr -S -q asgci='aws sts get-caller-identity'

## github
abbr -S -q ghprc='git push && gh pr create -B main -f'

# usage: kubectl logs {pod} rnl
abbr -S -q rntl="| sed 's/\\\n\\\t/\'$'\n\t''/g'" # newline and tab
abbr -S -q rnl="| sed 's/\\\n/\'$'\n''/g'"        # only new line
