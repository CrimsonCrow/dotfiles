# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ "$TERM" == "linux" ]; then
  PS1='[\u@\h \W]\$ '
else
  PS1='[\[\033[01;31m\]\u@\h\[\033[00m\]] \[\033[01;34m\]\w \[\033[00m\]\n❯ '
fi

source ~/.config/.aliases

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
