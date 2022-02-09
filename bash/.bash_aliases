#    __define_git_completion () {
#    eval "
#        _git_$2_shortcut () {
#            COMP_LINE=\"git $2\${COMP_LINE#$1}\"
#            let COMP_POINT+=$((4+${#2}-${#1}))
#            COMP_WORDS=(git $2 \"\${COMP_WORDS[@]:1}\")
#            let COMP_CWORD+=1
#
#            local cur words cword prev
#            _get_comp_words_by_ref -n =: cur words cword prev
#            _git_$2
#        }
#    "
#    }
#
#    __git_shortcut () {
#        type _git_$2_shortcut &>/dev/null || __define_git_completion $1 $2
#        alias $1="git $2 $3"
#        complete -o bashdefault -o default -o nospace -F _git_$2_shortcut $1
#    }
#
#__git_shortcut  ga   add
#__git_shortcut  gb   branch
#__git_shortcut  gc   commit
#__git_shortcut  gd   diff
#__git_shortcut  gco  checkout
#__git_shortcut  gst  status
#__git_shortcut  gcp  cherry-pick

alias k9='kill -9'
alias powfix='~/powfix.sh'
alias ttr='touch tmp/restart.txt'
alias kj='cd ~/code/karmajunkie'
alias be="bundle exec"
alias bec="bundle exec cucumber"
#alias gst="git status"
#alias gco="git checkout"
alias grc="git rebase --continue"
alias glo="git log --format=oneline"
alias git_branch_cleanup="git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -D"
alias bo="vi ~/.bash_profile"
alias bp="source ~/.bash_profile"
alias cheer='afplay ~/code/happykids.wav'
alias psg='ps aux|grep'
alias xo='cd ~/code/xo/'
alias em='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias tmi='tmuxinator'
alias tm='tmux'
alias tma='tmux -CC a'
alias ec='emacsclient -a= -nw -s'
alias dpsql="psql -h localhost -U postgres"
alias dco="docker-compose -f ~/code/intf/intf-docker-library/docker-compose.yml"
alias tpsql="psql -h localhost -p 5435 -U keith postgres"
alias signin="eval \$(op signin)"
alias ifpw="op get item 'Amazon (interfolio)' --fields password | pbcopy"
alias ifotp="op get totp 'Amazon (interfolio)'"
alias ifmfa="awsmfa --identity-profile interfolio --target-profile interfolio-mfa -c \$(op get totp 'Amazon (interfolio)')"

alias deploy_tag='(){ TAG=$1 && git tag ${TAG} -f && (git push origin :${TAG} || true) && git push origin ${TAG} ;}'

export KERL_CONFIGURE_OPTIONS="--disable-silent-rules --enable-shared-zlib --enable-dynamic-ssl-lib --enable-hipe --enable-smp-support --enable-threads --enable-kernel-poll --enable-wx --enable-darwin-64bit --with-ssl=$(brew --prefix openssl)"
alias d1="dayone2"
alias re="reminders"
