# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt nomatch
unsetopt autocd beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lfong/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
