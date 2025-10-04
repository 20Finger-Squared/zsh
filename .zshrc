# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
source /usr/share/zsh-antidote/antidote.zsh
antidote load

bindkey -v
zstyle :compinstall filename '/home/rhylie/.zshrc'

__fzfextra() {
    local fzf_opts=(--height=$(($LINES-1)) --smart-case --style=full)
    if command -v tmux &>/dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ (screen|tmux) ]] && [ -z "$TMUX" ]; then
        fzf "${fzf_opts[@]}"
    else
        fzf "${fzf_opts[@]}" --tmux
    fi
}

# alias' for config
alias ls="exa -G --icons -F --group-directories-first"
alias fzf=__fzfextra

# actual alias'
alias cdr='cd $(git rev-parse --show-toplevel 2>/dev/null)'
alias cd="z"

# pacman alias'
alias pacstall="sudo pacman -Syu"
alias pacrem="sudo pacman -Rns"

autoload -Uz compinit
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Ghost text color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#5e5c64' # Gruvbox gray


compinit

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    if tmux ls &> /dev/null; then
        tmux attach
    else
        tmux
    fi
fi
