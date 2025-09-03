# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
source /usr/share/zsh-antidote/antidote.zsh
antidote load

bindkey -v
zstyle :compinstall filename '/home/rhylie/.zshrc'

# alias' for config
alias ls="exa -G --icons -F --group-directories-first"
alias fzf='fzf --height=$(($LINES-1)) --smart-case --style=full'

# actual alias'
alias cdr='cd $(git rev-parse --show-toplevel 2>/dev/null)'
alias fvim='~/.config/myScripts/fvim.sh'
alias fman="~/.config/myScripts/fman.sh"
alias repos="~/.config/myScripts/repos.sh"
alias cd="z"

# pacman alias'
alias pacstall="sudo pacman -Syu"
alias pacrem="sudo pacman -Rns"
alias pacfind='~/.config/myScripts/pacfind.sh'

autoload -Uz compinit
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Ghost text color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#5e5c64' # Gruvbox gray


compinit
