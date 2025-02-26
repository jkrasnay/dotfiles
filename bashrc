# Fix occasional messed up prompts in a terminal window in neovim
shopt -s checkwinsize

LT_GREEN="\[\033[1;32m\]"
LT_YELLOW="\[\033[1;33m\]"
LT_CYAN="\[\033[1;36m\]"
NO_COLOR="\[\033[0m\]"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

PS1="${LT_GREEN}\w${LT_YELLOW}\$(parse_git_branch)${NO_COLOR}\n${LT_CYAN}λ ${NO_COLOR}"

export PATH="~/.local/bin:/usr/local/sbin:$PATH"
export EDITOR=nvim

alias vi=nvim
alias vim=nvim
export LEDGER_FILE=main.journal

export PGHOST=localhost
export PGUSER=erbium

export GNUPGHOME=~/Dropbox/gnupg

export FZF_DEFAULT_COMMAND='ag --nocolor --hidden -g ""'

export PATH="$HOME/.cargo/bin:$PATH"

export BASH_SILENCE_DEPRECATION_WARNING=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias nvim-ks='NVIM_APPNAME="nvim-ks" nvim'
