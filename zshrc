# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:/Users/wzieba/bin"
alias gw='./gradlew'
eval "$(rbenv init -)"
eval "$(pyenv init -)"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin
export ANDROID_NDK="$ANDROID_HOME/ndk/21.0.6113669"
export ZSH=$HOME/.oh-my-zsh

plugins=(git zsh-autosuggestions autojump tmux)

ZSH_THEME="agnoster"

DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"
ZSH_TMUX_AUTOSTART="true"

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/Users/wzieba/git-fuzzy/bin:$PATH"

alias cat=bat
alias vim=nvim
alias gd="git fuzzy diff"
alias ls=exa
alias gbr='git checkout $(git branch | fzf | tr -d "*")'

eval "$(starship init zsh)"

export PATH="/Users/wzieba/companion-android/git-fuzzy/bin:$PATH"
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export TERM=xterm-256color
