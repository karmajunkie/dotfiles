export EDITOR='vim -f'
set -o vi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#export NVM_DIR="/Users/keith/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

. ~/.bash_aliases
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
local        BLUE="\[\033[0;34m\]"
local         RED="\[\033[0;31m\]"
local   LIGHT_RED="\[\033[1;31m\]"
local       GREEN="\[\033[0;32m\]"
local LIGHT_GREEN="\[\033[1;32m\]"
local       WHITE="\[\033[1;37m\]"
local  LIGHT_GRAY="\[\033[0;37m\]"
local  BLACK="\[\033[0;30m\]"
case $TERM in
  xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
  *)
    TITLEBAR=""
    ;;
esac

export PS1="${TITLEBAR}\
  $BLUE[$RED\$(date +%H:%M)$BLUE]\
  $BLUE[$RED\w$GREEN\$(parse_git_branch)$BLUE]\
  $GREEN$LIGHT_GRAY\$ "
export PS2='> '
export PS4='+ '
}
proml
[ -s "$HOME/.bash_local" ] && . "$HOME/.bash_local"  # vm-local stuff


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
