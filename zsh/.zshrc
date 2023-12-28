#Plugins 
source $(brew --prefix)/share/antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle git
antigen bundle vi-mode
antigen apply

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

bindkey -v
export NVIM_APPNAME="nvim"
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"

export RIPGREP_CONFIG_PATH="$HOME/.config/.ripgreprc"

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
alias vim="env TERM=$TERM CC=gcc-13 nvim"
alias home="cd $HOME"
alias reload="source ~/.zshrc"
alias tmuxconf='vim ~/.config/tmux/tmux.conf'
alias wezconf='vim ~/.config/wezterm/wezterm.lua'
alias ls='exa -G --color auto --icons -s type'
alias ll='exa -l --color always --icons -s type'
alias cat="bat"
alias ta="tmux attach"
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# I dunno what this is supposed to do, but it doesn't exist. Maybe on ARM?
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
