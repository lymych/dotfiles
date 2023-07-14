create_link() {
  #TODO create backup
  bkp_date=`date -Iseconds`
  file=$1
  if [[ ! -L .${file} && -f .${file} ]] ; then
    mv .${file} .${file}-${bkp_date}
  fi
  ln -sf $ZSH_CONFIG_PATH/$file ~/.$file
}

git submodule update --init --recursive

# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
ZSH_CONFIG_PATH=`dirname $SCRIPT`

# sed -i 's/search_string/replace_string/' ./zshrc

config_files=('zshenv' 'zshrc' 'p10k.zsh')

for i in $config_files; do create_link $i; done
