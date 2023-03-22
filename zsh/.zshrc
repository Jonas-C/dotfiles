#Plugins 
source /opt/homebrew/share/antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle git
antigen bundle vi-mode
antigen apply

bindkey -v
export NVIM_APPNAME="nvim"
export PATH="$PATH:$HOME.local/share/bob/nvim-bin"
export PATH="$PATH:/Users/jec/.local/share/bob/nvim-bin"

# Auto-suggestion colors
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#515151"

# ASDF STUFF
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Ensure prompt is fast by disabling manual rebinding. If you need to rebind,
# run _zsh_autosuggest_bind_widgets
ZSH_AUTOSUGGEST_MANUAL_REBIND=true
# Accept autosuggestions with <C-Space>
bindkey '^ ' autosuggest-accept


for file in $HOME/.config/zsh/*; do
    source "$file"
done

alias vim="env TERM=$TERM nvim"
alias home="cd $HOME"
alias reload="source ~/.zshrc"
alias tmuxconf='vim ~/.config/tmux/tmux.conf'
alias wezconf='vim ~/.config/wezterm/wezterm.lua'
alias ls='exa -G --color auto --icons -s type'
alias ll='exa -l --color always --icons -s type'
alias ta="tmux attach"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
