# import original functions
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes
# to end of it)
#
bindkey -e

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
zle -N do_enter
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward
bindkey '^m' do_enter

# peco
which peco > /dev/null 2>&1
local which_peco=$?

if [ $which_peco -eq 0 ]; then
  function peco-history-selection() {
      BUFFER=`history -n 1 | tac | awk '!a[$0]++' | peco`
      CURSOR=$#BUFFER
      zle reset-prompt
  }

  zle -N peco-history-selection
  bindkey '^R' peco-history-selection
fi
