# aws
al () {
  cat ~/Downloads/credentials > ~/.aws/config
  echo '\nregion=eu-central-1' >> ~/.aws/config
  # echo "AWS Account: $(aws sts get-caller-identity --query Account --no-verify-ssl --output text 2>/dev/null)"
  aws sts get-caller-identity --output yaml
}

ssm () {
  aws ssm start-session --target $1
}

# proxy
hproxy_set () {
  export HTTP_PROXY_PASSWORD=$(security find-generic-password -ga "$USER" -s 'PROXY_PASSWORD' -w)
  export NO_PROXY="localhost,svc,aval,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,rbinternational.corp,rbi.tech"
  export HTTP_PROXY="http://${USER}:${HTTP_PROXY_PASSWORD}@rbaproxy.inet-dmz.kv.aval:8000"
  export HTTPS_PROXY="http://${USER}:${HTTP_PROXY_PASSWORD}@rbaproxy.inet-dmz.kv.aval:8000"
}
hproxy_unset () {
  unset HTTP_PROXY_PASSWORD
  unset NO_PROXY
  unset HTTP_PROXY
  unset HTTPS_PROXY
}

# fzf
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Generate authentication keys for SSH.
function gen-ssh-keygen-ed25519() {
  ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/keys/$1 -C "$2"
}
function gen-ssh-keygen-rsa() {
  ssh-keygen -t rsa -o -a 100 -b 4096 -f ~/.ssh/keys/$1 -C "$2"
}
