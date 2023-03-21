bindkey -v
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export NVIM_APPNAME="nvim"

export PATH="$PATH:$HOME.local/share/bob/nvim-bin"

export PATH="$PATH:/Users/jec/.local/share/bob/nvim-bin"

ZSH_THEME=""

plugins=(
  git 
  zsh-autosuggestions
  vi-mode
  zsh-syntax-highlighting
)

# Auto-suggestion colors
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#515151"

# Ensure prompt is fast by disabling manual rebinding. If you need to rebind,
# run _zsh_autosuggest_bind_widgets
ZSH_AUTOSUGGEST_MANUAL_REBIND=true
# Accept autosuggestions with <C-Space>
bindkey '^ ' autosuggest-accept

# ASDF STUFF
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

source $ZSH/oh-my-zsh.sh

alias vim="env TERM=$TERM nvim"
# alias vim="nvim"
alias home="cd $HOME"
alias tmuxconf='vim ~/.config/tmux/tmux.conf'
alias wezconf='vim ~/.config/wezterm/wezterm.lua'
alias ls='exa -G --color auto --icons -s type'
alias ll='exa -l --color always --icons -s type'
alias ta="tmux attach"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
