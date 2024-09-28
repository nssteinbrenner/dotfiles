# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U colors && colors

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR=nvim
export VISUAL=nvim
export PATH="$PATH:/home/rockrock/bin"

alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias sway="sway --unsupported-gpu"
alias tms="tmux-sessionizer"

bindkey -e

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
