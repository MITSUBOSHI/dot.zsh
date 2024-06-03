#expand aliases before completing
setopt complete_aliases # aliased ls needs if file/dir completions work

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias a=alias
alias du="du -h"
alias df="df -h"
alias h="history"
alias j="jobs -l"
alias la="ls -aF"
alias lf="ls -F"
alias ll="ls -lF"
alias lla="ls -alF"
alias sc="screen -D -RR"
alias screen="screen -D -RR"
alias su="su -l"
alias va="vagrant"
alias where="command -v"

alias urlencode="nkf -wMQ | tr = %"
alias urldecode="nkf --url-input"

if [ -d ~/.ssh/conf.d ]; then
  # feature "conf.d"
  alias ssh=": > ~/.ssh/config && echo '# DO NOT EDIT! Please edit conf.d/' >> ~/.ssh/config && find ~/.ssh/conf.d -type f | grep -v '/\.git' | xargs cat >> ~/.ssh/config; ssh"
fi

if  [[ -x "`which kde-open`" ]] ; then
  alias open="kde-open"
fi
