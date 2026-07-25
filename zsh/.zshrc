

# ==========================================
# 1. Environment Variables & Paths
# ==========================================
export PATH=$HOME/.local/bin:$PATH:$HOME/go/bin
export ANTHROPIC_BASE_URL="http://localhost:11434"
export ANTHROPIC_AUTH_TOKEN="ollama"

export PATH=/home/suyashk12/.local/bin:/home/suyashk13/.nvm/versions/node/v24.12.0/bin:/home/suyashk13/.local/bin:/home/suyashk13/bin:/home/suyashk13/miniconda3/bin:/home/suyashk13/miniconda3/condabin:/home/suyashk13/.local/bin:/usr/local/bin:/usr/bin:/var/lib/snapd/snap/bin:/home/suyashk13/go/bin:/home/suyashk13/go/bin:/usr/local/go/bin:~/go/bin
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export TMUX_THEME="dracula"
# ==========================================
# 2. History Configuration
# ==========================================
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000

# ==========================================
# 3. Zsh Completions
# ==========================================
# The following lines were added by compinstall
zstyle :compinstall filename '/home/suyashk13/.zshrc'
autoload -Uz compinit
compinit

# ==========================================
# 4. Conda Initialization
# ==========================================
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/suyashk13/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/suyashk13/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/suyashk13/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/suyashk13/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ==========================================
# 5. Plugins & Prompt (Order Matters Here)
# ==========================================
# Zsh Autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#777777"

# Starship Prompt
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# Zsh Syntax Highlighting (MUST BE LAST)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



# ==========================================
# Keybindings (Word Jumping & Deleting)
# ==========================================
# Ctrl + Left Arrow (jump backward)
bindkey "^[[1;5D" backward-word

# Ctrl + Right Arrow (jump forward)
bindkey "^[[1;5C" forward-word

# Ctrl + Backspace (delete word backward)
bindkey "^H" backward-kill-word

# Delete Key
bindkey "^[[3;5~" kill-word

# Added by Antigravity CLI installer
export PATH="/home/suyashk13/.local/bin:$PATH"


# run fastfetch on startup if installed 
if [ -f /usr/bin/fastfetch ]; then
        fastfetch --percent-type 3
fi
