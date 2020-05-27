# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# bash history config
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# history size and history file size
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize

# bash shell prompt config
if [ "$TERM" == "linux" ]; then
  PS1='[\u@\h \W]\$ '
else
  PS1='[\[\033[01;31m\]\u@\h\[\033[00m\]] \[\033[01;34m\]\w \[\033[00m\]\n❯ '
fi

source ~/.config/.aliases

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
