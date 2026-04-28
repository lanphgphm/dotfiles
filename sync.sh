DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# standalone config files
cp ~/.zshrc "$DOTFILES_DIR/.zshrc"          # zsh runcommands
cp ~/.gitconfig "$DOTFILES_DIR/.gitconfig"  # global git config

# Sync NixOS configuration
sudo cp /etc/nixos/configuration.nix "$DOTFILES_DIR/configuration.nix"

# Sync .config directories
configs=(
    "kitty"
    "nvim"
    "xfce4"
    "opencode/opencode.json"
)

for config in "${configs[@]}"; do
    src=~/.config/"$config"
    dest="$DOTFILES_DIR/.config/$config"
    if [ -d "$src" ]; then
        rsync -av --delete "$src"/ "$dest"/
    elif [ -f "$src" ]; then
        mkdir -p "$(dirname "$dest")"
        cp "$src" "$dest"
    fi
done

echo "Sync complete! You may now commit & push new dotfiles"
