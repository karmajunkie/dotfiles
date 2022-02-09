if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
if [ -f $HOME/.bash_aliases ]; then
  . $HOME/.bash_aliases
fi

function tabname {
  if [ -z $TMUX ] ; then
    printf "\e]1;$@\a"
  else
   tmux rename-window $@
  fi
}

export EDITOR='vim'
export GOPATH="$HOME/golang"
#export GOROOT="/usr/local/Cellar/go/1.4.1/bin"
set -o vi
export PATH="./bin:$HOME/bin:/usr/local/bin:$HOME/golang/bin:/usr/local/share/npm/bin:$PATH"
export ERL_AFLAGS="-kernel shell_history enabled"


function za { zeus rspec "spec/acceptance/$1"; }
function ga { git add "./**/$1";}

function getpw { yq r "/Users/keith/code/contractsimply/infrastructure/kubernetes/helm/dozer/$1.secrets.yaml" secrets.VIEW_DATA_DB_PASSWORD -t; }
export -f getpw

alias gsql_prod="gcloud beta sql connect readstore-739d7671 --user=dozer --database=dozer_readstore --project=rabbet-prod --quiet"
alias gsql_staging="gcloud beta sql connect readstore-2d61387a --user=dozer --database=dozer_readstore --project=rabbet-staging --quiet"


export -f za
export -f ga

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
  $BLUE[$(scutil --get LocalHostName):$RED\w$GREEN\$(parse_git_branch)$BLUE]\
  $GREEN$LIGHT_GRAY\$ "
export PS2='> '
export PS4='+ '
}
proml
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#[[ -s "/usr/local/opt/asdf/asdf.sh" ]] && source /usr/local/opt/asdf/asdf.sh
#[[ -s "$HOME/.asdf/completions/asdf.bash" ]] && source  $HOME/.asdf/completions/asdf.bash
export PATH="/usr/local/sbin:$PATH"
[[ -s "$HOME/.bash_local" ]] && source "$HOME/.bash_local"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/usr/local/opt/postgresql/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export ERL_COMPILER_OPTIONS='[]'
export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; '
#:"$PROMPT_COMMAND";
alias bledit='emacsclient -a= -nw -s blweb'

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

export PATH="$HOME/.cargo/bin:$PATH"

_direnv_hook() {
  local previous_exit_status=$?;
  eval "$("/usr/local/bin/direnv" export bash)";
  return $previous_exit_status;
};
if ! [[ "${PROMPT_COMMAND:-}" =~ _direnv_hook ]]; then
  PROMPT_COMMAND="_direnv_hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
fi
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
