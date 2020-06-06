# enabled colors
autoload -U colors && colors

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

# key bindings
# alt-left-right-arrow
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
# ctrl-left-right-arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
#shift-up-down-arrow
bindkey "^[[1;2A" up-line
bindkey "^[[1;2B" down-line-or-history
# Home, End, Del
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# export alias
source ~/.config/aliases

# true-color
if [ -n $TMUX ]; then
 source $HOME/.vim/pack/default/start/gruvbox/gruvbox_256palette.sh
fi

# change prompt
if [[ $TERM == "linux" ]] || [[ $TERM == "xterm" ]]; then
	PROMPT='%n@%m:%~ %(!.#.%%) '
else
  # custom third party themes
	if [ -f $XDG_CONFIG_HOME/zsh/themes/oxide.zsh-theme ]; then
  	source $XDG_CONFIG_HOME/zsh/themes/oxide.zsh-theme
	else
		PROMPT='%n%(!.#.%%) '
	fi
  # zsh-autosuggestions
  if [ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null
  fi
fi

# load zsh-syntax-highlighting; this should be last
if [ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
fi
