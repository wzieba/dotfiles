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
#ZSH_TMUX_AUTOSTART="true"

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

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

fzf-git-checkout() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    local branch

    branch=$(fzf-git-branch)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}

spire() {
    adb shell am broadcast -a io.spire.HEALTH_TAG_COMMAND --es health_tag_state "$1"
}

alias gcf='fzf-git-checkout'

function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

