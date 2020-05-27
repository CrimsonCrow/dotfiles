# conf
#loads
# enabled colors and change prompt
autoload -U colors && colors
# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# tab autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# export alias
source ~/.config/.aliases

if [[ $TERM == "linux" ]]; then
  PROMPT='[%n@%m] %~ $ '
else
  # custom third party themes
  source ~/.config/zsh/themes/oxide.zsh-theme
  # zsh-autosuggestions
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null
fi
# load zsh-syntax-highlighting; this should be last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null

