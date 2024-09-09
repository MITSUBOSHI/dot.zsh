export BLOCKSIZE=K
export EDITOR=vi

# ------------------------------
# Ruby
# ------------------------------
if [[ -x "`which rbenv`" ]] ; then
  # rbenv
  eval "$(rbenv init - zsh)"
elif [[ -s $HOME/.rvm/scripts/rvm ]] ; then
  # rvm
  source $HOME/.rvm/scripts/rvm
fi

if [[ -d /usr/local/go/bin ]] ; then
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
fi

# ------------------------------
# go
# ------------------------------
if [[ -d $HOME/.goenv  ]] ; then
  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"
  export GOENV_DISABLE_GOPATH=1
  eval "$(goenv init -)"
fi

if [[ -d $HOME/go ]] ; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
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
if  [[ -x "`which direnv`" ]] ; then
  eval "$(direnv hook zsh)"
fi

# ------------------------------
# opam
# ------------------------------
if  [[ -x "`which opam`" ]] ; then
   source "$HOME/.opam/opam-init/init.zsh"
fi

# ------------------------------
# asdf
# ------------------------------
if  [[ -x "`which asdf`" ]] ; then
  source `echo -e "$(brew --prefix asdf)/libexec/asdf.sh"`
fi
# ------------------------------
# pyenv
# ------------------------------
if  [[ -d $HOME/.pyenv ]] ; then
  export PYENV_ROOT=$HOME/.pyenv
  export PATH=$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init -)"
fi

# ------------------------------
# PostgreSQL
# ------------------------------
export PGDATA=/usr/local/var/postgres

# ------------------------------
# JVM SBT
# ------------------------------
export SBT_OPTS='-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=1024M'

# ------------------------------
# Haskell
# ------------------------------
if [[ -d $HOME/.cabel ]] ; then
  export PATH=$PATH:$HOME/.cabal/bin
fi

# ------------------------------
# kubectl krew
# ------------------------------
if [[ -d $HOME/.krew ]] ; then
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

# ------------------------------
# User local script
# ------------------------------
if [[ -d $HOME/bin ]] ; then
  export PATH=$PATH:$HOME/bin
fi

# ------------------------------
# nvm
# ------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# ------------------------------
# volta
# ------------------------------
if [[ -d $HOME/.volta ]] ; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
fi

# ------------------------------
# user custom commands
# ------------------------------
. $SCRIPT_DIR/skinny.sh
. $SCRIPT_DIR/_skinny

function sushi() {
	ruby -e 'C=`stty size`.scan(/\d+/)[1].to_i;S="\xf0\x9f\x8d\xa3";a={};puts "\033[2J";loop{a[rand(C)]=0;a.each{|x,o|;a[x]+=1;print "\033[#{o};#{x}H \033[#{a[x]};#{x}H#{S} \033[0;0H"};$stdout.flush;sleep 0.01}'
}
