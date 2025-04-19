export PATH="$PATH:/Users/wzieba/bin"
alias gw='$HOME/gw.sh'

eval "$(rbenv init - zsh)"
eval "$(pyenv init -)"
export PATH=/opt/homebrew/bin:$PATH

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin
export ANDROID_NDK="$ANDROID_HOME/ndk/21.0.6113669"
export ZSH=$HOME/.oh-my-zsh
export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"
export JAVA_HOME=/Users/wzieba/Library/Java/JavaVirtualMachines/corretto-17.0.14.7.1/Contents/Home
export PATH="/Users/wzieba/git-fuzzy/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

plugins=(git zsh-autosuggestions autojump zsh-syntax-highlighting)

ZSH_THEME="agnoster"

DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias cat=bat
alias vim=nvim
alias ls=eza

# Git Diff
alias gd="git fuzzy diff"
# Git Checkout Trunk
alias gct='git checkout trunk'
# Git Last Commit
alias glc="git rev-parse HEAD | tr -d '\n' | pbcopy"
# Watch PR
alias wpr="gh pr checks --watch && osascript -e 'display notification \"PR checks completed\" with title \"Github\" sound name \"hero\"'"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Checkout fuzzy
cf() {
  git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/ \
    | fzf --layout=reverse --height=25% --border=rounded --prompt="Checkout > " --info=inline \
    | xargs -r git checkout
}

# Find in files fuzzy
ff() {
  fd --type f --hidden --exclude .git \
    | fzf --layout=reverse --height=25% --border=rounded --prompt="Find > " --info=inline \
    | xargs nvim
}

# Neovim fuzzy search
nfs() {
  rg --hidden --no-heading --line-number --color=always --smart-case --glob '!.git/*' "" \
    | fzf --ansi --layout=reverse --height=25% --border=rounded \
          --prompt="Find in files > " --info=inline \
          --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
          --delimiter : \
          --bind 'enter:execute(nvim {1} +{2})'
}

# Android fuzzy search
afs() {
  rg --hidden --no-heading --line-number --color=always --smart-case --glob '!.git/*' "" \
    | fzf --ansi --layout=reverse --height=25% --border=rounded \
          --prompt="Find in files > " --info=inline \
          --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
          --delimiter : \
          --bind "enter:execute(studio --line {2} {1})"
}

set -o vi
KEYTIMEOUT=1

