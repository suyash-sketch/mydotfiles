#!/bin/bash

# exit immediately if a command exits with a non zero status
set -e

# get the absolute path to the dotfiles dir 
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


echo "Starting system setup..."

# 1. detect OS and install package-manager tools
if [ -f /etc/os-release ]; then
    . /etc/os-release

    if [ "$ID" = "fedora" ]; then
        echo "Detected Fedora. Installing tools via dnf..."
        sudo dnf install -y zsh tmux neovim fastfetch curl

    elif [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
        echo "Detected ubuntu/debian. installing tools via apt..."
        sudo apt update
        sudo apt install -y zsh tmux neovim fastfetch curl
    else
        echo "Unsupported operating system: $ID. Please install zsh, tmux, neovim, fastfetch, curl manually."
    fi
else
    echo "Could not detect operating system. Please install zsh, tmux, neovim, fastfetch, curl manually."
fi

# 2. install starship via official script
if ! command -v starship &> /dev/null; then
    echo "Installing starship..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
else
    echo "starship is already installed."
fi 

# 3. create the target directories if they don't exist
echo "Creating necessary directories..."
mkdir -p ~/.config

# 4. Symlink standard home directory files 
echo "linking home directory files..."
ln -sfn "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc

# 5. symlink ~/.config directories
ln -sfn "$DOTFILES_DIR/fastfetch" ~/.config/fastfetch
ln -sfn "$DOTFILES_DIR/ghostty" ~/.config/ghostty 
ln -sfn "$DOTFILES_DIR/nvim" ~/.config/nvim
ln -sfn "$DOTFILES_DIR/starship" ~/.config/starshipstarship.toml
ln -sfn "$DOTFILES_DIR/tmux" ~/.config/tmux

# 6. change default shell to zsh
if [ "$SHELL" != "/usr/bin/zsh" ] && [ "$SHELL" != "/bin/zsh" ]; then
    echo "Changing default shell to zsh..."
    ZSH_PATH=$(which zsh)
    chsh -s "$ZSH_PATH"
fi

echo "Done! your system is fully set up"
