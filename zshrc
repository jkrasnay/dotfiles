#-- Prompt --------------------------------------------------

# Thanks to https://dev.to/cassidoo/customizing-my-zsh-prompt-3417
# See also for customizing git branch colour based on work-area state:
# https://gist.github.com/lucassperez/bc04afa332c18ab708a084c1be1ff230
#

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '


#-- Completions --------------------------------------------------

autoload -Uz compinit && compinit   # must come before compdef

# Babashka task
#
_bb_tasks() {
    local matches=(`bb tasks |tail -n +3 |cut -f1 -d ' '`)
    compadd -a matches
    _files # autocomplete filenames as well
}
compdef _bb_tasks bb
