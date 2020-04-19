# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias gdb='gdb -q'
alias xi='sudo xbps-install -S'
alias xr='sudo xbps-remove -R'
alias xq='xbps-query -Rs'
alias emcc='emacsclient'
alias screenfetch="screenfetch -d '-cpu;-gpu'"
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
