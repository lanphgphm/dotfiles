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

# format man pages
export GROFF_NO_SGR=1
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

alias tosrc="cd $HOME/src/timebeat && nvim ."
alias tosrconly="cd $HOME/src/timebeat"
alias tonotes="cd $HOME/me/zettelkasten/ && nvim ."
alias tocfgrepo="cd $HOME/me/dotfiles/"
alias tocfg="cd $HOME/.config && nvim ."
alias tooss="cd $HOME/oss/ && nvim ."
alias totb="ssh -p 651129 admin@localhost"
alias ssh="TERM=xterm-256color ssh"
alias towr="cd $HOME/src/wr"
alias to="cd"
alias togke="cd $HOME/src/gke-config/ && nvim ."
alias clearblanks="sed -i 's/[[:space:]]*$//' "
alias torvsim="cd $HOME/src/wr/riscv-gnu-toolchain"
alias totest="cd $HOME/src/hitl-tests/ && nvim ."
alias toatf="cd $HOME/artifacts/"
alias towork="ssh lfong@100.91.155.7"

portfwd() {
    ssh -L 65129:localhost:65129 root@"$1"
}

# Timebeat CLI on test server: usage `CLI "show opentimecard clockgen dpll status 2"`
CLI() {
    if [[ -z "$x" ]]; then 
        echo "Usage: CLI <X>"
        return 1 
    fi
    local x="$1"
    local host="10.101.101.${x}"
    sshpass -p '1234' ssh -o StrictHostKeyChecking=no root@$host \
      "sshpass -p 'pw' ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -p 65129 admin@localhost '$1'" \
      2>&1 | grep -v Warning
}

filecp() {
    local filepath="$1"
    local x="$2"

    if [[ -z "$filepath" || -z "$x" ]]; then
        echo "Usage: filecp <filepath> <X>"
        return 1
    fi

    if [[ ! -f "$filepath" ]]; then
        echo "Error: file '$filepath' not found"
        return 1
    fi

    local host="10.101.101.${x}"

    sshpass -p 1234 scp -o StrictHostKeyChecking=no "$filepath" "root@${host}:/root/phuong/"

    echo "copy file $filepath to $host done"
}

cfgcp() {
    local filepath="$1"
    local x="$2"
    local dest_fname="$3"

    if [[ -z "$filepath" || -z "$x" ]]; then
        echo "Usage: filecp <filepath> <X>"
        return 1
    fi

    if [[ ! -f "$filepath" ]]; then
        echo "Error: file '$filepath' not found"
        return 1
    fi

    local host="10.101.101.${x}"

    sshpass -p 1234 scp -o StrictHostKeyChecking=no "$filepath" "root@${host}:/etc/timebeat/${dest_fname}"

    echo "copy file $filepath to $host done"
}

cpsshkey() {
      local host="$1"
      local user="${2:-root}"
      local pw="${3:-1234}"

      if [[ -z "$host" ]]; then
          echo "Usage: cpsshkey <host> [user] [password]"
          return 1
      fi

      if [[ ! -f "$HOME/.ssh/agent_key.pub" ]]; then
          echo "Error: $HOME/.ssh/agent_key.pub not found"
          return 1
      fi

      sshpass -p "$pw" ssh-copy-id \
          -i "$HOME/.ssh/agent_key.pub" \
          -o StrictHostKeyChecking=accept-new \
          "$user@${host}"
      
      # Verify passwordless key auth actually works. Fabric needs BatchMode-clean.
      ssh -i "$HOME/.ssh/agent_key" \
          -o BatchMode=yes \
          -o StrictHostKeyChecking=accept-new \
          "$user@${host}" hostname \
          && echo "cpsshkey: OK — passwordless auth to $host is live" \
          || { echo "cpsshkey: FAILED verify — key present on remote but auth still refuses"; return 1; }
  }
