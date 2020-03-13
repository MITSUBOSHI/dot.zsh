export BLOCKSIZE=K
export EDITOR=vi

# ------------------------------
# Ruby
# ------------------------------
if [[ -s /usr/local/bin/rbenv ]] ; then
  # rbenv
  eval "$(rbenv init - zsh)"
elif [[ -s $HOME/.rvm/scripts/rvm ]] ; then
  # rvm
  source $HOME/.rvm/scripts/rvm
fi

# ------------------------------
# goenv
# ------------------------------
if [[ -s ~/.goenv  ]] ; then
  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"
  export GOENV_DISABLE_GOPATH=1
  eval "$(goenv init -)"
fi

# ------------------------------
# phpenv
# ------------------------------
if [[ -x "`which phpenv`" ]] ; then
  eval "$(phpenv init - zsh)"
fi

# ------------------------------
# anyenv
# ------------------------------
if  [[ -x "`which anyenv`" ]] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

# ------------------------------
# direnv
# ------------------------------
if [[ -s /usr/local/bin/direnv ]] ; then
  eval "$(direnv hook zsh)"
fi

# ------------------------------
# asdf
# ------------------------------
if  [[ -x "`which asdf`" ]] ; then
  source /usr/local/opt/asdf/asdf.sh
fi
# ------------------------------
# pyenv
# ------------------------------
if [[ -s /usr/local/bin/pyenv ]] ; then
  export PYENV_ROOT=$HOME/.pyenv
  export PATH=$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init -)"
fi

# ------------------------------
# PostgreSQL
# ------------------------------
export PGDATA=/usr/local/var/postgres

# ------------------------------
# Java8
# ------------------------------
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# ------------------------------
# JVM SBT
# ------------------------------
export SBT_OPTS='-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=1024M'

# ------------------------------
# Android
# ------------------------------
export ANDROID_HOME=/Applications/android-sdk-macosx
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools

# ------------------------------
# Haskell
# ------------------------------
export PATH=$PATH:$HOME/.cabal/bin

# ------------------------------
# User local script
# ------------------------------
export PATH=$PATH:$HOME/bin

# ------------------------------
# nvm
# ------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# ------------------------------
# user custom commands
# ------------------------------
. $SCRIPT_DIR/skinny.sh
. $SCRIPT_DIR/_skinny

function sushi() {
	ruby -e 'C=`stty size`.scan(/\d+/)[1].to_i;S="\xf0\x9f\x8d\xa3";a={};puts "\033[2J";loop{a[rand(C)]=0;a.each{|x,o|;a[x]+=1;print "\033[#{o};#{x}H \033[#{a[x]};#{x}H#{S} \033[0;0H"};$stdout.flush;sleep 0.01}'
}
