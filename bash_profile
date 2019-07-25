LT_GREEN="\[\033[1;32m\]"
LT_YELLOW="\[\033[1;33m\]"
NO_COLOR="\[\033[0m\]"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

PS1="${LT_GREEN}\w${LT_YELLOW}\$(parse_git_branch)${NO_COLOR}\n|> "

export PATH="~/.local/bin:~/Library/Python/3.5/bin:/usr/local/sbin:$PATH"
export EDITOR=nvim

alias vi=nvim
alias vim=nvim
export LEDGER_FILE=main.journal

export GNUPGHOME=~/Dropbox/gnupg

export FZF_DEFAULT_COMMAND='ag --nocolor --hidden -g ""'

export PATH="$HOME/.cargo/bin:$PATH"
