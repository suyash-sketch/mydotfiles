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
        sudo dnf install -y zsh tmux neovim fastfetch helix curl zsh-autosuggestions zsh-syntax-highlighting unzip fontconfig
    elif [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
        echo "Detected ubuntu/debian. installing tools via apt..."
        sudo apt update
        sudo apt install -y zsh neovim fastfetch helix curl zsh-autosuggestions zsh-syntax-highlighting unzip fontconfig
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

# 3. install herdr via official script
if ! command -v herdr &> /dev/null; then
    echo "Installing herdr..."
    curl -fsSL https://herdr.dev/install.sh | sh
else
    echo "herdr is already installed."
fi

# Install Nerd Fonts if a display is present AND we are NOT in WSL
# WSL via cmd, powershell etc, cannot read fonts stored inside the Linux ~/.local/share/fonts directory. You will still see broken icons.
if { [ -n "$WAYLAND_DISPLAY" ] || [ -n "$DISPLAY" ]; } && ! grep -qi microsoft /proc/version; then
    FONT_NAME="JetBrainsMono"
    FONT_DIR="$HOME/.local/share/fonts"
    
    if fc-list : family | grep -qi "$FONT_NAME Nerd Font"; then
        echo "$FONT_NAME Nerd Font is already installed."
    else
        echo "Installing $FONT_NAME Nerd Font..."
        mkdir -p "$FONT_DIR"
        
        # Download latest zip of the font from GitHub
        TEMP_ZIP="/tmp/${FONT_NAME}.zip"
        URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT_NAME}.zip"
        
        curl -sL "$URL" -o "$TEMP_ZIP"
        unzip -q "$TEMP_ZIP" -d "$FONT_DIR"
        rm "$TEMP_ZIP"
        
        # Refresh system font cache
        fc-cache -f -v > /dev/null 2>&1
        echo "Nerd Font installed successfully."
    fi
else
    echo "Headless environment detected. Skipping Nerd Font installation."
fi


# 3. create the target directories if they don't exist
echo "Creating necessary directories..."
mkdir -p ~/.config

# 4. Symlink standard home directory files 
echo "linking home directory files..."
ln -sfn "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc

# 5. symlink ~/.config directories
ln -sfn "$DOTFILES_DIR/fastfetch" ~/.config/fastfetch
ln -sfn "$DOTFILES_DIR/nvim" ~/.config/nvim
ln -sfn "$DOTFILES_DIR/starship" ~/.config/starship
ln -sfn "$DOTFILES_DIR/tmux" ~/.config/tmux
ln -sfn "$DOTFILES_DIR/herdr" ~/.config/herdr
ln -sfn "$DOTFILES_DIR/helix" ~/.config/helix

# 5b. Symlink GUI tools ONLY if a display is detected (Skips on EC2)
if [ -n "$WAYLAND_DISPLAY" ] || [ -n "$DISPLAY" ]; then
    echo "Graphical environment detected. Linking Ghostty..."
    ln -sfn "$DOTFILES_DIR/ghostty" ~/.config/ghostty 
else
    echo "Headless environment detected. Skipping Ghostty."
fi

# 6. change default shell to zsh
if [ "$SHELL" != "/usr/bin/zsh" ] && [ "$SHELL" != "/bin/zsh" ]; then
    echo "Changing default shell to zsh..."
    ZSH_PATH=$(which zsh)
    chsh -s "$ZSH_PATH"
fi

echo "Done! your system is fully set up"
