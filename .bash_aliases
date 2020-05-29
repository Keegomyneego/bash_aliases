
# open with default editor, defined by `EDIT` in your env, falling back to `open`
edit () { ${EDIT:-'open'} "$1" ; }

# MacOS - control whether the OS GUI shows hidden files
alias showHiddenFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideHiddenFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Terminal
alias edit-aliases="edit ~/.bash_aliases"
alias realias="source ~/.bash_aliases"
alias reenv="source ~/.bash_env"
alias reprofile="VERBOSE_REPROFILE=true source ~/.bash_profile"

# Bash
alias grepc="grep --color=always"
alias lookfor="find . | grep -i"
alias lookfor1="find . -maxdepth 1 | grep -i"
alias lookforc="find . | grep -i --color=always"

# Utilities
# syntax: countlines <regex to include> [<regex to exclude>]
countlines () { find . | grep -iE --color=never $1 | grep -v --color=never ${2:-"^$"} | xargs wc -l | grep -iE --color=always "$1|(.*total$)"; }

alias ytdlmp3="youtube-dl --extract-audio --audio-format mp3 --output \"%(title)s.%(ext)s\""
alias ytdl="youtube-dl --output \"%(title)s.%(ext)s\""
# trim video from start time to start time + duration
# ffmpeg -i "input-file.mkv" -ss "HH:MM:SS.00" -t "HH:MM:SS.00" "output.mkv"
# use vlc's file > convert option to convert to mp3

# VS Code
alias edit-snippets="edit ~/Library/Application\ Support/Code/User/Snippets"
alias edit-vscode-settings="edit ~/.Library/Application\ Support/Code/User/settings.json"

# Git
alias ga='git add'
alias gaa='git add -A && git status'
alias gb='git branch'
alias gbuoh='git branch -u origin/$(grph)'
alias gc='git commit'
alias gcane='git commit --amend --no-edit'
alias gcanenv='gcane --no-verify'
alias gch='git checkout'
alias gcm='git commit -m'
alias gcmwip='git add -A && git commit -m "WIP" --no-verify'
alias gd='git diff'
alias gdhns='git diff HEAD~ HEAD --name-status'
alias gdi='git diff --ignore-space-at-eol'
alias gf='git fetch --all --prune'
alias gfom='git fetch origin master:master'
alias gl='git log --decorate --abbrev-commit'
alias glg='git log --decorate --abbrev-commit --graph'
alias glgp='git log --decorate --abbrev-commit --graph --pretty=oneline'
alias glp='git log --decorate --abbrev-commit --pretty=oneline'
alias gpullohr='glp -5 && git pull origin $(grph) --rebase'
alias gpullom='git pull origin master'
alias gpullomd='gch HEAD --detach && git fetch origin master:master && gch master'
alias gpushoh='git push origin $(grph)'
alias grph='git rev-parse --abbrev-ref HEAD'
alias grphc='echo $(git rev-parse --abbrev-ref HEAD) | pbcopy'
alias gs='git status'
alias gsa='git stash apply'
alias gsl='git stash list'
alias gss='git stash save'

gcht() { git fetch "$1" "$2" && git checkout -t "$1/$2"; }
git-amend-current-commit-date() { GIT_COMMITTER_DATE="$1" git commit --amend --date="$1" --no-edit ; }
git-view-changes() { FROM="$1" ; TO="$2" ; git checkout $TO && git reset $FROM --soft ; }
code-review() { BRANCH="$1" ; git fetch origin master && git checkout code-review && git reset $BRANCH --hard && git reset origin/master --soft ; }
