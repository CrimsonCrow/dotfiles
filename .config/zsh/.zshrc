# conf
#loads
# enabled colors and change prompt
autoload -U colors && colors

# vcs_info
#autoload -Uz vcs_info
#zstyle ':vcs_info:git:*' formats "%b"
#precmd() { vcs_info }


#setopt prompt_subst
# change promp here
PS1="%{$fg[white]%}[%{$reset_color%}%{$fg[green]%}%*%{$reset_color%} %{$fg[cyan]%}%~%{$reset_color%}%{$fg[white]%}]>%{$reset_color%} "

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# tab autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
#bindkey vi
#export KEYTIMEOUT=1

# use vim keys in tab complete mode
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

# export alias
source ~/.config/.aliases

# load zsh-syntax-highlighting; this should be last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
