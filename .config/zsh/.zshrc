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
#PS1="%{$fg[white]%}[%{$reset_color%}%{$fg[green]%}%*%{$reset_color%} %{$fg[cyan]%}%~%{$reset_color%}%{$fg[white]%}]>%{$reset_color%} "

# custom third party themes
source ~/.config/zsh/themes/oxide.zsh-theme

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
bindkey -v
export KEYTIMEOUT=1

# use vim keys in tab complete mode
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

# change cursor shape
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] ||
		[[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] ||
		[[ ${KEYMAP} == viins ]] ||
		[[ ${KEYMAP} = '' ]] ||
		[[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
	zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
	echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# export alias
source ~/.config/.aliases

# load zsh-syntax-highlighting; this should be last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
