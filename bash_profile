if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# Create the python virtual env: python3 -m venv ~/venv
export VIRTUAL_ENV_DISABLE_PROMPT=1
[ -f ~/venv/bin/activate ] && source ~/venv/bin/activate

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
