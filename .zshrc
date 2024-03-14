export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gentoo"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias nvcfg="nvim ~/.config/nvim"
alias tmcfg="nvim ~/.config/tmux/tmux.conf"

alias opnv='nvim "$(find ~/Documents/* -type d ! -path "*/Work/*/*" ! -path "*/Dev/*/*" | fzf)"'
alias opt='find ~/Documents/* -type d ! -path "*/Work/*/*" ! -path "*/Dev/*/*" | fzf | xargs -i sh -c "tmux new -s {} -c {} -d && tmux switch -t {}"'
alias opd='cd "$(find ~/Documents/* -type d ! -path "*/Work/*/*" ! -path "*/Dev/*/*" | fzf)"'

eval "$(zoxide init zsh)"

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new -s main
fi
