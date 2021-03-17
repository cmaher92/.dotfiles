# Use for the shell configuration and for executing commands

# Setup for zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Load rbenv to the beginning of $PATH
eval "$(rbenv init -)"

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=99999                   # Maximum events for internal history
export SAVEHIST=99999                   # Maximum events in history file

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt EXTENDED_HISTORY     # Adds time stamp to history
setopt INC_APPEND_HISTORY   # Adds commands to history file as soon as they are run
setopt SHARE_HISTORY        # share history across multiple zsh sessions
setopt APPEND_HISTORY       # appends to history
setopt NO_CASE_GLOB
setopt AUTO_CD
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

alias la='ls -a'

cloud="/Users/cmaher/Library/Mobile Documents/com~apple~CloudDocs"
alias cloud='cd $cloud'

launch="/Users/cmaher/Development/launchschool"
alias launch='cd $launch'
alias ls="ls -lGhAFUr"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}
