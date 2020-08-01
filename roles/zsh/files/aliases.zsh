###############################################################################
# BEGIN: Aliases

alias open="xdg-open"
alias vim="nvim"
alias x='exit'
alias c='clear'
alias cls='printf "\033c"'

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias rr='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias h='history'
alias hh='history | fzf'

# END: Aliases
###############################################################################
