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
export KNOWLEDGE_VAULT_PATH="$HOME/self/zettelkasten/"
export PATH="$PATH:$HOME/.cargo/bin"
alias tosrc="cd $HOME/src/timebeat"
alias tonotes="cd $HOME/self/zettelkasten/"
alias tocfg="cd $HOME/self/dotfiles/"
alias tooss="cd $HOME/oss/"
