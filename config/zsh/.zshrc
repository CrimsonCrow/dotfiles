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
