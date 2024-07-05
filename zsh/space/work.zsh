# Work environment
export AWS_CA_BUNDLE=/opt/homebrew/etc/ca-certificates/cert.pem
export NODE_EXTRA_CA_CERTS=/usr/local/etc/pki/rbua.pem

# Work aliases
abbr -S -q kcurl='kubectl run -t -i --rm curl --image harbor.avalaunch.aval/docker-hub-proxy/radial/busyboxplus:curl --overrides="{ \"apiVersion\": \"v1\", \"spec\": { \"nodeSelector\": { \"node-purpose\": \"compute\" } } }"'
abbr -S -q work='cd ~/sre/github'
abbr -S -q infra='cd ~/sre/github/ua-avalaunch-terragrunt/aws/payments'
abbr -S -q rdig='dig @10.191.50.50 +short'

# Work functions
aws_login () {
    cat ~/Downloads/credentials > ~/.aws/config
    echo '\nregion=eu-central-1' >> ~/.aws/config
    aws sts get-caller-identity --output yaml
}
