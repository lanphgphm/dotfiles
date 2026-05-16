#!/bin/bash
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# standalone config files
cp "$DOTFILES_DIR/.zshrc" ~/.zshrc              # zsh runcommands
cp "$DOTFILES_DIR/.gitconfig" ~/.gitconfig      # global git config

# Apply NixOS configuration
sudo cp "$DOTFILES_DIR/configuration.nix" /etc/nixos/configuration.nix

# Apply .config directories
configs=(
    "kitty"
    "nvim"
    "xfce4"
    "opencode/opencode.json"
)

for config in "${configs[@]}"; do
    src="$DOTFILES_DIR/.config/$config"
    dest=~/.config/"$config"
    if [ -d "$src" ]; then
        rsync -av --delete "$src"/ "$dest"/
    elif [ -f "$src" ]; then
        mkdir -p "$(dirname "$dest")"
        cp "$src" "$dest"
    fi
done

echo "Apply complete! Dotfiles have been installed."
