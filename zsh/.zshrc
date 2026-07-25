
# ==========================================
# 1. Environment Variables & Paths
# ==========================================
export ANTHROPIC_BASE_URL="http://localhost:11434"
export ANTHROPIC_AUTH_TOKEN="ollama"
export TMUX_THEME="dracula"

# Base PATH (Clean and deduplicated, removing hardcoded usernames)
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:/usr/bin:/var/lib/snapd/snap/bin:$PATH"

# Add Go to PATH only if the Go directory actually exists
if [ -d "$HOME/go/bin" ]; then
    export PATH="$HOME/go/bin:/usr/local/go/bin:$PATH"
fi

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# ==========================================
# 2. History Configuration
# ==========================================
HISTFILE="$HOME/.histfile"
HISTSIZE=10000
SAVEHIST=1000

# ==========================================
# 3. Zsh Completions
# ==========================================
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# ==========================================
# 4. Conda Initialization
# ==========================================
# Initialize Conda only if the Miniconda directory actually exists on the machine
if [ -d "$HOME/miniconda3/bin" ]; then
    __conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
            . "$HOME/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
fi

# ==========================================
# 4.5 NVM (Node/NPM) Initialization
# ==========================================
# Add NVM only if the NVM directory actually exists on the machine
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# ==========================================
# 5. Plugins & Prompt (Order Matters Here)
# ==========================================
# Load Zsh Autosuggestions (Checking if file exists first for safety)
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Starship Prompt
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# Load Zsh Syntax Highlighting (MUST BE LAST)
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ==========================================
# 6. Keybindings (Word Jumping & Deleting)
# ==========================================
# Ctrl + Left Arrow (jump backward)
bindkey "^[[1;5D" backward-word

# Ctrl + Right Arrow (jump forward)
bindkey "^[[1;5C" forward-word

# Ctrl + Backspace (delete word backward)
bindkey "^H" backward-kill-word

# Delete Key
bindkey "^[[3;5~" kill-word

# ==========================================
# 7. Startup Scripts
# ==========================================
# run fastfetch on startup if installed 
if command -v fastfetch &> /dev/null; then
    fastfetch --percent-type 3
fi
