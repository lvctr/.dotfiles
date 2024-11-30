# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=/home/insti/.scripts/:$PATH

# ZINIT
source /usr/share/zinit/zinit.zsh

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

zinit snippet OMZP::sudo/sudo.plugin.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZP::colored-man-pages

zinit ice depth=1
zinit light romkatv/powerlevel10k

zmodload zsh/complist

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/insti/.zshrc'
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit
# End of lines added by compinstall

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

autoload -Uz select-word-style
select-word-style bash

# Keybinds
bindkey	"^[[1;5D"	backward-word			    # Alt  + Left
bindkey	"^[[1;5C"	forward-word		      # Alt  + Right
bindkey	"^[[1;3D"	backward-word         # Ctrl + Left
bindkey	"^[[1;3C"	forward-word          # Ctrl + Right
bindkey	"^H"      backward-kill-word    # Alt  + Backspace
bindkey '^W'      backward-delete-word  # Ctrl + Backspace

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

bindkey -M menuselect '^[[Z' reverse-menu-complete

# Alias
alias :q="exit"
alias :q!="exit"
alias gotop="gotop --color=solarized"
alias rebuild-qt-styles="yay -S qt5-styleplugins qt6gtk2 --rebuild"
alias rebuild-mpv="yay -S mpv-full --rebuild"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Make Flags
export MAKEFLAGS=-j16
export MAKEOPTS=-j16