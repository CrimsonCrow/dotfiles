# conf
#loads
# enabled colors and change prompt
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

# export alias
source ~/.config/aliases

# true-color
source $HOME/.vim/pack/default/start/gruvbox/gruvbox_256palette.sh

# key bindings
# alt-arrow
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Home, End, Del
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

if [[ $TERM == "linux" ]]; then
  PROMPT='[%n@%m] %~ $ '
else
  # custom third party themes
  source ~/.config/zsh/themes/oxide.zsh-theme
  # zsh-autosuggestions
  if [ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null
  fi
fi
# load zsh-syntax-highlighting; this should be last
if [ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
fi
